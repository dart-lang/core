// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:characters/src/grapheme_clusters/table.dart';

import '../../tool/src/debug_names.dart';

export 'unicode_grapheme_tests.dart';

/// Readable description of the [expected] grapheme clusters.
///
/// The list of strings is the expected grapheme cluster separation
/// of the concatenation of those strings.
///
/// The description converts each code unit to a 4-digit hex number,
/// puts ` × ` between the code units of the same grapheme cluster
/// and ` ÷ ` before, after and between the grapheme clusters.
/// (This is the format of the original Unicode test data, so it
/// can be compared to the original tests.)
String testDescription(List<String> expected) {
  var expectedString = expected
      .map((s) =>
          s.runes.map((x) => x.toRadixString(16).padLeft(4, '0')).join(' × '))
      .join(' ÷ ');
  return '÷ $expectedString ÷';
}

int categoryOf(int codePoint) {
  if (codePoint < 0x10000) return low(codePoint);
  var nonBmpOffset = codePoint - 0x10000;
  return high(0xD800 + (nonBmpOffset >> 10), 0xDC00 + (nonBmpOffset & 0x3ff));
}

String partCategories(List<String> parts) {
  var index = 0;
  int posOf(int rune) {
    var result = index;
    index += rune >= 0xFFFF ? 2 : 1;
    return result;
  }

  return parts.map((part) {
    return part.runes
        .map((n) => '#${posOf(n)}:${categoryLongNames[categoryOf(n)]}')
        .join(' × ');
  }).join(' ÷ ');
}
