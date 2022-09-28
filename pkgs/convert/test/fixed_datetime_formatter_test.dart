// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:convert/src/fixed_datetime_formatter.dart';
import 'package:test/test.dart';

void main() {
  //decode
  test('Parse only year', () {
    var time = FixedDateTimeFormatter('YYYY').decode('1996');
    expect(time, DateTime(1996));
  });
  test('Escaped chars are ignored', () {
    var time = FixedDateTimeFormatter('YYYY kiwi MM').decode('1996 rnad 01');
    expect(time, DateTime(1996, 1));
  });
  test('Parse two years throws', () {
    expect(() => FixedDateTimeFormatter('YYYY YYYY'), throwsException);
  });
  test('Parse year and century', () {
    var time = FixedDateTimeFormatter('CCYY').decode('1996');
    expect(time, DateTime(1996));
  });
  test('Parse year, decade and century', () {
    var time = FixedDateTimeFormatter('CCEY').decode('1996');
    expect(time, DateTime(1996));
  });
  test('Parse year, century, month', () {
    var time = FixedDateTimeFormatter('CCYY MM').decode('1996 04');
    expect(time, DateTime(1996, 4));
  });
  test('Parse year, century, month, day', () {
    var time = FixedDateTimeFormatter('CCYY MM-DD').decode('1996 04-25');
    expect(time, DateTime(1996, 4, 25));
  });
  test('Parse year, century, month, day, hour, minute, second', () {
    var time = FixedDateTimeFormatter('CCYY MM-DD hh:mm:ss')
        .decode('1996 04-25 05:03:22');
    expect(time, DateTime(1996, 4, 25, 5, 3, 22));
  });
  test('Parse YYYYMMDDhhmmss', () {
    var time =
        FixedDateTimeFormatter('YYYYMMDDhhmmss').decode('19960425050322');
    expect(time, DateTime(1996, 4, 25, 5, 3, 22));
  });
  test('Parse hex year throws', () {
    expect(
      () => FixedDateTimeFormatter('YYYY').decode('0xAB'),
      throwsFormatException,
    );
  });
  //tryDecode
  test('Try parse year', () {
    var time = FixedDateTimeFormatter('YYYY').tryDecode('1996');
    expect(time, DateTime(1996));
  });
  test('Try parse hex year return default', () {
    var time = FixedDateTimeFormatter('YYYY').tryDecode('0xAB');
    expect(time, DateTime(0));
  });
  test('Try parse invalid returns default', () {
    var time = FixedDateTimeFormatter('YYYY').tryDecode('1x96');
    expect(time, DateTime(0));
  });
  //encode
  test('Format simple', () {
    var time = DateTime(1996, 1);
    expect('1996 kiwi 01', FixedDateTimeFormatter('YYYY kiwi MM').encode(time));
  });
  test('Format YYYYMMDDhhmmss', () {
    var str = FixedDateTimeFormatter('YYYYMMDDhhmmss')
        .encode(DateTime(1996, 4, 25, 5, 3, 22));
    expect('19960425050322', str);
  });
  test('Format CCEY-MM', () {
    var str = FixedDateTimeFormatter('CCEY-MM').encode(DateTime(1996, 4));
    expect('1996-04', str);
  });
  test('Format XCCEY-MMX', () {
    var str = FixedDateTimeFormatter('XCCEY-MMX').encode(DateTime(1996, 4));
    expect('X1996-04X', str);
  });
}
