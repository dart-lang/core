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
/// * `Y`	for “calendar year”
/// * `M`	for “calendar month”
/// * `D`	for “calendar day”
/// * `E`	for “decade”
/// * `C`	for “century”
/// * `h`	for “clock hour”
/// * `m`	for “clock minute”
/// * `s`	for “clock second”
/// * `S`	for “fractional clock second”
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
  static const _powersOfTen = [0, 1, 10, 100, 1000, 10000, 100000];
  static const _validFormatCharacters = [
    _yearCode,
    _monthCode,
    _dayCode,
    _decadeCode,
    _centuryCode,
    _hourCode,
    _minuteCode,
    _secondCode,
    _fractionSecondCode,
  ];
  static const _yearCode = 0x59; /*Y*/
  static const _monthCode = 0x4D; /*M*/
  static const _dayCode = 0x44; /*D*/
  static const _decadeCode = 0x45; /*E*/
  static const _centuryCode = 0x43; /*C*/
  static const _hourCode = 0x68; /*H*/
  static const _minuteCode = 0x6D; /*m*/
  static const _secondCode = 0x73; /*s*/
  static const _fractionSecondCode = 0x53; /*S*/

  ///Store publicly in case the user wants to retrieve it
  final String pattern;

  ///Whether to use UTC or the local time zone
  final bool isUtc;
  final _blocks = _ParsedFormatBlocks();

  /// Creates a new [FixedDateTimeFormatter] with the provided [pattern].
  ///
  /// The [pattern] interprets the characters mentioned in
  /// [FixedDateTimeFormatter] to represent fields of a `DateTime` value. Other
  /// characters are not special. If [isUtc] is set to false, the DateTime is
  /// constructed with respect to the local timezone.
  ///
  /// There must at most be one sequence of each special character to ensure a
  /// single source of truth when constructing the [DateTime], so a pattern of
  /// `"CCCC-MM-DD, CC"` is invalid, because it has two separate `C` sequences.
  FixedDateTimeFormatter(this.pattern, {this.isUtc = true}) {
    int? current;
    var start = 0;
    var characters = pattern.codeUnits;
    for (var i = 0; i < characters.length; i++) {
      var char = characters[i];
      if (current != char) {
        _blocks.saveBlock(current, start, i);
        if (_validFormatCharacters.contains(char)) {
          var hasSeenBefore = _blocks.formatCharacters.indexOf(char);
          if (hasSeenBefore > -1) {
            throw FormatException(
                "Pattern contains more than one '$char' block.\n"
                "Previous occurrence at index ${_blocks.starts[hasSeenBefore]}",
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
    _blocks.saveBlock(current, start, pattern.length);
  }

  /// Convert [DateTime] to a [String] exactly as specified by the [pattern].
  String encode(DateTime datetime) {
    var buffer = StringBuffer();
    for (var i = 0; i < _blocks.length; i++) {
      var start = _blocks.starts[i];
      var end = _blocks.ends[i];
      var length = end - start;

      var previousEnd = i > 0 ? _blocks.ends[i - 1] : 0;
      if (previousEnd < start) {
        buffer.write(pattern.substring(previousEnd, start));
      }
      var formatCharacter = _blocks.formatCharacters[i];
      var number = _extractNumFromDateTime(
        formatCharacter,
        datetime,
      ).toString();
      if (number.length > length) {
        if (formatCharacter == _fractionSecondCode) {
          //Special case, as we want fractional seconds to be the leading digits
          number = number.substring(length);
        } else {
          number = number.substring(number.length - length);
        }
      } else if (number.length < length) {
        number = number.padLeft(length, '0');
      }
      buffer.write(number);
    }
    if (_blocks.length > 0) {
      var lastEnd = _blocks.ends.last;
      if (lastEnd < pattern.length) {
        buffer.write(pattern.substring(lastEnd, pattern.length));
      }
    }
    return buffer.toString();
  }

  int _extractNumFromDateTime(int? formatChar, DateTime dateTime) {
    switch (formatChar) {
      case _yearCode:
        return dateTime.year;
      case _centuryCode:
        return (dateTime.year / 100).floor();
      case _decadeCode:
        return (dateTime.year / 10).floor();
      case _monthCode:
        return dateTime.month;
      case _dayCode:
        return dateTime.day;
      case _hourCode:
        return dateTime.hour;
      case _minuteCode:
        return dateTime.minute;
      case _secondCode:
        return dateTime.second;
      case _fractionSecondCode:
        return dateTime.microsecond;
    }
    throw AssertionError("Unreachable, the key is checked in the constructor");
  }

  /// Parse a string [formattedDateTime] to a local [DateTime] as specified in the
  /// [pattern], substituting missing values with a default. Throws an exception
  /// on failure to parse.
  DateTime decode(String formattedDateTime) {
    return _decode(formattedDateTime, isUtc, true);
  }

  /// Same as [decode], but will not throw on parsing erros, instead using
  /// the default value as if the format char was not present in the [pattern].
  DateTime tryDecode(String formattedDateTime) {
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
    var microsecond = 0;
    for (int i = 0; i < _blocks.length; i++) {
      var char = _blocks.formatCharacters[i];
      var number = _extractNumFromString(characters, i, throwOnError);
      if (number != null) {
        if (char == _fractionSecondCode) {
          //Special case, as we want fractional seconds to be the leading digits
          var numberLength = _blocks.ends[i] - _blocks.starts[i];
          number *= _powersOfTen[6 - numberLength + 1];
        }
        switch (char) {
          case _yearCode:
            year = number;
            break;
          case _centuryCode:
            century = number;
            break;
          case _decadeCode:
            decade = number;
            break;
          case _monthCode:
            month = number;
            break;
          case _dayCode:
            day = number;
            break;
          case _hourCode:
            hour = number;
            break;
          case _minuteCode:
            minute = number;
            break;
          case _secondCode:
            second = number;
            break;
          case _fractionSecondCode:
            microsecond = number;
            break;
        }
      }
    }
    var totalYear = year + 100 * century + 10 * decade;
    if (isUtc) {
      return DateTime.utc(
        totalYear,
        month,
        day,
        hour,
        minute,
        second,
        0,
        microsecond,
      );
    } else {
      return DateTime(
        totalYear,
        month,
        day,
        hour,
        minute,
        second,
        0,
        microsecond,
      );
    }
  }

  int? _extractNumFromString(
    List<int> characters,
    int index,
    bool throwOnError,
  ) {
    var parsed = tryParse(
      characters,
      _blocks.starts[index],
      _blocks.ends[index],
    );
    if (parsed == null && throwOnError) {
      throw FormatException(
          '${String.fromCharCodes(characters)} should only contain digits');
    }
    return parsed;
  }

  int? tryParse(List<int> characters, int start, int end) {
    int result = 0;
    for (var i = start; i < end; i++) {
      var digit = characters[i] ^ 0x30;
      if (digit <= 9) {
        result = result * 10 + digit;
      } else {
        return null;
      }
    }
    return result;
  }
}

class _ParsedFormatBlocks {
  final formatCharacters = <int>[];
  final starts = <int>[];
  final ends = <int>[];

  _ParsedFormatBlocks();

  int get length => formatCharacters.length;

  void saveBlock(int? char, int start, int end) {
    if (char != null) {
      formatCharacters.add(char);
      starts.add(start);
      ends.add(end);
    }
  }
}
