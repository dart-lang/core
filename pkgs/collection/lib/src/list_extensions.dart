// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Extension methods on common collection types.
import 'dart:collection';
import 'dart:math';

import 'algorithms.dart';
import 'algorithms.dart' as algorithms;
import 'equality.dart';
import 'utils.dart';

/// Various extensions on lists of arbitrary elements.
extension ListExtensions<E> on List<E> {
  /// Returns the index of [element] in this sorted list.
  ///
  /// Uses binary search to find the location of [element].
  /// This takes on the order of `log(n)` comparisons.
  /// The list *must* be sorted according to [compare],
  /// otherwise the result is unspecified
  ///
  /// Returns -1 if [element] does not occur in this list.
  int binarySearch(E element, int Function(E, E) compare) =>
      algorithms.binarySearchBy<E, E>(this, identity, compare, element);

  /// Returns the index of [element] in this sorted list.
  ///
  /// Uses binary search to find the location of [element].
  /// This takes on the order of `log(n)` comparisons.
  /// The list *must* be sorted according to [compare] on the [keyOf] of
  /// elements, otherwise the result is unspecified.
  ///
  /// Returns -1 if [element] does not occur in this list.
  ///
  /// If [start] and [end] are supplied, only the list range from [start] to
  /// [end] is searched, and only that range needs to be sorted.
  int binarySearchByCompare<K>(
    E element,
    K Function(E element) keyOf,
    int Function(K, K) compare, [
    int start = 0,
    int? end,
  ]) =>
      algorithms.binarySearchBy<E, K>(
        this,
        keyOf,
        compare,
        element,
        start,
        end,
      );

  /// Returns the index of [element] in this sorted list.
  ///
  /// Uses binary search to find the location of [element].
  /// This takes on the order of `log(n)` comparisons.
  /// The list *must* be sorted according to the natural ordering of
  /// the [keyOf] of elements, otherwise the result is unspecified.
  ///
  /// Returns -1 if [element] does not occur in this list.
  ///
  /// If [start] and [end] are supplied, only the list range from [start] to
  /// [end] is searched, and only that range needs to be sorted.
  int binarySearchBy<K extends Comparable<K>>(
    E element,
    K Function(E element) keyOf, [
    int start = 0,
    int? end,
  ]) =>
      algorithms.binarySearchBy<E, K>(
        this,
        keyOf,
        (a, b) => a.compareTo(b),
        element,
        start,
        end,
      );

  /// Returns the index where [element] should be in this sorted list.
  ///
  /// Uses binary search to find the location of [element].
  /// This takes on the order of `log(n)` comparisons.
  /// The list *must* be sorted according to [compare],
  /// otherwise the result is unspecified.
  ///
  /// If [element] is in the list, its index is returned,
  /// otherwise returns the first position where adding [element]
  /// would keep the list sorted. This may be the [length] of
  /// the list if all elements of the list compare less than
  /// [element].
  int lowerBound(E element, int Function(E, E) compare) =>
      algorithms.lowerBoundBy<E, E>(this, identity, compare, element);

  /// Returns the index where [element] should be in this sorted list.
  ///
  /// Uses binary search to find the location of [element].
  /// This takes on the order of `log(n)` comparisons.
  /// The list *must* be sorted according to [compare] of
  /// the [keyOf] of the elements, otherwise the result is unspecified.
  ///
  /// If [element] is in the list, its index is returned,
  /// otherwise returns the first position where adding [element]
  /// would keep the list sorted. This may be the [length] of
  /// the list if all elements of the list compare less than
  /// [element].
  ///
  /// If [start] and [end] are supplied, only that range is searched,
  /// and only that range need to be sorted.
  int lowerBoundByCompare<K>(
    E element,
    K Function(E) keyOf,
    int Function(K, K) compare, [
    int start = 0,
    int? end,
  ]) =>
      algorithms.lowerBoundBy(this, keyOf, compare, element, start, end);

  /// Returns the index where [element] should be in this sorted list.
  ///
  /// Uses binary search to find the location of [element].
  /// This takes on the order of `log(n)` comparisons.
  /// The list *must* be sorted according to the
  /// natural ordering of the [keyOf] of the elements,
  /// otherwise the result is unspecified.
  ///
  /// If [element] is in the list, its index is returned,
  /// otherwise returns the first position where adding [element]
  /// would keep the list sorted. This may be the [length] of
  /// the list if all elements of the list compare less than
  /// [element].
  ///
  /// If [start] and [end] are supplied, only that range is searched,
  /// and only that range need to be sorted.
  int lowerBoundBy<K extends Comparable<K>>(
    E element,
    K Function(E) keyOf, [
    int start = 0,
    int? end,
  ]) =>
      algorithms.lowerBoundBy<E, K>(
        this,
        keyOf,
        compareComparable,
        element,
        start,
        end,
      );

  /// Takes an action for each element.
  ///
  /// Calls [action] for each element along with the index in the
  /// iteration order.
  void forEachIndexed(void Function(int index, E element) action) {
    for (var index = 0; index < length; index++) {
      action(index, this[index]);
    }
  }

  /// Takes an action for each element as long as desired.
  ///
  /// Calls [action] for each element.
  /// Stops iteration if [action] returns `false`.
  void forEachWhile(bool Function(E element) action) {
    for (var index = 0; index < length; index++) {
      if (!action(this[index])) break;
    }
  }

  /// Takes an action for each element and index as long as desired.
  ///
  /// Calls [action] for each element along with the index in the
  /// iteration order.
  /// Stops iteration if [action] returns `false`.
  void forEachIndexedWhile(bool Function(int index, E element) action) {
    for (var index = 0; index < length; index++) {
      if (!action(index, this[index])) break;
    }
  }

  /// Maps each element and its index to a new value.
  Iterable<R> mapIndexed<R>(R Function(int index, E element) convert) sync* {
    for (var index = 0; index < length; index++) {
      yield convert(index, this[index]);
    }
  }

  /// The elements whose value and index satisfies [test].
  Iterable<E> whereIndexed(bool Function(int index, E element) test) sync* {
    for (var index = 0; index < length; index++) {
      var element = this[index];
      if (test(index, element)) yield element;
    }
  }

  /// The elements whose value and index do not satisfy [test].
  Iterable<E> whereNotIndexed(bool Function(int index, E element) test) sync* {
    for (var index = 0; index < length; index++) {
      var element = this[index];
      if (!test(index, element)) yield element;
    }
  }

  /// Expands each element and index to a number of elements in a new iterable.
  ///
  /// Like [Iterable.expand] except that the callback function is supplied with
  /// both the index and the element.
  Iterable<R> expandIndexed<R>(
    Iterable<R> Function(int index, E element) expand,
  ) sync* {
    for (var index = 0; index < length; index++) {
      yield* expand(index, this[index]);
    }
  }

  /// Sort a range of elements by [compare].
  void sortRange(int start, int end, int Function(E a, E b) compare) {
    quickSortBy<E, E>(this, identity, compare, start, end);
  }

  /// Sorts elements by the [compare] of their [keyOf] property.
  ///
  /// Sorts elements from [start] to [end], defaulting to the entire list.
  void sortByCompare<K>(
    K Function(E element) keyOf,
    int Function(K a, K b) compare, [
    int start = 0,
    int? end,
  ]) {
    quickSortBy(this, keyOf, compare, start, end);
  }

  /// Sorts elements by the natural order of their [keyOf] property.
  ///
  /// Sorts elements from [start] to [end], defaulting to the entire list.
  void sortBy<K extends Comparable<K>>(
    K Function(E element) keyOf, [
    int start = 0,
    int? end,
  ]) {
    quickSortBy<E, K>(this, keyOf, compareComparable, start, end);
  }

  /// Shuffle a range of elements.
  void shuffleRange(int start, int end, [Random? random]) {
    RangeError.checkValidRange(start, end, length);
    shuffle(this, start, end, random);
  }

  /// Reverses the elements in a range of the list.
  void reverseRange(int start, int end) {
    RangeError.checkValidRange(start, end, length);
    while (start < --end) {
      var tmp = this[start];
      this[start] = this[end];
      this[end] = tmp;
      start += 1;
    }
  }

  /// Swaps two elements of this list.
  void swap(int index1, int index2) {
    RangeError.checkValidIndex(index1, this, 'index1');
    RangeError.checkValidIndex(index2, this, 'index2');
    var tmp = this[index1];
    this[index1] = this[index2];
    this[index2] = tmp;
  }

  /// A fixed length view of a range of this list.
  ///
  /// The view is backed by this list, which must not change its length while
  /// the view is being used.
  ///
  /// The view can be used to perform specific whole-list
  /// actions on a part of the list.
  /// For example, to see if a list contains more than one
  /// "marker" element, you can do:
  /// ```dart
  /// someList.slice(someList.indexOf(marker) + 1).contains(marker)
  /// ```
  ListSlice<E> slice(int start, [int? end]) {
    end = RangeError.checkValidRange(start, end, length);
    var self = this;
    if (self is ListSlice<E>) return self.slice(start, end);
    return ListSlice<E>(this, start, end);
  }

  /// Whether [other] has the same elements as this list.
  ///
  /// Returns true iff [other] has the same [length]
  /// as this list, and the elements of this list and [other]
  /// at the same indices are equal according to [equality],
  /// which defaults to using `==`.
  bool equals(List<E> other, [Equality<E> equality = const DefaultEquality()]) {
    if (length != other.length) return false;
    for (var i = 0; i < length; i++) {
      if (!equality.equals(this[i], other[i])) return false;
    }
    return true;
  }

  /// The [index]th element, or `null` if there is no such element.
  ///
  /// Returns the element at position [index] of this list,
  /// just like [elementAt], if this list has such an element.
  /// If this list does not have enough elements to have one with the given
  /// [index], the `null` value is returned, unlike [elementAt] which throws
  /// instead.
  ///
  /// The [index] must not be negative.
  E? elementAtOrNull(int index) => (index < length) ? this[index] : null;

  /// Contiguous [slice]s of `this` with the given [length].
  ///
  /// Each slice is a view of this list [length] elements long, except for the
  /// last one which may be shorter if `this` contains too few elements. Each
  /// slice begins after the last one ends.
  ///
  /// As with [slice], these slices are backed by this list, which must not
  /// change its length while the views are being used.
  ///
  /// For example, `[1, 2, 3, 4, 5].slices(2)` returns `[[1, 2], [3, 4], [5]]`.
  Iterable<List<E>> slices(int length) sync* {
    if (length < 1) throw RangeError.range(length, 1, null, 'length');
    for (var i = 0; i < this.length; i += length) {
      yield slice(i, min(i + length, this.length));
    }
  }

  /// The elements of this list separated by [separator] as a lazy list.
  ///
  /// Creates an unmodifiable list backed by this list, which has [separator]s
  /// between, and optionally before and or/after, the elements of this list.
  /// Changes to this list will be reflected in the returned list.
  ///
  /// If [before] is set to `true`, the returned list has a separator
  /// before each element of this list.
  /// If [after] is set to `true`, the returned list has a separator
  /// after each element of this list.
  /// The returned list always has a separator between two elements
  /// of this list.
  ///
  /// If this iterable is empty, [before] and [after] have no effect.
  ///
  /// Compared to [IterableExtension.separatedList], this function
  /// doesn't copy the elements into a new list, it creates a view
  /// of the existing list with separators between the original elements.
  /// To do that efficiently, the source must be a list, not just
  /// an iterable.
  ///
  /// Example:
  /// ```dart
  /// print([1, 2, 3].separated(-1)); // [1, -1, 2, -1, 3]
  /// print([1].separated(-1)); // [1]
  /// print([].separated(-1)); // []
  ///
  /// print([1, 2, 3].separated(
  ///   -1,
  ///   before: true,
  /// )); // [-1, 1, -1, 2, -1, 3]
  ///
  /// print([1].separated(
  ///   -1,
  ///   before: true,
  ///   after: true,
  /// )); // [-1, 1, -1]
  ///
  /// print([].separated(
  ///   -1,
  ///   before: true,
  ///   after: true,
  /// )); // []
  /// ```
  /// @docImport 'iterable_extensions.dart' show IterableExtension;
  List<E> separated(E separator, {bool before = false, bool after = false}) =>
      _SeparatedList<E>(this, separator, before, after);

  /// Creates new list with the elements of this list separated by [separator].
  ///
  /// Returns a new list which contains the same elements as this list,
  /// with a [separator] between any two of those elements.
  ///
  /// If [before] is set to `true`, a [separator] is also
  /// added before the first element.
  /// If [after] is set to `true`, a [separator] is also
  /// added after the last element.
  ///
  /// If this list is empty, [before] and [after] have no effect.
  ///
  /// Example:
  /// ```dart
  /// print([1, 2, 3].separatedList(-1)); // [1, -1, 2, -1, 3]
  /// print([1].separatedList(-1)); // [1]
  /// print([].separatedList(-1)); // []
  ///
  /// print([1, 2, 3].separatedList(
  ///   -1
  ///   before: true,
  /// )); // [-1, 1, -1, 2, -1, 3]
  ///
  /// print([1].separatedList(
  ///   -1
  ///   before: true,
  ///   after: true,
  /// )); // [-1, 1, -1]
  ///
  /// print([].separatedList(
  ///   -1
  ///   before: true,
  ///   after: true,
  /// )); // []
  /// ```
  List<E> separatedList(E separator,
          {bool before = false, bool after = false}) =>
      isEmpty
          ? []
          : [
              if (!before) this[0],
              for (var i = before ? 0 : 1; i < length; i++) ...[
                separator,
                this[i],
              ],
              if (after) separator
            ];

  /// Inserts [separator] between elements of this list.
  ///
  /// Afterwards, the list will contains all the original elements,
  /// with a [separator] between any two of those elements.
  ///
  /// If [before] is set to `true`, a [separator] is also
  /// inserted before the first element.
  /// If [after] is set to `true`, a [separator] is also
  /// added after the last element.
  ///
  /// If this list is empty, [before] and [after] have no effect.
  ///
  /// Example:
  /// ```dart
  /// print([1, 2, 3]..separate(-1)); // [1, -1, 2, -1, 3]
  /// print([1]..separate(-1)); // [1]
  /// print([]..separate(-1)); // []
  ///
  /// print([1, 2, 3]..separate(
  ///   -1,
  ///   before: true,
  /// )); // [-1, 1, -1, 2, -1, 3]
  ///
  /// print([1]..separate(
  ///   -1,
  ///   before: true,
  ///   after: true,
  /// )); // [-1, 1, -1]
  ///
  /// print([]..separate(
  ///   -1,
  ///   before: true,
  ///   after: true,
  /// )); // []
  /// ```
  void separate(E separator, {bool before = false, bool after = false}) {
    var length = this.length;
    if (length == 0) return;
    // New position of first element.
    var newFirst = before ? 1 : 0;
    // New position of last element.
    var newLast = length * 2 - (newFirst ^ 1);

    var splitIndex = length - newFirst;
    var cursor = splitIndex >> 1;
    if (splitIndex.isEven) {
      add(this[cursor]);
    }
    cursor++;
    while (this.length < newLast) {
      add(separator);
      add(this[cursor++]);
    }
    assert(cursor == length);
    if (after) add(separator);

    cursor = splitIndex >> 1;
    if (splitIndex.isOdd) {
      this[--length] = this[cursor];
    }
    cursor--;
    for (var i = length; i > 1;) {
      this[--i] = separator;
      this[--i] = this[cursor--];
    }
    if (newFirst != 0) this[0] = separator;
  }
}

/// Various extensions on lists of comparable elements.
extension ListComparableExtensions<E extends Comparable<E>> on List<E> {
  /// Returns the index of [element] in this sorted list.
  ///
  /// Uses binary search to find the location of [element].
  /// This takes on the order of `log(n)` comparisons.
  /// The list *must* be sorted according to [compare],
  /// otherwise the result is unspecified.
  /// If [compare] is omitted, it uses the natural order of the elements.
  ///
  /// Returns -1 if [element] does not occur in this list.
  int binarySearch(E element, [int Function(E, E)? compare]) =>
      algorithms.binarySearchBy<E, E>(
        this,
        identity,
        compare ?? compareComparable,
        element,
      );

  /// Returns the index where [element] should be in this sorted list.
  ///
  /// Uses binary search to find the location of where [element] should be.
  /// This takes on the order of `log(n)` comparisons.
  /// The list *must* be sorted according to [compare],
  /// otherwise the result is unspecified.
  /// If [compare] is omitted, it uses the natural order of the elements.
  ///
  /// If [element] does not occur in this list, the returned index is
  /// the first index where inserting [element] would keep the list
  /// sorted.
  int lowerBound(E element, [int Function(E, E)? compare]) =>
      algorithms.lowerBoundBy<E, E>(
        this,
        identity,
        compare ?? compareComparable,
        element,
      );

  /// Sort a range of elements by [compare].
  ///
  /// If [compare] is omitted, the range is sorted according to the
  /// natural ordering of the elements.
  void sortRange(int start, int end, [int Function(E a, E b)? compare]) {
    RangeError.checkValidRange(start, end, length);
    algorithms.quickSortBy<E, E>(
      this,
      identity,
      compare ?? compareComparable,
      start,
      end,
    );
  }
}

/// A list view of a range of another list.
///
/// Wraps the range of the [source] list from [start] to [end]
/// and acts like a fixed-length list view of that range.
/// The source list must not change length while a list slice is being used.
class ListSlice<E> extends ListBase<E> {
  /// Original length of [source].
  ///
  /// Used to detect modifications to [source] which may invalidate
  /// the slice.
  final int _initialSize;

  /// The original list backing this slice.
  final List<E> source;

  /// The start index of the slice.
  final int start;

  @override
  final int length;

  /// Creates a slice of [source] from [start] to [end].
  ListSlice(this.source, this.start, int end)
      : length = end - start,
        _initialSize = source.length {
    RangeError.checkValidRange(start, end, source.length);
  }

  // No argument checking, for internal use.
  ListSlice._(this._initialSize, this.source, this.start, this.length);

  /// The end index of the slice.
  int get end => start + length;

  @override
  E operator [](int index) {
    if (source.length != _initialSize) {
      throw ConcurrentModificationError(source);
    }
    RangeError.checkValidIndex(index, this, null, length);
    return source[start + index];
  }

  @override
  void operator []=(int index, E value) {
    if (source.length != _initialSize) {
      throw ConcurrentModificationError(source);
    }
    RangeError.checkValidIndex(index, this, null, length);
    source[start + index] = value;
  }

  @override
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    if (source.length != _initialSize) {
      throw ConcurrentModificationError(source);
    }
    RangeError.checkValidRange(start, end, length);
    source.setRange(start + start, start + end, iterable, skipCount);
  }

  /// A fixed length view of a range of this list.
  ///
  /// The view is backed by this list, which must not change its length while
  /// the view is being used.
  ///
  /// The view can be used to perform specific whole-list
  /// actions on a part of the list.
  /// For example, to see if a list contains more than one
  /// "marker" element, you can do:
  /// ```dart
  /// someList.slice(someList.indexOf(marker) + 1).contains(marker)
  /// ```
  ListSlice<E> slice(int start, [int? end]) {
    end = RangeError.checkValidRange(start, end, length);
    return ListSlice._(_initialSize, source, this.start + start, end - start);
  }

  @override
  void shuffle([Random? random]) {
    if (source.length != _initialSize) {
      throw ConcurrentModificationError(source);
    }
    algorithms.shuffle(source, start, end, random);
  }

  @override
  void sort([int Function(E a, E b)? compare]) {
    if (source.length != _initialSize) {
      throw ConcurrentModificationError(source);
    }
    compare ??= defaultCompare;
    quickSort(source, compare, start, start + length);
  }

  /// Sort a range of elements by [compare].
  void sortRange(int start, int end, int Function(E a, E b) compare) {
    if (source.length != _initialSize) {
      throw ConcurrentModificationError(source);
    }
    source.sortRange(start, end, compare);
  }

  /// Shuffles a range of elements.
  ///
  /// If [random] is omitted, a new instance of [Random] is used.
  void shuffleRange(int start, int end, [Random? random]) {
    if (source.length != _initialSize) {
      throw ConcurrentModificationError(source);
    }
    RangeError.checkValidRange(start, end, length);
    algorithms.shuffle(source, this.start + start, this.start + end, random);
  }

  /// Reverses a range of elements.
  void reverseRange(int start, int end) {
    RangeError.checkValidRange(start, end, length);
    source.reverseRange(this.start + start, this.start + end);
  }

  // Act like a fixed-length list.

  @override
  set length(int newLength) {
    throw UnsupportedError('Cannot change the length of a fixed-length list');
  }

  @override
  void add(E element) {
    throw UnsupportedError('Cannot add to a fixed-length list');
  }

  @override
  void insert(int index, E element) {
    throw UnsupportedError('Cannot add to a fixed-length list');
  }

  @override
  void insertAll(int index, Iterable<E> iterable) {
    throw UnsupportedError('Cannot add to a fixed-length list');
  }

  @override
  void addAll(Iterable<E> iterable) {
    throw UnsupportedError('Cannot add to a fixed-length list');
  }

  @override
  bool remove(Object? element) {
    throw UnsupportedError('Cannot remove from a fixed-length list');
  }

  @override
  void removeWhere(bool Function(E element) test) {
    throw UnsupportedError('Cannot remove from a fixed-length list');
  }

  @override
  void retainWhere(bool Function(E element) test) {
    throw UnsupportedError('Cannot remove from a fixed-length list');
  }

  @override
  void clear() {
    throw UnsupportedError('Cannot clear a fixed-length list');
  }

  @override
  E removeAt(int index) {
    throw UnsupportedError('Cannot remove from a fixed-length list');
  }

  @override
  E removeLast() {
    throw UnsupportedError('Cannot remove from a fixed-length list');
  }

  @override
  void removeRange(int start, int end) {
    throw UnsupportedError('Cannot remove from a fixed-length list');
  }

  @override
  void replaceRange(int start, int end, Iterable<E> newContents) {
    throw UnsupportedError('Cannot remove from a fixed-length list');
  }
}

/// A lazy separator mapper around a `List`.
class _SeparatedList<E> extends ListBase<E> {
  final E _separator;
  final List<E> _elements;

  static const int _lengthDeltaShift = 1;
  static const int _lengthDeltaUnit = 1 << _lengthDeltaShift;
  static const int _beforeFlag = 1 << 0;

  /// Bit flags for before/after separator behavior.
  ///
  /// Bit 0: Have separator before first element.
  /// Bit 1+: Number of separators before and after.
  ///         One of 0, 1 or 2 depending on how many of `before` and `after`
  ///         were true.
  final int _flags;

  _SeparatedList(this._elements, this._separator, bool before, bool after)
      : _flags = (before ? (_beforeFlag + _lengthDeltaUnit) : 0) +
            (after ? _lengthDeltaUnit : 0);

  @override
  bool get isEmpty => _elements.isEmpty;

  @override
  bool get isNotEmpty => _elements.isNotEmpty;

  @override
  int get length {
    var length = _elements.length;
    if (length != 0) length = length * 2 - 1 + (_flags >> _lengthDeltaShift);
    return length;
  }

  @override
  E operator [](int index) {
    IndexError.check(index, length, indexable: this);
    var indexWithoutBefore = index - (_flags & _beforeFlag);
    return indexWithoutBefore.isEven
        ? _elements[indexWithoutBefore >> 1]
        : _separator;
  }

  @override
  void operator []=(int index, E value) => _unmodifiable();

  @override
  set length(int newLength) => _unmodifiable();

  @override
  set first(E element) => _unmodifiable();

  @override
  set last(E element) => _unmodifiable();

  @override
  void setAll(int at, Iterable<E> iterable) => _unmodifiable();

  @override
  void add(E value) => _unmodifiable();

  @override
  void insert(int index, E element) => _unmodifiable();

  @override
  void insertAll(int at, Iterable<E> iterable) => _unmodifiable();

  @override
  void addAll(Iterable<E> iterable) => _unmodifiable();

  @override
  bool remove(Object? element) => _unmodifiable();

  @override
  void removeWhere(bool Function(E element) test) => _unmodifiable();

  @override
  void retainWhere(bool Function(E element) test) => _unmodifiable();

  @override
  void sort([Comparator<E>? compare]) => _unmodifiable();

  @override
  void shuffle([Random? random]) => _unmodifiable();

  @override
  void clear() => _unmodifiable();

  @override
  E removeAt(int index) => _unmodifiable();

  @override
  E removeLast() => _unmodifiable();

  @override
  void setRange(int start, int end, Iterable<E> iterable,
          [int skipCount = 0]) =>
      _unmodifiable();

  @override
  void removeRange(int start, int end) => _unmodifiable();

  @override
  void replaceRange(int start, int end, Iterable<E> iterable) =>
      _unmodifiable();

  @override
  void fillRange(int start, int end, [E? fillValue]) => _unmodifiable();

  static Never _unmodifiable() =>
      throw UnsupportedError('Cannot modify lazily separated list');
}
