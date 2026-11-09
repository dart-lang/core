// Copyright (c) 2026, the Otzaria contributors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:characters/characters.dart';
import 'package:test/test.dart';

void main() {
  test('UTF-16 code units are exact, lazy, repeatable, and snapshotted', () {
    const segment = 'אב\u05B0\u{1F600}';
    const source = 'prefix-$segment-suffix';
    final start = 'prefix-'.length;
    final range = CharacterRange.at(source, start, start + segment.length);

    final snapshot = range.utf16CodeUnits;
    expect(snapshot.toList(), segment.codeUnits);
    expect(snapshot.toList(), segment.codeUnits);
    expect(snapshot.length, segment.length);

    range.collapseToEnd();
    expect(range.utf16CodeUnits, isEmpty);
    expect(snapshot.toList(), segment.codeUnits);
  });

  test('a tiny selected range in a large source returns only its units', () {
    final source = List.filled(100000, 'א').join();
    final range = CharacterRange.at(source, 50000, 50002);
    final snapshot = range.utf16CodeUnits;
    expect(snapshot.toList(), [0x05D0, 0x05D0]);

    range.expandAll();
    expect(snapshot.toList(), [0x05D0, 0x05D0]);
    expect(range.utf16CodeUnits.length, source.length - 50000);
  });
}
