// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Regression tests for backwards iteration over a string whose first code
// unit is an unpaired tail (low) surrogate. `BackBreaks.step` used to read the
// code unit before `start`, which throws a `RangeError` when `start` is 0.

import 'package:characters/characters.dart';
import 'package:characters/src/grapheme_clusters/breaks.dart';
import 'package:characters/src/grapheme_clusters/constants.dart';
import 'package:test/test.dart';

void main() {
  group('unpaired tail surrogate at start:', () {
    test('Characters.last of a lone tail surrogate', () {
      expect('\uDC00'.characters.last, '\uDC00');
      expect('\uDC00'.characters.length, 1);
    });

    test('Characters.last with regional indicator lookahead', () {
      // Backwards iteration from a regional indicator looks back through all
      // preceding code points to count regional indicators.
      const text = '\uDC00\u{1F1E6}';
      expect(text.characters.last, '\u{1F1E6}');
      expect(text.characters.toList(), ['\uDC00', '\u{1F1E6}']);
    });

    test('Characters.last with ZWJ + pictographic lookahead', () {
      const text = '\uDC00\u200D\u{1F600}';
      expect(text.characters.last, '\u{1F600}');
      expect(text.characters.toList(), ['\uDC00', '\u200D', '\u{1F600}']);
    });

    test('backwards iteration matches forwards iteration', () {
      const text = '\uDC00a\uDC00';
      var forward = text.characters.toList();
      var backward = <String>[];
      var range = text.characters.iteratorAtEnd;
      while (range.moveBack()) {
        backward.add(range.current);
      }
      expect(forward, ['\uDC00', 'a', '\uDC00']);
      expect(backward, forward.reversed.toList());
    });

    test('BackBreaks does not pair with a lead surrogate before start', () {
      // The lead surrogate before `start` is outside the iterated range and
      // must not be combined with the tail surrogate at `start`.
      const text = '\uD83D\uDC4D';
      var breaks = BackBreaks(text, text.length, 1, stateEoTNoBreak);
      expect(breaks.nextBreak(), 1);
      expect(breaks.cursor, 1);
    });
  });
}
