/// Legacy quickSort implementation preserved for benchmarking purposes.
/// This code is ONLY for benchmarking and should not be used in production.
library;

import 'dart:math';
import 'package:collection/src/utils.dart';

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

/// Sort [elements] using a quick-sort algorithm.
///
/// The elements are compared using [compare] on the elements.
/// If [start] and [end] are provided, only that range is sorted.
///
/// Uses insertion sort for smaller sublists.
void quickSort<E>(
  List<E> elements,
  int Function(E a, E b) compare, [
  int start = 0,
  int? end,
]) {
  end = RangeError.checkValidRange(start, end, elements.length);
  _quickSort<E, E>(elements, identity, compare, Random(), start, end);
}

/// Sort [list] using a quick-sort algorithm.
///
/// The elements are compared using [compare] on the value provided by [keyOf]
/// on the element.
/// If [start] and [end] are provided, only that range is sorted.
///
/// Uses insertion sort for smaller sublists.
void quickSortBy<E, K>(
  List<E> list,
  K Function(E element) keyOf,
  int Function(K a, K b) compare, [
  int start = 0,
  int? end,
]) {
  end = RangeError.checkValidRange(start, end, list.length);
  _quickSort(list, keyOf, compare, Random(), start, end);
}

void _quickSort<E, K>(
  List<E> list,
  K Function(E element) keyOf,
  int Function(K a, K b) compare,
  Random random,
  int start,
  int end,
) {
  const minQuickSortLength = 24;
  var length = end - start;
  while (length >= minQuickSortLength) {
    var pivotIndex = random.nextInt(length) + start;
    var pivot = list[pivotIndex];
    var pivotKey = keyOf(pivot);
    var endSmaller = start;
    var startGreater = end;
    var startPivots = end - 1;
    list[pivotIndex] = list[startPivots];
    list[startPivots] = pivot;
    while (endSmaller < startPivots) {
      var current = list[endSmaller];
      var relation = compare(keyOf(current), pivotKey);
      if (relation < 0) {
        endSmaller++;
      } else {
        startPivots--;
        var currentTarget = startPivots;
        list[endSmaller] = list[startPivots];
        if (relation > 0) {
          startGreater--;
          currentTarget = startGreater;
          list[startPivots] = list[startGreater];
        }
        list[currentTarget] = current;
      }
    }
    if (endSmaller - start < end - startGreater) {
      _quickSort(list, keyOf, compare, random, start, endSmaller);
      start = startGreater;
    } else {
      _quickSort(list, keyOf, compare, random, startGreater, end);
      end = endSmaller;
    }
    length = end - start;
  }
  _movingInsertionSort<E, K>(list, keyOf, compare, start, end, list, start);
}
