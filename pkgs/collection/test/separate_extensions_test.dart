// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:collection/collection.dart';
import 'package:test/test.dart';

void main() {
  group('Iterable.separated', () {
    group('empty', () {
      test('', () {
        expect(iterable(<int>[]).separated(42), isEmpty);
      });
      test('before', () {
        expect(iterable(<int>[]).separated(42, before: true), isEmpty);
      });
      test('after', () {
        expect(iterable(<int>[]).separated(42, after: true), isEmpty);
      });
      test('before and after', () {
        expect(iterable(<int>[]).separated(42, before: true, after: true),
            isEmpty);
      });
      test('List', () {
        var separatedList = <int>[].separated(42);
        expect(separatedList, isNot(isA<List>()));
        expect(separatedList, isEmpty);
      });
    });
    group('Singleton', () {
      test('', () {
        expect(iterable(<int>[1]).separated(42), [1]);
      });
      test('before', () {
        expect(iterable(<int>[1]).separated(42, before: true), [42, 1]);
      });
      test('after', () {
        expect(iterable(<int>[1]).separated(42, after: true), [1, 42]);
      });
      test('before and after', () {
        expect(iterable(<int>[1]).separated(42, before: true, after: true),
            [42, 1, 42]);
      });
      test('List', () {
        var separatedList = <int>[1].separated(42);
        expect(separatedList, isNot(isA<List>()));
        expect(separatedList, [1]);
      });
    });
    group('Multiple', () {
      test('', () {
        expect(iterable(<int>[1, 2, 3]).separated(42), [1, 42, 2, 42, 3]);
      });
      test('before', () {
        expect(iterable(<int>[1, 2, 3]).separated(42, before: true),
            [42, 1, 42, 2, 42, 3]);
      });
      test('after', () {
        expect(iterable(<int>[1, 2, 3]).separated(42, after: true),
            [1, 42, 2, 42, 3, 42]);
      });
      test('before and after', () {
        expect(
            iterable(<int>[1, 2, 3]).separated(42, before: true, after: true),
            [42, 1, 42, 2, 42, 3, 42]);
      });
      test('List', () {
        var separatedList = <int>[1, 2, 3].separated(42);
        expect(separatedList, isNot(isA<List>()));
        expect(separatedList, [1, 42, 2, 42, 3]);
      });
    });
    test('nulls', () {
      expect(iterable<int?>([null, 2, null]).separated(null),
          [null, null, 2, null, null]);
    });
    test('upcast receiver', () {
      var source = <int>[1, 2, 3];
      expect(iterable<num>(source).separated(3.14), [1, 3.14, 2, 3.14, 3]);
    });
  });

  // ------------------------------------------------------------------
  group('Iterable.separatedList', () {
    group('empty', () {
      test('', () {
        expect(iterable(<int>[]).separatedList(42), isEmpty);
      });
      test('before', () {
        expect(iterable(<int>[]).separatedList(42, before: true), isEmpty);
      });
      test('after', () {
        expect(iterable(<int>[]).separatedList(42, after: true), isEmpty);
      });
      test('before and after', () {
        expect(iterable(<int>[]).separatedList(42, before: true, after: true),
            isEmpty);
      });
    });
    group('Singleton', () {
      test('', () {
        expect(iterable(<int>[1]).separatedList(42), [1]);
      });
      test('before', () {
        expect(iterable(<int>[1]).separatedList(42, before: true), [42, 1]);
      });
      test('after', () {
        expect(iterable(<int>[1]).separatedList(42, after: true), [1, 42]);
      });
      test('before and after', () {
        expect(iterable(<int>[1]).separatedList(42, before: true, after: true),
            [42, 1, 42]);
      });
    });
    group('Multiple', () {
      test('', () {
        expect(iterable(<int>[1, 2, 3]).separatedList(42), [1, 42, 2, 42, 3]);
      });
      test('before', () {
        expect(iterable(<int>[1, 2, 3]).separatedList(42, before: true),
            [42, 1, 42, 2, 42, 3]);
      });
      test('after', () {
        expect(iterable(<int>[1, 2, 3]).separatedList(42, after: true),
            [1, 42, 2, 42, 3, 42]);
      });
      test('before and after', () {
        expect(
            iterable(<int>[1, 2, 3])
                .separatedList(42, before: true, after: true),
            [42, 1, 42, 2, 42, 3, 42]);
      });
    });
    test('nulls', () {
      expect(iterable<int?>([null, 2, null]).separatedList(null),
          [null, null, 2, null, null]);
    });
    test('upcast receiver', () {
      var source = <int>[1, 2, 3];
      expect(iterable<num>(source).separatedList(3.14), [1, 3.14, 2, 3.14, 3]);
    });
  });

  // ------------------------------------------------------------------
  group('List.separatedList', () {
    group('empty', () {
      test('', () {
        expect(<int>[].separatedList(42), isEmpty);
      });
      test('before', () {
        expect(<int>[].separatedList(42, before: true), isEmpty);
      });
      test('after', () {
        expect(<int>[].separatedList(42, after: true), isEmpty);
      });
      test('before and after', () {
        expect(<int>[].separatedList(42, before: true, after: true), isEmpty);
      });
    });
    group('Singleton', () {
      test('', () {
        expect(<int>[1].separatedList(42), [1]);
      });
      test('before', () {
        expect(<int>[1].separatedList(42, before: true), [42, 1]);
      });
      test('after', () {
        expect(<int>[1].separatedList(42, after: true), [1, 42]);
      });
      test('before and after', () {
        expect(
            <int>[1].separatedList(42, before: true, after: true), [42, 1, 42]);
      });
    });
    group('Multiple', () {
      test('', () {
        expect(<int>[1, 2, 3].separatedList(42), [1, 42, 2, 42, 3]);
      });
      test('before', () {
        expect(<int>[1, 2, 3].separatedList(42, before: true),
            [42, 1, 42, 2, 42, 3]);
      });
      test('after', () {
        expect(<int>[1, 2, 3].separatedList(42, after: true),
            [1, 42, 2, 42, 3, 42]);
      });
      test('before and after', () {
        expect(<int>[1, 2, 3].separatedList(42, before: true, after: true),
            [42, 1, 42, 2, 42, 3, 42]);
      });
    });
    test('nulls', () {
      expect([null, 2, null].separatedList(null), [null, null, 2, null, null]);
    });
    test('upcast receiver', () {
      var source = <int>[1, 2, 3];
      expect((source as List<num>).separatedList(3.14), [1, 3.14, 2, 3.14, 3]);
    });
  });

  // ------------------------------------------------------------------
  group('List.separate', () {
    group('empty', () {
      test('', () {
        expect(<int>[]..separate(42), isEmpty);
      });
      test('before', () {
        expect(<int>[]..separate(42, before: true), isEmpty);
      });
      test('after', () {
        expect(<int>[]..separate(42, after: true), isEmpty);
      });
      test('before and after', () {
        expect(<int>[]..separate(42, before: true, after: true), isEmpty);
      });
    });
    group('Singleton', () {
      test('', () {
        expect(<int>[1]..separate(42), [1]);
      });
      test('before', () {
        expect(<int>[1]..separate(42, before: true), [42, 1]);
      });
      test('after', () {
        expect(<int>[1]..separate(42, after: true), [1, 42]);
      });
      test('before and after', () {
        expect(<int>[1]..separate(42, before: true, after: true), [42, 1, 42]);
      });
    });
    group('Multiple', () {
      group('odd length', () {
        test('', () {
          expect(<int>[1, 2, 3]..separate(42), [1, 42, 2, 42, 3]);
        });
        test('before', () {
          expect(<int>[1, 2, 3]..separate(42, before: true),
              [42, 1, 42, 2, 42, 3]);
        });
        test('after', () {
          expect(
              <int>[1, 2, 3]..separate(42, after: true), [1, 42, 2, 42, 3, 42]);
        });
        test('before and after', () {
          expect(<int>[1, 2, 3]..separate(42, before: true, after: true),
              [42, 1, 42, 2, 42, 3, 42]);
        });
      });
      group('even length', () {
        test('', () {
          expect(<int>[1, 2, 3, 4]..separate(42), [1, 42, 2, 42, 3, 42, 4]);
        });
        test('before', () {
          expect(<int>[1, 2, 3, 4]..separate(42, before: true),
              [42, 1, 42, 2, 42, 3, 42, 4]);
        });
        test('after', () {
          expect(<int>[1, 2, 3, 4]..separate(42, after: true),
              [1, 42, 2, 42, 3, 42, 4, 42]);
        });
        test('before and after', () {
          expect(<int>[1, 2, 3, 4]..separate(42, before: true, after: true),
              [42, 1, 42, 2, 42, 3, 42, 4, 42]);
        });
      });
    });
    test('nulls', () {
      expect([null, 2, null]..separate(null), [null, null, 2, null, null]);
    });
    test('upcast receiver throws', () {
      // Modifying the list is a contravariant operation,
      // throws if separator is not valid.
      var source = <int>[1, 2, 3];
      expect(() => (source as List<num>).separate(3.14),
          throwsA(isA<TypeError>()));
    });
    test('upcast receiver succeeds if separator valid', () {
      // Modifying the list is a contravariant operation,
      // succeeds if the separator is a valid value.
      // (All operations are read/write with existing elements
      // or the separator, which works when upcast if values are valid.)
      var source = <int>[1, 2, 3];
      expect((source as List<num>)..separate(42), [1, 42, 2, 42, 3]);
    });
  });
}

/// Creates a plain iterable not implementing any other class.
Iterable<T> iterable<T>(Iterable<T> values) sync* {
  yield* values;
}
