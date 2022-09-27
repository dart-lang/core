import 'package:convert/src/fixed_datetime_parser.dart';
import 'package:test/test.dart';

void main() {
  test('Parse only year', () {
    var time = FixedDateTimeParser('YYYY').parseToLocal('1996');
    expect(time, DateTime(1996));
  });
  test('Escaped chars are ignored', () {
    var time = FixedDateTimeParser('YYYY kiwi MM').parseToLocal('1996 rnad 01');
    expect(time, DateTime(1996, 1));
  });
  test('Parse two years throws', () {
    expect(() => FixedDateTimeParser('YYYY YYYY'), throwsException);
  });
  test('Parse year and century', () {
    var time = FixedDateTimeParser('CCYY').parseToLocal('1996');
    expect(time, DateTime(1996));
  });
  test('Parse year, decade and century', () {
    var time = FixedDateTimeParser('CCEY').parseToLocal('1996');
    expect(time, DateTime(1996));
  });
  test('Parse year, century, month', () {
    var time = FixedDateTimeParser('CCYY MM').parseToLocal('1996 04');
    expect(time, DateTime(1996, 4));
  });
  test('Parse year, century, month, day', () {
    var time = FixedDateTimeParser('CCYY MM-DD').parseToLocal('1996 04-25');
    expect(time, DateTime(1996, 4, 25));
  });
  test('Parse year, century, month, day, hour, minute, second', () {
    var time = FixedDateTimeParser('CCYY MM-DD hh:mm:ss')
        .parseToLocal('1996 04-25 05:03:22');
    expect(time, DateTime(1996, 4, 25, 5, 3, 22));
  });
  test('Parse YYYYMMDDhhmmss', () {
    var time =
        FixedDateTimeParser('YYYYMMDDhhmmss').parseToLocal('19960425050322');
    expect(time, DateTime(1996, 4, 25, 5, 3, 22));
  });
  test('Format simple', () {
    var time = DateTime(1996, 1);
    expect('1996 kiwi 01', FixedDateTimeParser('YYYY kiwi MM').format(time));
  });
  test('Format YYYYMMDDhhmmss', () {
    var str = FixedDateTimeParser('YYYYMMDDhhmmss')
        .format(DateTime(1996, 4, 25, 5, 3, 22));
    expect('19960425050322', str);
  });
}
