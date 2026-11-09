// Copyright (c) 2026, the Otzaria contributors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:characters/characters.dart';
import 'package:test/test.dart';

void main() {
  test('characterAt returns whole grapheme clusters', () {
    final characters = Characters('א\u05B8\u{1F600}');
    expect(characters.characterAt(0).string, 'א\u05B8');
    expect(characters.characterAt(1).string, '\u{1F600}');
  });

  test('characterAt rejects negative and out-of-range positions', () {
    final characters = Characters('א\u05B8\u{1F600}');
    expect(() => characters.characterAt(-1), throwsRangeError);
    expect(() => characters.characterAt(2), throwsRangeError);
    expect(() => characters.characterAt(100), throwsRangeError);
    expect(() => Characters.empty.characterAt(0), throwsRangeError);
  });

  test('characterAt reports the originally requested invalid position', () {
    for (final text in ['', 'א\u05B8\u{1F600}', '\r\n', '\uDC00']) {
      for (final position in [-1, text.characters.length, 100]) {
        expect(
          () => text.characters.characterAt(position),
          throwsA(
            isA<RangeError>().having(
              (error) => error.invalidValue,
              'invalidValue',
              position,
            ),
          ),
        );
      }
    }
  });
}
