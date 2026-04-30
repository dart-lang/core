// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Interface for a native platform with access to `dart:io`.
///
/// @docImport '../../testing.dart';
// ignore: unnecessary_library_name - Used by DartDoc
library native_platform_impl;

import 'dart:convert';
import 'dart:io' as io;

import '../platform_apis.dart' as apis;
import '../util/environment_override_keys.dart' as env;
import '../util/json_keys.dart' as json_key;

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
final class NativePlatform extends apis.NativePlatformBase {
  const NativePlatform._();

  @override
  @pragma('vm:prefer-inline')
  bool get isAndroid => _operatingSystem == apis.NativePlatform.android;

  @override
  @pragma('vm:prefer-inline')
  bool get isFuchsia => _operatingSystem == apis.NativePlatform.fuchsia;

  @override
  @pragma('vm:prefer-inline')
  bool get isIOS => _operatingSystem == apis.NativePlatform.iOS;

  @override
  @pragma('vm:prefer-inline')
  bool get isLinux => _operatingSystem == apis.NativePlatform.linux;

  @override
  @pragma('vm:prefer-inline')
  bool get isMacOS => _operatingSystem == apis.NativePlatform.macOS;

  @override
  @pragma('vm:prefer-inline')
  bool get isWindows => _operatingSystem == apis.NativePlatform.windows;

  @override
  @pragma('vm:prefer-inline')
  String get operatingSystem => _operatingSystem;

  @override
  @pragma('vm:prefer-inline')
  String get operatingSystemVersion => _operatingSystemVersion;

  @override
  @pragma('vm:prefer-inline')
  Map<String, String> get environment => io.Platform.environment;

  @override
  @pragma('vm:prefer-inline')
  String get executable => io.Platform.executable;

  @override
  @pragma('vm:prefer-inline')
  List<String> get executableArguments => io.Platform.executableArguments;

  @override
  @pragma('vm:prefer-inline')
  String get lineTerminator => io.Platform.lineTerminator;

  @override
  @pragma('vm:prefer-inline')
  String get localHostname => io.Platform.localHostname;

  @override
  @pragma('vm:prefer-inline')
  String get localeName => io.Platform.localeName;

  @override
  @pragma('vm:prefer-inline')
  int get numberOfProcessors => io.Platform.numberOfProcessors;

  @override
  @pragma('vm:prefer-inline')
  String? get packageConfig => io.Platform.packageConfig;

  @override
  @pragma('vm:prefer-inline')
  String get pathSeparator => io.Platform.pathSeparator;

  @override
  @pragma('vm:prefer-inline')
  String get resolvedExecutable => io.Platform.resolvedExecutable;

  @override
  @pragma('vm:prefer-inline')
  Uri get script => io.Platform.script;

  @override
  @pragma('vm:prefer-inline')
  bool get stdinSupportsAnsi => io.stdin.supportsAnsiEscapes;

  @override
  @pragma('vm:prefer-inline')
  bool get stdoutSupportsAnsi => io.stdout.supportsAnsiEscapes;

  @override
  @pragma('vm:prefer-inline')
  String get version => io.Platform.version;

  @override
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
