// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:collection/collection.dart';
import 'package:test/test.dart';

import '../unmodifiable_collection_test.dart' as common;

void main() {
  test('indexOf matches a flat list across child boundaries', () {
    final lists = <List<int>>[
      [],
      [1, 2, 1],
      [],
      [3, 2, 4, 2],
      [],
      [5],
      [],
    ];
    final combined = CombinedListView<int>(lists);
    final flat = lists.expand((list) => list).toList();
    for (final value in [1, 2, 4, 5, 8]) {
      for (final start in [-3, 0, 1, 3, 6, 7, 100]) {
        expect(combined.indexOf(value, start), flat.indexOf(value, start));
      }
    }
    lists[1].add(4);
    expect(combined.indexOf(3), 4);
    expect(combined.indexOf(2.0, 3), 5);
  });

  var list1 = [1, 2, 3];
  var list2 = [4, 5, 6];
  var list3 = [7, 8, 9];
  var concat = <int>[...list1, ...list2, ...list3];

  // In every way possible this should test the same as an UnmodifiableListView.
  common.testUnmodifiableList(
    concat,
    CombinedListView([list1, list2, list3]),
    'combineLists',
  );

  common.testUnmodifiableList(
    concat,
    CombinedListView([list1, [], list2, [], list3, []]),
    'combineLists',
  );

  test('should function as an empty list when no lists are passed', () {
    var empty = CombinedListView([]);
    expect(empty, isEmpty);
    expect(empty.length, 0);
    expect(() => empty[0], throwsRangeError);
  });

  test('should function as an empty list when only empty lists are passed', () {
    var empty = CombinedListView([[], [], []]);
    expect(empty, isEmpty);
    expect(empty.length, 0);
    expect(() => empty[0], throwsRangeError);
  });

  test('should reflect underlying changes back to the combined list', () {
    var backing1 = <int>[];
    var backing2 = <int>[];
    var combined = CombinedListView([backing1, backing2]);
    expect(combined, isEmpty);
    backing1.addAll(list1);
    expect(combined, list1);
    backing2.addAll(list2);
    expect(combined, backing1.toList()..addAll(backing2));
  });

  test('should reflect underlying changes from the list of lists', () {
    var listOfLists = <List<int>>[];
    var combined = CombinedListView(listOfLists);
    expect(combined, isEmpty);
    listOfLists.add(list1);
    expect(combined, list1);
    listOfLists.add(list2);
    expect(combined, [...list1, ...list2]);
    listOfLists.clear();
    expect(combined, isEmpty);
  });

  test('should reflect underlying changes with a single list', () {
    var backing1 = <int>[];
    var combined = CombinedListView([backing1]);
    expect(combined, isEmpty);
    backing1.addAll(list1);
    expect(combined, list1);
  });
}
