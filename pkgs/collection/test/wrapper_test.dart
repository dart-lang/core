// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Tests wrapper utilities.
library;

import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:test/test.dart';

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

  void testIterable<T>(Iterable<T> iterable, List<T> expected) {
    expect(iterable, expected);
    expect(iterable, hasLength(expected.length));
    expect(iterable.cast<Object?>(), expected);
    expect(iterable, isNot(contains(Object())));
    expect(() => iterable.elementAt(expected.length), throwsRangeError);
    expect(iterable.every(expected.contains), isTrue);
    expect(iterable.expand((x) => [x, x]), [
      for (var x in expected) ...[x, x],
    ]);
    expect(
      iterable.fold<List<T>>([], (previous, element) => [...previous, element]),
      expected,
    );
    expect(iterable.followedBy(expected), [...expected, ...expected]);

    var visited = <T>[];
    iterable.forEach(visited.add);
    expect(visited, expected);

    var iterator = iterable.iterator;
    for (var element in expected) {
      expect(iterator.moveNext(), isTrue);
      expect(iterator.current, element);
    }
    expect(iterator.moveNext(), isFalse);

    expect(iterable.join(), expected.join());
    expect(iterable.join(','), expected.join(','));
    expect(iterable.map((x) => '$x!'), expected.map((x) => '$x!'));
    expect(iterable.skip(1), expected.skip(1));
    expect(iterable.take(2), expected.take(2));
    expect(iterable.toList(), expected);
    expect(
      () => iterable.toList(growable: false).clear(),
      throwsUnsupportedError,
    );
    expect(iterable.toSet(), expected.toSet());
    expect(iterable.whereType<T>(), expected);
    expect(iterable.whereType<Never>(), isEmpty);

    if (expected.isEmpty) {
      expect(iterable, isEmpty);
      expect(iterable.any((_) => true), isFalse);
      expect(() => iterable.first, throwsStateError);
      expect(() => iterable.firstWhere((_) => true), throwsStateError);
      expect(() => iterable.last, throwsStateError);
      expect(() => iterable.lastWhere((_) => true), throwsStateError);
      expect(() => iterable.reduce((a, _) => a), throwsStateError);
      expect(() => iterable.single, throwsStateError);
      expect(() => iterable.singleWhere((_) => true), throwsStateError);
      expect(iterable.skipWhile((_) => true), isEmpty);
      expect(iterable.takeWhile((_) => true), isEmpty);
      expect(iterable.where((_) => true), isEmpty);
      return;
    }

    expect(iterable, isNotEmpty);
    expect(iterable.any((x) => x == expected.last), isTrue);
    expect(iterable.any((_) => false), isFalse);
    for (var i = 0; i < expected.length; i++) {
      expect(iterable, contains(expected[i]));
      expect(iterable.elementAt(i), expected[i]);
    }
    expect(iterable.every((x) => x != expected.first), isFalse);
    expect(iterable.first, expected.first);
    expect(iterable.firstWhere((x) => x == expected.last), expected.last);
    expect(
      iterable.firstWhere((_) => false, orElse: () => expected.first),
      expected.first,
    );
    expect(iterable.last, expected.last);
    expect(iterable.lastWhere((x) => x == expected.first), expected.first);
    expect(
      iterable.lastWhere((_) => false, orElse: () => expected.last),
      expected.last,
    );
    expect(iterable.reduce((_, element) => element), expected.last);
    if (expected.length == 1) {
      expect(iterable.single, expected.single);
      expect(iterable.singleWhere((_) => true), expected.single);
    } else {
      expect(() => iterable.single, throwsStateError);
      expect(() => iterable.singleWhere((_) => true), throwsStateError);
    }
    if (expected.where((x) => x == expected.last).length == 1) {
      expect(iterable.singleWhere((x) => x == expected.last), expected.last);
    }
    expect(
      iterable.singleWhere((_) => false, orElse: () => expected.first),
      expected.first,
    );
    expect(
      iterable.skipWhile((x) => x == expected.first),
      expected.skipWhile((x) => x == expected.first),
    );
    expect(
      iterable.takeWhile((x) => x != expected.last),
      expected.takeWhile((x) => x != expected.last),
    );
    expect(
      iterable.where((x) => x != expected.first),
      expected.where((x) => x != expected.first),
    );
  }

  group('DelegatingIterable', () {
    test('delegates to underlying iterable', () {
      var base = <int>[1, 2, 3];
      var wrapper = DelegatingIterable<int>(base);

      testIterable(wrapper, [1, 2, 3]);
      testIterable(const DelegatingIterable<int>([42]), [42]);
      testIterable(const DelegatingIterable<int>([]), <int>[]);

      expect(wrapper.cast<num>(), [1, 2, 3]);
      expect(wrapper.toString(), base.toString());
      expect(const DelegatingIterable<num>([1, 2.5, 3]).whereType<int>(), [
        1,
        3,
      ]);
    });
  });

  group('DelegatingList', () {
    test('delegates to underlying list', () {
      var base = <int>[1, 2, 3];
      var wrapper = DelegatingList<int>(base);

      testIterable(wrapper, [1, 2, 3]);
      testIterable(const DelegatingList<int>([42]), [42]);
      testIterable(const DelegatingList<int>([]), <int>[]);
      expect(wrapper.toString(), base.toString());

      expect(wrapper[1], 2);

      wrapper[0] = 0;
      expect(base, [0, 2, 3]);

      wrapper.first = 1;
      wrapper.last = 30;
      expect(base, [1, 2, 30]);
      wrapper.last = 3;

      expect(wrapper + [4, 5], [1, 2, 3, 4, 5]);
      expect(wrapper.asMap(), {0: 1, 1: 2, 2: 3});
      expect(wrapper.cast<num>(), [1, 2, 3]);
      expect(wrapper.getRange(1, 3), [2, 3]);
      expect(wrapper.reversed, [3, 2, 1]);

      wrapper.add(4);
      expect(base, [1, 2, 3, 4]);

      wrapper.addAll([5, 6]);
      expect(base, [1, 2, 3, 4, 5, 6]);

      wrapper.fillRange(0, 2, -1);
      expect(base, [-1, -1, 3, 4, 5, 6]);

      expect(wrapper.indexOf(3), 2);
      expect(wrapper.indexWhere((x) => x == 3), 2);

      wrapper.insert(0, 10);
      expect(base, [10, -1, -1, 3, 4, 5, 6]);

      wrapper.insertAll(0, [11, 12]);
      expect(base, [11, 12, 10, -1, -1, 3, 4, 5, 6]);

      expect(wrapper.lastIndexOf(3), 5);
      expect(wrapper.lastIndexWhere((x) => x == 3), 5);

      expect(wrapper.remove(10), isTrue);
      expect(base, isNot(contains(10)));

      expect(wrapper.removeAt(0), 11);
      expect(wrapper.removeLast(), 6);
      expect(base, [12, -1, -1, 3, 4, 5]);

      wrapper.removeRange(0, 1);
      expect(base, [-1, -1, 3, 4, 5]);

      wrapper.removeWhere((x) => x == -1);
      expect(base, [3, 4, 5]);

      wrapper.replaceRange(0, 1, [20, 21]);
      expect(base, [20, 21, 4, 5]);

      wrapper.retainWhere((x) => x > 4);
      expect(base, [20, 21, 5]);

      wrapper.setAll(0, [30, 31]);
      expect(base, [30, 31, 5]);

      wrapper.setRange(0, 2, [40, 41, 42], 1);
      expect(base, [41, 42, 5]);

      wrapper.sort();
      expect(base, [5, 41, 42]);

      wrapper.sort((a, b) => b.compareTo(a));
      expect(base, [42, 41, 5]);

      wrapper.shuffle();
      expect(base, unorderedEquals([5, 41, 42]));

      base
        ..clear()
        ..addAll([1, 2, 3]);
      expect(wrapper.sublist(1), [2, 3]);
      expect(wrapper.sublist(0, 2), [1, 2]);

      wrapper.clear();
      expect(base, isEmpty);

      var nullBase = <int?>[1, 2];
      var nullWrapper = DelegatingList<int?>(nullBase);
      nullWrapper.length = 5;
      expect(nullBase, hasLength(5));
    });
  });

  group('DelegatingSet', () {
    test('delegates to underlying set', () {
      var base = <int>{1, 2, 3};
      var wrapper = DelegatingSet<int>(base);

      testIterable(wrapper, [1, 2, 3]);
      testIterable(const DelegatingSet<int>({42}), [42]);
      testIterable(const DelegatingSet<int>({}), <int>[]);
      expect(wrapper.toString(), base.toString());

      expect(wrapper.add(4), isTrue);
      expect(base, {1, 2, 3, 4});

      wrapper.addAll([5, 6]);
      expect(base, {1, 2, 3, 4, 5, 6});

      expect(wrapper.cast<num>(), {1, 2, 3, 4, 5, 6});

      expect(wrapper.remove(1), isTrue);
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
      expect(wrapper.containsAll([5, 99]), isFalse);
      expect(wrapper.difference({5}), isEmpty);
      expect(wrapper.intersection({5, 6}), {5});
      expect(wrapper.union({6}), {5, 6});
      expect(wrapper.lookup(5), 5);
      expect(wrapper.toSet(), isA<DelegatingSet<int>>());
      expect(wrapper.toSet(), {5});

      wrapper.clear();
      expect(base, isEmpty);
    });
  });

  group('DelegatingQueue', () {
    test('delegates to underlying queue', () {
      var base = Queue<int>.of([1, 2, 3]);
      var wrapper = DelegatingQueue<int>(base);

      testIterable(wrapper, [1, 2, 3]);
      testIterable(DelegatingQueue<int>(Queue<int>.of([42])), [42]);
      testIterable(DelegatingQueue<int>(Queue<int>()), <int>[]);
      expect(wrapper.toString(), base.toString());

      wrapper.add(4);
      expect(base, [1, 2, 3, 4]);

      wrapper.addAll([5, 6]);
      expect(base, [1, 2, 3, 4, 5, 6]);

      wrapper.addFirst(0);
      expect(base, [0, 1, 2, 3, 4, 5, 6]);

      wrapper.addLast(7);
      expect(base, [0, 1, 2, 3, 4, 5, 6, 7]);

      expect(wrapper.cast<num>(), [0, 1, 2, 3, 4, 5, 6, 7]);

      expect(wrapper.remove(0), isTrue);
      expect(base, isNot(contains(0)));

      expect(wrapper.removeFirst(), 1);
      expect(base, [2, 3, 4, 5, 6, 7]);

      expect(wrapper.removeLast(), 7);
      expect(base, [2, 3, 4, 5, 6]);

      wrapper.removeWhere((x) => x == 2);
      expect(base, [3, 4, 5, 6]);

      wrapper.retainWhere((x) => x == 3);
      expect(base, [3]);

      wrapper.clear();
      expect(base, isEmpty);
    });
  });

  group('DelegatingMap', () {
    test('delegates to underlying map', () {
      var base = <String, int>{'a': 1, 'b': 2};
      var wrapper = DelegatingMap<String, int>(base);

      expect(wrapper, containsPair('a', 1));

      wrapper['c'] = 3;
      expect(base, containsPair('c', 3));

      wrapper.addAll({'d': 4});
      expect(base, containsPair('d', 4));

      expect(wrapper.cast<String, num>(), {'a': 1, 'b': 2, 'c': 3, 'd': 4});
      expect(wrapper, contains('a'));
      expect(wrapper, containsValue(1));
      expect(
        wrapper.entries.map((e) => '${e.key}:${e.value}'),
        ['a:1', 'b:2', 'c:3', 'd:4'],
      );

      var visited = <String>[];
      wrapper.forEach((k, v) => visited.add('$k=$v'));
      expect(visited, ['a=1', 'b=2', 'c=3', 'd=4']);

      expect(wrapper, isNotEmpty);
      testIterable(wrapper.keys, ['a', 'b', 'c', 'd']);
      testIterable(wrapper.values, [1, 2, 3, 4]);
      expect(wrapper, hasLength(4));
      expect(
        wrapper.map((k, v) => MapEntry(k.toUpperCase(), v * 10)),
        {'A': 10, 'B': 20, 'C': 30, 'D': 40},
      );
      expect(wrapper.toString(), base.toString());

      expect(wrapper.remove('a'), 1);
      expect(base, isNot(contains('a')));

      wrapper.removeWhere((k, v) => k == 'b');
      expect(base, isNot(contains('b')));

      expect(wrapper.update('c', (v) => v + 1), 4);
      expect(base, containsPair('c', 4));

      wrapper.updateAll((k, v) => v * 2);
      expect(base, containsPair('c', 8));

      expect(wrapper.putIfAbsent('e', () => 5), 5);
      expect(base, containsPair('e', 5));

      wrapper.addEntries([const MapEntry('f', 6)]);
      expect(base, containsPair('f', 6));

      wrapper.clear();
      expect(base, isEmpty);
      expect(wrapper, isEmpty);
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
