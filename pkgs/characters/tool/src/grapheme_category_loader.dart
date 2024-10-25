// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "dart:async";
import 'dart:collection';
import "dart:io" show stderr;
import "dart:typed_data";

import "package:characters/src/grapheme_clusters/constants.dart";

import "data_files.dart";

// Loads the grapheme breaking categories from Unicode data files.

Future<Uint8List> loadGraphemeCategories(
    {bool update = false, bool verbose = false}) async {
  var dataFiles = await Future.wait([
    graphemeBreakPropertyData.load(checkForUpdate: update),
    emojiData.load(checkForUpdate: update),
    // This data used to be in:
    // https://www.unicode.org/Public/12.0.0/ucd/auxiliary/GraphemeBreakProperty-12.0.0d16.txt
    // Make sure it's included.
    Future.value(
        "D800..DFFF    ; Control # Cc       <control-D800>..<control-DFFF>\n"),
  ]);
  var table = _parseCategories(dataFiles, verbose: verbose);
  return table;
}

Future<Uint8List> loadInCBCategories(
    {bool update = false, bool verbose = false}) async {
  var data = await derivedData.load(checkForUpdate: update);
  var table = _parseInCBCategories(data, verbose: verbose);
  return table;
}

// -----------------------------------------------------------------------------
// Unicode table parser.
final _tableRE = RegExp(r"^([\dA-F]{4,5})(?:..([\dA-F]{4,5}))?\s*;\s*(\w+)\s*#",
    multiLine: true);

// The relevant names that occur in the Unicode tables.
final categoryByName = {
  "CR": categoryCR,
  "LF": categoryLF,
  "Control": categoryControl,
  "Extend": categoryExtend,
  "ZWJ": categoryZWJ,
  "Regional_Indicator": categoryRegionalIndicator,
  "Prepend": categoryPrepend,
  "SpacingMark": categorySpacingMark,
  "L": categoryL,
  "V": categoryV,
  "T": categoryT,
  "LV": categoryLV,
  "LVT": categoryLVT,
  "Extended_Pictographic": categoryPictographic,
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
    stderr.writeln("Loaded $count entries");
    categoryCount.forEach((category, count) {
      stderr.writeln("  $category: $count, min: U+"
          "${categoryMin[category]!.toRadixString(16).padLeft(4, "0")}");
    });
  }
  if (result[0xD800] != categoryControl) {
    stderr.writeln("WARNING: Surrogates are not controls. Check inputs.");
  }
  if (categoryMin["Regional_Indicator"]! < 0x10000) {
    stderr.writeln("WARNING: Regional Indicator in BMP. "
        "Code assuming all RIs are non-BMP will fail");
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
    r"^([\dA-F]{4,5})(?:..([\dA-F]{4,5}))?\s*;\s*InCB\s*;\s*(\w+)\s*#"
    r"|"
    r"^# Total code points: (\d+)",
    multiLine: true);

Uint8List _parseInCBCategories(String file, {required bool verbose}) {
  const categoryName = ["None", "Consonant", "Extend", "Linker"];
  var result = Uint8List(0x110000);
  assert(incbNone == 0); // result.fillRange(0, result.length, incbNone);
  var lines = 0;
  var count = 0;
  var counts = List<int>.filled(categoryName.length, 0);
  var totalCounts = List<int>.filled(categoryName.length, 0);
  var lastCategory = -1;
  for (var match in _derivedPropertyTableRE.allMatches(file)) {
    if (match[4] case var totalCountText?) {
      if (lastCategory >= 0) {
        if (totalCounts[lastCategory] != 0) {
          throw FormatException(
              "More than one total count per category", match[0]!);
        }
        totalCounts[lastCategory] = int.parse(totalCountText);
        lastCategory = -1;
      }
      continue;
    }
    var start = int.parse(match[1]!, radix: 16);
    // "None" should not occur in the table, since it's the default.
    var incbCategory = categoryName.indexOf(match[3]!, 1);
    if (incbCategory < 0) {
      throw FormatException("Invalid InCB category", match[0]!);
    }
    var endMatch = match[2];
    if (endMatch == null) {
      assert(result[start] == incbNone);
      result[start] = incbCategory;
      if (verbose) {
        lines += 1;
        count += 1;
        counts[incbCategory] += 1;
      }
    } else {
      var end = int.parse(endMatch, radix: 16);
      assert(result.getRange(start, end + 1).every((x) => x == incbNone));
      result.fillRange(start, end + 1, incbCategory);
      if (verbose) {
        var range = end - start + 1;
        lines += 1;
        count += range;
        counts[incbCategory] += range;
      }
    }
  }
  for (var i = 0; i < counts.length; i++) {
    if (counts[i] != totalCounts[i]) {
      stderr.writeln("${categoryName[i]}: "
          "Parsed: ${counts[i]}, expected: ${totalCounts[i]}");
    }
  }
  if (verbose) {
    stderr.writeln("InCB categories: Loaded $count entries from $lines lines");
    for (var i = 0; i < categoryName.length; i++) {
      stderr.writeln("  ${categoryName[i].padRight(9)}: "
          "${counts[i].toString().padLeft(6)}");
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

  @override
  int operator [](int index) =>
      _entries[index >> _entryShift][index & _entryMask];

  @override
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

  static Never _fixedLength() =>
      throw UnsupportedError("Cannot change length of fixed length list");
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
