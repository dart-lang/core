// Copyright (c) 2026, the Otzaria contributors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:characters/characters.dart';
import 'package:test/test.dart';

void main() {
  test('UTF-16 bounds safely short-circuit oversized grapheme counts', () {
    for (final source in <String>[
      '',
      'abcdef',
      'אָב',
      '\u{1F600}',
      'אב\u05B0ג',
      'א\u{1F1EE}\u{1F1F1}ב',
      '\r\nשלום',
    ]) {
      final characters = Characters(source);
      final max = source.length;
      expect(characters.skip(0), same(characters));
      expect(characters.take(max), same(characters));
      expect(characters.skip(max), isEmpty);
      expect(characters.takeLast(max), same(characters));
      expect(characters.skipLast(max), isEmpty);

      expect(characters.take(1000000), same(characters));
      expect(characters.takeLast(1000000), same(characters));
      expect(characters.skip(1000000), isEmpty);
      expect(characters.skipLast(1000000), isEmpty);
      expect(characters.getRange(0, 1000000), same(characters));

      final suffix = characters.skip(1);
      expect(characters.getRange(1, 1000000), suffix);
    }
  });

  test('bounded selections preserve Hebrew diacritics and emoji clusters', () {
    final characters = Characters('א\u05B7ב\u{1F600}ג');
    expect(characters.take(1).string, 'א\u05B7');
    expect(characters.skip(1).string, 'ב\u{1F600}ג');
    expect(characters.getRange(1, 3).string, 'ב\u{1F600}');
    expect(characters.getRange(1, 100000).string, 'ב\u{1F600}ג');
    expect(characters.takeLast(2).string, '\u{1F600}ג');
    expect(characters.skipLast(2).string, 'א\u05B7ב');
  });
}
