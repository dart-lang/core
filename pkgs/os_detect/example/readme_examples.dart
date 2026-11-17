// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// #region import
import 'package:os_detect/os_detect.dart' as os_detect;
// #endregion import
import 'package:os_detect/override.dart';

void main() {
  print('${os_detect.operatingSystem} (${OperatingSystem.current.id})');
}
