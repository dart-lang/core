// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:convert/convert.dart';

void main() {
  // Create a formatter with a specific pattern.
  // The 'YYYY', 'MM', 'DD', 'hh', 'mm', 'ss' correspond to
  // the year, month, day, hour, minute, and second.
  final formatter = FixedDateTimeFormatter('YYYYMMDDhhmmss');

  // Decode a string into a DateTime (returns UTC by default).
  final dateTime = formatter.decode('19960425050322');
  print(dateTime); // 1996-04-25 05:03:22.000Z

  // Encode a DateTime into a string.
  final encoded = formatter.encode(DateTime.utc(1996, 4, 25, 5, 3, 22));
  print(encoded); // '19960425050322'
}
