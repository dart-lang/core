// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: constant_identifier_names

import 'int32.dart';
import 'intx.dart';
import 'utilities.dart' as u;

/// An immutable 64-bit signed integer, in the range `[-2^63, 2^63 - 1]`.
/// Arithmetic operations may overflow in order to maintain this range.
class Int64 implements IntX {
  final int _i;

  /// The maximum positive value attainable by an [Int64], namely
  /// 9,223,372,036,854,775,807.
  static const Int64 MAX_VALUE = Int64(9223372036854775807);

  /// The minimum positive value attainable by an [Int64], namely
  /// -9,223,372,036,854,775,808.
  static const Int64 MIN_VALUE = Int64(-9223372036854775808);

  /// An [Int64] constant equal to 0.
  static const Int64 ZERO = Int64(0);

  /// An [Int64] constant equal to 1.
  static const Int64 ONE = Int64(1);

  /// An [Int64] constant equal to 2.
  static const Int64 TWO = Int64(2);

  const Int64([int value = 0]) : _i = value;

  /// Constructs an [Int64] from a pair of 32-bit integers having the value
  /// [:((high & 0xffffffff) << 32) | (low & 0xffffffff):].
  factory Int64.fromInts(int high, int low) =>
      Int64((high << 32) | (low & 0xFFFFFFFF));

  factory Int64.fromBytes(List<int> bytes) => Int64(((bytes[7] & 0xFF) << 56) |
      ((bytes[6] & 0xFF) << 48) |
      ((bytes[5] & 0xFF) << 40) |
      ((bytes[4] & 0xFF) << 32) |
      ((bytes[3] & 0xFF) << 24) |
      ((bytes[2] & 0xFF) << 16) |
      ((bytes[1] & 0xFF) << 8) |
      (bytes[0] & 0xFF));

  factory Int64.fromBytesBigEndian(List<int> bytes) =>
      Int64(((bytes[0] & 0xFF) << 56) |
          ((bytes[1] & 0xFF) << 48) |
          ((bytes[2] & 0xFF) << 40) |
          ((bytes[3] & 0xFF) << 32) |
          ((bytes[4] & 0xFF) << 24) |
          ((bytes[5] & 0xFF) << 16) |
          ((bytes[6] & 0xFF) << 8) |
          (bytes[7] & 0xFF));

  /// Parses [source] as a decimal numeral.
  ///
  /// Returns an [Int64] with the numerical value of [source]. If the numerical
  /// value of [source] does not fit in a signed 64 bit integer, the numerical
  /// value is truncated to the lowest 64 bits of the value's binary
  /// representation, interpreted as a 64-bit two's complement integer.
  ///
  /// The [source] string must contain a sequence of digits (`0`-`9`), possibly
  /// prefixed by a `-` sign.
  ///
  /// Throws a [FormatException] if the input is not a valid decimal integer
  /// numeral.
  static Int64 parseInt(String source) => _parseRadix(source, 10, true)!;

  /// Parses [source] as a decimal numeral.
  ///
  /// Returns an [Int64] with the numerical value of [source]. If the numerical
  /// value of [source] does not fit in a signed 64 bit integer, the numerical
  /// value is truncated to the lowest 64 bits of the value's binary
  /// representation, interpreted as a 64-bit two's complement integer.
  ///
  /// The [source] string must contain a sequence of digits (`0`-`9`), possibly
  /// prefixed by a `-` sign.
  ///
  /// Returns `null` if the input is not a valid decimal integer numeral.
  static Int64? tryParseInt(String source) => _parseRadix(source, 10, false);

  /// Parses [source] in a given [radix] between 2 and 36.
  ///
  /// Returns an [Int64] with the numerical value of [source]. If the numerical
  /// value of [source] does not fit in a signed 64 bit integer, the numerical
  /// value is truncated to the lowest 64 bits of the value's binary
  /// representation, interpreted as a 64-bit two's complement integer.
  ///
  /// The [source] string must contain a sequence of base-[radix] digits (using
  /// letters from `a` to `z` as digits with values 10 through 25 for radixes
  /// above 10), possibly prefixed by a `-` sign.
  ///
  /// Throws a [FormatException] if the input is not recognized as a valid
  /// integer numeral.
  static Int64 parseRadix(String source, int radix) =>
      _parseRadix(source, u.validateRadix(radix), true)!;

  /// Parses [source] in a given [radix] between 2 and 36.
  ///
  /// Returns an [Int64] with the numerical value of [source]. If the numerical
  /// value of [source] does not fit in a signed 64 bit integer, the numerical
  /// value is truncated to the lowest 64 bits of the value's binary
  /// representation, interpreted as a 64-bit two's complement integer.
  ///
  /// The [source] string must contain a sequence of base-[radix] digits (using
  /// letters from `a` to `z` as digits with values 10 through 25 for radixes
  /// above 10), possibly prefixed by a `-` sign.
  ///
  /// Returns `null` if the input is not recognized as a valid integer numeral.
  static Int64? tryParseRadix(String source, int radix) =>
      _parseRadix(source, u.validateRadix(radix), false);

  /// Parses [source] as a hexadecimal numeral.
  ///
  /// Returns an [Int64] with the numerical value of [source]. If the numerical
  /// value of [source] does not fit in a signed 64 bit integer, the numerical
  /// value is truncated to the lowest 64 bits of the value's binary
  /// representation, interpreted as a 64-bit two's complement integer.
  ///
  /// The [source] string must contain a sequence of hexadecimal digits
  /// (`0`-`9`, `a`-`f` or `A`-`F`), possibly prefixed by a `-` sign.
  ///
  /// Throws a [FormatException] if the input is not a valid hexadecimal
  /// integer numeral.
  static Int64 parseHex(String source) => _parseRadix(source, 16, true)!;

  /// Parses [source] as a hexadecimal numeral.
  ///
  /// Returns an [Int64] with the numerical value of [source]. If the numerical
  /// value of [source] does not fit in a signed 64 bit integer, the numerical
  /// value is truncated to the lowest 64 bits of the value's binary
  /// representation, interpreted as a 64-bit two's complement integer.
  ///
  /// The [source] string must contain a sequence of hexadecimal digits
  /// (`0`-`9`, `a`-`f` or `A`-`F`), possibly prefixed by a `-` sign.
  ///
  /// Returns `null` if the input is not a valid hexadecimal integer numeral.
  static Int64? tryParseHex(String source) => _parseRadix(source, 16, false);

  static Int64? _parseRadix(String s, int radix, bool throwOnError) {
    int charIdx = 0;
    bool negative = false;
    if (s.startsWith('-')) {
      negative = true;
      charIdx++;
    }

    if (charIdx >= s.length) {
      if (!throwOnError) return null;
      throw FormatException('No digits', s, charIdx);
    }

    int i = 0;
    for (; charIdx < s.length; charIdx++) {
      int c = s.codeUnitAt(charIdx);
      int digit = u.decodeDigit(c);
      if (digit < radix) {
        i = (i * radix) + digit;
      } else {
        if (!throwOnError) return null;
        throw FormatException('Not radix digit', s, charIdx);
      }
    }

    if (negative) {
      return Int64(-i);
    }

    return Int64(i);
  }

  static int _promote(Object value) {
    if (value is Int64) {
      return value._i;
    } else if (value is int) {
      return value;
    } else if (value is Int32) {
      return value.toInt();
    }
    throw ArgumentError.value(value, 'other', 'not an int, Int32 or Int64');
  }

  @override
  Int64 operator +(Object other) => Int64(_i + _promote(other));

  @override
  Int64 operator -(Object other) => Int64(_i - _promote(other));

  @override
  Int64 operator -() => Int64(-_i);

  @override
  Int64 operator *(Object other) => Int64(_i * _promote(other));

  @override
  Int64 operator %(Object other) => Int64(_i % _promote(other));

  @override
  Int64 operator ~/(Object other) => Int64(_i ~/ _promote(other));

  @override
  Int64 remainder(Object other) => Int64(_i.remainder(_promote(other)));

  @override
  Int64 operator &(Object other) => Int64(_i & _promote(other));

  @override
  Int64 operator |(Object other) => Int64(_i | _promote(other));

  @override
  Int64 operator ^(Object other) => Int64(_i ^ _promote(other));

  @override
  Int64 operator ~() => Int64(~_i);

  @override
  Int64 operator <<(int shiftAmount) => Int64(_i << shiftAmount);

  @override
  Int64 operator >>(int shiftAmount) => Int64(_i >> shiftAmount);

  @override
  Int64 shiftRightUnsigned(int shiftAmount) => Int64(_i >>> shiftAmount);

  @override
  int compareTo(Object other) => _i.compareTo(_promote(other));

  @override
  bool operator <(Object other) => _i < _promote(other);

  @override
  bool operator <=(Object other) => _i <= _promote(other);

  @override
  bool operator >(Object other) => _i > _promote(other);

  @override
  bool operator >=(Object other) => _i >= _promote(other);

  @override
  bool get isEven => _i.isEven;

  @override
  bool get isMaxValue => this == MAX_VALUE;

  @override
  bool get isMinValue => this == MIN_VALUE;

  @override
  bool get isNegative => _i < 0;

  @override
  bool get isOdd => _i.isOdd;

  @override
  bool get isZero => _i == 0;

  @override
  int get bitLength => _i.bitLength;

  /// Returns a hash code based on the numeric value.
  @override
  int get hashCode => _i.hashCode;

  /// Returns whether this [Int64] has the same numeric value as the given
  /// object. The argument may be an [int] or an [IntX].
  @override
  bool operator ==(Object other) => _i == _promote(other);

  @override
  Int64 abs() => Int64(_i.abs());

  @override
  Int64 clamp(Object lowerLimit, Object upperLimit) =>
      Int64(_i.clamp(_promote(lowerLimit), _promote(upperLimit)));

  @override
  int numberOfLeadingZeros() => _i < 0 ? 0 : (64 - _i.bitLength);

  @override
  int numberOfTrailingZeros() {
    if (_i == 0) return 64;
    var lsb = _i & (_i ^ (_i - 1));
    if (lsb < 0) return 63;
    return lsb.bitLength - 1;
  }

  @override
  Int64 toSigned(int width) {
    if (width < 1 || width > 64) {
      throw RangeError.range(width, 1, 64);
    }
    return Int64(_i.toSigned(width));
  }

  @override
  Int64 toUnsigned(int width) {
    if (width < 0 || width > 64) {
      throw RangeError.range(width, 0, 64);
    }
    return Int64(_i.toUnsigned(width));
  }

  @override
  List<int> toBytes() {
    final result = List<int>.filled(8, 0);
    result[0] = _i & 0xff;
    result[1] = (_i >> 8) & 0xff;
    result[2] = (_i >> 16) & 0xff;
    result[3] = (_i >> 24) & 0xff;
    result[4] = (_i >> 32) & 0xff;
    result[5] = (_i >> 40) & 0xff;
    result[6] = (_i >> 48) & 0xff;
    result[7] = (_i >> 56) & 0xff;
    return result;
  }

  @override
  double toDouble() => _i.toDouble();

  @override
  int toInt() => _i;

  @override
  Int32 toInt32() => Int32(_i);

  @override
  Int64 toInt64() => this;

  @override
  String toString() => _i.toString();

  @override
  String toHexString() => toRadixStringUnsigned(16).toUpperCase();

  @override
  String toRadixString(int radix) => _i.toRadixString(radix);

  String toRadixStringUnsigned(int radix) => _toRadixStringUnsigned(_i, radix);

  String toStringUnsigned() => _toRadixStringUnsigned(_i, 10);

  static String _toRadixStringUnsigned(int value, int radix) {
    if (radix < 2 || radix > 36) {
      throw ArgumentError('toStringRadixUnsigned radix must be >= 2 and <= 36'
          ' (found $radix)');
    }
    if (value == 0) {
      return '0';
    }
    // Split value into two 32-bit unsigned digits (v1, v0).
    int v1 = value >>> 32;
    int v0 = value.toUnsigned(32);
    // Long division by a single digit: (q1, q0) = (v1, v0) ~/ radix, remainder r0.
    int q1 = v1 ~/ radix;
    int r1 = v1.remainder(radix);
    v0 += r1 << 32;
    int q0 = v0 ~/ radix;
    int r0 = v0.remainder(radix); // lowest digit.
    int otherDigits = (q1 << 32) + q0;
    return '${otherDigits.toRadixString(radix)}${r0.toRadixString(radix)}';
  }
}
