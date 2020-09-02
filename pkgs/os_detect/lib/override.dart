// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Functionality to override information about the current platform.
library pkg.os_id.override;

import "dart:async" show Zone, runZoned;

import 'src/osid_unknown.dart'
    if (dart.library.io) "src/osid_io.dart"
    if (dart.library.html) "src/osid_html.dart";

/// The name and version of an operating system.
class OperatingSystemID {
  /// The current operating system ID.
  ///
  /// Defaults to what information is available
  /// from known platform specific libraries,
  /// but can be overridden using functionality from the
  /// `osid_override.dart` library.
  static OperatingSystemID get current => Zone.current[#_osid] ?? platformOSID;

  /// A string representing the operating system or platform.
  final String operatingSystem;

  /// A string representing the version of the operating system or platform.
  ///
  /// May be empty if no version is known or available.
  final String operatingSystemVersion;

  /// Creates an operating system ID with the provided values.
  const OperatingSystemID(this.operatingSystem, this.operatingSystemVersion);
}

/// Convenience operations on [OperatingSystemID].
///
/// Implemented as extensions to allow users to *implement* [OperatingSystemID]
/// without having to implement all of these getters.
extension OperatingSystemIDGetters on OperatingSystemID {
  /// Whether the operating system is a version of
  /// [Linux](https://en.wikipedia.org/wiki/Linux).
  ///
  /// Identified by [operatingSystem] being the string `linux`.
  ///
  /// This value is `false` if the operating system is a specialized
  /// version of Linux that identifies itself by a different name,
  /// for example Android (see [isAndroid]).
  bool get isLinux => ("linux" == operatingSystem);

  /// Whether the operating system is a version of
  /// [macOS](https://en.wikipedia.org/wiki/MacOS).
  ///
  /// Identified by [operatingSystem] being the string `macos`.
  bool get isMacOS => ("macos" == operatingSystem);

  /// Whether the operating system is a version of
  /// [Microsoft Windows](https://en.wikipedia.org/wiki/Microsoft_Windows).
  ///
  /// Identified by [operatingSystem] being the string `windows`.
  bool get isWindows => ("windows" == operatingSystem);

  /// Whether the operating system is a version of
  /// [Android](https://en.wikipedia.org/wiki/Android_%28operating_system%29).
  ///
  /// Identified by [operatingSystem] being the string `android`.
  bool get isAndroid => ("android" == operatingSystem);

  /// Whether the operating system is a version of
  /// [iOS](https://en.wikipedia.org/wiki/IOS).
  ///
  /// Identified by [operatingSystem] being the string `ios`.
  bool get isIOS => ("ios" == operatingSystem);

  /// Whether the operating system is a version of
  /// [Fuchsia](https://en.wikipedia.org/wiki/Google_Fuchsia).
  ///
  /// Identified by [operatingSystem] being the string `fuchsia`.
  bool get isFuchsia => ("fuchsia" == operatingSystem);

  /// Whether running in a web browser.
  ///
  /// Identified by [operatingSystem] being the string `browser`.
  ///
  /// If so, the [operatingSystemVersion] is the string made available
  /// through `window.navigator.appVersion`.
  bool get isBrowser => ("browser" == operatingSystem);
}

/// Run [body] in a zone with platform overrides.
///
/// Overrides [OperatingSystemID.current] with the supplied [osId]
/// value while running in a new zone, and then runs [body] in that zone.
///
/// This override affects the `operatingSystem` and `operatingSystemVersion`
/// exported by `package:osid/osid.dart`.
R overrideOperatingSystem<R>(OperatingSystemID osId, R body()) {
  return runZoned(body, zoneValues: {#_osid: osId});
}
