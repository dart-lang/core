// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Information about the current operating system.
library pkg.os_id;

import 'override.dart';

/// Identification of the current operating system or platform.
///
/// Specific known operating systems are reported by a unique string.
String get operatingSystem => OperatingSystemID.current.operatingSystem;

/// Representation of the version of the current operating system or platform.
///
/// May be empty if no version is known or available.
String get operatingSystemVersion =>
    OperatingSystemID.current.operatingSystemVersion;

/// Whether the current operating system is a version of
/// [Linux](https://en.wikipedia.org/wiki/Linux).
///
/// Identified by [operatingSystem] being the string `linux`.
///
/// This value is `false` if the operating system is a specialized
/// version of Linux that identifies itself by a different name,
/// for example Android (see [isAndroid]).
bool get isLinux => OperatingSystemID.current.isLinux;

/// Whether the current operating system is a version of
/// [macOS](https://en.wikipedia.org/wiki/MacOS).
///
/// Identified by [operatingSystem] being the string `macos`.
bool get isMacOS => OperatingSystemID.current.isMacOS;

/// Whether the current operating system is a version of
/// [Microsoft Windows](https://en.wikipedia.org/wiki/Microsoft_Windows).
///
/// Identified by [operatingSystem] being the string `windows`.
bool get isWindows => OperatingSystemID.current.isWindows;

/// Whether the current operating system is a version of
/// [Android](https://en.wikipedia.org/wiki/Android_%28operating_system%29).
///
/// Identified by [operatingSystem] being the string `android`.
bool get isAndroid => OperatingSystemID.current.isAndroid;

/// Whether the current operating system is a version of
/// [iOS](https://en.wikipedia.org/wiki/IOS).
///
/// Identified by [operatingSystem] being the string `ios`.
bool get isIOS => OperatingSystemID.current.isIOS;

/// Whether the current operating system is a version of
/// [Fuchsia](https://en.wikipedia.org/wiki/Google_Fuchsia).
///
/// Identified by [operatingSystem] being the string `fuchsia`.
bool get isFuchsia => OperatingSystemID.current.isFuchsia;

/// Whether running in a web browser.
///
/// Identified by [operatingSystem] being the string `browser`.
///
/// If so, the [operatingSystemVersion] is the string made available
/// through `window.navigator.appVersion`.
bool get isBrowser => OperatingSystemID.current.isBrowser;
