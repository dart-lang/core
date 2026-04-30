// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Unknown platform. Has neither a native platform or a browser platform.
/// @docImport '../platform_apis.dart';
// ignore: unnecessary_library_name - Used by DartDoc
library platform_impl;

import '../platform_apis.dart' as apis;

const platformInstance = Platform._();

/// Non-web, non-native Platform implementation.
final class Platform extends apis.PlatformBase {
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  @override
  apis.NativePlatform? get nativePlatform => null;

  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  @override
  apis.BrowserPlatform? get browserPlatform => null;

  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  @override
  bool get isNative => false;

  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  @override
  bool get isBrowser => false;

  const Platform._();
}
