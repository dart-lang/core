// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Platform specific implementations for `LocalPlatform`
/// when `dart:html` is available , but `dart:io` is not.
/// (That is, when compiling for the web).
///
/// @docImport '../../testing.dart';
// ignore: unnecessary_library_name - Used by DartDoc
library browser_platform_impl;

import 'dart:convert' show JsonEncoder;

import '../platform_apis.dart' as apis;
import '../util/json_keys.dart' as json_key;
import '../util/platform_browser_interop.dart' as window;

/// For access in `platform_browser_impl.dart` without public constructor.
const BrowserPlatform browserPlatformInstance = BrowserPlatform._();

/// Information about the current browser.
///
/// Only available while running in a browser.
final class BrowserPlatform extends apis.BrowserPlatformBase {
  const BrowserPlatform._();

  /// The browser's version, as reported by `Navigator.appVersion` by default.
  ///
  /// If a particular browser provides a more specific version string,
  /// it may be used instead of the default.
  ///
  /// No guarantees are made about the format of the string, it may differ
  /// between different browser types, and between different browser versions
  /// or versions of this package.
  ///
  /// If no `Navigator` object is a available,
  /// the string content and format is unspecified.
  @override
  String get version =>
      window.navigator?.appVersion ?? 'No navigator.appVersion';

  /// The browser's user-agent string, as reported by `Navigator.userAgent`.
  ///
  /// If no `Navigator` object is a available, the value will be
  /// the string `"unknown"`.
  ///
  /// The string content and format is unspecified.
  @override
  String get userAgent =>
      window.navigator?.userAgent ?? 'No navigator.userAgent';

  /// A JSON representation of the state of this browser platform object.
  ///
  /// Can be emitted for debugging or be used to create a [TestBrowserPlatform]
  /// with the same configuration.
  @override
  String toJson() => const JsonEncoder.withIndent(
    '  ',
  ).convert({json_key.userAgent: userAgent, json_key.version: version});
}
