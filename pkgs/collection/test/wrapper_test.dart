// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Tests wrapper utilities.
library;

import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:test/test.dart';

void testIterable<T>(Iterable<T> iterable, List<T> expected) {
  expect(iterable, expected);
  expect(iterable, hasLength(expected.length));
  expect(iterable.cast<Object?>(), expected);
  expect(iterable, isNot(contains(Object())));
  expect(() => iterable.elementAt(-1), throwsRangeError);
  expect(() => iterable.elementAt(expected.length), throwsRangeError);
  expect(iterable.every((_) => true), isTrue);
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
  expect(iterable.join(', '), expected.join(', '));
  expect(iterable.map((x) => '$x!'), expected.map((x) => '$x!'));
  expect(iterable.skip(0), expected);
  expect(iterable.skip(1), expected.skip(1));
  expect(iterable.skip(expected.length), isEmpty);
  expect(iterable.skipWhile((_) => true), isEmpty);
  expect(iterable.skipWhile((_) => false), expected);
  expect(iterable.take(0), isEmpty);
  expect(iterable.take(1), expected.take(1));
  expect(iterable.take(2), expected.take(2));
  expect(iterable.take(expected.length), expected);
  expect(iterable.takeWhile((_) => false), isEmpty);
  expect(iterable.takeWhile((_) => true), expected);
  expect(iterable.toList(), expected);
  expect(
    () => iterable.toList(growable: false).clear(),
    throwsUnsupportedError,
  );
  expect(iterable.toSet(), expected.toSet());
  expect(iterable.where((_) => true), expected);
  expect(iterable.where((_) => false), isEmpty);
  expect(iterable.whereType<T>(), expected);
  expect(iterable.whereType<Never>(), isEmpty);

  if (expected.isEmpty) {
    expect(iterable, isEmpty);
    expect(iterable.isNotEmpty, isFalse);
    expect(iterable.cast<Never>(), isEmpty);
    expect(iterable.any((_) => true), isFalse);
    expect(() => iterable.first, throwsStateError);
    expect(() => iterable.firstWhere((_) => true), throwsStateError);
    expect(() => iterable.firstWhere((_) => false), throwsStateError);
    expect(() => iterable.last, throwsStateError);
    expect(() => iterable.lastWhere((_) => true), throwsStateError);
    expect(() => iterable.lastWhere((_) => false), throwsStateError);
    expect(() => iterable.reduce((a, _) => a), throwsStateError);
    expect(() => iterable.single, throwsStateError);
    expect(() => iterable.singleWhere((_) => true), throwsStateError);
    expect(() => iterable.singleWhere((_) => false), throwsStateError);
    return;
  }

  expect(iterable, isNotEmpty);
  expect(iterable.isEmpty, isFalse);
  expect(iterable.any((x) => x == expected.first), isTrue);
  expect(iterable.any((x) => x == expected.last), isTrue);
  expect(iterable.any((_) => false), isFalse);
  for (var i = 0; i < expected.length; i++) {
    expect(iterable, contains(expected[i]));
    expect(iterable.elementAt(i), expected[i]);
  }
  expect(iterable.every((x) => x != expected.first), isFalse);
  if (expected.any((x) => x != expected.first)) {
    expect(iterable.every((x) => x == expected.first), isFalse);
  }
  expect(iterable.first, expected.first);
  expect(iterable.firstWhere((_) => true), expected.first);
  expect(iterable.firstWhere((x) => x == expected.last), expected.last);
  expect(() => iterable.firstWhere((_) => false), throwsStateError);
  expect(
    iterable.firstWhere((_) => false, orElse: () => expected.first),
    expected.first,
  );
  expect(iterable.last, expected.last);
  expect(iterable.lastWhere((_) => true), expected.last);
  expect(iterable.lastWhere((x) => x == expected.first), expected.first);
  expect(() => iterable.lastWhere((_) => false), throwsStateError);
  expect(
    iterable.lastWhere((_) => false, orElse: () => expected.last),
    expected.last,
  );

  var reducedPrevious = <T>[];
  expect(
    iterable.reduce((previous, element) {
      reducedPrevious.add(previous);
      return element;
    }),
    expected.last,
  );
  expect(reducedPrevious, expected.take(expected.length - 1));

  expect(() => iterable.singleWhere((_) => false), throwsStateError);
  if (expected.length == 1) {
    expect(iterable.single, expected.single);
    expect(iterable.singleWhere((_) => true), expected.single);
  } else {
    expect(() => iterable.single, throwsStateError);
    expect(() => iterable.singleWhere((_) => true), throwsStateError);
  }
  if (expected.where((x) => x == expected.first).length == 1) {
    expect(iterable.singleWhere((x) => x == expected.first), expected.first);
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
    iterable.takeWhile((x) => x == expected.first),
    expected.takeWhile((x) => x == expected.first),
  );
  expect(
    iterable.takeWhile((x) => x != expected.last),
    expected.takeWhile((x) => x != expected.last),
  );
  expect(
    () => iterable.toList(growable: false).add(expected.first),
    throwsUnsupportedError,
  );
  var growableCopy = iterable.toList()..add(expected.first);
  expect(growableCopy, hasLength(expected.length + 1));
  expect(growableCopy, [...expected, expected.first]);
  expect(iterable, hasLength(expected.length));
  expect(
    iterable.where((x) => x == expected.first),
    expected.where((x) => x == expected.first),
  );
  expect(
    iterable.where((x) => x != expected.first),
    expected.where((x) => x != expected.first),
  );
}

void testReadOnlySet<T>(Set<T> set, List<T> expected, T absent) {
  testIterable(set, expected);

  var expectedSet = expected.toSet();
  expect(set, isNot(contains(absent)));
  expect(set.cast<Object?>(), expectedSet);
  expect(set.containsAll(<T>[]), isTrue);
  expect(set.containsAll(expected), isTrue);
  expect(set.containsAll([...expected, absent]), isFalse);
  expect(set.difference(<T>{}), expectedSet);
  expect(set.difference(expectedSet), isEmpty);
  expect(set.intersection(<T>{}), isEmpty);
  expect(set.intersection({absent}), isEmpty);
  expect(set.union(<T>{}), expectedSet);
  expect(set.union({absent}), {...expectedSet, absent});

  if (expected.isEmpty) {
    expect(set.cast<Never>(), isEmpty);
    return;
  }

  var first = expected.first;
  expect(set.containsAll([first]), isTrue);
  expect(set.difference({first, absent}), expected.skip(1).toSet());
  expect(set.intersection({first, absent}), {first});
  expect(set.union({first, absent}), {...expectedSet, absent});
}

void main() {
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

      testReadOnlySet(wrapper, [1, 2, 3], 99);
      testReadOnlySet(const DelegatingSet<int>({42}), [42], 99);
      testReadOnlySet(const DelegatingSet<int>({}), <int>[], 99);
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
      testIterable(const DelegatingMap<String, int>({'x': 10}).keys, ['x']);
      testIterable(const DelegatingMap<String, int>({'x': 10}).values, [10]);
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
      testIterable(wrapper.keys, <String>[]);
      testIterable(wrapper.values, <int>[]);
    });
  });

  group('MapKeySet', () {
    late Map<String, dynamic> map;
    late Set<String> set;

    setUp(() {
      map = <String, int>{};
      set = MapKeySet<String>(map);
    });

    test('delegates Iterable and Set read operations', () {
      expect(set, isNot(contains('foo')));
      testReadOnlySet(set, <String>[], 'qux');

      map['foo'] = 1;
      testReadOnlySet(set, ['foo'], 'qux');

      map['bar'] = 2;
      testReadOnlySet(set, ['foo', 'bar'], 'qux');
    });

    test('.toString', () {
      expect(set.toString(), '{}');
      map['foo'] = 1;
      expect(set.toString(), '{foo}');
      map['bar'] = 2;
      expect(set.toString(), '{foo, bar}');
    });

    test('.lookup', () {
      expect(() => set.lookup('foo'), throwsUnsupportedError);
      map['foo'] = 1;
      expect(() => set.lookup('foo'), throwsUnsupportedError);
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

    test('delegates Iterable and Set read operations', () {
      testReadOnlySet(set, <String>[], 'qux');

      map['f'] = 'foo';
      testReadOnlySet(set, ['foo'], 'qux');

      map['b'] = 'bar';
      testReadOnlySet(set, ['foo', 'bar'], 'qux');
    });

    test('.toString', () {
      expect(set.toString(), '{}');
      map['f'] = 'foo';
      expect(set.toString(), '{foo}');
      map['b'] = 'bar';
      expect(set.toString(), '{foo, bar}');
    });

    test('.contains', () {
      expect(set, isNot(contains('foo')));
      map['f'] = 'foo';
      expect(set, contains('foo'));
      expect(set, contains('fblthp'));
      expect(set, isNot(contains('bar')));
      expect(set.containsAll(['fblthp']), isTrue);
    });

    test('.lookup', () {
      map['f'] = 'foo';
      expect(set.lookup('fblthp'), 'foo');
      expect(set.lookup('bar'), isNull);
      expect(set.lookup(Object()), isNull);
    });

    test('.add', () {
      expect(set.add('foo'), isTrue);
      expect(set.add('bar'), isTrue);
      expect(map, {'f': 'foo', 'b': 'bar'});
      expect(set.add('fblthp'), isFalse);
      expect(map, {'f': 'foo', 'b': 'bar'});
    });

    test('.addAll', () {
      set.addAll(['foo', 'bar']);
      expect(map, {'f': 'foo', 'b': 'bar'});
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
      expect(set.remove('fblthp'), isTrue);
      expect(set.remove('fblthp'), isFalse);
      expect(set.remove(Object()), isFalse);
      expect(map, {'b': 'bar'});
    });

    test('.removeAll', () {
      map['f'] = 'foo';
      map['b'] = 'bar';
      map['q'] = 'qux';
      set.removeAll(['fblthp', 'qux']);
      expect(map, {'b': 'bar'});
    });

    test('.removeWhere', () {
      map['f'] = 'foo';
      map['b'] = 'bar';
      map['q'] = 'qoo';
      set.removeWhere((element) => element.endsWith('o'));
      expect(map, {'b': 'bar'});
    });

    test('.retainAll', () {
      map['f'] = 'foo';
      map['b'] = 'bar';
      map['q'] = 'qux';
      set.retainAll(['fblthp', 'qux']);
      expect(map, {'f': 'foo', 'q': 'qux'});
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
      expect(map, {'f': 'foo', 'Q': 'qux'});
    });

    test('.retainWhere', () {
      map['f'] = 'foo';
      map['b'] = 'bar';
      map['q'] = 'qoo';
      set.retainWhere((element) => element.endsWith('o'));
      expect(map, {'f': 'foo', 'q': 'qoo'});
    });
  });
}
