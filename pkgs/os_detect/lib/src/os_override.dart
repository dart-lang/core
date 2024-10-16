// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async' show Zone, runZoned;

import 'package:meta/meta.dart';

import 'os_kind.dart';
import 'osid_unknown.dart'
    if (dart.library.io) 'osid_io.dart'
    if (dart.library.html) 'osid_html.dart';

/// The name and version of an operating system.
final class OperatingSystem {
  // The recognized OS identifier strings.

  /// The operating system ID string for Linux.
  ///
  /// Compare against [id] or the `operatingSystem` of `os_detect.dart`,
  /// or use as argument to [OperatingSystem.new].
  static const androidId = RecognizedOS.androidId;

  /// The operating system ID string for browsers.
  ///
  /// Compare against [id] or the `operatingSystem` of `os_detect.dart`,
  /// or use as argument to [OperatingSystem.new].
  static const browserId = RecognizedOS.browserId;

  /// The operating system ID string for Fuchsia.
  ///
  /// Compare against [id] or the `operatingSystem` of `os_detect.dart`,
  /// or use as argument to [OperatingSystem.new].
  static const fuchsiaId = RecognizedOS.fuchsiaId;

  /// The operating system ID string for iOS.
  ///
  /// Compare against [id] or the `operatingSystem` of `os_detect.dart`,
  /// or use as argument to [OperatingSystem.new].
  static const iOSId = RecognizedOS.iOSId;

  /// The operating system ID string for Linux.
  ///
  /// Compare against [id] or the `operatingSystem` of `os_detect.dart`,
  /// or use as argument to [OperatingSystem.new].
  static const linuxId = RecognizedOS.linuxId;

  /// The operating system ID string for macOS.
  ///
  /// Compare against [id] or the `operatingSystem` of `os_detect.dart`,
  /// or use as argument to [OperatingSystem.new].
  static const macOSId = RecognizedOS.macOSId;

  /// The operating system ID string for Windows.
  ///
  /// Compare against [id] or the `operatingSystem` of `os_detect.dart`,
  /// or use as argument to [OperatingSystem.new].
  static const windowsId = RecognizedOS.windowsId;

  /// The current operating system ID.
  ///
  /// Defaults to what information is available
  /// from known platform specific libraries,
  /// but can be overridden using functionality from the
  /// `osid_override.dart` library.
  @pragma('vm:try-inline')
  static OperatingSystem get current =>
      Zone.current[#_os] as OperatingSystem? ?? platformOS;

  /// A string representing the operating system or platform.
  String get id => _osId.id;

  // Operating system ID object.
  final RecognizedOS _osId;

  /// A string representing the version of the operating system or platform.
  ///
  /// May be empty if no version is known or available.
  final String version;

  /// Creates a new operating system object for testing.
  ///
  /// Can be used with [overrideOperatingSystem] to selectively
  /// change the value returned by [current].
  ///
  /// **Notice:** Using this constructor may reduce the efficiency
  /// of compilers recognizing code that isn't needed when compiling
  /// for a particular platform (aka. "tree-shaking" of unreachable code).
  // Uses chained conditionals to allow back-ends to constant fold when they
  // know what `id` is, which they'd usually know for a specific operation.
  // That can avoid retaining *all* the subclasses of `OS`.
  @visibleForTesting
  @pragma('vm:prefer-inline')
  OperatingSystem(String id, String version)
      : this._(
            id == linuxId
                ? const LinuxOS()
                : id == macOSId
                    ? const MacOS()
                    : id == windowsId
                        ? const WindowsOS()
                        : id == androidId
                            ? const AndroidOS()
                            : id == iOSId
                                ? const IOS()
                                : id == fuchsiaId
                                    ? const FuchsiaOS()
                                    : id == browserId
                                        ? const BrowserOS()
                                        : UnknownOS(id),
            version);

  /// Used by platforms which know the ID object.
  const OperatingSystem._(this._osId, this.version);

  /// Whether the operating system is a version of
  /// [Linux](https://en.wikipedia.org/wiki/Linux).
  ///
  /// Identified by [id] being the string `linux`.
  ///
  /// This value is `false` if the operating system is a specialized
  /// version of Linux that identifies itself by a different name,
  /// for example Android (see [isAndroid]).
  bool get isLinux => _osId is LinuxOS;

  /// Whether the operating system is a version of
  /// [macOS](https://en.wikipedia.org/wiki/MacOS).
  ///
  /// Identified by [id] being the string `macos`.
  bool get isMacOS => _osId is MacOS;

  /// Whether the operating system is a version of
  /// [Microsoft Windows](https://en.wikipedia.org/wiki/Microsoft_Windows).
  ///
  /// Identified by [id] being the string `windows`.
  bool get isWindows => _osId is WindowsOS;

  /// Whether the operating system is a version of
  /// [Android](https://en.wikipedia.org/wiki/Android_%28operating_system%29).
  ///
  /// Identified by [id] being the string `android`.
  bool get isAndroid => _osId is AndroidOS;

  /// Whether the operating system is a version of
  /// [iOS](https://en.wikipedia.org/wiki/IOS).
  ///
  /// Identified by [id] being the string `ios`.
  bool get isIOS => _osId is IOS;

  /// Whether the operating system is a version of
  /// [Fuchsia](https://en.wikipedia.org/wiki/Google_Fuchsia).
  ///
  /// Identified by [id] being the string `fuchsia`.
  bool get isFuchsia => _osId is FuchsiaOS;

  /// Whether running in a web browser.
  ///
  /// Identified by [id] being the string `browser`.
  ///
  /// If so, the [version] is the string made available
  /// through `window.navigator.appVersion`.
  bool get isBrowser => _osId is BrowserOS;
}

/// Run [body] in a zone with platform overrides.
///
/// Overrides [OperatingSystem.current] with the supplied [operatingSystem]
/// value while running in a new zone, and then runs [body] in that zone.
///
/// This override affects the `operatingSystem` and `version`
/// exported by `package:osid/osid.dart`.
R overrideOperatingSystem<R>(
        OperatingSystem operatingSystem, R Function() body) =>
    runZoned(body, zoneValues: {#_os: operatingSystem});

// Exposes the `OperatingSystem._` constructor to the conditionally imported
// libraries. Not exported by `../override.dart'.
final class OperatingSystemInternal extends OperatingSystem {
  const OperatingSystemInternal(super.id, super.version) : super._();
}
