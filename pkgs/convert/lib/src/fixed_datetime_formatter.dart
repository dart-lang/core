// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// A formatter and parser for [DateTime] in a fixed format [String] pattern.
///
/// For example, calling
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
/// `1996` would be a valid match. This limits it's use to format strings
/// containing delimiters, as the parser would not know how many digits to take
/// otherwise.
class FixedDateTimeFormatter {
  static final _validFormatCharacters = 'YMDEChms'.codeUnits;
  static final yearCode = 'Y'.codeUnitAt(0);
  static final monthCode = 'M'.codeUnitAt(0);
  static final dayCode = 'D'.codeUnitAt(0);
  static final decadeCode = 'E'.codeUnitAt(0);
  static final centuryCode = 'C'.codeUnitAt(0);
  static final hourCode = 'h'.codeUnitAt(0);
  static final minuteCode = 'm'.codeUnitAt(0);
  static final secondCode = 's'.codeUnitAt(0);

  final String pattern;
  final _parsed = _ParsedPattern();

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
    int? current;
    var start = 0;
    var characters = pattern.codeUnits;
    for (var i = 0; i < characters.length; i++) {
      var char = characters[i];
      if (current != char) {
        _parsed.saveBlock(current, start, i);
        if (_validFormatCharacters.contains(char)) {
          var hasSeenBefore = _parsed.chars.indexOf(char);
          if (hasSeenBefore > -1) {
            throw FormatException(
                "Pattern contains more than one '$char' block.\n"
                "Previous occurrence at index ${_parsed.starts[hasSeenBefore]}",
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
    _parsed.saveBlock(current, start, pattern.length);
  }

  /// Convert [DateTime] to a [String] exactly as specified by the [pattern].
  String encode(DateTime datetime) {
    var buffer = StringBuffer();
    for (var i = 0; i < _parsed.length; i++) {
      var start = _parsed.starts[i];
      var end = _parsed.ends[i];
      var length = end - start;

      var previousEnd = i > 0 ? _parsed.ends[i - 1] : 0;
      if (previousEnd < start) {
        buffer.write(pattern.substring(previousEnd, start));
      }
      var number =
          _extractNumFromDateTime(_parsed.chars[i], datetime).toString();
      if (number.length > length) {
        number = number.substring(number.length - length);
      } else if (number.length < length) {
        number = number.padLeft(length, '0');
      }
      buffer.write(number);
    }
    if (_parsed.length > 0) {
      var lastEnd = _parsed.ends.last;
      if (lastEnd < pattern.length) {
        buffer.write(pattern.substring(lastEnd, pattern.length));
      }
    }
    return buffer.toString();
  }

  int _extractNumFromDateTime(int? key, DateTime dt) {
    if (key == yearCode) {
      return dt.year;
    } else if (key == centuryCode) {
      return (dt.year / 100).floor();
    } else if (key == decadeCode) {
      return (dt.year / 10).floor();
    } else if (key == monthCode) {
      return dt.month;
    } else if (key == dayCode) {
      return dt.day;
    } else if (key == hourCode) {
      return dt.hour;
    } else if (key == minuteCode) {
      return dt.minute;
    } else if (key == secondCode) {
      return dt.second;
    }
    throw AssertionError("Unreachable, the key is checked in the constructor");
  }

  /// Parse a string [formattedDateTime] to a local [DateTime] as specified in the
  /// [pattern], substituting missing values with a default. Throws an exception
  /// on failure to parse.
  DateTime decode(String formattedDateTime, {bool isUtc = false}) {
    return _decode(formattedDateTime, isUtc, true);
  }

  /// Same as [decode], but will not throw on parsing erros, instead using
  /// the default value as if the format char was not present in the [pattern].
  DateTime tryDecode(String formattedDateTime, {bool isUtc = false}) {
    return _decode(formattedDateTime, isUtc, false);
  }

  DateTime _decode(
    String formattedDateTime,
    bool isUtc,
    bool throwOnError,
  ) {
    var characters = formattedDateTime.codeUnits;
    var year = 0;
    var century = 0;
    var decade = 0;
    var month = 1;
    var day = 1;
    var hour = 0;
    var minute = 0;
    var second = 0;
    for (int i = 0; i < _parsed.chars.length; i++) {
      var char = _parsed.chars[i];
      var num = _extractNumFromString(characters, i, throwOnError);
      if (num != null) {
        if (char == yearCode) {
          year = num;
        } else if (char == centuryCode) {
          century = num;
        } else if (char == decadeCode) {
          decade = num;
        } else if (char == monthCode) {
          month = num;
        } else if (char == dayCode) {
          day = num;
        } else if (char == hourCode) {
          hour = num;
        } else if (char == minuteCode) {
          minute = num;
        } else if (char == secondCode) {
          second = num;
        }
      }
    }
    var totalYear = year + 100 * century + 10 * decade;
    if (isUtc) {
      return DateTime.utc(totalYear, month, day, hour, minute, second, 0, 0);
    } else {
      return DateTime(totalYear, month, day, hour, minute, second, 0, 0);
    }
  }

  int? _extractNumFromString(
      List<int> characters, int index, bool throwOnError) {
    var parsed =
        tryParse(characters, _parsed.starts[index], _parsed.ends[index]);
    if (parsed == null && throwOnError) {
      throw FormatException(
          '${String.fromCharCodes(characters)} should only contain digits');
    }
    return parsed;
  }

  static final zeroCode = '0'.codeUnitAt(0);
  int? tryParse(List<int> characters, int start, int end) {
    int result = 0;
    for (var i = start; i < end; i++) {
      var character = characters[i];
      if (character >= zeroCode && character < zeroCode + 10) {
        result = result * 10 + (character - zeroCode);
      } else {
        return null;
      }
    }
    return result;
  }
}

class _ParsedPattern {
  final starts = <int>[];
  final ends = <int>[];
  final chars = <int>[];

  _ParsedPattern();

  int get length => chars.length;

  void saveBlock(int? char, int start, int end) {
    if (char != null) {
      chars.add(char);
      starts.add(start);
      ends.add(end);
    }
  }
}
