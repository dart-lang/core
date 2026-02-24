// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Platform information, and mocking of that information for tests.
///
/// This library provides the [Platform] interface of the `platform.dart`
/// library, and the [BrowserPlatform] and [NativePlatform]
/// types that it may or may not expose an instance of.
///
/// On top of that, this library also exposes mock-versions of those
/// platform specific classes: [TestBrowserPlatform] and [TestNativePlatform],
/// and a [TestPlatform] that can hold one of these.
///
/// These test-only classes can be used to specify a platform configuration
/// that is not the actual current platform.
/// Using the `run` methods of those test-classes will run the function in
/// a zone-context where [Platform.current] is the test-configuration.
///
/// > [!WARNING]
/// > These test-classes should *only* be used for testing.
/// > Importing this library in a production program may cause more code to
/// > be retained than necessary.
///
/// @docImport 'src/platforms.dart';
/// @docImport 'src/testing/test_platforms.dart';
/// {@canonicalFor test_platforms.TestPlatform}
/// {@canonicalFor test_platforms.TestBrowserPlatform}
/// {@canonicalFor test_platforms.TestNativePlatform}
library;

export 'src/platforms.dart'
    show BrowserPlatform, NativePlatform, Platform, PlatformIsOS;

export 'src/testing/test_platforms.dart'
    show TestBrowserPlatform, TestNativePlatform, TestPlatform;
