// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// #region cross-platform
import 'package:platform/platform.dart';

void main() {
  switch (Platform.current) {
    case Platform(:var nativePlatform?):
      // `nativePlatform` has `dart:io`'s `Platform` properties.
      print(
        'Running on ${nativePlatform.operatingSystem} v.'
        '${nativePlatform.operatingSystemVersion}',
      );
    case Platform(:var browserPlatform?):
      // `browserPlatform` has version information from `Navigator.userAgent`.
      print('Running on ${browserPlatform.userAgent}');
  }
}
// #endregion cross-platform
