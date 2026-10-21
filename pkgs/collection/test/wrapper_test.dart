// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: unnecessary_statements

/// Tests wrapper utilities.

library;

import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:test/test.dart';

// Test that any member access/call on the wrapper object is equal to
// an expected access on the wrapped object.
// This is implemented by capturing accesses using noSuchMethod and comparing
// them to expected accesses captured previously.

void main() {
  void testTwoElementSet(Set<String> Function() setUpSet) {
    group('with two elements', () {
      late Set<String> set;
      setUp(() => set = setUpSet());

      test('.any', () {
        expect(set.any((element) => element == 'foo'), isTrue);
        expect(set.any((element) => element == 'baz'), isFalse);
      });

      test('.elementAt', () {
        expect(set.elementAt(0), equals('foo'));
        expect(set.elementAt(1), equals('bar'));
        expect(() => set.elementAt(2), throwsRangeError);
      });

      test('.every', () {
        expect(set.every((element) => element == 'foo'), isFalse);
        expect(set.every((element) => true), isTrue);
      });

      test('.expand', () {
        expect(
          set.expand((element) {
            return [element.substring(0, 1), element.substring(1)];
          }),
          equals(['f', 'oo', 'b', 'ar']),
        );
      });

      test('.first', () {
        expect(set.first, equals('foo'));
      });

      test('.firstWhere', () {
        expect(set.firstWhere((element) => true), equals('foo'));
        expect(
          set.firstWhere((element) => element.startsWith('b')),
          equals('bar'),
        );
        expect(
          () => set.firstWhere((element) => element is int),
          throwsStateError,
        );
        expect(
          set.firstWhere((element) => element is int, orElse: () => 'baz'),
          equals('baz'),
        );
      });

      test('.fold', () {
        expect(
          set.fold('start', (dynamic previous, element) => previous + element),
          equals('startfoobar'),
        );
      });

      test('.forEach', () {
        var values = [];
        set.forEach(values.add);
        expect(values, equals(['foo', 'bar']));
      });

      test('.iterator', () {
        var values = [];
        for (var element in set) {
          values.add(element);
        }
        expect(values, equals(['foo', 'bar']));
      });

      test('.join', () {
        expect(set.join(', '), equals('foo, bar'));
      });

      test('.last', () {
        expect(set.last, equals('bar'));
      });

      test('.lastWhere', () {
        expect(set.lastWhere((element) => true), equals('bar'));
        expect(
          set.lastWhere((element) => element.startsWith('f')),
          equals('foo'),
        );
        expect(
          () => set.lastWhere((element) => element is int),
          throwsStateError,
        );
        expect(
          set.lastWhere((element) => element is int, orElse: () => 'baz'),
          equals('baz'),
        );
      });

      test('.map', () {
        expect(
          set.map((element) => element.substring(1)),
          equals(['oo', 'ar']),
        );
      });

      test('.reduce', () {
        expect(
          set.reduce((previous, element) => previous + element),
          equals('foobar'),
        );
      });

      test('.singleWhere', () {
        expect(
          () => set.singleWhere((element) => element == 'baz'),
          throwsStateError,
        );
        expect(set.singleWhere((element) => element == 'foo'), 'foo');
        expect(() => set.singleWhere((element) => true), throwsStateError);
      });

      test('.skip', () {
        expect(set.skip(0), equals(['foo', 'bar']));
        expect(set.skip(1), equals(['bar']));
        expect(set.skip(2), equals([]));
      });

      test('.skipWhile', () {
        expect(
          set.skipWhile((element) => element.startsWith('f')),
          equals(['bar']),
        );
        expect(
          set.skipWhile((element) => element.startsWith('z')),
          equals(['foo', 'bar']),
        );
        expect(set.skipWhile((element) => true), equals([]));
      });

      test('.take', () {
        expect(set.take(0), equals([]));
        expect(set.take(1), equals(['foo']));
        expect(set.take(2), equals(['foo', 'bar']));
      });

      test('.takeWhile', () {
        expect(
          set.takeWhile((element) => element.startsWith('f')),
          equals(['foo']),
        );
        expect(set.takeWhile((element) => element.startsWith('z')), equals([]));
        expect(set.takeWhile((element) => true), equals(['foo', 'bar']));
      });

      test('.toList', () {
        expect(set.toList(), equals(['foo', 'bar']));
        expect(
          () => set.toList(growable: false).add('baz'),
          throwsUnsupportedError,
        );
        expect(set.toList()..add('baz'), equals(['foo', 'bar', 'baz']));
      });

      test('.toSet', () {
        expect(set.toSet(), equals({'foo', 'bar'}));
      });

      test('.where', () {
        expect(
          set.where((element) => element.startsWith('f')),
          equals(['foo']),
        );
        expect(set.where((element) => element.startsWith('z')), equals([]));
        expect(set.whereType<String>(), equals(['foo', 'bar']));
      });

      test('.containsAll', () {
        expect(set.containsAll(['foo', 'bar']), isTrue);
        expect(set.containsAll(['foo']), isTrue);
        expect(set.containsAll(['foo', 'bar', 'qux']), isFalse);
      });

      test('.difference', () {
        expect(set.difference({'foo', 'baz'}), equals({'bar'}));
      });

      test('.intersection', () {
        expect(set.intersection({'foo', 'baz'}), equals({'foo'}));
      });

      test('.union', () {
        expect(set.union({'foo', 'baz'}), equals({'foo', 'bar', 'baz'}));
      });
    });
  }

  group('DelegatingIterable', () {
    test('delegates to underlying iterable', () {
      var base = <int>[1, 2, 3];
      var wrapper = DelegatingIterable<int>(base);

      expect(wrapper.any((x) => x == 2), isTrue);
      expect(wrapper.contains(2), isTrue);
      expect(wrapper.elementAt(1), 2);
      expect(wrapper.every((x) => x > 0), isTrue);
      expect(wrapper.expand((x) => [x, x]).toList(), [1, 1, 2, 2, 3, 3]);
      expect(wrapper.first, 1);
      expect(wrapper.firstWhere((x) => x > 1), 2);
      expect(wrapper.fold<int>(0, (p, e) => p + e), 6);
      expect(wrapper.isEmpty, isFalse);
      expect(wrapper.isNotEmpty, isTrue);
      expect(wrapper.iterator.moveNext(), isTrue);
      expect(wrapper.join(','), '1,2,3');
      expect(wrapper.last, 3);
      expect(wrapper.lastWhere((x) => x < 3), 2);
      expect(wrapper.length, 3);
      expect(wrapper.map((x) => x * 2).toList(), [2, 4, 6]);
      expect(wrapper.reduce((a, b) => a + b), 6);
      expect(wrapper.singleWhere((x) => x == 2), 2);
      expect(wrapper.skip(1).toList(), [2, 3]);
      expect(wrapper.skipWhile((x) => x < 2).toList(), [2, 3]);
      expect(wrapper.take(2).toList(), [1, 2]);
      expect(wrapper.takeWhile((x) => x < 3).toList(), [1, 2]);
      expect(wrapper.toList(), [1, 2, 3]);
      expect(wrapper.toSet(), {1, 2, 3});
      expect(wrapper.where((x) => x > 1).toList(), [2, 3]);
    });
  });

  group('DelegatingList', () {
    test('delegates to underlying list', () {
      var base = <int>[1, 2, 3];
      var wrapper = DelegatingList<int>(base);

      wrapper.add(4);
      expect(base, [1, 2, 3, 4]);

      wrapper.addAll([5, 6]);
      expect(base, [1, 2, 3, 4, 5, 6]);

      wrapper[0] = 0;
      expect(base[0], 0);

      wrapper.fillRange(0, 2, -1);
      expect(base, [-1, -1, 3, 4, 5, 6]);

      expect(wrapper.indexOf(3), 2);
      expect(wrapper.indexWhere((x) => x == 3), 2);

      wrapper.insert(0, 10);
      expect(base[0], 10);

      wrapper.insertAll(0, [11, 12]);
      expect(base.take(2), [11, 12]);

      expect(wrapper.lastIndexOf(3), 5);
      expect(wrapper.lastIndexWhere((x) => x == 3), 5);

      wrapper.remove(10);
      expect(base.contains(10), isFalse);

      wrapper.removeAt(0);
      wrapper.removeLast();

      wrapper.removeRange(0, 1);
      wrapper.removeWhere((x) => x == -1);
      wrapper.replaceRange(0, 1, [20, 21]);
      wrapper.retainWhere((x) => x > 0);

      wrapper.setAll(0, [30, 31]);
      wrapper.setRange(0, 2, [40, 41]);

      base.clear();
      base.addAll([3, 1, 2]);
      wrapper.sort();
      expect(base, [1, 2, 3]);

      wrapper.shuffle();
      expect(base.length, 3);

      base.clear();
      base.addAll([1, 2, 3]);
      expect(wrapper.sublist(0, 1), [1]);

      wrapper.clear();
      expect(base, isEmpty);

      var nullBase = <int?>[1, 2];
      var nullWrapper = DelegatingList<int?>(nullBase);
      nullWrapper.length = 5;
      expect(nullBase.length, 5);
    });
  });

  group('DelegatingSet', () {
    test('delegates to underlying set', () {
      var base = <int>{1, 2, 3};
      var wrapper = DelegatingSet<int>(base);

      wrapper.add(4);
      expect(base, {1, 2, 3, 4});

      wrapper.addAll([5, 6]);
      expect(base, {1, 2, 3, 4, 5, 6});

      wrapper.remove(1);
      expect(base, {2, 3, 4, 5, 6});

      wrapper.removeAll([2, 3]);
      expect(base, {4, 5, 6});

      wrapper.removeWhere((x) => x == 4);
      expect(base, {5, 6});

      wrapper.retainAll([5]);
      expect(base, {5});

      base.addAll([6, 7]);
      wrapper.retainWhere((x) => x == 5);
      expect(base, {5});

      expect(wrapper.containsAll([5]), isTrue);
      expect(wrapper.difference({5}), isEmpty);
      expect(wrapper.intersection({5}), {5});
      expect(wrapper.union({6}), {5, 6});
      expect(wrapper.lookup(5), 5);

      wrapper.clear();
      expect(base, isEmpty);
    });
  });

  group('DelegatingQueue', () {
    test('delegates to underlying queue', () {
      var base = Queue<int>.from([1, 2, 3]);
      var wrapper = DelegatingQueue<int>(base);

      wrapper.add(4);
      expect(base, equals([1, 2, 3, 4]));

      wrapper.addAll([5, 6]);
      expect(base, equals([1, 2, 3, 4, 5, 6]));

      wrapper.addFirst(0);
      expect(base.first, 0);

      wrapper.addLast(7);
      expect(base.last, 7);

      wrapper.remove(0);
      expect(base.contains(0), isFalse);

      wrapper.removeFirst();
      expect(base.first, 2);

      wrapper.removeLast();
      expect(base.last, 6);

      wrapper.removeWhere((x) => x == 2);
      expect(base.first, 3);

      wrapper.retainWhere((x) => x == 3);
      expect(base, equals([3]));

      wrapper.clear();
      expect(base, isEmpty);
    });
  });

  group('DelegatingMap', () {
    test('delegates to underlying map', () {
      var base = <String, int>{'a': 1, 'b': 2};
      var wrapper = DelegatingMap<String, int>(base);

      expect(wrapper['a'], 1);

      wrapper['c'] = 3;
      expect(base['c'], 3);

      wrapper.addAll({'d': 4});
      expect(base['d'], 4);

      expect(wrapper.containsKey('a'), isTrue);
      expect(wrapper.containsValue(1), isTrue);
      expect(wrapper.isEmpty, isFalse);
      expect(wrapper.isNotEmpty, isTrue);
      expect(wrapper.keys.toList(), ['a', 'b', 'c', 'd']);
      expect(wrapper.values.toList(), [1, 2, 3, 4]);
      expect(wrapper.length, 4);

      wrapper.remove('a');
      expect(base.containsKey('a'), isFalse);

      wrapper.removeWhere((k, v) => k == 'b');
      expect(base.containsKey('b'), isFalse);

      wrapper.update('c', (v) => v + 1);
      expect(base['c'], 4);

      wrapper.updateAll((k, v) => v * 2);
      expect(base['c'], 8);

      wrapper.putIfAbsent('e', () => 5);
      expect(base['e'], 5);

      wrapper.addEntries([const MapEntry('f', 6)]);
      expect(base['f'], 6);

      wrapper.clear();
      expect(base, isEmpty);
    });
  });

  group('MapKeySet', () {
    late Map<String, dynamic> map;
    late Set<String> set;

    setUp(() {
      map = <String, int>{};
      set = MapKeySet<String>(map);
    });

    testTwoElementSet(() {
      map['foo'] = 1;
      map['bar'] = 2;
      return set;
    });

    test('.single', () {
      expect(() => set.single, throwsStateError);
      map['foo'] = 1;
      expect(set.single, equals('foo'));
      map['bar'] = 1;
      expect(() => set.single, throwsStateError);
    });

    test('.toString', () {
      expect(set.toString(), equals('{}'));
      map['foo'] = 1;
      map['bar'] = 2;
      expect(set.toString(), equals('{foo, bar}'));
    });

    test('.contains', () {
      expect(set, isNot(contains('foo')));
      map['foo'] = 1;
      expect(set, contains('foo'));
    });

    test('.isEmpty', () {
      expect(set, isEmpty);
      map['foo'] = 1;
      expect(set, isNotEmpty);
    });

    test('.isNotEmpty', () {
      expect(set, isEmpty);
      map['foo'] = 1;
      expect(set, isNotEmpty);
    });

    test('.length', () {
      expect(set, hasLength(0));
      map['foo'] = 1;
      expect(set, hasLength(1));
      map['bar'] = 2;
      expect(set, hasLength(2));
    });

    test('is unmodifiable', () {
      expect(() => set.add('baz'), throwsUnsupportedError);
      expect(() => set.addAll(['baz', 'bang']), throwsUnsupportedError);
      expect(() => set.remove('foo'), throwsUnsupportedError);
      expect(() => set.removeAll(['baz', 'bang']), throwsUnsupportedError);
      expect(() => set.retainAll(['foo']), throwsUnsupportedError);
      expect(() => set.removeWhere((_) => true), throwsUnsupportedError);
      expect(() => set.retainWhere((_) => true), throwsUnsupportedError);
      expect(() => set.clear(), throwsUnsupportedError);
    });
  });

  group('MapValueSet', () {
    late Map<String, String> map;
    late Set<String> set;

    setUp(() {
      map = <String, String>{};
      set = MapValueSet<String, String>(
        map,
        (string) => string.substring(0, 1),
      );
    });

    testTwoElementSet(() {
      map['f'] = 'foo';
      map['b'] = 'bar';
      return set;
    });

    test('.single', () {
      expect(() => set.single, throwsStateError);
      map['f'] = 'foo';
      expect(set.single, equals('foo'));
      map['b'] = 'bar';
      expect(() => set.single, throwsStateError);
    });

    test('.toString', () {
      expect(set.toString(), equals('{}'));
      map['f'] = 'foo';
      map['b'] = 'bar';
      expect(set.toString(), equals('{foo, bar}'));
    });

    test('.contains', () {
      expect(set, isNot(contains('foo')));
      map['f'] = 'foo';
      expect(set, contains('foo'));
      expect(set, contains('fblthp'));
    });

    test('.isEmpty', () {
      expect(set, isEmpty);
      map['f'] = 'foo';
      expect(set, isNotEmpty);
    });

    test('.isNotEmpty', () {
      expect(set, isEmpty);
      map['f'] = 'foo';
      expect(set, isNotEmpty);
    });

    test('.length', () {
      expect(set, hasLength(0));
      map['f'] = 'foo';
      expect(set, hasLength(1));
      map['b'] = 'bar';
      expect(set, hasLength(2));
    });

    test('.lookup', () {
      map['f'] = 'foo';
      expect(set.lookup('fblthp'), equals('foo'));
      expect(set.lookup('bar'), isNull);
    });

    test('.add', () {
      set.add('foo');
      set.add('bar');
      expect(map, equals({'f': 'foo', 'b': 'bar'}));
    });

    test('.addAll', () {
      set.addAll(['foo', 'bar']);
      expect(map, equals({'f': 'foo', 'b': 'bar'}));
    });

    test('.clear', () {
      map['f'] = 'foo';
      map['b'] = 'bar';
      set.clear();
      expect(map, isEmpty);
    });

    test('.remove', () {
      map['f'] = 'foo';
      map['b'] = 'bar';
      set.remove('fblthp');
      expect(map, equals({'b': 'bar'}));
    });

    test('.removeAll', () {
      map['f'] = 'foo';
      map['b'] = 'bar';
      map['q'] = 'qux';
      set.removeAll(['fblthp', 'qux']);
      expect(map, equals({'b': 'bar'}));
    });

    test('.removeWhere', () {
      map['f'] = 'foo';
      map['b'] = 'bar';
      map['q'] = 'qoo';
      set.removeWhere((element) => element.endsWith('o'));
      expect(map, equals({'b': 'bar'}));
    });

    test('.retainAll', () {
      map['f'] = 'foo';
      map['b'] = 'bar';
      map['q'] = 'qux';
      set.retainAll(['fblthp', 'qux']);
      expect(map, equals({'f': 'foo', 'q': 'qux'}));
    });

    test('.retainAll respects an unusual notion of equality', () {
      map = HashMap<String, String>(
        equals: (value1, value2) =>
            value1.toLowerCase() == value2.toLowerCase(),
        hashCode: (value) => value.toLowerCase().hashCode,
      );
      set = MapValueSet<String, String>(
        map,
        (string) => string.substring(0, 1),
      );

      map['f'] = 'foo';
      map['B'] = 'bar';
      map['Q'] = 'qux';
      set.retainAll(['fblthp', 'qux']);
      expect(map, equals({'f': 'foo', 'Q': 'qux'}));
    });

    test('.retainWhere', () {
      map['f'] = 'foo';
      map['b'] = 'bar';
      map['q'] = 'qoo';
      set.retainWhere((element) => element.endsWith('o'));
      expect(map, equals({'f': 'foo', 'q': 'qoo'}));
    });
  });
}
