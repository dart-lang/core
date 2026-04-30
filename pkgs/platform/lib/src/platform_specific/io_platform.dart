// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Interface for a native platform with access to `dart:io`.
// ignore: unnecessary_library_name - Used by DartDoc
library platform_impl;

import '../platform_apis.dart' as apis;
import 'io_native_platform.dart';

const Platform platformInstance = Platform._();

/// Native (`dart:io`-based) implementation of [apis.Platform] and
/// [apis.NativePlatform].
final class Platform extends apis.PlatformBase {
  /// The current native platform, if running on a native platform.
  @pragma('vm:prefer-inline')
  @override
  apis.NativePlatform? get nativePlatform => nativePlatformInstance;

  /// The current browser platform, if running on a browser platform.
  @pragma('vm:prefer-inline')
  @override
  apis.BrowserPlatform? get browserPlatform => null;

  /// Whether currently running on a native platform.
  @pragma('vm:prefer-inline')
  @override
  bool get isNative => true;

  /// Whether currently running in a browser.
  @pragma('vm:prefer-inline')
  @override
  bool get isBrowser => false;

  const Platform._();
}
