// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "dart:async";
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
      var to = match[2] == null ? from : int.parse(match[2]!, radix: 16);
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
