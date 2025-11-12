// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:collection/collection.dart';
import 'package:test/test.dart';

void main() {
  group('Iterable.separated', () {
    group('empty', () {
      test('', () {
        expectIterable(iterable(<int>[]).separated(42), <int>[]);
      });
      test('before', () {
        expectIterable(iterable(<int>[]).separated(42, before: true), <int>[]);
      });
      test('after', () {
        expectIterable(iterable(<int>[]).separated(42, after: true), <int>[]);
      });
      test('before and after', () {
        expectIterable(
            iterable(<int>[]).separated(42, before: true, after: true),
            <int>[]);
      });
      test('List', () {
        var separatedList = iterable(<int>[]).separated(42);
        expect(separatedList, isNot(isA<List>()));
        expectIterable(separatedList, <int>[]);
      });
    });
    group('Singleton', () {
      test('', () {
        expectIterable(iterable(<int>[1]).separated(42), [1]);
      });
      test('before', () {
        expectIterable(iterable(<int>[1]).separated(42, before: true), [42, 1]);
      });
      test('after', () {
        expectIterable(iterable(<int>[1]).separated(42, after: true), [1, 42]);
      });
      test('before and after', () {
        expectIterable(
            iterable(<int>[1]).separated(42, before: true, after: true),
            [42, 1, 42]);
      });
      test('List', () {
        var separatedList = iterable(<int>[1]).separated(42);
        expect(separatedList, isNot(isA<List>()));
        expectIterable(separatedList, [1]);
      });
    });
    group('Multiple', () {
      test('', () {
        expectIterable(
            iterable(<int>[1, 2, 3]).separated(42), [1, 42, 2, 42, 3]);
      });
      test('before', () {
        expectIterable(iterable(<int>[1, 2, 3]).separated(42, before: true),
            [42, 1, 42, 2, 42, 3]);
      });
      test('after', () {
        expectIterable(iterable(<int>[1, 2, 3]).separated(42, after: true),
            [1, 42, 2, 42, 3, 42]);
      });
      test('before and after', () {
        expectIterable(
            iterable(<int>[1, 2, 3]).separated(42, before: true, after: true),
            [42, 1, 42, 2, 42, 3, 42]);
      });
    });
    test('nulls', () {
      expectIterable(iterable<int?>([null, 2, null]).separated(null),
          [null, null, 2, null, null]);
    });
    test('upcast receiver', () {
      var source = <int>[1, 2, 3];
      expectIterable(
          iterable<num>(source).separated(3.14), [1, 3.14, 2, 3.14, 3]);
    });
  });

  // ------------------------------------------------------------------
  group('List.separated', () {
    group('empty', () {
      test('', () {
        expectUnmodifiableList(<int>[].separated(42), <int>[], 0);
      });
      test('before', () {
        expectUnmodifiableList(<int>[].separated(42, before: true), <int>[], 0);
      });
      test('after', () {
        expectUnmodifiableList(<int>[].separated(42, after: true), <int>[], 0);
      });
      test('before and after', () {
        expectUnmodifiableList(
            <int>[].separated(42, before: true, after: true), <int>[], 0);
      });
      test('List', () {
        var separatedList = <int>[].separated(42);
        expect(separatedList, isA<List>());
        expectUnmodifiableList(separatedList, <int>[], 0);
      });
    });
    group('Singleton', () {
      test('', () {
        expectUnmodifiableList(<int>[1].separated(42), [1], 0);
      });
      test('before', () {
        expectUnmodifiableList(
            <int>[1].separated(42, before: true), [42, 1], 0);
      });
      test('after', () {
        expectUnmodifiableList(<int>[1].separated(42, after: true), [1, 42], 0);
      });
      test('before and after', () {
        expectUnmodifiableList(
            <int>[1].separated(42, before: true, after: true), [42, 1, 42], 0);
      });
      test('List', () {
        var separatedList = <int>[1].separated(42);
        expect(separatedList, isA<List>());
        expectUnmodifiableList(separatedList, [1], 0);
      });
    });
    group('Multiple', () {
      test('', () {
        expectUnmodifiableList(
            <int>[1, 2, 3].separated(42), [1, 42, 2, 42, 3], 0);
      });
      test('before', () {
        expectUnmodifiableList(<int>[1, 2, 3].separated(42, before: true),
            [42, 1, 42, 2, 42, 3], 0);
      });
      test('after', () {
        expectUnmodifiableList(<int>[1, 2, 3].separated(42, after: true),
            [1, 42, 2, 42, 3, 42], 0);
      });
      test('before and after', () {
        expectUnmodifiableList(
            <int>[1, 2, 3].separated(42, before: true, after: true),
            [42, 1, 42, 2, 42, 3, 42],
            0);
      });
      test('List', () {
        var separatedList = <int>[1, 2, 3].separated(42);
        expect(separatedList, isA<List>());
        expectUnmodifiableList(separatedList, [1, 42, 2, 42, 3], 0);
      });
    });
    test('nulls', () {
      expectUnmodifiableList(
          [null, 2, null].separated(null), [null, null, 2, null, null], 0);
    });
    test('upcast receiver', () {
      var source = <int>[1, 2, 3];
      expectUnmodifiableList(
          (source as List<num>).separated(3.14), [1, 3.14, 2, 3.14, 3], 0);
    });
  });

  // ------------------------------------------------------------------
  group('Iterable.separatedList', () {
    group('empty', () {
      test('', () {
        expect(iterable(<int>[]).separatedList(42), <int>[]);
      });
      test('before', () {
        expect(iterable(<int>[]).separatedList(42, before: true), <int>[]);
      });
      test('after', () {
        expect(iterable(<int>[]).separatedList(42, after: true), <int>[]);
      });
      test('before and after', () {
        expect(iterable(<int>[]).separatedList(42, before: true, after: true),
            <int>[]);
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
        expect(<int>[].separatedList(42), <int>[]);
      });
      test('before', () {
        expect(<int>[].separatedList(42, before: true), <int>[]);
      });
      test('after', () {
        expect(<int>[].separatedList(42, after: true), <int>[]);
      });
      test('before and after', () {
        expect(<int>[].separatedList(42, before: true, after: true), <int>[]);
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
        expectList(<int>[]..separate(42), <int>[]);
      });
      test('before', () {
        expectList(<int>[]..separate(42, before: true), <int>[]);
      });
      test('after', () {
        expectList(<int>[]..separate(42, after: true), <int>[]);
      });
      test('before and after', () {
        expectList(<int>[]..separate(42, before: true, after: true), <int>[]);
      });
    });
    group('Singleton', () {
      test('', () {
        expectList(<int>[1]..separate(42), [1]);
      });
      test('before', () {
        expectList(<int>[1]..separate(42, before: true), [42, 1]);
      });
      test('after', () {
        expectList(<int>[1]..separate(42, after: true), [1, 42]);
      });
      test('before and after', () {
        expectList(
            <int>[1]..separate(42, before: true, after: true), [42, 1, 42]);
      });
    });
    group('Multiple', () {
      group('odd length', () {
        test('', () {
          expectList(<int>[1, 2, 3]..separate(42), [1, 42, 2, 42, 3]);
        });
        test('before', () {
          expectList(<int>[1, 2, 3]..separate(42, before: true),
              [42, 1, 42, 2, 42, 3]);
        });
        test('after', () {
          expectList(
              <int>[1, 2, 3]..separate(42, after: true), [1, 42, 2, 42, 3, 42]);
        });
        test('before and after', () {
          expectList(<int>[1, 2, 3]..separate(42, before: true, after: true),
              [42, 1, 42, 2, 42, 3, 42]);
        });
      });
      group('even length', () {
        test('', () {
          expectList(<int>[1, 2, 3, 4]..separate(42), [1, 42, 2, 42, 3, 42, 4]);
        });
        test('before', () {
          expectList(<int>[1, 2, 3, 4]..separate(42, before: true),
              [42, 1, 42, 2, 42, 3, 42, 4]);
        });
        test('after', () {
          expectList(<int>[1, 2, 3, 4]..separate(42, after: true),
              [1, 42, 2, 42, 3, 42, 4, 42]);
        });
        test('before and after', () {
          expectList(<int>[1, 2, 3, 4]..separate(42, before: true, after: true),
              [42, 1, 42, 2, 42, 3, 42, 4, 42]);
        });
      });
    });
    test('nulls', () {
      expectList([null, 2, null]..separate(null), [null, null, 2, null, null]);
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
      expectList((source as List<num>)..separate(42), [1, 42, 2, 42, 3]);
    });
  });
}

/// Creates a plain iterable not implementing any other class.
Iterable<T> iterable<T>(Iterable<T> values) sync* {
  yield* values;
}

void expectIterable<T>(Iterable<T> actual, List<T> expected) {
  expect(actual, expected); // Elements are correct, uses `iterator`.

  // Specialized members should work.
  expect(actual.length, expected.length);
  for (var i = 0; i < expected.length; i++) {
    expect(actual.isEmpty, expected.isEmpty);
    expect(actual.isNotEmpty, expected.isNotEmpty);
    expect(actual.elementAt(i), expected[i]);
    expect(actual.skip(i), expected.sublist(i));
    expect(actual.take(i), expected.sublist(0, i));
  }
  expect(() => actual.elementAt(actual.length), throwsRangeError);
  expect(() => actual.elementAt(-1), throwsRangeError);

  if (expected.isNotEmpty) {
    expect(actual.first, expected.first, reason: 'first');
    expect(actual.last, expected.last, reason: 'last');
  } else {
    expect(() => actual.first, throwsStateError, reason: 'first');
    expect(() => actual.last, throwsStateError, reason: 'last');
  }
}

void expectList<T>(List<T> actual, List<T> expected) {
  expectIterable(actual, expected);

  for (var i = 0; i < expected.length; i++) {
    expect(actual[i], expected[i]);
  }
  expect(() => actual[actual.length], throwsRangeError);
  expect(() => actual[-1], throwsRangeError);
}

void expectUnmodifiableList<T>(List<T> actual, List<T> expected, T value) {
  expectList(actual, expected);

  expect(() => actual.length = 0, throwsUnsupportedError);
  expect(() => actual.add(value), throwsUnsupportedError);
  expect(() => actual.addAll([]), throwsUnsupportedError);
  expect(() => actual.clear(), throwsUnsupportedError);
  expect(() => actual.fillRange(0, 0, value), throwsUnsupportedError);
  expect(() => actual.remove(0), throwsUnsupportedError);
  expect(() => actual.removeAt(0), throwsUnsupportedError);
  expect(() => actual.removeLast(), throwsUnsupportedError);
  expect(() => actual.removeRange(0, 0), throwsUnsupportedError);
  expect(() => actual.removeWhere((_) => false), throwsUnsupportedError);
  expect(() => actual.replaceRange(0, 0, []), throwsUnsupportedError);
  expect(() => actual.retainWhere((_) => true), throwsUnsupportedError);
  expect(() => actual.setAll(0, []), throwsUnsupportedError);
  expect(() => actual.setRange(0, 0, []), throwsUnsupportedError);
  expect(() => actual.sort((a, b) => 0), throwsUnsupportedError);
}
