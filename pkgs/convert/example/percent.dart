// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// #region percent
import 'dart:convert';

import 'package:convert/convert.dart';

void main() {
  final bytes = utf8.encode('hello world!');

  // Encode bytes to a percent-encoded string.
  final encoded = percent.encode(bytes);
  print(encoded); // hello%20world%21

  // Decode a percent-encoded string back to bytes.
  final decoded = percent.decode(encoded);
  print(utf8.decode(decoded)); // hello world!
}
// #endregion percent
