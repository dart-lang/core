// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Platform specific implementations for `LocalPlatform`
/// when `dart:html` is available , but `dart:io` is not.
/// (That is, when compiling for the web).
// ignore: unnecessary_library_name - Used by DartDoc
library platform_impl;

import '../platform_apis.dart' as apis;
import 'web_browser_platform.dart';

const Platform platformInstance = Platform._();

/// Web/JS based implementation of [apis.Platform].
///
/// Uses [BrowserPlatform] to implement [apis.BrowserPlatform].
final class Platform extends apis.PlatformBase {
  /// The current native platform, if running on a native platform.
  @override
  @pragma('dart2js:prefer-inline')
  apis.NativePlatform? get nativePlatform => null;

  /// The current browser platform, if running on a browser platform.
  @override
  @pragma('dart2js:prefer-inline')
  apis.BrowserPlatform? get browserPlatform => browserPlatformInstance;

  /// Whether currently running on a native platform.
  @override
  @pragma('dart2js:prefer-inline')
  bool get isNative => false;

  /// Whether currently running in a browser.
  @override
  @pragma('dart2js:prefer-inline')
  bool get isBrowser => true;

  const Platform._();
}
