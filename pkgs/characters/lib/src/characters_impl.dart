// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "dart:collection" show ListBase;

import 'package:characters/src/grapheme_clusters/table.dart';

import "characters.dart";
import "grapheme_clusters/constants.dart";
import "grapheme_clusters/breaks.dart";

/// The grapheme clusters of a string.
///
/// Backed by a single string.
class StringCharacters extends Iterable<String> implements Characters {
  // Try to avoid allocating more empty grapheme clusters.
  static const StringCharacters _empty = const StringCharacters("");

  final String string;

  const StringCharacters(this.string);

  @override
  CharacterRange get iterator => StringCharacterRange._(string, 0, 0);

  @override
  CharacterRange get iteratorAtEnd =>
      StringCharacterRange._(string, string.length, string.length);

  StringCharacterRange get _rangeAll =>
      StringCharacterRange._(string, 0, string.length);

  @override
  String get first => string.isEmpty
      ? throw StateError("No element")
      : string.substring(
          0, Breaks(string, 0, string.length, stateSoTNoBreak).nextBreak());

  @override
  String get last => string.isEmpty
      ? throw StateError("No element")
      : string.substring(
          BackBreaks(string, string.length, 0, stateEoTNoBreak).nextBreak());

  @override
  String get single {
    if (string.isEmpty) throw StateError("No element");
    int firstEnd =
        Breaks(string, 0, string.length, stateSoTNoBreak).nextBreak();
    if (firstEnd == string.length) return string;
    throw StateError("Too many elements");
  }

  @override
  bool get isEmpty => string.isEmpty;

  @override
  bool get isNotEmpty => string.isNotEmpty;

  @override
  int get length {
    if (string.isEmpty) return 0;
    var brk = Breaks(string, 0, string.length, stateSoTNoBreak);
    int length = 0;
    while (brk.nextBreak() >= 0) length++;
    return length;
  }

  @override
  Iterable<T> whereType<T>() {
    Iterable<Object> self = this;
    if (self is Iterable<T>) {
      return self.map<T>((x) => x);
    }
    return Iterable<T>.empty();
  }

  @override
  String join([String separator = ""]) {
    if (separator == "") return string;
    return _explodeReplace(string, 0, string.length, separator, "");
  }

  @override
  String lastWhere(bool test(String element), {String orElse()}) {
    int cursor = string.length;
    var brk = BackBreaks(string, cursor, 0, stateEoTNoBreak);
    int next = 0;
    while ((next = brk.nextBreak()) >= 0) {
      String current = string.substring(next, cursor);
      if (test(current)) return current;
      cursor = next;
    }
    if (orElse != null) return orElse();
    throw StateError("no element");
  }

  @override
  String elementAt(int index) {
    RangeError.checkNotNegative(index, "index");
    int count = 0;
    if (string.isNotEmpty) {
      var breaks = Breaks(string, 0, string.length, stateSoTNoBreak);
      int start = 0;
      int end = 0;
      while ((end = breaks.nextBreak()) >= 0) {
        if (count == index) return string.substring(start, end);
        count++;
        start = end;
      }
    }
    throw RangeError.index(index, this, "index", null, count);
  }

  @override
  bool contains(Object other) {
    if (other is String) {
      if (other.isEmpty) return false;
      int next = Breaks(other, 0, other.length, stateSoTNoBreak).nextBreak();
      if (next != other.length) return false;
      // [other] is single grapheme cluster.
      return _indexOf(string, other, 0, string.length) >= 0;
    }
    return false;
  }

  @override
  bool startsWith(Characters other) {
    int length = string.length;
    String otherString = other.string;
    if (otherString.isEmpty) return true;
    return string.startsWith(otherString) &&
        isGraphemeClusterBoundary(string, 0, length, otherString.length);
  }

  @override
  bool endsWith(Characters other) {
    int length = string.length;
    String otherString = other.string;
    if (otherString.isEmpty) return true;
    int otherLength = otherString.length;
    int start = string.length - otherLength;
    return start >= 0 &&
        string.startsWith(otherString, start) &&
        isGraphemeClusterBoundary(string, 0, length, start);
  }

  @override
  Characters replaceAll(Characters pattern, Characters replacement) =>
      _rangeAll.replaceAll(pattern, replacement);

  @override
  Characters replaceFirst(Characters pattern, Characters replacement) {
    var range = _rangeAll;
    if (!range.collapseToFirst(pattern)) return this;
    return range.replaceRange(replacement);
  }

  @override
  bool containsAll(Characters other) =>
      _indexOf(string, other.string, 0, string.length) >= 0;

  @override
  Characters skip(int count) {
    RangeError.checkNotNegative(count, "count");
    if (count == 0) return this;
    if (string.isNotEmpty) {
      int stringLength = string.length;
      var breaks = Breaks(string, 0, stringLength, stateSoTNoBreak);
      int startIndex = 0;
      while (count > 0) {
        int index = breaks.nextBreak();
        if (index >= 0) {
          count--;
          startIndex = index;
        } else {
          return _empty;
        }
      }
      if (startIndex == stringLength) return _empty;
      return StringCharacters(string.substring(startIndex));
    }
    return this;
  }

  @override
  Characters take(int count) {
    RangeError.checkNotNegative(count, "count");
    if (count == 0) return _empty;
    if (string.isNotEmpty) {
      var breaks = Breaks(string, 0, string.length, stateSoTNoBreak);
      int endIndex = 0;
      while (count > 0) {
        int index = breaks.nextBreak();
        if (index >= 0) {
          endIndex = index;
          count--;
        } else {
          return this;
        }
      }
      return StringCharacters(string.substring(0, endIndex));
    }
    return this;
  }

  @override
  Characters skipWhile(bool Function(String) test) {
    if (string.isNotEmpty) {
      int stringLength = string.length;
      var breaks = Breaks(string, 0, stringLength, stateSoTNoBreak);
      int index = 0;
      int startIndex = 0;
      while ((index = breaks.nextBreak()) >= 0) {
        if (!test(string.substring(startIndex, index))) {
          if (startIndex == 0) return this;
          if (startIndex == stringLength) return _empty;
          return StringCharacters(string.substring(startIndex));
        }
        startIndex = index;
      }
    }
    return _empty;
  }

  @override
  Characters takeWhile(bool Function(String) test) {
    if (string.isNotEmpty) {
      var breaks = Breaks(string, 0, string.length, stateSoTNoBreak);
      int index = 0;
      int endIndex = 0;
      while ((index = breaks.nextBreak()) >= 0) {
        if (!test(string.substring(endIndex, index))) {
          if (endIndex == 0) return _empty;
          return StringCharacters(string.substring(0, endIndex));
        }
        endIndex = index;
      }
    }
    return this;
  }

  @override
  Characters where(bool Function(String) test) {
    var string = super.where(test).join();
    if (string.isEmpty) return _empty;
    return StringCharacters(super.where(test).join());
  }

  @override
  Characters operator +(Characters other) =>
      StringCharacters(string + other.string);

  @override
  Characters skipLast(int count) {
    RangeError.checkNotNegative(count, "count");
    if (count == 0) return this;
    if (string.isNotEmpty) {
      var breaks = BackBreaks(string, string.length, 0, stateEoTNoBreak);
      int endIndex = string.length;
      while (count > 0) {
        int index = breaks.nextBreak();
        if (index >= 0) {
          endIndex = index;
          count--;
        } else {
          return _empty;
        }
      }
      if (endIndex > 0) return StringCharacters(string.substring(0, endIndex));
    }
    return _empty;
  }

  @override
  Characters skipLastWhile(bool Function(String) test) {
    if (string.isNotEmpty) {
      var breaks = BackBreaks(string, string.length, 0, stateEoTNoBreak);
      int index = 0;
      int end = string.length;
      while ((index = breaks.nextBreak()) >= 0) {
        if (!test(string.substring(index, end))) {
          if (end == string.length) return this;
          return end == 0 ? _empty : StringCharacters(string.substring(0, end));
        }
        end = index;
      }
    }
    return _empty;
  }

  @override
  Characters takeLast(int count) {
    RangeError.checkNotNegative(count, "count");
    if (count == 0) return _empty;
    if (string.isNotEmpty) {
      var breaks = BackBreaks(string, string.length, 0, stateEoTNoBreak);
      int startIndex = string.length;
      while (count > 0) {
        int index = breaks.nextBreak();
        if (index >= 0) {
          startIndex = index;
          count--;
        } else {
          return this;
        }
      }
      if (startIndex > 0) {
        return StringCharacters(string.substring(startIndex));
      }
    }
    return this;
  }

  @override
  Characters takeLastWhile(bool Function(String) test) {
    if (string.isNotEmpty) {
      var breaks = BackBreaks(string, string.length, 0, stateEoTNoBreak);
      int index = 0;
      int start = string.length;
      while ((index = breaks.nextBreak()) >= 0) {
        if (!test(string.substring(index, start))) {
          if (start == string.length) return _empty;
          return StringCharacters(string.substring(start));
        }
        start = index;
      }
    }
    return this;
  }

  @override
  Characters toLowerCase() => StringCharacters(string.toLowerCase());

  @override
  Characters toUpperCase() => StringCharacters(string.toUpperCase());

  @override
  bool operator ==(Object other) =>
      other is Characters && string == other.string;

  @override
  int get hashCode => string.hashCode;

  @override
  String toString() => string;

  @override
  CharacterRange findFirst(Characters characters) {
    var range = _rangeAll;
    if (range.collapseToFirst(characters)) return range;
    return null;
  }

  @override
  CharacterRange findLast(Characters characters) {
    var range = _rangeAll;
    if (range.collapseToLast(characters)) return range;
    return null;
  }
}

/// A [CharacterRange] on a single string.
class StringCharacterRange implements CharacterRange {
  /// The source string.
  final String _string;

  /// Start index of range in string.
  ///
  /// The index is a code unit index in the [String].
  /// It is always at a grapheme cluster boundary.
  int _start;

  /// End index of range in string.
  ///
  /// The index is a code unit index in the [String].
  /// It is always at a grapheme cluster boundary.
  int _end;

  /// The [current] value is created lazily and cached to avoid repeated
  /// or unnecessary string allocation.
  String _currentCache;

  StringCharacterRange(String string) : this._(string, 0, 0);
  StringCharacterRange._(this._string, this._start, this._end);

  /// Changes the current range.
  ///
  /// Resets all cached state.
  void _move(int start, int end) {
    _start = start;
    _end = end;
    _currentCache = null;
  }

  /// Creates a [Breaks] from [_end] to `_string.length`.
  ///
  /// Uses information stored in [_state] for cases where the next
  /// character has already been seen.
  Breaks _breaksFromEnd() {
    return Breaks(_string, _end, _string.length, stateSoTNoBreak);
  }

  /// Creates a [Breaks] from string start to [_start].
  ///
  /// Uses information stored in [_state] for cases where the previous
  /// character has already been seen.
  BackBreaks _backBreaksFromStart() {
    return BackBreaks(_string, _start, 0, stateEoTNoBreak);
  }

  @override
  String get current => _currentCache ??= _string.substring(_start, _end);

  @override
  bool moveNext([int count = 1]) => _advanceEnd(count, _end);

  bool _advanceEnd(int count, int newStart) {
    if (count > 0) {
      var state = stateSoTNoBreak;
      int index = _end;
      while (index < _string.length) {
        int char = _string.codeUnitAt(index);
        int category = categoryControl;
        int nextIndex = index + 1;
        if (char & 0xFC00 != 0xD800) {
          category = low(char);
        } else if (nextIndex < _string.length) {
          int nextChar = _string.codeUnitAt(nextIndex);
          if (nextChar & 0xFC00 == 0xDC00) {
            nextIndex += 1;
            category = high(char, nextChar);
          }
        }
        state = move(state, category);
        if (state & stateNoBreak == 0 && --count == 0) {
          _move(newStart, index);
          return true;
        }
        index = nextIndex;
      }
      _move(newStart, _string.length);
      return count == 1 && state != stateSoTNoBreak;
    } else if (count == 0) {
      _move(newStart, _end);
      return true;
    } else {
      throw RangeError.range(count, 0, null, "count");
    }
  }

  bool _moveNextPattern(String patternString, int start, int end) {
    int offset = _indexOf(_string, patternString, start, end);
    if (offset >= 0) {
      _move(offset, offset + patternString.length);
      return true;
    }
    return false;
  }

  @override
  bool moveBack([int count = 1]) => _retractStart(count, _start);

  bool _retractStart(int count, int newEnd) {
    RangeError.checkNotNegative(count, "count");
    var breaks = _backBreaksFromStart();
    int start = _start;
    while (count > 0) {
      int nextBreak = breaks.nextBreak();
      if (nextBreak >= 0) {
        start = nextBreak;
      } else {
        break;
      }
      count--;
    }
    _move(start, newEnd);
    return count == 0;
  }

  bool _movePreviousPattern(String patternString, int start, int end) {
    int offset = _lastIndexOf(_string, patternString, start, end);
    if (offset >= 0) {
      _move(offset, offset + patternString.length);
      return true;
    }
    return false;
  }

  @override
  List<int> get codeUnits => _CodeUnits(_string, _start, _end);

  @override
  Runes get runes => Runes(current);

  @override
  CharacterRange copy() {
    return StringCharacterRange._(_string, _start, _end);
  }

  @override
  void collapseToEnd() {
    _move(_end, _end);
  }

  @override
  void collapseToStart() {
    _move(_start, _start);
  }

  @override
  bool dropFirst([int count = 1]) {
    RangeError.checkNotNegative(count, "count");
    if (_start == _end) return count == 0;
    var breaks = Breaks(_string, _start, _end, stateSoTNoBreak);
    while (count > 0) {
      int nextBreak = breaks.nextBreak();
      if (nextBreak >= 0) {
        _start = nextBreak;
        _currentCache = null;
        count--;
      } else {
        return false;
      }
    }
    return true;
  }

  @override
  bool dropTo(Characters target) {
    if (_start == _end) return target.isEmpty;
    var targetString = target.string;
    var index = _indexOf(_string, targetString, _start, _end);
    if (index >= 0) {
      _move(index + targetString.length, _end);
      return true;
    }
    return false;
  }

  @override
  bool dropUntil(Characters target) {
    if (_start == _end) return target.isEmpty;
    var targetString = target.string;
    var index = _indexOf(_string, targetString, _start, _end);
    if (index >= 0) {
      _move(index, _end);
      return true;
    }
    _move(_end, _end);
    return false;
  }

  @override
  void dropWhile(bool Function(String) test) {
    if (_start == _end) return;
    var breaks = Breaks(_string, _start, _end, stateSoTNoBreak);
    int cursor = _start;
    int next = 0;
    while ((next = breaks.nextBreak()) >= 0) {
      if (!test(_string.substring(cursor, next))) {
        break;
      }
      cursor = next;
    }
    _move(cursor, _end);
  }

  @override
  bool dropLast([int count = 1]) {
    RangeError.checkNotNegative(count, "count");
    var breaks = BackBreaks(_string, _end, _start, stateEoTNoBreak);
    while (count > 0) {
      int nextBreak = breaks.nextBreak();
      if (nextBreak >= 0) {
        _end = nextBreak;
        _currentCache = null;
        count--;
      } else {
        return false;
      }
    }
    return true;
  }

  @override
  bool dropBackTo(Characters target) {
    if (_start == _end) return target.isEmpty;
    var targetString = target.string;
    var index = _lastIndexOf(_string, targetString, _start, _end);
    if (index >= 0) {
      _move(_start, index);
      return true;
    }
    return false;
  }

  @override
  bool dropBackUntil(Characters target) {
    if (_start == _end) return target.isEmpty;
    var targetString = target.string;
    var index = _lastIndexOf(_string, targetString, _start, _end);
    if (index >= 0) {
      _move(_start, index + targetString.length);
      return true;
    }
    _move(_start, _start);
    return false;
  }

  @override
  void dropBackWhile(bool Function(String) test) {
    if (_start == _end) return;
    var breaks = BackBreaks(_string, _end, _start, stateEoTNoBreak);
    int cursor = _end;
    int next = 0;
    while ((next = breaks.nextBreak()) >= 0) {
      if (!test(_string.substring(next, cursor))) {
        break;
      }
      cursor = next;
    }
    _move(_start, cursor);
  }

  @override
  bool expandNext([int count = 1]) => _advanceEnd(count, _start);

  @override
  bool expandTo(Characters target) {
    String targetString = target.string;
    int index = _indexOf(_string, targetString, _end, _string.length);
    if (index >= 0) {
      _move(_start, index + targetString.length);
      return true;
    }
    return false;
  }

  @override
  void expandWhile(bool Function(String character) test) {
    var breaks = _breaksFromEnd();
    int cursor = _end;
    int next = 0;
    while ((next = breaks.nextBreak()) >= 0) {
      if (!test(_string.substring(cursor, next))) {
        break;
      }
      cursor = next;
    }
    _move(_start, cursor);
  }

  @override
  void expandAll() {
    _move(_start, _string.length);
  }

  @override
  bool expandBack([int count = 1]) => _retractStart(count, _end);

  @override
  bool expandBackTo(Characters target) {
    var targetString = target.string;
    int index = _lastIndexOf(_string, targetString, 0, _start);
    if (index >= 0) {
      _move(index, _end);
      return true;
    }
    return false;
  }

  @override
  void expandBackWhile(bool Function(String character) test) {
    var breaks = _backBreaksFromStart();
    int cursor = _start;
    int next = 0;
    while ((next = breaks.nextBreak()) >= 0) {
      if (!test(_string.substring(next, cursor))) {
        _move(cursor, _end);
        return;
      }
      cursor = next;
    }
    _move(0, _end);
  }

  @override
  bool expandBackUntil(Characters target) {
    return _retractStartUntil(target.string, _end);
  }

  @override
  void expandBackAll() {
    _move(0, _end);
  }

  @override
  bool expandUntil(Characters target) {
    return _advanceEndUntil(target.string, _start);
  }

  @override
  bool get isEmpty => _start == _end;

  @override
  bool get isNotEmpty => _start != _end;

  @override
  bool moveBackUntil(Characters target) {
    var targetString = target.string;
    return _retractStartUntil(targetString, _start);
  }

  bool _retractStartUntil(String targetString, int newEnd) {
    var index = _lastIndexOf(_string, targetString, 0, _start);
    if (index >= 0) {
      _move(index + targetString.length, newEnd);
      return true;
    }
    _move(0, newEnd);
    return false;
  }

  @override
  bool collapseToFirst(Characters target) {
    return _moveNextPattern(target.string, _start, _end);
  }

  @override
  bool collapseToLast(Characters target) {
    return _movePreviousPattern(target.string, _start, _end);
  }

  @override
  bool moveUntil(Characters target) {
    var targetString = target.string;
    return _advanceEndUntil(targetString, _end);
  }

  bool _advanceEndUntil(String targetString, int newStart) {
    int index = _indexOf(_string, targetString, _end, _string.length);
    if (index >= 0) {
      _move(newStart, index);
      return true;
    }
    _move(newStart, _string.length);
    return false;
  }

  @override
  Characters replaceFirst(Characters pattern, Characters replacement) {
    String patternString = pattern.string;
    String replacementString = replacement.string;
    if (patternString.isEmpty) {
      return StringCharacters(
          _string.replaceRange(_start, _start, replacementString));
    }
    int index = _indexOf(_string, patternString, _start, _end);
    String result = _string;
    if (index >= 0) {
      result = _string.replaceRange(
          index, index + patternString.length, replacementString);
    }
    return StringCharacters(result);
  }

  @override
  Characters replaceAll(Characters pattern, Characters replacement) {
    var patternString = pattern.string;
    var replacementString = replacement.string;
    if (patternString.isEmpty) {
      var replaced = _explodeReplace(
          _string, _start, _end, replacementString, replacementString);
      return StringCharacters(replaced);
    }
    if (_start == _end) return Characters(_string);
    int start = 0;
    int cursor = _start;
    StringBuffer buffer;
    while ((cursor = _indexOf(_string, patternString, cursor, _end)) >= 0) {
      (buffer ??= StringBuffer())
        ..write(_string.substring(start, cursor))
        ..write(replacementString);
      cursor += patternString.length;
      start = cursor;
    }
    if (buffer == null) return Characters(_string);
    buffer.write(_string.substring(start));
    return Characters(buffer.toString());
  }

  @override
  Characters replaceRange(Characters replacement) {
    return Characters(_string.replaceRange(_start, _end, replacement.string));
  }

  @override
  Characters get source => Characters(_string);

  @override
  bool startsWith(Characters characters) {
    return _startsWith(_start, _end, characters.string);
  }

  @override
  bool endsWith(Characters characters) {
    return _endsWith(_start, _end, characters.string);
  }

  @override
  bool isFollowedBy(Characters characters) {
    return _startsWith(_end, _string.length, characters.string);
  }

  @override
  bool isPrecededBy(Characters characters) {
    return _endsWith(0, _start, characters.string);
  }

  bool _endsWith(int start, int end, String string) {
    int length = string.length;
    int stringStart = end - length;
    return stringStart >= start &&
        _string.startsWith(string, stringStart) &&
        isGraphemeClusterBoundary(_string, start, end, stringStart);
  }

  bool _startsWith(int start, int end, String string) {
    int length = string.length;
    int stringEnd = start + length;
    return stringEnd <= end &&
        _string.startsWith(string, start) &&
        isGraphemeClusterBoundary(_string, start, end, stringEnd);
  }

  @override
  bool moveBackTo(Characters target) {
    var targetString = target.string;
    int index = _lastIndexOf(_string, targetString, 0, _start);
    if (index >= 0) {
      _move(index, index + targetString.length);
      return true;
    }
    return false;
  }

  @override
  bool moveTo(Characters target) {
    var targetString = target.string;
    int index = _indexOf(_string, targetString, _end, _string.length);
    if (index >= 0) {
      _move(index, index + targetString.length);
      return true;
    }
    return false;
  }
}

class _CodeUnits extends ListBase<int> {
  final String _string;
  final int _start;
  final int _end;

  _CodeUnits(this._string, this._start, this._end);

  int get length => _end - _start;

  int operator [](int index) {
    RangeError.checkValidIndex(index, this, "index", _end - _start);
    return _string.codeUnitAt(_start + index);
  }

  void operator []=(int index, int value) {
    throw UnsupportedError("Cannot modify an unmodifiable list");
  }

  @override
  void set length(int newLength) {
    throw UnsupportedError("Cannot modify an unmodifiable list");
  }
}

String _explodeReplace(String string, int start, int end,
    String internalReplacement, String outerReplacement) {
  if (start == end) {
    return string.replaceRange(start, start, outerReplacement);
  }
  var buffer = StringBuffer(string.substring(0, start));
  var breaks = Breaks(string, start, end, stateSoTNoBreak);
  int index = 0;
  String replacement = outerReplacement;
  while ((index = breaks.nextBreak()) >= 0) {
    buffer..write(replacement)..write(string.substring(start, index));
    start = index;
    replacement = internalReplacement;
  }
  buffer..write(outerReplacement)..write(string.substring(end));
  return buffer.toString();
}

/// Finds [pattern] in the range from [start] to [end].
///
/// Both [start] and [end] are grapheme cluster boundaries in the
/// [source] string.
int _indexOf(String source, String pattern, int start, int end) {
  int patternLength = pattern.length;
  if (patternLength == 0) return start;
  // Any start position after realEnd won't fit the pattern before end.
  int realEnd = end - patternLength;
  if (realEnd < start) return -1;
  // Use indexOf if what we can overshoot is
  // less than twice as much as what we have left to search.
  int rest = source.length - realEnd;
  if (rest <= (realEnd - start) * 2) {
    int index = 0;
    while (start < realEnd && (index = source.indexOf(pattern, start)) >= 0) {
      if (index > realEnd) return -1;
      if (isGraphemeClusterBoundary(source, start, end, index) &&
          isGraphemeClusterBoundary(
              source, start, end, index + patternLength)) {
        return index;
      }
      start = index + 1;
    }
    return -1;
  }
  return _gcIndexOf(source, pattern, start, end);
}

int _gcIndexOf(String source, String pattern, int start, int end) {
  var breaks = Breaks(source, start, end, stateSoT);
  int index = 0;
  while ((index = breaks.nextBreak()) >= 0) {
    int endIndex = index + pattern.length;
    if (endIndex > end) break;
    if (source.startsWith(pattern, index) &&
        isGraphemeClusterBoundary(source, start, end, endIndex)) {
      return index;
    }
  }
  return -1;
}

/// Finds pattern in the range from [start] to [end].
/// Both [start] and [end] are grapheme cluster boundaries in the
/// [source] string.
int _lastIndexOf(String source, String pattern, int start, int end) {
  int patternLength = pattern.length;
  if (patternLength == 0) return end;
  // Start of pattern must be in range [start .. end - patternLength].
  int realEnd = end - patternLength;
  if (realEnd < start) return -1;
  // If the range from 0 to start is no more than double the range from
  // start to end, use lastIndexOf.
  if (realEnd * 2 > start) {
    int index = 0;
    while (realEnd >= start &&
        (index = source.lastIndexOf(pattern, realEnd)) >= 0) {
      if (index < start) return -1;
      if (isGraphemeClusterBoundary(source, start, end, index) &&
          isGraphemeClusterBoundary(
              source, start, end, index + patternLength)) {
        return index;
      }
      realEnd = index - 1;
    }
    return -1;
  }
  return _gcLastIndexOf(source, pattern, start, end);
}

int _gcLastIndexOf(String source, String pattern, int start, int end) {
  var breaks = BackBreaks(source, end, start, stateEoT);
  int index = 0;
  while ((index = breaks.nextBreak()) >= 0) {
    int startIndex = index - pattern.length;
    if (startIndex < start) break;
    if (source.startsWith(pattern, startIndex) &&
        isGraphemeClusterBoundary(source, start, end, startIndex)) {
      return startIndex;
    }
  }
  return -1;
}
