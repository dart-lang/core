// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Interface for a native platform with access to `dart:io`.
// ignore: unnecessary_library_name - Used by DartDoc
library native_platform_impl;

import 'dart:convert' show JsonEncoder;
import 'dart:io' as io;

import '../util/environment_override_keys.dart' as env;
import '../util/json_keys.dart' as json_key;
import 'io_platform.dart';

@pragma('vm:platform-const')
final String _operatingSystem =
    env.operatingSystem ?? io.Platform.operatingSystem;

final String _operatingSystemVersion =
    env.operatingSystemVersion ?? io.Platform.operatingSystemVersion;

const NativePlatform nativePlatformInstance = NativePlatform._();

/// Properties of the native host platform and process.
///
/// Provides API parity with the `Platform` class in `dart:io`, but using
/// instance properties rather than static properties. This difference enables
/// the use of these APIs in tests, where you can provide mock implementations.
/// Also provides access to a few chosen properties from other
/// parts of `dart:io`.
final class NativePlatform {
  const NativePlatform._();

  /// The current native platform, if any.
  ///
  /// Same as [Platform.nativePlatform] of [Platform.current].
  @pragma('vm:prefer-inline')
  static NativePlatform? get current => Platform.current.nativePlatform;

  /// The value of [operatingSystem] on Android.
  ///
  /// Can be used, for example, in switch cases when switching on
  /// [operatingSystem].
  ///
  /// Use [isAndroid] as a direct way to check whether the platform is Android.
  static const String android = 'android';

  /// The value of [operatingSystem] on Fuchsia.
  ///
  /// Can be used, for example, in switch cases when switching on
  /// [operatingSystem].
  ///
  /// Use [isFuchsia] as a direct way to check whether the platform is Fuchsia.
  static const String fuchsia = 'fuchsia';

  /// The value of [operatingSystem] on iOS.
  ///
  /// Can be used, for example, in switch cases when switching on
  /// [operatingSystem].
  ///
  /// Use [isIOS] as a direct way to check whether the platform is iOS.
  static const String iOS = 'ios';

  /// The value of [operatingSystem] on Linux.
  ///
  /// Can be used, for example, in switch cases when switching on
  /// [operatingSystem].
  ///
  /// Use [isLinux] as a direct way to check whether the platform is Linux.
  static const String linux = 'linux';

  /// The value of [operatingSystem] on macOS.
  ///
  /// Can be used, for example, in switch cases when switching on
  /// [operatingSystem].
  ///
  /// Use [isMacOS] as a direct way to check whether the platform is macOS.
  static const String macOS = 'macos';

  /// The value of [operatingSystem] on Windows.
  ///
  /// Can be used, for example, in switch cases when switching on
  /// [operatingSystem].
  ///
  /// Use [isWindows] as a direct way to check whether the platform is Windows.
  static const String windows = 'windows';

  /// A list of the recognized values that [operatingSystem] can have.
  static const List<String> operatingSystemValues = <String>[
    android,
    fuchsia,
    iOS,
    linux,
    macOS,
    windows,
  ];

  /// Whether the operating system is Android.
  ///
  /// The operating system is determined by [operatingSystem],
  /// and is recognized as Android if the value is the string [android].
  @pragma('vm:prefer-inline')
  bool get isAndroid => _operatingSystem == NativePlatform.android;

  /// Whether the operating system is Fuchsia.
  ///
  /// The operating system is determined by [operatingSystem],
  /// and is recognized as Fuchsia if the value is the string [fuchsia].
  @pragma('vm:prefer-inline')
  bool get isFuchsia => _operatingSystem == NativePlatform.fuchsia;

  /// Whether the operating system is iOS.
  ///
  /// The operating system is determined by [operatingSystem],
  /// and is recognized as iOS if the value is the string [iOS].
  @pragma('vm:prefer-inline')
  bool get isIOS => _operatingSystem == NativePlatform.iOS;

  /// Whether the operating system is Linux.
  ///
  /// The operating system is determined by [operatingSystem],
  /// and is recognized as Linux if the value is the string [linux].
  @pragma('vm:prefer-inline')
  bool get isLinux => _operatingSystem == NativePlatform.linux;

  /// Whether the operating system is OS X.
  ///
  /// The operating system is determined by [operatingSystem],
  /// and is recognized as X if the value is the string [macOS].
  @pragma('vm:prefer-inline')
  bool get isMacOS => _operatingSystem == NativePlatform.macOS;

  /// Whether the operating system is Windows.
  ///
  /// The operating system is determined by [operatingSystem],
  /// and is recognized as Windows if the value is the string [windows].
  @pragma('vm:prefer-inline')
  bool get isWindows => _operatingSystem == NativePlatform.windows;

  @pragma('vm:prefer-inline')
  /// A string representing the operating system.
  ///
  /// The currently possible return values are available
  /// from [operatingSystemValues], and there are constants
  /// for each of the platforms to use in switch statements
  /// or conditionals (See [linux], [macOS], [windows], [android], [iOS],
  /// and [fuchsia]).
  String get operatingSystem => _operatingSystem;

  /// A string representing the version of the operating system or platform.
  ///
  /// The string content and format is unspecified.
  @pragma('vm:prefer-inline')
  String get operatingSystemVersion => _operatingSystemVersion;

  /// The environment for this process.
  ///
  /// The returned environment is an unmodifiable map whose content is
  /// retrieved from the operating system on its first use.
  ///
  /// Environment variables on Windows are case-insensitive. The map
  /// returned on Windows is therefore case-insensitive and will convert
  /// all keys to upper case. On other platforms the returned map is
  /// a standard case-sensitive map.
  @pragma('vm:prefer-inline')
  Map<String, String> get environment => io.Platform.environment;

  /// The file path of the executable used to run the script in this isolate.
  ///
  /// The file path returned is the literal path used to run the script.
  /// This path might be relative or just be a name from which the executable
  /// was found by searching the system path.
  ///
  /// For the absolute path to the resolved executable use [resolvedExecutable].
  @pragma('vm:prefer-inline')
  String get executable => io.Platform.executable;

  /// The flags passed to the executable used to run the script of this program.
  ///
  /// These are the command-line entries between the executable name
  /// and the script name. Each access to `executableArguments` returns a new
  /// list containing the flags passed to the executable.
  @pragma('vm:prefer-inline')
  List<String> get executableArguments => io.Platform.executableArguments;

  /// The default line terminator on the current platform.
  ///
  /// Is a line feed (`"\n"`, U+000A) on most platforms, but
  /// carriage return followed by linefeed (`"\r\n"`, U+000D + U+000A)
  /// on Windows.
  @pragma('vm:prefer-inline')
  String get lineTerminator => io.Platform.lineTerminator;

  /// The local hostname for the system.
  @pragma('vm:prefer-inline')
  String get localHostname => io.Platform.localHostname;

  /// The name of the current locale.
  @pragma('vm:prefer-inline')
  String get localeName => io.Platform.localeName;

  /// The number of processors of the machine.
  @pragma('vm:prefer-inline')
  int get numberOfProcessors => io.Platform.numberOfProcessors;

  /// The value of the `--packages` flag passed to the executable
  /// used to run the script in this isolate. This is the configuration which
  /// specifies how Dart packages are looked up.
  ///
  /// If there is no `--packages` flag, `null` is returned.
  @pragma('vm:prefer-inline')
  String? get packageConfig => io.Platform.packageConfig;

  /// The path separator used by the operating system to separate
  /// components in file paths.
  @pragma('vm:prefer-inline')
  String get pathSeparator => io.Platform.pathSeparator;

  /// The path of the executable used to run the script in this
  /// isolate after it has been resolved by the OS.
  ///
  /// This is the absolute path, with all symlinks resolved, to the
  /// executable used to run the script.
  @pragma('vm:prefer-inline')
  String get resolvedExecutable => io.Platform.resolvedExecutable;

  /// The absolute URI of the script file of the program currently running.
  ///
  /// The [Uri] is empty if the executable environment does not provide
  /// the location of a script.
  /// Otherwise the value is what the platform provides, which is usually
  /// the `Platform.script` provided by `dart:io`.
  @pragma('vm:prefer-inline')
  Uri get script => io.Platform.script;

  /// When stdin is connected to a terminal, whether ANSI codes are supported.
  @pragma('vm:prefer-inline')
  bool get stdinSupportsAnsi => io.stdin.supportsAnsiEscapes;

  /// When stdout is connected to a terminal, whether ANSI codes are supported.
  @pragma('vm:prefer-inline')
  bool get stdoutSupportsAnsi => io.stdout.supportsAnsiEscapes;

  /// The version of the current Dart runtime.
  ///
  /// The returned `String` is formatted as the [semver](http://semver.org)
  /// version string of the current dart runtime, possibly followed by
  /// whitespace and other version and build details.
  @pragma('vm:prefer-inline')
  String get version => io.Platform.version;

  /// A JSON-encoded representation of the native platform information.
  ///
  /// Can be emitted for debugging, or be used to create a fake
  /// native platform object used for debugging.
  String toJson() {
    return const JsonEncoder.withIndent('  ').convert(<String, Object?>{
      json_key.environment: environment,
      json_key.executable: executable,
      json_key.executableArguments: executableArguments,
      json_key.lineTerminator: lineTerminator,
      json_key.localeName: localeName,
      json_key.localHostname: localHostname,
      json_key.numberOfProcessors: numberOfProcessors,
      json_key.operatingSystem: operatingSystem,
      json_key.operatingSystemVersion: operatingSystemVersion,
      if (packageConfig != null) json_key.packageConfig: packageConfig,
      json_key.pathSeparator: pathSeparator,
      json_key.resolvedExecutable: resolvedExecutable,
      json_key.script: script.toString(),
      json_key.stdinSupportsAnsi: stdinSupportsAnsi,
      json_key.stdoutSupportsAnsi: stdoutSupportsAnsi,
      json_key.version: version,
    });
  }
}

abstract base class NativePlatformTestBase implements NativePlatform {}
