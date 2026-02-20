// Copyright 2024 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: deprecated_member_use_from_same_package

/// Properties of the current platform.
///
/// The [Platform.current] object represents the current runtime platform
/// by having one of [Platform.nativePlatform] or [Platform.browserPlatform]
/// being non-`null`. Which one is available depends on the runtime system
/// the current program is running on.
///
/// That value can provide more information about the current native
/// or browser platform, respectively.
///
/// Example:
/// ```dart
/// import 'platform/platform.dart';
///
/// bool get isMobile {
///   if (Platform.current.nativePlatform case var native?) {
///     return native.isAndroid || native.isIOS;
///   }
///   return false;
/// }
///
/// bool get isWeb => Platform.current.browserPlatform != null;
///
/// String get osAndVersionText => switch (Platform.current) {
///   Platform(nativePlatform: var n?) =>
///       '${n.operatingSystem} v. ${n.operatingSystemVersion}',
///   Platform(browserPlatform: var b?) => '${b.userAgent}',
///   _ => 'Unknown';
/// }
/// ```
///
/// > [!NOTE]
/// > This library currently provides deprecated legacy [LocalPlatform]
/// > and [FakePlatform] classes, and exposes deprecated members on the
/// > [Platform] interface.
/// > Code using those deprecated members or the class [LocalPlatform]
/// > should use [Platform.nativePlatform] of [Platform.current] instead.
/// > Code using [FakePlatform] should import `package:platform/testing.dart`
/// > and use `FestNativePlatform` instead.
/// > The legacy [FakePlatform] is also available as [LegacyFakePlatform].
///
/// @docImport 'src/legacy_implementation/legacy_classes.dart';
/// @docImport 'src/platforms.dart';
/// {@canonicalFor platform_impl.Platform}
/// {@canonicalFor browser_platform_impl.BrowserPlatform}
/// {@canonicalFor native_platform_impl.NativePlatform}
/// {@canonicalFor exported_platforms.PlatformIsOS}
library;

// Legacy classes, `LocalPlatform` and `FakePlatform`
// The `FakePlatform` is an alias for `LegacyFakePlatform`.
export 'src/legacy_implementation/legacy_classes.dart'
    show FakePlatform, LegacyFakePlatform, LocalPlatform;

export 'src/platforms.dart'
    show BrowserPlatform, NativePlatform, Platform, PlatformIsOS;
