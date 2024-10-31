// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "dart:io";
import "dart:typed_data";

import 'package:characters/src/grapheme_clusters/constants.dart';

import "../src/args.dart";
import "../src/automaton_builder.dart";
import "../src/data_files.dart";
import "../src/grapheme_category_loader.dart";
import "../src/indirect_table.dart";
import "../src/shared.dart";
import "../src/string_literal_writer.dart";
import "../src/table_builder.dart";

// Generates tables used by the grapheme cluster breaking algorithm
// and a state machine used to implement the algorithm.

// The task of this tool is to take the complete table of
// grapheme cluster categories for every code point (U+0000 ... U+10FFFF)
// and build a smaller table with the same information.
//
// The approach taken is to split the large table into chunks,
// smaller chunks for data in the BMP (U+0000 ... U+FFFF)
// which have higher variation than later data,
// and larger chunks for non-BMP ("astral" planes) code points.
// This also corresponds to the split between one-UTF-16 code unit
// character and surrogate pairs, which gives us a natural
// branch in the string parsing code.
//
// Then a single table is built containing all these chunks, but where
// the chunks are allowed to overlap.
// An indirection table points to the start of each chunk
// in the larger table.
//
// Having many small chunks increases the size of the indirection table,
// and large chunks reduces the chance of chunks being completely
// equivalent.
//
// The state machines are based on the extended Grapheme Cluster breaking
// algorithm. The forward-scanning state machine is entirely regular.
// The backwards-scanning state machine needs to call out to do look-ahead
// in some cases (for example, how to combine a regional identifier
// depends on whether there is an odd or even number of
// previous regional identifiers.)

/// Print more information to stderr while generating.
///
/// Set while developing if you don't want to pass `-v` on the command line
/// every time.
/// Only affects this file when it's run directly.
const defaultVerbose = false;

/// Default location for table file.
const tableFile = "lib/src/grapheme_clusters/table.dart";

// Best values found for current tables.
// Update if better value found when updating data files.
// (May consider benchmark performance as well as size.)

// TODO: Write out best sizes to a file after an update, and read them back
// next time, instead of hardcoding in the source file.

// Chunk sizes must be powers of 2.
const int defaultLowChunkSize = 64;

// 512 gives best size by 431b and no discernible performance difference
// from 1024 in benchmark.
const int defaultHighChunkSize = 512;

void main(List<String> args) {
  var flags = parseArgs(args, "generate_tables", allowOptimize: true);
  var output = flags.dryrun
      ? null
      : flags.targetFile ?? File(path(packageRoot, tableFile));

  if (output != null && !output.existsSync()) {
    try {
      output.createSync(recursive: true);
    } catch (e) {
      stderr.writeln("Cannot find or create file: ${output.path}");
      stderr.writeln("Writing to stdout");
      output = null;
    }
  }
  generateTables(output,
      update: flags.update,
      dryrun: flags.dryrun,
      verbose: flags.verbose,
      optimize: flags.optimize);
}

Future<void> generateTables(
  File? output, {
  bool update = false,
  bool dryrun = false,
  bool optimize = false,
  bool verbose = defaultVerbose,
  bool acceptLicenseChange = false,
}) async {
  // Generate the category mapping for all Unicode code points.
  // This is the table we want to create an compressed version of.
  var table = await loadGraphemeCategories(update: update, verbose: verbose);
  var incbTable = await loadInCBCategories(update: update, verbose: verbose);
  if (verbose) {
    _logIntersection(table, incbTable);
  }
  for (var i = 0; i < table.length; i++) {
    var incb = incbTable[i];
    if (incb != 0 && table[i] != categoryZWJ) {
      table[i] = incb;
    }
  }

  var lowChunkSize = defaultLowChunkSize;
  var highChunkSize = defaultHighChunkSize;

  int optimizeTable(
      IndirectTable chunkTable, int lowChunkSize, int highChunkSize) {
    var index = 0;
    do {
      chunkTable.entries.add(TableEntry(0, index, lowChunkSize));
      index += lowChunkSize;
    } while (index < 0x10000);
    var lowChunkCount = chunkTable.entries.length;
    do {
      chunkTable.entries.add(TableEntry(0, index, highChunkSize));
      index += highChunkSize;
    } while (index < 0x110000);
    var highChunkCount = chunkTable.entries.length - lowChunkCount;
    assert(lowChunkCount * lowChunkSize + highChunkCount * highChunkSize ==
        0x110000);
    assert(chunkTable.chunks.length == 1);
    assert(_validate(table, chunkTable, lowChunkSize, highChunkSize,
        verbose: false));

    chunkifyTable(chunkTable);
    assert(chunkTable.entries.length == lowChunkCount + highChunkCount);
    assert(_validate(table, chunkTable, lowChunkSize, highChunkSize,
        verbose: false));

    combineChunkedTable(chunkTable);
    assert(chunkTable.entries.length == lowChunkCount + highChunkCount);
    assert(chunkTable.chunks.length == 1);
    assert(_validate(table, chunkTable, lowChunkSize, highChunkSize,
        verbose: false));

    var size = chunkTable.chunks[0].length + chunkTable.entries.length * 2;
    return size;
  }

  var chunkTable = IndirectTable([table.sublist(0, table.length)], []);
  var size = optimizeTable(chunkTable, lowChunkSize, highChunkSize);
  if (verbose) {
    stderr.writeln("Default chunk size: $lowChunkSize/$highChunkSize: $size");
  }
  if (optimize) {
    // Chunk sizes must be powers of 2.
    // Smaller chunk sizes gives more smaller chunks,
    // with more chance of overlap,
    // but each chunks adds an entry to the index table.
    for (var low in [64, 128, 32, 256]) {
      for (var high in [512, 1024, 256, 2048]) {
        if (low == lowChunkSize && high == highChunkSize) continue;
        var newChunk = IndirectTable([table.sublist(0, table.length)], []);
        var newSize = optimizeTable(newChunk, low, high);
        if (verbose) {
          var delta = newSize - size;
          stderr.writeln("${size < newSize ? "Worse" : "Better"}"
              " chunk size: $low/$high: $newSize "
              "(${delta > 0 ? "+$delta" : delta})");
        }
        if (newSize < size) {
          lowChunkSize = low;
          highChunkSize = high;
          chunkTable = newChunk;
          size = newSize;
        }
      }
    }
    if (verbose) {
      stderr.writeln("Best low chunk size: $lowChunkSize");
      stderr.writeln("Best high chunk size: $highChunkSize");
      stderr.writeln("Best table size: $size");
    }
  }

  // Write the table and automaton to source.
  var buffer = StringBuffer(copyright)
    ..writeln("// Generated code. Do not edit.")
    ..writeln("// Generated from [${graphemeBreakPropertyData.sourceLocation}]"
        "(../../${graphemeBreakPropertyData.targetLocation}),")
    ..writeln("// [${emojiData.sourceLocation}]"
        "(../../${emojiData.targetLocation}) and")
    ..writeln("// [${derivedData.sourceLocation}]"
        "(../../${derivedData.targetLocation}).")
    ..writeln("// Licensed under the Unicode Inc. License Agreement")
    ..writeln("// (${licenseFile.sourceLocation}, "
        "../../third_party/${licenseFile.targetLocation})")
    ..writeln();

  writeTables(buffer, chunkTable, lowChunkSize, highChunkSize,
      verbose: verbose);

  writeForwardAutomaton(buffer, verbose: verbose);
  buffer.writeln();
  writeBackwardAutomaton(buffer, verbose: verbose);

  if (output == null) {
    stdout.write(buffer);
  } else {
    output.writeAsStringSync(buffer.toString());
  }
  if (update && !dryrun) {
    var version = guessVersion(await graphemeBreakPropertyData.contents);
    updateReadmeVersion(version);
  }
}

// -----------------------------------------------------------------------------
// Unicode version number.

String? guessVersion(String dataFile) {
  // If first line has format:
  //
  // # GraphemeBreakProperty-16.0.0.txt
  //
  // Then use 16.0.0 as version number.
  var match = RegExp(r"# \w+-(\d+\.\d+\.\d+)\.txt").matchAsPrefix(dataFile);
  return match?[1];
}

void updateReadmeVersion(String? version) {
  var readmeFile = File(packagePath("README.md"));
  var contents = readmeFile.readAsStringSync();
  String replacementText;
  if (version != null) {
    replacementText = "version $version";
  } else {
    var now = DateTime.timestamp();
    replacementText = "of ${now.year}-${lz(now.month)}-${lz(now.day)}";
  }
  const startTag = "<!-- unicode-version -->";
  const endTag = "<!-- /unicode-version -->";
  var versionRE = RegExp('(?<=$startTag).*?(?=$endTag)');
  var newContents = contents.replaceFirst(versionRE, replacementText);
  if (contents != newContents) {
    readmeFile.writeAsStringSync(newContents);
  } else if (versionRE.firstMatch(contents) == null) {
    stderr.writeln("MISSING VERSION TAGS IN README.md");
  }
}

// -----------------------------------------------------------------------------
// Combined table writing.
void writeTables(
    StringSink out, IndirectTable table, int lowChunkSize, int highChunkSize,
    {required bool verbose}) {
  assert(table.chunks.length == 1);
  _writeBytes(out, "_data", table.chunks[0], verbose: verbose);
  _writeStringLiteral(out, "_start", table.entries.map((e) => e.start).toList(),
      verbose: verbose);
  _writeLookupFunction(out, "_data", "_start", lowChunkSize);
  out.writeln();
  _writeSurrogateLookupFunction(
      out, "_data", "_start", 65536 ~/ lowChunkSize, highChunkSize);
  out.writeln();
}

void _writeStringLiteral(StringSink out, String name, List<int> data,
    {required bool verbose}) {
  if (verbose) {
    stderr.writeln("Writing ${data.length} chars");
  }
  var prefix = "const String $name = ";
  out.write(prefix);
  var writer = StringLiteralWriter(out, padding: 4, escape: _needsEscape);
  writer.start(prefix.length);
  for (var i = 0; i < data.length; i++) {
    writer.add(data[i]);
  }
  writer.end();
  out.write(";\n");
}

void _writeNybbles(StringSink out, String name, List<int> data,
    {required bool verbose}) {
  if (verbose) {
    stderr.writeln("Writing ${data.length} nybbles");
  }
  var prefix = "const String $name = ";
  out.write(prefix);
  var writer = StringLiteralWriter(out, padding: 4, escape: _needsEscape);
  writer.start(prefix.length);
  for (var i = 0; i < data.length - 1; i += 2) {
    var n1 = data[i];
    var n2 = data[i + 1];
    assert(0 <= n1 && n1 <= 15);
    assert(0 <= n2 && n2 <= 15);
    writer.add(n1 + n2 * 16);
  }
  if (data.length.isOdd) writer.add(data.last);
  writer.end();
  out.write(";\n");
}

void _writeBytes(StringSink out, String name, List<int> data,
    {required bool verbose}) {
  if (verbose) {
    stderr.writeln("Writing ${data.length} bytes");
  }
  var prefix = "const String $name = ";
  out.write(prefix);
  var writer = StringLiteralWriter(out, padding: 4, escape: _needsEscape);
  writer.start(prefix.length);
  for (var i = 0; i < data.length; i++) {
    var n1 = data[i];
    writer.add(n1);
  }
  writer.end();
  out.write(";\n");
}

bool _needsEscape(int codeUnit) =>
    codeUnit > 0xff || codeUnit == 0x7f || codeUnit & 0x60 == 0;

void _writeLookupFunction(
    StringSink out, String dataName, String startName, int chunkSize) {
  out.write(_lookupMethod("low", dataName, startName, chunkSize));
}

void _writeSurrogateLookupFunction(StringSink out, String dataName,
    String startName, int startOffset, int chunkSize) {
  out.write(_lookupSurrogatesMethod(
      "high", dataName, startName, startOffset, chunkSize));
}

String _lookupMethod(
        String name, String dataName, String startName, int chunkSize) =>
    """

@pragma('dart2js:prefer-inline')
@pragma('vm:prefer-inline')
@pragma('wasm:prefer-inline')
int $name(int codeUnit) {
  var chunkStart = $startName.codeUnitAt(codeUnit >> ${chunkSize.bitLength - 1});
  var index = chunkStart + (codeUnit & ${chunkSize - 1});
  return $dataName.codeUnitAt(index);
}
""";

String _lookupSurrogatesMethod(String name, String dataName, String startName,
        int startOffset, int chunkSize) =>
    chunkSize == 1024
        ? """
int $name(int lead, int tail) {
  var chunkStart = $startName.codeUnitAt($startOffset + (0x3ff & lead));
  var index = chunkStart + (0x3ff & tail);
  return $dataName.codeUnitAt(index);
}
"""
        : """
int $name(int lead, int tail) {
  var offset = ((0x3ff & lead) << 10) | (0x3ff & tail);
  var chunkStart = $startName.codeUnitAt($startOffset + (offset >> ${chunkSize.bitLength - 1}));
  var index = chunkStart + (offset & ${chunkSize - 1});
  return $dataName.codeUnitAt(index);
}
""";

// -----------------------------------------------------------------------------
bool _validate(Uint8List table, IndirectTable indirectTable, int lowChunkSize,
    int highChunkSize,
    {required bool verbose}) {
  var lowChunkCount = 65536 ~/ lowChunkSize;
  var lowChunkShift = lowChunkSize.bitLength - 1;
  var lowChunkMask = lowChunkSize - 1;
  for (var i = 0; i < 65536; i++) {
    var value = table[i];
    var entryIndex = i >> lowChunkShift;
    var entry = indirectTable.entries[entryIndex];
    var indirectValue = indirectTable.chunks[entry.chunkNumber]
        [entry.start + (i & lowChunkMask)];
    if (value != indirectValue) {
      stderr.writeln("$entryIndex: $entry");
      stderr.writeln('Error: ${i.toRadixString(16)} -> Expected $value,'
          ' was $indirectValue');
      printIndirectTable(indirectTable);
      return false;
    }
  }
  var highChunkShift = highChunkSize.bitLength - 1;
  var highChunkMask = highChunkSize - 1;
  for (var i = 0x10000; i < 0x110000; i++) {
    var j = i - 0x10000;
    var value = table[i];
    var entryIndex = lowChunkCount + (j >> highChunkShift);
    var entry = indirectTable.entries[entryIndex];
    var indirectValue = indirectTable.chunks[entry.chunkNumber]
        [entry.start + (j & highChunkMask)];
    if (value != indirectValue) {
      stderr.writeln("$entryIndex: $entry");
      stderr.writeln('Error: ${i.toRadixString(16)} -> Expected $value,'
          ' was $indirectValue');
      printIndirectTable(indirectTable);
      return false;
    }
  }
  if (verbose) {
    stderr.writeln("Table validation success");
  }
  return true;
}

void printIndirectTable(IndirectTable table) {
  stderr.writeln("IT(chunks: ${table.chunks.map((x) => "#${x.length}")},"
      " entries: ${table.entries}");
}

void _logIntersection(Uint8List table, Uint8List incbTable) {
  const catNames = [
    "CR",
    "ZWJ",
    "Control",
    "Other",
    "Extend",
    "SpacingMark",
    "RegionalIndicator",
    "Pictographic",
    "LF",
    "Prepend",
    "L",
    "V",
    "T",
    "LV",
    "LVT",
    "EoT",
  ];
  const incbNames = ["None", "Consonant", "Extend", "Linked"];
  const incbOffsets = {
    0: 0,
    categoryOtherIndicConsonant: 1,
    categoryExtendIndicExtend: 2,
    categoryExtendIndicLinked: 3,
  };

  var counts = List<int>.filled(catNames.length * incbNames.length, 0);
  for (var i = 0; i < table.length; i++) {
    var incbOffset = incbOffsets[incbTable[i]] ?? 0;
    counts[table[i] * incbNames.length + incbOffset]++;
  }
  print(
      "GC/InCB             ${incbNames.map((s) => s.padLeft(10)).join("  ")}");
  for (var i = 0; i < catNames.length; i++) {
    print("${catNames[i].padRight(20)}${[
      for (var j = 0; j < incbNames.length; j++)
        switch (counts[i * incbNames.length + j]) {
          0 => "",
          var v => v.toString()
        }
            .padLeft(10)
    ].join("  ")}");
  }
}
