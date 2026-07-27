// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// All non-test classes and interfaces exposed by the package.
///
/// All classes are declared in the same library, so that they can all be final,
/// and still depend with the.
/// @docImport 'platform_apis.dart';
// ignore: unnecessary_library_name - Used by DartDoc
library exported_platforms;

import 'platform_apis.dart' show NativePlatform, Platform, PlatformBase;
export 'platform_apis.dart' show BrowserPlatform, NativePlatform, Platform;

/// Shorthands for checking operating system on the native platform.
///
/// Extension getters on `Platform` which forward to the operating system
/// checks on [Platform.nativePlatform], after checking that this is a native
/// platform.
///
/// Not currently directly callabke because [Platform] has instance members
/// with  the same behavior, but may become useful if those can be removed
extension PlatformIsOS on Platform {
  /// Whether this is a [nativePlatform] with [NativePlatform.isAndroid].
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  bool get isAndroid =>
      nativePlatform?.operatingSystem == NativePlatform.android;

  /// Whether this is a [nativePlatform] with [NativePlatform.isFuchsia].
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  bool get isFuchsia =>
      nativePlatform?.operatingSystem == NativePlatform.fuchsia;

  /// Whether this is a [nativePlatform] with [NativePlatform.isIOS].
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  bool get isIOS => nativePlatform?.operatingSystem == NativePlatform.iOS;

  /// Whether this is a [nativePlatform] with [NativePlatform.isLinux].
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  bool get isLinux => nativePlatform?.operatingSystem == NativePlatform.linux;

  /// Whether this is a [nativePlatform] with [NativePlatform.isMacOS].
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  bool get isMacOS => nativePlatform?.operatingSystem == NativePlatform.macOS;

  /// Whether this is a [nativePlatform] with [NativePlatform.isWindows].
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  bool get isWindows =>
      nativePlatform?.operatingSystem == NativePlatform.windows;
}

// TODO: Eventually get rid of these members on `Platform`.
// Maybe even on `NativePlatform`, and let `NativePlatform.operatingSystem`
// string interpretation be handled by client libraries, so this
// library doesn't have to hardwire specific operating system names.

base mixin PlatformIsOSMixin on PlatformBase implements PlatformIsOSMembers {
  @override
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  bool get isAndroid => PlatformIsOS(this).isAndroid;

  @override
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  bool get isFuchsia => PlatformIsOS(this).isFuchsia;

  @override
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  bool get isIOS => PlatformIsOS(this).isIOS;

  @override
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  bool get isLinux => PlatformIsOS(this).isLinux;

  @override
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  bool get isMacOS => PlatformIsOS(this).isMacOS;

  @override
  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  bool get isWindows => PlatformIsOS(this).isWindows;
}

// The interface for the members of [PlatformIsOSMixin] implemented by
// [Platform].
//
// Kept here so it can be deprecated at some point.
abstract interface class PlatformIsOSMembers {
  /// Whether a [Platform.nativePlatform] with [NativePlatform.isAndroid].
  bool get isAndroid;

  /// Whether a [Platform.nativePlatform] with [NativePlatform.isFuchsia].
  bool get isFuchsia;

  /// Whether a [Platform.nativePlatform] with [NativePlatform.isIOS].
  bool get isIOS;

  /// Whether a [Platform.nativePlatform] with [NativePlatform.isLinux].
  bool get isLinux;

  /// Whether a [Platform.nativePlatform] with [NativePlatform.isMacOS].
  bool get isMacOS;

  /// Whether a [Platform.nativePlatform] with [NativePlatform.isWindows].
  bool get isWindows;
}
