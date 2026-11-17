// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// #region import
import 'package:typed_data/typed_data.dart';
// #endregion import

void main() {
  final buffer = Uint8Buffer()..add(42);
  print(buffer);
}
