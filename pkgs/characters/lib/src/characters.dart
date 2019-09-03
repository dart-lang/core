// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "dart:collection";

import "grapheme_clusters/constants.dart";
import "grapheme_clusters/breaks.dart";

part "characters_impl.dart";

/// The characters of a string.
///
/// A character is a Unicode Grapheme cluster represented
/// by a substring of the original string.
/// The `Characters` class is an [Iterable] of those strings.
/// However, unlike most iterables, many of the operations are
/// *eager*. Since the underlying string is known in its entirety,
/// and is known not to change, operations which select a subset of
/// the elements can be computed eagerly, and in that case the
/// operation returns a new `Characters` object.
///
/// A `Characters` also supports operations based on
/// string indices into the underlying string.
///
/// Inspection operations like [indexOf] or [lastIndexAfter]
/// returns such indices which are guranteed to be at character
/// boundaries.
/// Most such operations use the index as starting point,
/// but will still only work on entire characters.
/// A few, like [substring] and [replaceSubstring], work directly
/// on the underlying string, independently of character
/// boundaries.
abstract class Characters implements Iterable<String> {
  /// Creates a [Characters] allowing iteration of
  /// the characters of [string].
  factory Characters(String string) = _Characters;

  /// The string to iterate over.
  String get string;

  /// A specialized character iterator.
  ///
  /// Allows iterating the characters of [string] as a plain iterator,
  // as well as controlling the iteration in more detail.
  Character get iterator;

  /// Whether [Character] is an element of this sequence of
  /// characters.
  ///
  /// Returns false if [Character] is not a string containing
  /// a single character,
  /// because then it is not a single element of this [Iterable]
  /// of characters.
  bool contains(Object Character);

  /// Whether this sequence of characters contains [other]
  /// as a subsequence.
  bool containsAll(Characters other);

  /// Whether [other] is an initial subsequence of this sequence
  /// of characters.
  ///
  /// If [startIndex] is provided, then checks whether
  /// [other] is an initial subsequence of the characters
  /// starting at the character boundary [startIndex].
  ///
  /// Returns `true` if [other] is a sub-sequence of this sequence of
  /// characters startings at the character boundary [startIndex].
  /// Returns `false` if [startIndex] is not a character boundary,
  /// or if [other] does not occur at that position.
  bool startsWith(Characters other, [int startIndex = 0]);

  /// Whether [other] is an trailing subsequence of this sequence
  /// of characters.
  ///
  /// If [endIndex] is provided, then checks whether
  /// [other] is a trailing subsequence of the characters
  /// starting at the character boundary [endIndex].
  ///
  /// Returns `true` if [other] is a sub-sequence of this sequence of
  /// characters startings at the character boundary [endIndex].
  /// Returns `false` if [endIndex] is not a character boundary,
  /// or if [other] does not occur at that position.
  bool endsWith(Characters other, [int endIndex]);

  /// The string index before the first place where [other] occurs as
  /// a subsequence of these characters.
  ///
  /// Returns the [string] index before first occurrence of the character
  /// of [other] in the sequence of characters of [string].
  /// Returns a negative number if there is no such occurrence of [other].
  ///
  /// If [startIndex] is supplied, returns the index after the first occurrence
  /// of [other] in this which starts no earlier than [startIndex], and again
  /// returns `null` if there is no such occurrence. That is, if the result
  /// is non-negative, it is greater than or equal to [startIndex].
  int indexOf(Characters other, [int startIndex]);

  /// The string index after the first place [other] occurs as a subsequence of
  /// these characters.
  ///
  /// Returns the [string] index after the first occurrence of the character
  /// of [other] in the sequence of characters of [string].
  /// Returns a negative number if there is no such occurrence of [other].
  ///
  /// If [startIndex] is supplied, returns the index after the first occurrence
  /// of [other] in this which starts no earlier than [startIndex], and again
  /// returns `null` if there is no such occurrence. That is, if the result
  /// is non-negative, it is greater than or equal to [startIndex].
  int indexAfter(Characters other, [int startIndex]);

  /// The string index before the last place where [other] occurs as
  /// a subsequence of these characters.
  ///
  /// Returns the [string] index before last occurrence of the character
  /// of [other] in the sequence of characters of [string].
  /// Returns a negative number if there is no such occurrence of [other].
  ///
  /// If [startIndex] is supplied, returns the before after the first occurrence
  /// of [other] in this which starts no later than [startIndex], and again
  /// returns `null` if there is no such occurrence. That is the result
  /// is less than or equal to [startIndex].
  int lastIndexOf(Characters other, [int startIndex]);

  /// The string index after the last place where [other] occurs as
  /// a subsequence of these characters.
  ///
  /// Returns the [string] index after the last occurrence of the character
  /// of [other] in the sequence of characters of [string].
  /// Returns a negative number if there is no such occurrence of [other].
  ///
  /// If [startIndex] is supplied, returns the index after the last occurrence
  /// of [other] in this which ends no later than [startIndex], and again
  /// returns `null` if there is no such occurrence. That is the result
  /// is less than or equal to [startIndex].
  int lastIndexAfter(Characters other, [int startIndex]);

  /// Eagerly selects a subset of the characters.
  ///
  /// Tests each character against [test], and returns the
  /// characters of the concatenation of those character strings.
  Characters where(bool Function(String) test);

  /// Eagerly selects all but the first [count] characters.
  ///
  /// If [count] is greater than [length], the count of character
  /// available, then the empty sequence of characters
  /// is returned.
  Characters skip(int count);

  /// Eagerly selects the first [count] characters.
  ///
  /// If [count] is greater than [length], the count of character
  /// available, then the entire sequence of characters
  /// is returned.
  Characters take(int count);

  /// Eagerly selects all but the last [count] characters.
  ///
  /// If [count] is greater than [length], the count of character
  /// available, then the empty sequence of characters
  /// is returned.
  Characters skipLast(int count);

  /// Eagerly selects the last [count] characters.
  ///
  /// If [count] is greater than [length], the count of character
  /// available, then the entire sequence of characters
  /// is returned.
  Characters takeLast(int count);

  /// Eagerly selects a range of characters.
  ///
  /// Both [start] and [end] are offsets of characters,
  /// not indices into [string].
  /// The [start] must be non-negative and [end] must be at least
  /// as large as [start].
  ///
  /// If [start] is at least as great as [length], then the result
  /// is an empty sequence of graphemes.
  /// If [end] is greater than [length], the count of character
  /// available, then it acts the same as if it was [length].
  ///
  /// A call like `gc.getRange(a, b)` is equivalent to `gc.take(b).skip(a)`.
  Characters getRange(int start, int end);

  /// Eagerly selects a trailing sequence of characters.
  ///
  /// Checks each character, from first to last, against [test],
  /// until one is found whwere [test] returns `false`.
  /// The characters starting with the first one
  /// where [test] returns `false`, are included in the result.
  ///
  /// If no characters test `false`, the result is an empty sequence
  /// of characters.
  Characters skipWhile(bool Function(String) test);

  /// Eagerly selects a leading sequnce of characters.
  ///
  /// Checks each character, from first to last, against [test],
  /// until one is found whwere [test] returns `false`.
  /// The characters up to, but not including, the first one
  /// where [test] returns `false` are included in the result.
  ///
  /// If no characters test `false`, the entire sequence of character
  /// is returned.
  Characters takeWhile(bool Function(String) test);

  /// Eagerly selects a leading sequnce of characters.
  ///
  /// Checks each character, from last to first, against [test],
  /// until one is found whwere [test] returns `false`.
  /// The characters up to and including the one with the latest index
  /// where [test] returns `false` are included in the result.
  ///
  /// If no characters test `false`, the empty sequence of character
  /// is returned.
  Characters skipLastWhile(bool Function(String) test);

  /// Eagerly selects a trailing sequence of characters.
  ///
  /// Checks each character, from last to first, against [test],
  /// until one is found whwere [test] returns `false`.
  /// The characters after the one with the latest index where
  /// [test] returns `false` are included in the result.
  ///
  /// If no characters test `false`, the entire sequence of character
  /// is returned.
  Characters takeLastWhile(bool Function(String) test);

  /// The characters of the concatenation of this and [other].
  ///
  /// This is the characters of the concatenation of the underlying
  /// strings. If there is no character break at the concatenation
  /// point in the resulting string, then the result is not the concatenation
  /// of the two character sequences.
  ///
  /// This differs from [followedBy] which provides the lazy concatenation
  /// of this sequence of strings with any other sequence of strings.
  Characters operator +(Characters other);

  /// The characters of [string] with [other] inserted at [index].
  ///
  /// The [index] is a string can be any index into [string].
  Characters insertAt(int index, Characters other);

  /// The characters of [string] with a substring replaced by other.
  Characters replaceSubstring(int startIndex, int endIndex, Characters other);

  /// The characters of a substring of [string].
  ///
  /// The [startIndex] and [endIndex] must be a valid range of [string]
  /// (0 &le; `startIndex` &le; `endIndex` &le; `string.length`).
  /// If [endIndex] is omitted, it defaults to `string.length`.
  Characters substring(int startIndex, [int endIndex]);

  /// Replaces [source] with [replacement].
  ///
  /// Returns a new [GrapehemeClusters] where all occurrences of the
  /// [source] character sequence are replaced by [replacement],
  /// unless the occurrence overlaps a prior replaced sequence.
  ///
  /// If [startIndex] is provided, only replace characters
  /// starting no earlier than [startIndex] in [string].
  Characters replaceAll(Characters source, Characters replacement,
      [int startIndex = 0]);

  /// Replaces the first [source] with [replacement].
  ///
  /// Returns a new [Characters] where the first occurence of the
  /// [source] character sequence, if any, is replaced by [replacement].
  ///
  /// If [startIndex] is provided, replaces the first occurrence
  /// of [source] starting no earlier than [startIndex] in [string], if any.
  Characters replaceFirst(Characters source, Characters replacement,
      [int startIndex = 0]);

  /// The characters of the lower-case version of [string].
  Characters toLowerCase();

  /// The characters of the upper-case version of [string].
  Characters toUpperCase();

  /// The hash code of [string].
  int get hashCode;

  /// Whether [other] to another [Characters] with the same [string].
  bool operator ==(Object other);

  /// The [string] content of these characters.
  String toString();
}

/// Iterator over characters of a string.
///
/// Characters are Unicode grapheme clusters represented as substrings
/// of the original string.
///
/// The [start] and [end] indices will iterate the grapheme cluster
/// boundaries of the string while the [Character] is iterating the
/// grapheme clusters. A string with *n* grapheme clusters will have
/// *n + 1* boundaries (except when *n* is zero, then there are also
/// zero boundaries). Those boundaries can be accessed as, for example:
/// ```dart
/// Iterable<int> graphemeClusterBoundaries(String string) sync* {
///   if (string.isEmpty) return;
///   var char = Characters(string).iterator;
///   var hasNext = false;
///   do {
///     hasNext = char.moveNext();
///     yield char.start;
///   } while (hasNext);
/// }
/// ```
abstract class Character implements BidirectionalIterator<String> {
  /// Creates a new character iterator iterating the character
  /// of [string].
  factory Character(String string) = _Character;

  /// The beginning of the current character in the underlying string.
  ///
  /// This index is always at a cluster boundary unless the iterator
  /// has been reset to a non-boundary index.
  ///
  /// If equal to [end], there is no current character, and [moveNext]
  /// needs to be called first before accessing [current].
  /// This is the case at the beginning of iteration,
  /// after [moveNext] has returned false,
  /// or after calling [reset].
  int get start;

  /// The end of the current character in the underlying string.
  ///
  /// This index is always at a cluster boundary unless the iterator
  /// has been reset to a non-boundary index.
  ///
  /// If equal to [start], there is no current character.
  int get end;

  /// The code units of the current character.
  List<int> get codeUnits;

  /// The code points of the current character.
  Runes get runes;

  /// Resets the iterator to the [index] position.
  ///
  /// There is no [current] character after a reset,
  /// a call to [moveNext] is needed to find the end of the character
  /// at the [index] position.
  /// A `reset(0)` will reset to the beginning of the string, as for a newly
  /// created iterator.
  void reset(int index);

  /// Resets the iterator to the start of the string.
  ///
  /// The iterator will be in the same state as a newly created iterator
  /// from [Characters.iterator].
  void resetStart();

  /// Resets the iterator to the end of the string.
  ///
  /// The iterator will be in the same state as an iterator which has
  /// performed [moveNext] until it returned false.
  void resetEnd();

  /// Creates a copy of this [Character].
  ///
  /// The copy is in the exact same state as this iterator.
  /// Can be used to iterate the following characters more than once
  /// at the same time. To simply rewind an iterator, remember the
  /// [start] or [end] position and use [reset] to reset the iterator
  /// to that position.
  Character copy();
}
