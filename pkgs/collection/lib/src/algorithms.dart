// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// A selection of data manipulation algorithms.
library;

import 'dart:math' show Random;

import 'utils.dart';

/// Returns a position of the [value] in [sortedList], if it is there.
///
/// If the list isn't sorted according to the [compare] function, the result
/// is unpredictable.
///
/// If [compare] is omitted, this defaults to calling [Comparable.compareTo] on
/// the objects. In this case, the objects must be [Comparable].
///
/// Returns -1 if [value] is not in the list.
int binarySearch<E>(
  List<E> sortedList,
  E value, {
  int Function(E, E)? compare,
}) {
  compare ??= defaultCompare;
  return binarySearchBy<E, E>(sortedList, identity, compare, value);
}

/// Returns a position of the [value] in [sortedList], if it is there.
///
/// If the list isn't sorted according to the [compare] function on the [keyOf]
/// property of the elements, the result is unpredictable.
///
/// Returns -1 if [value] is not in the list by default.
///
/// If [start] and [end] are supplied, only that range is searched,
/// and only that range need to be sorted.
int binarySearchBy<E, K>(
  List<E> sortedList,
  K Function(E element) keyOf,
  int Function(K, K) compare,
  E value, [
  int start = 0,
  int? end,
]) {
  end = RangeError.checkValidRange(start, end, sortedList.length);
  var min = start;
  var max = end;
  var key = keyOf(value);
  while (min < max) {
    var mid = min + ((max - min) >> 1);
    var element = sortedList[mid];
    var comp = compare(keyOf(element), key);
    if (comp == 0) return mid;
    if (comp < 0) {
      min = mid + 1;
    } else {
      max = mid;
    }
  }
  return -1;
}

/// Returns the first position in [sortedList] that does not compare less than
/// [value].
///
/// Uses binary search to find the location of [value].
/// This takes on the order of `log(n)` comparisons.
/// If the list isn't sorted according to the [compare] function, the result
/// is unpredictable.
///
/// If [compare] is omitted, this defaults to calling [Comparable.compareTo] on
/// the objects. In this case, the objects must be [Comparable].
///
/// Returns the length of [sortedList] if all the items in [sortedList] compare
/// less than [value].
int lowerBound<E>(List<E> sortedList, E value, {int Function(E, E)? compare}) {
  compare ??= defaultCompare;
  return lowerBoundBy<E, E>(sortedList, identity, compare, value);
}

/// Returns the first position in [sortedList] that is not before [value].
///
/// Uses binary search to find the location of [value].
/// This takes on the order of `log(n)` comparisons.
/// Elements are compared using the [compare] function of the [keyOf] property
/// of the elements.
/// If the list isn't sorted according to this order, the result is
/// unpredictable.
///
/// Returns the length of [sortedList] if all the items in [sortedList] are
/// before [value].
///
/// If [start] and [end] are supplied, only that range is searched,
/// and only that range need to be sorted.
int lowerBoundBy<E, K>(
  List<E> sortedList,
  K Function(E element) keyOf,
  int Function(K, K) compare,
  E value, [
  int start = 0,
  int? end,
]) {
  end = RangeError.checkValidRange(start, end, sortedList.length);
  var min = start;
  var max = end;
  var key = keyOf(value);
  while (min < max) {
    var mid = min + ((max - min) >> 1);
    var element = sortedList[mid];
    var comp = compare(keyOf(element), key);
    if (comp < 0) {
      min = mid + 1;
    } else {
      max = mid;
    }
  }
  return min;
}

/// Shuffles a list randomly.
///
/// A sub-range of a list can be shuffled by providing [start] and [end].
///
/// If [start] or [end] are omitted,
/// they default to the start and end of the list.
///
/// If [random] is omitted, it defaults to a new instance of [Random].
void shuffle(List elements, [int start = 0, int? end, Random? random]) {
  random ??= Random();
  end ??= elements.length;
  var length = end - start;
  while (length > 1) {
    var pos = random.nextInt(length);
    length--;
    var tmp1 = elements[start + pos];
    elements[start + pos] = elements[start + length];
    elements[start + length] = tmp1;
  }
}

/// Reverses a list, or a part of a list, in-place.
void reverse<E>(List<E> elements, [int start = 0, int? end]) {
  end = RangeError.checkValidRange(start, end, elements.length);
  _reverse<E>(elements, start, end);
}

/// Internal helper function that assumes valid arguments.
void _reverse<E>(List<E> elements, int start, int end) {
  for (var i = start, j = end - 1; i < j; i++, j--) {
    var tmp = elements[i];
    elements[i] = elements[j];
    elements[j] = tmp;
  }
}

/// Sort a list between [start] (inclusive) and [end] (exclusive) using
/// insertion sort.
///
/// If [compare] is omitted, this defaults to calling [Comparable.compareTo] on
/// the objects. In this case, the objects must be [Comparable].
///
/// Insertion sort is a simple sorting algorithm. For `n` elements it does on
/// the order of `n * log(n)` comparisons but up to `n` squared moves. The
/// sorting is performed in-place, without using extra memory.
///
/// For short lists the many moves have less impact than the simple algorithm,
/// and it is often the favored sorting algorithm for short lists.
///
/// This insertion sort is stable: Equal elements end up in the same order
/// as they started in.
void insertionSort<E>(
  List<E> elements, {
  int Function(E, E)? compare,
  int start = 0,
  int? end,
}) {
  // If the same method could have both positional and named optional
  // parameters, this should be (list, [start, end], {compare}).
  compare ??= defaultCompare;
  end ??= elements.length;

  for (var pos = start + 1; pos < end; pos++) {
    var min = start;
    var max = pos;
    var element = elements[pos];
    while (min < max) {
      var mid = min + ((max - min) >> 1);
      var comparison = compare(element, elements[mid]);
      if (comparison < 0) {
        max = mid;
      } else {
        min = mid + 1;
      }
    }
    elements.setRange(min + 1, pos + 1, elements, min);
    elements[min] = element;
  }
}

/// Generalized insertion sort.
///
/// Performs insertion sort on the [elements] range from [start] to [end].
/// Ordering is the [compare] of the [keyOf] of the elements.
void insertionSortBy<E, K>(
  List<E> elements,
  K Function(E element) keyOf,
  int Function(K a, K b) compare, [
  int start = 0,
  int? end,
]) {
  end = RangeError.checkValidRange(start, end, elements.length);
  _movingInsertionSort(elements, keyOf, compare, start, end, elements, start);
}

/// Limit below which merge sort defaults to insertion sort.
const int _mergeSortLimit = 32;

/// Sorts a list between [start] (inclusive) and [end] (exclusive) using the
/// merge sort algorithm.
///
/// If [compare] is omitted, this defaults to calling [Comparable.compareTo] on
/// the objects. If any object is not [Comparable], that throws a [TypeError].
///
/// Merge-sorting works by splitting the job into two parts, sorting each
/// recursively, and then merging the two sorted parts.
///
/// This takes on the order of `n * log(n)` comparisons and moves to sort
/// `n` elements, but requires extra space of about the same size as the list
/// being sorted.
///
/// This merge sort is stable: Equal elements end up in the same order
/// as they started in.
void mergeSort<E>(
  List<E> elements, {
  int start = 0,
  int? end,
  int Function(E, E)? compare,
}) {
  end = RangeError.checkValidRange(start, end, elements.length);
  compare ??= defaultCompare;

  var length = end - start;
  if (length < 2) return;
  if (length < _mergeSortLimit) {
    insertionSort(elements, compare: compare, start: start, end: end);
    return;
  }
  // Special case the first split instead of directly calling
  // _mergeSort, because the _mergeSort requires its target to
  // be different from its source, and it requires extra space
  // of the same size as the list to sort.
  // This split allows us to have only half as much extra space,
  // and allows the sorted elements to end up in the original list.
  var firstLength = (end - start) >> 1;
  var middle = start + firstLength;
  var secondLength = end - middle;
  // secondLength is always the same as firstLength, or one greater.
  var scratchSpace = elements.sublist(0, secondLength);
  _mergeSort(elements, identity<E>, compare, middle, end, scratchSpace, 0);
  var firstTarget = end - firstLength;
  _mergeSort(
    elements,
    identity<E>,
    compare,
    start,
    middle,
    elements,
    firstTarget,
  );
  _merge(
    identity<E>,
    compare,
    elements,
    firstTarget,
    end,
    scratchSpace,
    0,
    secondLength,
    elements,
    start,
  );
}

/// Sort [elements] using a merge-sort algorithm.
///
/// The elements are compared using [compare] on the value provided by [keyOf]
/// on the element.
/// If [start] and [end] are provided, only that range is sorted.
///
/// Uses insertion sort for smaller sublists.
void mergeSortBy<E, K>(
  List<E> elements,
  K Function(E element) keyOf,
  int Function(K a, K b) compare, [
  int start = 0,
  int? end,
]) {
  end = RangeError.checkValidRange(start, end, elements.length);
  var length = end - start;
  if (length < 2) return;
  if (length < _mergeSortLimit) {
    _movingInsertionSort(elements, keyOf, compare, start, end, elements, start);
    return;
  }
  // Special case the first split instead of directly calling
  // _mergeSort, because the _mergeSort requires its target to
  // be different from its source, and it requires extra space
  // of the same size as the list to sort.
  // This split allows us to have only half as much extra space,
  // and it ends up in the original place.
  var middle = start + (length >> 1);
  var firstLength = middle - start;
  var secondLength = end - middle;
  // secondLength is always the same as firstLength, or one greater.
  var scratchSpace = elements.sublist(0, secondLength);
  _mergeSort(elements, keyOf, compare, middle, end, scratchSpace, 0);
  var firstTarget = end - firstLength;
  _mergeSort(elements, keyOf, compare, start, middle, elements, firstTarget);
  _merge(
    keyOf,
    compare,
    elements,
    firstTarget,
    end,
    scratchSpace,
    0,
    secondLength,
    elements,
    start,
  );
}

/// Performs an insertion sort into a potentially different list than the
/// one containing the original values.
///
/// It will work in-place as well.
void _movingInsertionSort<E, K>(
  List<E> list,
  K Function(E element) keyOf,
  int Function(K, K) compare,
  int start,
  int end,
  List<E> target,
  int targetOffset,
) {
  var length = end - start;
  if (length == 0) return;
  target[targetOffset] = list[start];
  for (var i = 1; i < length; i++) {
    var element = list[start + i];
    var elementKey = keyOf(element);
    var min = targetOffset;
    var max = targetOffset + i;
    while (min < max) {
      var mid = min + ((max - min) >> 1);
      if (compare(elementKey, keyOf(target[mid])) < 0) {
        max = mid;
      } else {
        min = mid + 1;
      }
    }
    target.setRange(min + 1, targetOffset + i + 1, target, min);
    target[min] = element;
  }
}

/// Sorts [elements] from [start] to [end] into [target] at [targetOffset].
///
/// The `target` list must be able to contain the range from `start` to `end`
/// after `targetOffset`.
///
/// Allows target to be the same list as [elements], as long as it's not
/// overlapping the `start..end` range.
void _mergeSort<E, K>(
  List<E> elements,
  K Function(E element) keyOf,
  int Function(K, K) compare,
  int start,
  int end,
  List<E> target,
  int targetOffset,
) {
  var length = end - start;
  if (length < _mergeSortLimit) {
    _movingInsertionSort<E, K>(
      elements,
      keyOf,
      compare,
      start,
      end,
      target,
      targetOffset,
    );
    return;
  }
  var middle = start + (length >> 1);
  var firstLength = middle - start;
  var secondLength = end - middle;
  // Here secondLength >= firstLength (differs by at most one).
  var targetMiddle = targetOffset + firstLength;
  // Sort the second half into the end of the target area.
  _mergeSort(elements, keyOf, compare, middle, end, target, targetMiddle);
  // Sort the first half into the end of the source area.
  _mergeSort(elements, keyOf, compare, start, middle, elements, middle);
  // Merge the two parts into the target area.
  _merge(
    keyOf,
    compare,
    elements,
    middle,
    middle + firstLength,
    target,
    targetMiddle,
    targetMiddle + secondLength,
    target,
    targetOffset,
  );
}

/// Merges two lists into a target list.
///
/// One of the input lists may be positioned at the end of the target
/// list.
///
/// For equal object, elements from [firstList] are always preferred.
/// This allows the merge to be stable if the first list contains elements
/// that started out earlier than the ones in [secondList]
void _merge<E, K>(
  K Function(E element) keyOf,
  int Function(K, K) compare,
  List<E> firstList,
  int firstStart,
  int firstEnd,
  List<E> secondList,
  int secondStart,
  int secondEnd,
  List<E> target,
  int targetOffset,
) {
  // No empty lists reaches here.
  assert(firstStart < firstEnd);
  assert(secondStart < secondEnd);
  var cursor1 = firstStart;
  var cursor2 = secondStart;
  var firstElement = firstList[cursor1++];
  var firstKey = keyOf(firstElement);
  var secondElement = secondList[cursor2++];
  var secondKey = keyOf(secondElement);
  while (true) {
    if (compare(firstKey, secondKey) <= 0) {
      target[targetOffset++] = firstElement;
      if (cursor1 == firstEnd) break; // Flushing second list after loop.
      firstElement = firstList[cursor1++];
      firstKey = keyOf(firstElement);
    } else {
      target[targetOffset++] = secondElement;
      if (cursor2 != secondEnd) {
        secondElement = secondList[cursor2++];
        secondKey = keyOf(secondElement);
        continue;
      }
      // Second list empties first. Flushing first list here.
      target[targetOffset++] = firstElement;
      target.setRange(
        targetOffset,
        targetOffset + (firstEnd - cursor1),
        firstList,
        cursor1,
      );
      return;
    }
  }
  // First list empties first. Reached by break above.
  target[targetOffset++] = secondElement;
  target.setRange(
    targetOffset,
    targetOffset + (secondEnd - cursor2),
    secondList,
    cursor2,
  );
}

/// Sorts a list between [start] (inclusive) and [end] (exclusive).
///
/// The sorting algorithm is a Pattern-defeating Quicksort (pdqsort), a
/// hybrid of Quicksort, Heapsort, and Insertion Sort.
void quickSort<E>(
  List<E> elements,
  int Function(E a, E b) compare, [
  int start = 0,
  int? end,
]) {
  end = RangeError.checkValidRange(start, end, elements.length);
  if (end - start < 2) return;
  _pdqSortImpl(elements, compare, start, end, _log2(end - start));
}

/// Sorts a list between [start] (inclusive) and [end] (exclusive) by key.
///
/// Elements are ordered by the [compare] function applied to the result of
/// the [keyOf] function.
void quickSortBy<E, K>(
  List<E> elements,
  K Function(E element) keyOf,
  int Function(K a, K b) compare, [
  int start = 0,
  int? end,
]) {
  end = RangeError.checkValidRange(start, end, elements.length);
  if (end - start < 2) return;
  _pdqSortByImpl(elements, keyOf, compare, start, end, _log2(end - start));
}

/// Minimum list size below which pdqsort uses insertion sort.
const int _pdqInsertionSortThreshold = 32;

/// Computes the base-2 logarithm of [n].
/// Computes the base-2 logarithm of [n].
///
/// Uses bitLength to compute the floor(log2(n)) efficiently.
/// For n == 0 we return 0.
int _log2(int n) => n > 0 ? n.bitLength - 1 : 0;

// ==========================================
// Implementation: Direct Comparison
// ==========================================

void _pdqSortImpl<E>(List<E> elements, int Function(E, E) compare, int start,
    int end, int badAllowed) {
  while (true) {
    final size = end - start;
    if (size < _pdqInsertionSortThreshold) {
      _insertionSort(elements, compare, start, end);
      return;
    }

    if (_handlePresorted(elements, compare, start, end)) return;

    if (badAllowed == 0) {
      _heapSort(elements, compare, start, end);
      return;
    }

    final mid = start + size ~/ 2;
    _selectPivot(elements, compare, start, mid, end, size);

    final pivot = elements[start];
    var less = start;
    var equal = start + 1;
    var greater = end;

    while (equal < greater) {
      final element = elements[equal];
      final comparison = compare(element, pivot);

      if (comparison < 0) {
        elements[equal] = elements[less];
        elements[less] = element;
        less++;
        equal++;
      } else if (comparison > 0) {
        greater--;
        elements[equal] = elements[greater];
        elements[greater] = element;
      } else {
        equal++;
      }
    }

    if ((less - start) < size ~/ 8 || (end - greater) < size ~/ 8) {
      badAllowed--;
    }

    if (less - start < end - greater) {
      _pdqSortImpl(elements, compare, start, less, badAllowed);
      start = greater;
    } else {
      _pdqSortImpl(elements, compare, greater, end, badAllowed);
      end = less;
    }
  }
}

bool _handlePresorted<E>(
    List<E> elements, int Function(E, E) compare, int start, int end) {
  if (compare(elements[start], elements[start + 1]) > 0) {
    // Check strictly decreasing
    var i = start + 1;
    while (i < end && compare(elements[i - 1], elements[i]) > 0) {
      i++;
    }
    if (i == end) {
      _reverseRange(elements, start, end);
      return true;
    }
  } else {
    // Check non-decreasing
    var i = start + 1;
    while (i < end && compare(elements[i - 1], elements[i]) <= 0) {
      i++;
    }
    if (i == end) return true;
  }
  return false;
}

void _reverseRange<E>(List<E> elements, int start, int end) {
  var left = start;
  var right = end - 1;
  while (left < right) {
    final temp = elements[left];
    elements[left] = elements[right];
    elements[right] = temp;
    left++;
    right--;
  }
}

void _insertionSort<E>(
    List<E> elements, int Function(E, E) compare, int start, int end) {
  for (var i = start + 1; i < end; i++) {
    var current = elements[i];
    var j = i - 1;
    while (j >= start && compare(elements[j], current) > 0) {
      elements[j + 1] = elements[j];
      j--;
    }
    elements[j + 1] = current;
  }
}

void _heapSort<E>(
    List<E> elements, int Function(E, E) compare, int start, int end) {
  final n = end - start;
  for (var i = n ~/ 2 - 1; i >= 0; i--) {
    _siftDown(elements, compare, i, n, start);
  }
  for (var i = n - 1; i > 0; i--) {
    final temp = elements[start];
    elements[start] = elements[start + i];
    elements[start + i] = temp;
    _siftDown(elements, compare, 0, i, start);
  }
}

void _siftDown<E>(
    List<E> elements, int Function(E, E) compare, int i, int n, int start) {
  var root = i;
  while (true) {
    final left = 2 * root + 1;
    if (left >= n) break;
    var largest = root;
    if (compare(elements[start + left], elements[start + largest]) > 0) {
      largest = left;
    }
    final right = left + 1;
    if (right < n &&
        compare(elements[start + right], elements[start + largest]) > 0) {
      largest = right;
    }
    if (largest == root) break;
    final temp = elements[start + root];
    elements[start + root] = elements[start + largest];
    elements[start + largest] = temp;
    root = largest;
  }
}

void _selectPivot<E>(List<E> elements, int Function(E, E) compare, int start,
    int mid, int end, int size) {
  if (size > 80) {
    final s = size ~/ 8;
    _sort3(elements, compare, start, start + s, start + 2 * s);
    _sort3(elements, compare, mid - s, mid, mid + s);
    _sort3(elements, compare, end - 1 - 2 * s, end - 1 - s, end - 1);
    _sort3(elements, compare, start + s, mid, end - 1 - s);
  } else {
    _sort3(elements, compare, start, mid, end - 1);
  }
  final temp = elements[start];
  elements[start] = elements[mid];
  elements[mid] = temp;
}

void _sort3<E>(
    List<E> elements, int Function(E, E) compare, int a, int b, int c) {
  if (compare(elements[a], elements[b]) > 0) {
    final t = elements[a];
    elements[a] = elements[b];
    elements[b] = t;
  }
  if (compare(elements[b], elements[c]) > 0) {
    final t = elements[b];
    elements[b] = elements[c];
    elements[c] = t;
    if (compare(elements[a], elements[b]) > 0) {
      final t2 = elements[a];
      elements[a] = elements[b];
      elements[b] = t2;
    }
  }
}

// ==========================================
// Implementation: Keyed Comparison (By)
// ==========================================

/// [badAllowed] tracks how many bad pivot selections are allowed before
/// falling back to heap sort.
void _pdqSortByImpl<E, K>(List<E> elements, K Function(E) keyOf,
    int Function(K, K) compare, int start, int end, int badAllowed) {
  while (true) {
    final size = end - start;
    if (size < _pdqInsertionSortThreshold) {
      _insertionSortBy(elements, keyOf, compare, start, end);
      return;
    }

    if (_handlePresortedBy(elements, keyOf, compare, start, end)) return;

    if (badAllowed == 0) {
      _heapSortBy(elements, keyOf, compare, start, end);
      return;
    }

    final mid = start + size ~/ 2;
    _selectPivotBy(elements, keyOf, compare, start, mid, end, size);

    final pivotElement = elements[start];
    final pivotKey = keyOf(pivotElement);

    var less = start;
    var equal = start + 1;
    var greater = end;

    while (equal < greater) {
      final element = elements[equal];
      final elementKey = keyOf(element);
      final comparison = compare(elementKey, pivotKey);

      if (comparison < 0) {
        elements[equal] = elements[less];
        elements[less] = element;
        less++;
        equal++;
      } else if (comparison > 0) {
        greater--;
        elements[equal] = elements[greater];
        elements[greater] = element;
      } else {
        equal++;
      }
    }

    if ((less - start) < size ~/ 8 || (end - greater) < size ~/ 8) {
      badAllowed--;
    }

    if (less - start < end - greater) {
      _pdqSortByImpl(elements, keyOf, compare, start, less, badAllowed);
      start = greater;
    } else {
      _pdqSortByImpl(elements, keyOf, compare, greater, end, badAllowed);
      end = less;
    }
  }
}

bool _handlePresortedBy<E, K>(List<E> elements, K Function(E) keyOf,
    int Function(K, K) compare, int start, int end) {
  if (compare(keyOf(elements[start]), keyOf(elements[start + 1])) > 0) {
    var i = start + 1;
    while (i < end && compare(keyOf(elements[i - 1]), keyOf(elements[i])) > 0) {
      i++;
    }
    if (i == end) {
      _reverseRange(elements, start, end);
      return true;
    }
  } else {
    var i = start + 1;
    while (
        i < end && compare(keyOf(elements[i - 1]), keyOf(elements[i])) <= 0) {
      i++;
    }
    if (i == end) return true;
  }
  return false;
}

void _insertionSortBy<E, K>(List<E> elements, K Function(E) keyOf,
    int Function(K, K) compare, int start, int end) {
  for (var i = start + 1; i < end; i++) {
    final current = elements[i];
    final currentKey = keyOf(current);
    var j = i - 1;
    while (j >= start && compare(keyOf(elements[j]), currentKey) > 0) {
      elements[j + 1] = elements[j];
      j--;
    }
    elements[j + 1] = current;
  }
}

void _heapSortBy<E, K>(List<E> elements, K Function(E) keyOf,
    int Function(K, K) compare, int start, int end) {
  final n = end - start;
  for (var i = n ~/ 2 - 1; i >= 0; i--) {
    _siftDownBy(elements, keyOf, compare, i, n, start);
  }
  for (var i = n - 1; i > 0; i--) {
    final temp = elements[start];
    elements[start] = elements[start + i];
    elements[start + i] = temp;
    _siftDownBy(elements, keyOf, compare, 0, i, start);
  }
}

void _siftDownBy<E, K>(List<E> elements, K Function(E) keyOf,
    int Function(K, K) compare, int i, int n, int start) {
  var root = i;
  while (true) {
    final left = 2 * root + 1;
    if (left >= n) break;
    var largest = root;
    var largestKey = keyOf(elements[start + largest]);

    final leftKey = keyOf(elements[start + left]);
    if (compare(leftKey, largestKey) > 0) {
      largest = left;
      largestKey = leftKey;
    }

    final right = left + 1;
    if (right < n) {
      final rightKey = keyOf(elements[start + right]);
      if (compare(rightKey, largestKey) > 0) {
        largest = right;
      }
    }
    if (largest == root) break;
    final temp = elements[start + root];
    elements[start + root] = elements[start + largest];
    elements[start + largest] = temp;
    root = largest;
  }
}

void _selectPivotBy<E, K>(List<E> elements, K Function(E) keyOf,
    int Function(K, K) compare, int start, int mid, int end, int size) {
  if (size > 80) {
    final s = size ~/ 8;
    _sort3By(elements, keyOf, compare, start, start + s, start + 2 * s);
    _sort3By(elements, keyOf, compare, mid - s, mid, mid + s);
    _sort3By(elements, keyOf, compare, end - 1 - 2 * s, end - 1 - s, end - 1);
    _sort3By(elements, keyOf, compare, start + s, mid, end - 1 - s);
  } else {
    _sort3By(elements, keyOf, compare, start, mid, end - 1);
  }
  final temp = elements[start];
  elements[start] = elements[mid];
  elements[mid] = temp;
}

void _sort3By<E, K>(List<E> elements, K Function(E) keyOf,
    int Function(K, K) compare, int a, int b, int c) {
  if (compare(keyOf(elements[a]), keyOf(elements[b])) > 0) {
    final t = elements[a];
    elements[a] = elements[b];
    elements[b] = t;
  }
  if (compare(keyOf(elements[b]), keyOf(elements[c])) > 0) {
    final t = elements[b];
    elements[b] = elements[c];
    elements[c] = t;
    if (compare(keyOf(elements[a]), keyOf(elements[b])) > 0) {
      final t2 = elements[a];
      elements[a] = elements[b];
      elements[b] = t2;
    }
  }
}
