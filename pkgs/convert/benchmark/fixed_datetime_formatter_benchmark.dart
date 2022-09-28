// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:convert/convert.dart';

/// This class tests the implementation speed of
/// _DateFormatPatternField::nextInteger, which is assumed to be called often and
/// thus being performance-critical.
class NewMethod extends BenchmarkBase {
  late String result;
  late FixedDateTimeFormatter fixedDateTimeFormatter;
  NewMethod() : super('Parse a million strings to datetime');

  @override
  void setup() {
    fixedDateTimeFormatter = FixedDateTimeFormatter("YYYYMMDDhhmmss");
  }

  @override
  void run() {
    for (var i = 0; i < 1000000; i++) {
      var decode = fixedDateTimeFormatter.decode('19960425050322');
    }
  }
}

void main() {
  NewMethod().report();
}
