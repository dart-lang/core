// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// A class for parsing dates for a fixed format string. For example, calling
/// `DateParser('YYYYMMDDhhmmss').parseToLocal('19960425050322')` has the same
/// result as calling `DateTime(1996, 4, 25, 5, 3, 22)`.
///
/// The allowed characters are
/// * Y	a digit used in the time scale component “calendar year”
/// * M	a digit used in the time scale component “calendar month”
/// * D	a digit used in the time scale component “calendar day”
/// * E	a digit used in the time scale component “decade”
/// * C	a digit used in the time scale component “century”
/// * h	a digit used in the time scale component “clock hour”
/// * m	a digit used in the time scale component “clock minute”
/// * s	a digit used in the time scale component “clock second”
/// as specified in the ISO 8601 standard.
///
/// Non-allowed characters in the format _pattern are ignored, therefore
/// `YYYY kiwi MM` is the same format string as `YYYY------MM`.
///
/// Note: this class differs from [DateFormat] in that here, the characters are
/// treated literally, i.e. the format string `YYY` matching `996` would result in
/// the same as calling `DateTime(996)`. [DateFormat] on the other hand uses the
/// specification in https://www.unicode.org/reports/tr35/tr35-dates.html#Date_Field_Symbol_Table,
/// the format string (or "skeleton") `YYY` specifies only the padding, so
/// `1996` would be a valid match. This limits is use to format strings
/// containing delimiters, as the parser would not know how many digits to take
/// otherwise.
///
/// Also, this parser does not know about locales and parses to the current
/// locale only.
class FixedDateTimeParser {
  static const _validChars = ['Y', 'M', 'D', 'E', 'C', 'h', 'm', 's'];

  final String _pattern;
  final _occurences = <String, _Range>{};

  FixedDateTimeParser(this._pattern) {
    String current = '';
    for (var i = 0; i < _pattern.length; i++) {
      var char = _pattern[i];
      if (!_validChars.contains(char)) {
        current = '';
        continue;
      }
      var newChar = current != char;
      if (newChar) {
        var hasNotSeenBefore = !_occurences.containsKey(char);
        if (hasNotSeenBefore) {
          _occurences[char] = _Range(i, i);
        } else {
          throw Exception(
              'The _pattern string "$_pattern" contains multiple instances of the formatting char block $char, both at position ${_occurences[char]!.from} and $i');
        }
      }
      current = char;
      _occurences.update(current, (value) => _Range(value.from, value.to + 1));
    }
  }

  /// Convert a datetime to a string exactly as specified by the [_pattern].
  String format(DateTime dt) {
    var startingPoints =
        _occurences.map((key, value) => MapEntry(value.from, key));
    var sb = StringBuffer();
    for (var i = 0; i < _pattern.length; i++) {
      if (startingPoints.containsKey(i)) {
        var key = startingPoints[i];
        var length = _occurences[key]!.length;
        var number = _extractNumFromDateTime(key, dt);
        var numAsString = number.toString();
        if (numAsString.length > length) {
          throw Exception(
              "The datetime $dt cannot be parsed as $number is longer than the _pattern $key allows");
        } else {
          sb.write(numAsString.padLeft(length, '0'));
        }
        i += length - 1;
      } else {
        sb.write(_pattern[i]);
      }
    }
    return sb.toString();
  }

  int _extractNumFromDateTime(String? key, DateTime dt) {
    switch (key) {
      case 'Y':
        return dt.year;
      case 'C':
        return (dt.year / 100).floor();
      case 'E':
        return (dt.year / 10).floor();
      case 'M':
        return dt.month;
      case 'D':
        return dt.day;
      case 'h':
        return dt.hour;
      case 'm':
        return dt.minute;
      case 's':
        return dt.second;
    }
    throw ArgumentError.value(key);
  }

  /// Parse a string [dateTimeStr] to a local [DateTime] as specified in the
  /// [_pattern]. Throws an exception on failure.
  DateTime parseToLocal(String dateTimeStr) {
    int? year = _extractDateTimeFromStr(dateTimeStr, 'Y') ?? 1;
    int? century = _extractDateTimeFromStr(dateTimeStr, 'C') ?? 0;
    int? decade = _extractDateTimeFromStr(dateTimeStr, 'E') ?? 0;
    var totalYear = year + 100 * century + 10 * decade;
    int? month = _extractDateTimeFromStr(dateTimeStr, 'M') ?? 1;
    int? day = _extractDateTimeFromStr(dateTimeStr, 'D') ?? 1;
    int? hour = _extractDateTimeFromStr(dateTimeStr, 'h') ?? 0;
    int? minute = _extractDateTimeFromStr(dateTimeStr, 'm') ?? 0;
    int? second = _extractDateTimeFromStr(dateTimeStr, 's') ?? 0;
    return DateTime(totalYear, month, day, hour, minute, second, 0, 0);
  }

  /// Same as [parseToLocal], but returns null if the string could not be
  /// parsed.
  DateTime? tryParseToLocal(String dateTimeStr) {
    try {
      return parseToLocal(dateTimeStr);
    } catch (_) {
      return null;
    }
  }

  int? _extractDateTimeFromStr(String s, String id) {
    var pos = _occurences[id];
    if (pos != null) {
      return int.parse(s.substring(pos.from, pos.to));
    } else {
      return null;
    }
  }
}

class _Range {
  final int from;
  final int to;

  _Range(this.from, this.to);

  int get length => to - from;
}
