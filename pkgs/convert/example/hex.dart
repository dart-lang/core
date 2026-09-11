// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:convert/convert.dart';

void main() {
  final bytes = <int>[0, 1, 2, 3, 255];

  // Encode byte array to hex string.
  final encoded = hex.encode(bytes);
  print(encoded); // '00010203ff'

  // Decode hex string back to byte array.
  final decoded = hex.decode(encoded);
  print(decoded); // [0, 1, 2, 3, 255]
}
