// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:convert/convert.dart';

void main() {
  final bytes = [0, 1, 2, 3, 255];

  // Encode bytes to a hex string.
  final encoded = hex.encode(bytes);
  print(encoded); // 00010203ff

  // Decode a hex string back to bytes.
  final decoded = hex.decode(encoded);
  print(decoded); // [0, 1, 2, 3, 255]
}
