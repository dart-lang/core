// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io' show stderr;
import 'dart:typed_data';

import 'package:characters/src/grapheme_clusters/constants.dart';

import 'data_files.dart';
import 'debug_names.dart';

// Loads the grapheme breaking categories from Unicode data files.

/// Loads all categories by combining the categories of the
/// grapheme break property with the categories of the InCB property.
Future<Uint8List> loadCategories(
    {bool update = false, bool verbose = false}) async {
  var (graphemeTable, incbTable) = await (
    loadGraphemeCategories(update: update, verbose: verbose),
    loadInCBCategories(update: update, verbose: verbose)
  ).wait;
  if (verbose) {
    _logIntersection(graphemeTable, incbTable);
  }
  for (var i = 0; i < graphemeTable.length; i++) {
    var grapheme = graphemeTable[i];
    var incb = incbTable[i];
    if (incb != 0) {
      if (grapheme == categoryZWJ) {
        assert(incb == categoryExtendIndicExtend);
        continue;
      }
      assert(incb == categoryOtherIndicConsonant && grapheme == categoryOther ||
          (incb == categoryExtendIndicExtend ||
                  incb == categoryExtendIndicLinked) &&
              grapheme == categoryExtend);
      graphemeTable[i] = incb;
    }
  }
  return graphemeTable;
}

/// Loads and parses the grapheme break categories from the grapheme break data,
/// emoji data, and adds unpaired surrogates as controls.
Future<Uint8List> loadGraphemeCategories(
    {bool update = false, bool verbose = false}) async {
  var dataFiles = await Future.wait([
    graphemeBreakPropertyData.load(checkForUpdate: update),
    emojiData.load(checkForUpdate: update),
    // This data used to be in:
    // https://www.unicode.org/Public/12.0.0/ucd/auxiliary/GraphemeBreakProperty-12.0.0d16.txt
    // Make sure it's included.
    Future.value(
        'D800..DFFF    ; Control # Cc       <control-D800>..<control-DFFF>\n'),
  ]);
  var table = _parseCategories(dataFiles, verbose: verbose);
  return table;
}

/// Loads and parses the InCB categories from the derived properties data.
Future<Uint8List> loadInCBCategories(
    {bool update = false, bool verbose = false}) async {
  var data = await derivedData.load(checkForUpdate: update);
  var table = _parseInCBCategories(data, verbose: verbose);
  return table;
}

/// Prints intersection between basic grapheme breaking properties
/// and InCB categories.
void _logIntersection(Uint8List table, Uint8List incbTable) {
  const incbNames = ['None', 'Consonant', 'Extend', 'Linked'];
  const incbOffsets = {
    0: 0,
    categoryOtherIndicConsonant: 1,
    categoryExtendIndicExtend: 2,
    categoryExtendIndicLinked: 3,
  };

  var counts = List<int>.filled(categoryCount * incbNames.length, 0);
  for (var i = 0; i < table.length; i++) {
    var incbOffset = incbOffsets[incbTable[i]] ?? 0;
    counts[table[i] * incbNames.length + incbOffset]++;
  }
  print(
      "GC/InCB             ${incbNames.map((s) => s.padLeft(10)).join("  ")}");
  for (var i = 0; i < categoryCount; i++) {
    if (i == categoryOtherIndicConsonant ||
        i == categoryExtendIndicExtend ||
        i == categoryExtendIndicLinked) {
      assert(counts
          .sublist(i * incbNames.length, (i + 1) * incbNames.length)
          .every((c) => c == 0));
      continue;
    }
    print("${categoryNames[i].padRight(20)}${[
      for (var j = 0; j < incbNames.length; j++)
        switch (counts[i * incbNames.length + j]) {
          0 => "",
          var v => v.toString()
        }
            .padLeft(10)
    ].join("  ")}");
  }
}

// -----------------------------------------------------------------------------
// Unicode table parser.
final _tableRE = RegExp(r'^([\dA-F]{4,5})(?:..([\dA-F]{4,5}))?\s*;\s*(\w+)\s*#',
    multiLine: true);

// The relevant names that occur in the Unicode tables.
final categoryByName = {
  'CR': categoryCR,
  'LF': categoryLF,
  'Control': categoryControl,
  'Extend': categoryExtend,
  'ZWJ': categoryZWJ,
  'Regional_Indicator': categoryRegionalIndicator,
  'Prepend': categoryPrepend,
  'SpacingMark': categorySpacingMark,
  'L': categoryL,
  'V': categoryV,
  'T': categoryT,
  'LV': categoryLV,
  'LVT': categoryLVT,
  'Extended_Pictographic': categoryPictographic,
};

Uint8List _parseCategories(List<String> files, {required bool verbose}) {
  var result = Uint8List(0x110000);
  result.fillRange(0, result.length, categoryOther);
  var count = 0;
  var categoryCount = <String, int>{};
  var categoryMin = <String, int>{
    for (var category in categoryByName.keys) category: 0x10FFFF
  };
  int min(int a, int b) => a < b ? a : b;
  for (var file in files) {
    for (var match in _tableRE.allMatches(file)) {
      var from = int.parse(match[1]!, radix: 16);
      var endMatch = match[2];
      var to = endMatch == null ? from : int.parse(endMatch, radix: 16);
      var category = match[3]!;
      assert(from <= to);
      var categoryCode = categoryByName[category];
      if (categoryCode != null) {
        assert(result.getRange(from, to + 1).every((x) => x == categoryOther));
        result.fillRange(from, to + 1, categoryCode);
        count += to + 1 - from;
        categoryMin[category] = min(categoryMin[category]!, from);
        categoryCount[category] =
            (categoryCount[category] ?? 0) + (to + 1 - from);
      }
    }
  }
  if (verbose) {
    stderr.writeln('Loaded $count entries');
    categoryCount.forEach((category, count) {
      stderr.writeln('  $category: $count, min: U+'
          "${categoryMin[category]!.toRadixString(16).padLeft(4, "0")}");
    });
  }
  if (result[0xD800] != categoryControl) {
    stderr.writeln('WARNING: Surrogates are not controls. Check inputs.');
  }
  if (categoryMin['Regional_Indicator']! < 0x10000) {
    stderr.writeln('WARNING: Regional Indicator in BMP. '
        'Code assuming all RIs are non-BMP will fail');
  }
  return result;
}

// ---------------------------------------------------------------------------
// Indic Conjunct Break property

// Derived property. From definition:
//
// Define the set of applicable scripts. For Unicode 15.1, the set is defined as
// S = [\p{sc=Beng}\p{sc=Deva}\p{sc=Gujr}\p{sc=Mlym}\p{sc=Orya}\p{sc=Telu}]
// Then for any character C:
// InCB = Linker iff C in [S &\p{Indic_Syllabic_Category=Virama}]
// InCB = Consonant iff C in [S &\p{Indic_Syllabic_Category=Consonant}]
// InCB = Extend iff C in
// [\p{gcb=Extend}
// \p{gcb=ZWJ}
// -\p{InCB=Linker}
// -\p{InCB=Consonant}
// -[\u200C]]
// Otherwise, InCB = None (the default value)
//
// Luckily it is precomputed in a file of its own.

final _derivedPropertyTableRE = RegExp(
    r'^([\dA-F]{4,5})(?:..([\dA-F]{4,5}))?\s*;\s*InCB\s*;\s*(\w+)\s*#'
    r'|'
    r'^# Total code points: (\d+)',
    multiLine: true);

Uint8List _parseInCBCategories(String file, {required bool verbose}) {
  const categoryByName = {
    'Consonant': categoryOtherIndicConsonant,
    'Extend': categoryExtendIndicExtend,
    'Linker': categoryExtendIndicLinked
  };
  var result = Uint8List(0x110000);
  var lines = 0;
  var count = 0;
  var counts = {for (var key in categoryByName.keys) key: 0};
  var totalCounts = {for (var key in categoryByName.keys) key: 0};
  var currentInCBCategory = '';
  for (var match in _derivedPropertyTableRE.allMatches(file)) {
    if (match[4] case var totalCountText?) {
      if (currentInCBCategory.isNotEmpty) {
        if (totalCounts[currentInCBCategory] != 0) {
          throw FormatException(
              'More than one total count per category', match[0]!);
        }
        totalCounts[currentInCBCategory] = int.parse(totalCountText);
        currentInCBCategory = '';
      }
      continue;
    }
    var start = int.parse(match[1]!, radix: 16);
    // "None" should not occur in the table, since it's the default.
    var name = match[3]!;
    var incbCategory = categoryByName[name];
    if (incbCategory == null) {
      throw FormatException('Invalid InCB category', match[0]!);
    }
    currentInCBCategory = name;
    var endMatch = match[2];
    if (endMatch == null) {
      assert(result[start] == 0);
      result[start] = incbCategory;
      lines += 1;
      count += 1;
      counts[name] = counts[name]! + 1;
    } else {
      var end = int.parse(endMatch, radix: 16);
      assert(result.getRange(start, end + 1).every((x) => x == 0));
      result.fillRange(start, end + 1, incbCategory);
      var rangeLength = end - start + 1;
      lines += 1;
      count += rangeLength;
      counts[name] = counts[name]! + rangeLength;
    }
  }
  for (var name in categoryByName.keys) {
    if (counts[name] != totalCounts[name]) {
      stderr.writeln('${categoryByName[name]}: '
          'Parsed: ${counts[name]}, expected: ${totalCounts[name]}');
    }
  }
  if (verbose) {
    stderr.writeln('InCB categories: Loaded $count entries from $lines lines');
    for (var name in categoryByName.keys) {
      stderr.writeln('  ${name.padRight(9)}: '
          '${counts[name].toString().padLeft(6)}');
    }
  }
  return result;
}

// --------------------------------------------------------------------
// TODO: Use a sparse table?
// Likely not worth it.

/// Fixed length table for Unicode properties.
class UnicodePropertyTable {
  static const int _unicodeCodePoints = 0x110000;
  static const int _entrySize = 0x100;
  static const int _entryMask = _entrySize - 1;
  static const int _entryShift = 8;
  static const int _entryCount = _unicodeCodePoints >> _entryShift;
  final List<_TableEntry> _entries =
      List.filled(_entryCount, const _ValueEntry(0));

  int operator [](int index) =>
      _entries[index >> _entryShift][index & _entryMask];

  void operator []=(int index, int value) {
    var entry = index >> _entryShift;
    _entries[entry] = _entries[entry].set(index & _entryMask, value);
  }

  void fillRange(int start, int end, int value) {
    RangeError.checkValidRange(start, end, _unicodeCodePoints);
    var startEntry = start >>> _entryShift;
    var endEntry = end >>> _entryShift;
    var startOffset = start & _entryMask;

    _ValueEntry? fullEntry;
    if (startEntry - endEntry > 1) {
      fullEntry = _ValueEntry(value); // TODO: Cache these per value.
    }
    while (startEntry < endEntry) {
      _entries[startEntry] = _entries[startEntry]
          .fillRange(startOffset, _entrySize, value, fullEntry);
      startOffset = 0;
    }
    var endOffset = end & _entryMask;
    if (endOffset > 0) {
      _entries[endEntry] = _entries[endEntry]
          .fillRange(startOffset, endOffset, value, fullEntry);
    }
  }
}

sealed class _TableEntry {
  const _TableEntry();
  int operator [](int index);
  _TableEntry set(int index, int value);
  _TableEntry fillRange(int start, int end, int value, _ValueEntry? fullEntry) {
    RangeError.checkValidRange(start, end, UnicodePropertyTable._entrySize);
    if (start == 0 && end == UnicodePropertyTable._entrySize) {
      return fullEntry ?? _ValueEntry(value);
    }
    return _fillRange(start, end, value, fullEntry);
  }

  _TableEntry _fillRange(int start, int end, int value, _ValueEntry? fullEntry);
}

final class _ValueEntry extends _TableEntry {
  final int value;
  const _ValueEntry(this.value);

  @override
  int operator [](int index) => value;

  @override
  _TableEntry set(int index, int value) {
    if (value == this.value) return this;
    return _toListEntry()..set(index, value);
  }

  @override
  _TableEntry _fillRange(
      int start, int end, int value, _ValueEntry? fullEntry) {
    if (value == this.value) return fullEntry ?? this;
    return _toListEntry()._fillRange(start, end, value, fullEntry);
  }

  _ListEntry _toListEntry() => _ListEntry(value);
}

final class _ListEntry extends _TableEntry {
  final Uint8List values = Uint8List(UnicodePropertyTable._entrySize);
  _ListEntry([int value = 0]) {
    if (value != 0) {
      values.fillRange(0, UnicodePropertyTable._entrySize, value);
    }
  }

  @override
  int operator [](int index) => values[index];

  @override
  _TableEntry set(int index, int value) {
    values[index] = value;
    return this;
  }

  @override
  _TableEntry _fillRange(
      int start, int end, int value, _ValueEntry? fullEntry) {
    values.fillRange(start, end, value);
    return this;
  }
}
