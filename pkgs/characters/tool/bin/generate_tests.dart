// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';
import 'dart:typed_data';

import 'package:characters/src/grapheme_clusters/constants.dart';

import '../src/args.dart';
import '../src/data_files.dart';
import '../src/grapheme_category_loader.dart';
import '../src/shared.dart';
import '../src/string_literal_writer.dart';

// Generates tests for grapheme cluster splitting from the Unicode
// GraphemeBreakTest.txt file.
//
// Fetches the data files from the Unicode web site.

const defaultVerbose = false;

const testFile = 'test/src/unicode_grapheme_tests.dart';

void main(List<String> args) async {
  var flags = parseArgs(args, 'generate_tests');

  var output = flags.dryrun
      ? null
      : flags.targetFile ?? File(path(packageRoot, testFile));

  if (output != null && !output.existsSync()) {
    try {
      output.createSync(recursive: true);
    } catch (e) {
      stderr.writeln('Cannot find or create file: ${output.path}');
      stderr.writeln('Writing to stdout');
      output = null;
    }
  }
  if (flags.update) {
    // Force license file update.
    await licenseFile.load(checkForUpdate: true);
  }

  var (categories, graphemeTests, emojiTests) = await (
    loadCategories(update: flags.update, verbose: flags.verbose),
    graphemeTestData.load(checkForUpdate: flags.update),
    emojiTestData.load(checkForUpdate: flags.update)
  ).wait;

  generateTests(output, [graphemeTests, emojiTests], categories,
      verbose: flags.verbose, dryrun: flags.dryrun);
}

void generateTests(File? output, List<String> texts, Uint8List categories,
    {bool verbose = false, bool dryrun = false}) {
  var buffer = StringBuffer();
  writeHeader(buffer, [
    graphemeTestData,
    emojiTestData,
    graphemeBreakPropertyData,
    emojiData,
    derivedData
  ]);
  buffer.writeln('// ignore_for_file: lines_longer_than_80_chars');
  buffer.writeln('// dart format off');
  buffer.writeln();

  // Example character of a category which is in the upper planes.
  var upperChars = List<int>.filled(inputCategoryCount, -1);
  // Example character of a category which is in the lower planes.
  var lowerChars = List<int>.filled(inputCategoryCount, -1);

  writeTests(buffer, texts, categories, lowerChars, upperChars,
      verbose: verbose, dryrun: dryrun);

  buffer.writeln('// dart format on');

  writeOtherCategories(buffer, categories, lowerChars, upperChars);

  if (output == null) {
    stdout.write(buffer);
  } else if (!dryrun) {
    output.writeAsStringSync(buffer.toString());
  }
}

void writeTests(StringSink buffer, List<String> texts, Uint8List categories,
    List<int> lowerChars, List<int> upperChars,
    {bool dryrun = false, bool verbose = defaultVerbose}) async {
  var writer = StringLiteralWriter(buffer, lineLength: 9999, escape: _escape);
  void writeParts(List<List<int>> parts, String description) {
    buffer.writeln('  [');
    const indent = '    ';
    for (var i = 0; i < parts.length; i++) {
      buffer.write(indent);
      writer.start(indent.length);
      for (var char in parts[i]) {
        writer.add(char);
        var c = categories[char];
        ((char < 0x10000) ? lowerChars : upperChars)[c] = char;
      }
      writer.end();
      buffer.writeln(',');
    }
    buffer
      ..write('  ], // ')
      ..writeln(description);
  }

  // Write grapheme cluster tests.
  {
    buffer.writeln('// Grapheme cluster tests.');
    writeTestHeader(buffer, 'splitTests');
    var test = texts[0];
    var lineRE = RegExp(r'^(÷.*?)#[ \t]*(.*)', multiLine: true);
    var tokensRE = RegExp(r'[÷×]|[\dA-F]+');

    for (var line in lineRE.allMatches(test)) {
      var description = line[2]!;
      var tokens = tokensRE.allMatches(line[1]!).map((x) => x[0]!).toList();
      assert(tokens.first == '÷');
      assert(tokens.last == '÷');

      var parts = <List<int>>[];
      var chars = <int>[];
      for (var i = 1; i < tokens.length; i += 2) {
        var cp = int.parse(tokens[i], radix: 16);
        chars.add(cp);
        if (tokens[i + 1] == '÷') {
          parts.add(chars);
          chars = [];
        }
      }
      writeParts(parts, description);
    }
    buffer.writeln('];');
  }
  // Write emoji cluster tests.
  {
    buffer.writeln('// Emoji tests.');
    writeTestHeader(buffer, 'emojis');
    // Emojis
    var emojis = texts[1];
    var lineRE = RegExp(r'^([ \dA-F]*?);[^#]*#[ \t]*(.*)', multiLine: true);
    var tokensRE = RegExp(r'[\dA-F]+');
    for (var line in lineRE.allMatches(emojis)) {
      var description = line[2]!;
      var part = <int>[];
      for (var token in tokensRE.allMatches(line[1]!)) {
        var value = int.parse(token[0]!, radix: 16);
        part.add(value);
      }
      writeParts([part], description);
    }
    buffer.writeln('];');
  }
}

bool _escape(int cp) => cp > 0xff || cp & 0x60 == 0 || cp == 0x7f;

void writeTestHeader(StringSink buffer, String testName) {
  buffer
    ..write('const List<List<String>> ')
    ..write(testName)
    ..writeln(' = [');
}

void writeOtherCategories(StringSink output, Uint8List categories,
    List<int> lowerChars, List<int> upperChars) {
  var otherCategories = lowerChars;
  for (var i = 0; i < 0x110000; i++) {
    if (i == 0x10000) otherCategories = upperChars;
    var category = categories[i];
    if (otherCategories[category] < 0) otherCategories[category] = i;
  }
  // BMP characters.
  output
    ..writeln('// BMP character in each category, if any, -1 if none.')
    ..writeln('const lowerChars = <int>[');
  for (var char in lowerChars) {
    output.write('  ');
    writeHex(output, char);
    output.writeln(',');
  }
  output.writeln('];');

  output
    ..writeln('// Non-BMP character in each category, if any, -1 if none.')
    ..writeln('const upperChars = <int>[');
  for (var char in upperChars) {
    output.write('  ');
    writeHex(output, char);
    output.writeln(',');
  }
  output.writeln('];');
}

void writeHex(StringSink out, int value) {
  if (value < 0) {
    out.write('-');
    value = -value;
  }
  out
    ..write('0x')
    ..write(value.toRadixString(16));
}
