// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Tests for BoolList.

import 'package:collection/collection.dart';
import 'package:test/test.dart';

void main() {
  test('empty fill ranges are no-ops for empty BoolLists', () {
    final fixed = BoolList(0);
    final growable = BoolList.empty();

    fixed.fillRange(0, 0, true);
    growable.fillRange(0, 0, true);

    expect(fixed, isEmpty);
    expect(growable, isEmpty);
  });

  test('empty fill at a word boundary preserves neighboring bits', () {
    final bits = BoolList(96, fill: true);

    bits.fillRange(32, 32, false);
    bits.fillRange(64, 64, false);
    bits.fillRange(96, 96, true);

    expect(bits, List<bool>.filled(96, true));
  });

  test('empty fill at zero never modifies the first word', () {
    final bits = BoolList(64);

    bits.fillRange(0, 0, true);

    expect(bits, List<bool>.filled(64, false));
  });

  bool generator(int index) {
    if (index < 512) {
      return index.isEven;
    }
    return false;
  }

  test('BoolList()', () {
    expect(BoolList(1024, fill: false), List.filled(1024, false));

    expect(BoolList(1024, fill: true), List.filled(1024, true));
  });

  test('BoolList.empty()', () {
    expect(BoolList.empty(growable: true, capacity: 1024), []);

    expect(BoolList.empty(growable: false, capacity: 1024), []);
  });

  test('BoolList.generate()', () {
    expect(BoolList.generate(1024, generator), List.generate(1024, generator));
  });

  test('BoolList.of()', () {
    var src = List.generate(1024, generator);
    expect(BoolList.of(src), src);
  });

  group('[], []=', () {
    test('RangeError', () {
      var b = BoolList(1024, fill: false);

      expect(() {
        // ignore: unnecessary_statements
        b[-1];
      }, throwsRangeError);

      expect(() {
        // ignore: unnecessary_statements
        b[1024];
      }, throwsRangeError);
    });

    test('[], []=', () {
      var b = BoolList(1024, fill: false);

      bool posVal;
      for (var pos = 0; pos < 1024; ++pos) {
        posVal = generator(pos);
        b[pos] = posVal;
        expect(b[pos], posVal, reason: 'at pos $pos');
      }
    });
  });

  group('length', () {
    test('shrink length', () {
      var b = BoolList(1024, fill: true, growable: true);

      b.length = 768;
      expect(b, List.filled(768, true));

      b.length = 128;
      expect(b, List.filled(128, true));

      b.length = 0;
      expect(b, []);
    });

    test('expand from != 0', () {
      var b = BoolList(256, fill: true, growable: true);

      b.length = 384;
      expect(b, List.filled(384, false)..fillRange(0, 256, true));

      b.length = 2048;
      expect(b, List.filled(2048, false)..fillRange(0, 256, true));
    });

    test('expand from = 0', () {
      var b = BoolList(0, growable: true);
      expect(b, hasLength(0));

      b.length = 256;
      expect(b, List.filled(256, false));
    });

    test('throw UnsupportedError', () {
      expect(() {
        BoolList(1024).length = 512;
      }, throwsUnsupportedError);
    });
  });

  group('fillRange', () {
    test('In one word', () {
      expect(
        BoolList(1024)..fillRange(32, 64, true),
        List.filled(1024, false)..fillRange(32, 64, true),
      );

      expect(
        // BoolList.filled constructor isn't used due internal usage of
        // fillRange
        BoolList.generate(1024, (i) => true)..fillRange(32, 64, false),
        List.filled(1024, true)..fillRange(32, 64, false),
      );
    });

    test('In several words', () {
      expect(
        BoolList(1024)..fillRange(32, 128, true),
        List.filled(1024, false)..fillRange(32, 128, true),
      );

      expect(
        // BoolList.filled constructor isn't used due internal usage of
        // fillRange
        BoolList.generate(1024, (i) => true)..fillRange(32, 128, false),
        List.filled(1024, true)..fillRange(32, 128, false),
      );
    });
  });

  group('Iterator', () {
    test('Iterator', () {
      var b = BoolList.generate(1024, generator);
      var iter = b.iterator;

      expect(iter.current, false);
      for (var i = 0; i < 1024; i++) {
        expect(iter.moveNext(), true);

        expect(iter.current, generator(i), reason: 'at pos $i');
      }

      expect(iter.moveNext(), false);
      expect(iter.current, false);
    });

    test('throw ConcurrentModificationError', () {
      var b = BoolList(1024, fill: true, growable: true);

      var iter = b.iterator;

      iter.moveNext();
      b.length = 512;
      expect(() {
        iter.moveNext();
      }, throwsConcurrentModificationError);
    });
  });
}
