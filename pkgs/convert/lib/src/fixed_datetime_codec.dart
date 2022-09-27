// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:collection';

/// A class for parsing and formatting dates for a fixed format string. For
/// example, calling
/// `FixedDateTimeCodec('YYYYMMDDhhmmss').decodeToLocal('19960425050322')` has
/// the same result as calling `DateTime(1996, 4, 25, 5, 3, 22)`.
///
/// The allowed characters are
/// * `Y`	a digit used in the time scale component “calendar year”
/// * `M`	a digit used in the time scale component “calendar month”
/// * `D`	a digit used in the time scale component “calendar day”
/// * `E`	a digit used in the time scale component “decade”
/// * `C`	a digit used in the time scale component “century”
/// * `h`	a digit used in the time scale component “clock hour”
/// * `m`	a digit used in the time scale component “clock minute”
/// * `s`	a digit used in the time scale component “clock second”
/// as specified in the ISO 8601 standard.
///
/// Non-allowed characters in the format [pattern] are ignored when decoding a
/// string, in this case `YYYY kiwi MM` is the same format string as
/// `YYYY------MM`. When encoding a datetime, the non-format characters are in
/// the output verbatim.
///
/// Note: this class differs from [DateFormat] in that here, the characters are
/// treated literally, i.e. the format string `YYY` matching `996` would result in
/// the same as calling `DateTime(996)`. [DateFormat] on the other hand uses the
/// specification in https://www.unicode.org/reports/tr35/tr35-dates.html#Date_Field_Symbol_Table,
/// the format string (or "skeleton") `YYY` specifies only the padding, so
/// `1996` would be a valid match. This limits is use to format strings
/// containing delimiters, as the parser would not know how many digits to take
/// otherwise.
class FixedDateTimeFormatter {
  static const _validFormatCharacters = 'YMDEChms';

  final String pattern;
  // ignore: prefer_collection_literals
  final _occurences = LinkedHashMap<String, _Range>();

  /// Creates a new [FixedDateTimeFormatter] with the provided [pattern].
  ///
  /// The [pattern] interprets the characters mentioned in
  /// [FixedDateTimeFormatter] to represent fields of a `DateTime` value. Other
  /// characters are not special.
  ///
  /// There must at most be one sequence of each special character to ensure a
  /// single source of truth when constructing the [DateTime], so a pattern of
  /// `"CCCC-MM-DD, CC"` is invalid, because it has two separate `C` sequences.
  FixedDateTimeFormatter(this.pattern) {
    String? current;
    var start = 0;
    for (var i = 0; i < pattern.length; i++) {
      var char = pattern[i];
      if (current != char) {
        _saveFormatBlock(current, start, i);
        if (_validFormatCharacters.contains(char)) {
          var hasSeenBefore = _occurences.containsKey(char);
          if (hasSeenBefore) {
            throw FormatException(
                "Pattern contains more than one '$char' block.\n"
                "Previous occurrence at position ${_occurences[char]!.from}",
                pattern,
                i);
          } else {
            start = i;
            current = char;
          }
        } else {
          current = null;
        }
      }
    }
    _saveFormatBlock(current, start, pattern.length);
  }

  void _saveFormatBlock(String? current, int start, int i) {
    if (current != null) _occurences[current] = _Range(start, i);
  }

  /// Convert [DateTime] to a [String] exactly as specified by the [pattern].
  String encode(DateTime datetime) {
    var buffer = StringBuffer();
    var previousEnd = 0;
    _occurences.forEach((key, value) {
      if (previousEnd < value.from) {
        buffer.write(pattern.substring(previousEnd, value.from));
      }
      var number = _extractNumFromDateTime(key, datetime).toString();
      var length = value.length;
      if (number.length > length) {
        number = number.substring(number.length - length);
      } else if (number.length < length) {
        number = number.padLeft(length, '0');
      }
      buffer.write(number);
      previousEnd = value.to;
    });
    if (previousEnd < pattern.length) {
      buffer.write(pattern.substring(previousEnd, pattern.length));
    }
    return buffer.toString();
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
    throw AssertionError("Unreachable, the key is checked in the constructor");
  }

  /// Parse a string [formattedDateTime] to a local [DateTime] as specified in the
  /// [pattern], substituting missing values with a default. Throws an exception
  /// on failure to parse.
  DateTime decode(String formattedDateTime, [bool isUtc = false]) {
    return _decode(formattedDateTime, isUtc, int.parse);
  }

  /// Same as [decode], but will not throw on parsing erros, instead using
  /// the default value as if the format char was not present in the [pattern].
  DateTime tryDecode(String formattedDateTime, [bool isUtc = false]) {
    return _decode(formattedDateTime, isUtc, int.tryParse);
  }

  DateTime _decode(
    String formattedDateTime,
    bool isUtc,
    int? Function(String) parser,
  ) {
    var year = _extractNumFromString(formattedDateTime, 'Y', parser) ?? 0;
    var century = _extractNumFromString(formattedDateTime, 'C', parser) ?? 0;
    var decade = _extractNumFromString(formattedDateTime, 'E', parser) ?? 0;
    var totalYear = year + 100 * century + 10 * decade;
    var month = _extractNumFromString(formattedDateTime, 'M', parser) ?? 1;
    var day = _extractNumFromString(formattedDateTime, 'D', parser) ?? 1;
    var hour = _extractNumFromString(formattedDateTime, 'h', parser) ?? 0;
    var minute = _extractNumFromString(formattedDateTime, 'm', parser) ?? 0;
    var second = _extractNumFromString(formattedDateTime, 's', parser) ?? 0;
    if (isUtc) {
      return DateTime.utc(totalYear, month, day, hour, minute, second, 0, 0);
    } else {
      return DateTime(totalYear, month, day, hour, minute, second, 0, 0);
    }
  }

  int? _extractNumFromString(
    String s,
    String id,
    int? Function(String) parser,
  ) {
    var pos = _occurences[id];
    if (pos != null) {
      return parser.call(s.substring(pos.from, pos.to));
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
