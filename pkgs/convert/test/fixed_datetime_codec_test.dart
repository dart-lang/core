// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:convert/src/fixed_datetime_codec.dart';
import 'package:test/test.dart';

void main() {
  test('Parse only year', () {
    var time = FixedDateTimeCodec('YYYY').decodeToLocal('1996');
    expect(time, DateTime(1996));
  });
  test('Escaped chars are ignored', () {
    var time = FixedDateTimeCodec('YYYY kiwi MM').decodeToLocal('1996 rnad 01');
    expect(time, DateTime(1996, 1));
  });
  test('Parse two years throws', () {
    expect(() => FixedDateTimeCodec('YYYY YYYY'), throwsException);
  });
  test('Parse year and century', () {
    var time = FixedDateTimeCodec('CCYY').decodeToLocal('1996');
    expect(time, DateTime(1996));
  });
  test('Parse year, decade and century', () {
    var time = FixedDateTimeCodec('CCEY').decodeToLocal('1996');
    expect(time, DateTime(1996));
  });
  test('Parse year, century, month', () {
    var time = FixedDateTimeCodec('CCYY MM').decodeToLocal('1996 04');
    expect(time, DateTime(1996, 4));
  });
  test('Parse year, century, month, day', () {
    var time = FixedDateTimeCodec('CCYY MM-DD').decodeToLocal('1996 04-25');
    expect(time, DateTime(1996, 4, 25));
  });
  test('Parse year, century, month, day, hour, minute, second', () {
    var time = FixedDateTimeCodec('CCYY MM-DD hh:mm:ss')
        .decodeToLocal('1996 04-25 05:03:22');
    expect(time, DateTime(1996, 4, 25, 5, 3, 22));
  });
  test('Parse YYYYMMDDhhmmss', () {
    var time =
        FixedDateTimeCodec('YYYYMMDDhhmmss').decodeToLocal('19960425050322');
    expect(time, DateTime(1996, 4, 25, 5, 3, 22));
  });
  test('Format simple', () {
    var time = DateTime(1996, 1);
    expect('1996 kiwi 01', FixedDateTimeCodec('YYYY kiwi MM').encode(time));
  });
  test('Format YYYYMMDDhhmmss', () {
    var str = FixedDateTimeCodec('YYYYMMDDhhmmss')
        .encode(DateTime(1996, 4, 25, 5, 3, 22));
    expect('19960425050322', str);
  });
}
