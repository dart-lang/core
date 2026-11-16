// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// #region native
import 'package:platform/platform.dart';

void main() {
  final host = NativePlatform.current;
  if (host == null) {
    print('Error: not running on a native platform!');
  } else {
    print('Running on ${host.operatingSystem} ${host.operatingSystemVersion}');
  }
}
// #endregion native
