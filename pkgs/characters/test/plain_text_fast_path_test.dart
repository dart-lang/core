// Copyright (c) 2026, the Dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:characters/characters.dart';
import 'package:characters/src/grapheme_clusters/breaks.dart';
import 'package:characters/src/grapheme_clusters/constants.dart';
import 'package:characters/src/grapheme_clusters/table.dart';
import 'package:test/test.dart';

void main() {
  test('every fast-path code unit matches the generated automata', () {
    for (final (start, end) in [(0x20, 0x7E), (0x05D0, 0x05EA)]) {
      for (var codeUnit = start; codeUnit <= end; codeUnit++) {
        expect(
          low(codeUnit),
          categoryOther,
          reason: 'U+${codeUnit.toRadixString(16)}',
        );
        expect(
          move(stateOther, low(codeUnit)),
          stateOther | flagBreak,
          reason: 'forward U+${codeUnit.toRadixString(16)}',
        );
        expect(
          moveBack(stateOther, low(codeUnit)),
          stateOther | flagBreak,
          reason: 'backward U+${codeUnit.toRadixString(16)}',
        );
      }
    }
  });

  test('plain Hebrew and ASCII keep Unicode cluster boundaries', () {
    const text = 'שלום, אב\u05B0ג\r\nHello\u{1F600}!';
    const expected = <String>[
      'ש',
      'ל',
      'ו',
      'ם',
      ',',
      ' ',
      'א',
      'ב\u05B0',
      'ג',
      '\r\n',
      'H',
      'e',
      'l',
      'l',
      'o',
      '\u{1F600}',
      '!',
    ];

    final characters = Characters(text);
    expect(characters.toList(), expected);
    expect(characters.length, expected.length);
    expect(characters.getRange(6, 9).string, 'אב\u05B0ג');

    final forwardBreaks = Breaks(text, 0, text.length, stateSoTNoBreak);
    final forward = <String>[];
    var start = 0;
    while (true) {
      final end = forwardBreaks.nextBreak();
      if (end < 0) break;
      forward.add(text.substring(start, end));
      start = end;
    }
    expect(forward, expected);

    final backwardBreaks = BackBreaks(text, text.length, 0, stateEoTNoBreak);
    final backward = <String>[];
    var end = text.length;
    while (true) {
      final start = backwardBreaks.nextBreak();
      if (start < 0) break;
      backward.add(text.substring(start, end));
      end = start;
    }
    expect(backward, expected.reversed.toList());

    final iteratorAtEnd = characters.iteratorAtEnd;
    final reversedByRange = <String>[];
    while (iteratorAtEnd.moveBack()) {
      reversedByRange.add(iteratorAtEnd.current);
    }
    expect(reversedByRange, expected.reversed.toList());
  });

  test('large plain Hebrew and ASCII runs have one cluster per code unit', () {
    final text = List.filled(1000, 'בראשית ברא אלוקים ABC ').join();
    final characters = Characters(text);
    expect(characters.length, text.length);
    expect(characters.toList().join(), text);
    expect(characters.take(30).length, 30);
    expect(characters.skip(30).length, text.length - 30);
  });
}
