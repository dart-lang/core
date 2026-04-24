// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: deprecated_member_use_from_same_package

@Deprecated('Import package:platform/testing.dart for testing')
library;

import 'dart:convert' show JsonDecoder, JsonEncoder;

import '../platforms_impl.dart'
    show BrowserPlatform, NativePlatform, Platform, PlatformTestBase;
// ignore: invalid_use_of_visible_for_testing_member
import '../testing/test_platforms.dart' show TestNativePlatform;

// Not showing `lineTerminator` which wasn't used in the legacy code.
import '../util/json_keys.dart'
    as json_key
    show
        environment,
        executable,
        executableArguments,
        localHostname,
        localeName,
        numberOfProcessors,
        operatingSystem,
        operatingSystemVersion,
        packageConfig,
        pathSeparator,
        resolvedExecutable,
        script,
        stdinSupportsAnsi,
        stdoutSupportsAnsi,
        version;

/// A mutable implementation of the legacy [Platform] interface.
///
/// > [!WARNING]
/// > Use `package:platform/testing.dart` for testing
/// > the non-deprecated API, and use `TestNativePlatform` to
/// > give custom values to native platform properties.
@Deprecated('Use TestNativePlatform instead')
final class FakePlatform extends PlatformTestBase {
  // ignore: invalid_use_of_visible_for_testing_member
  final TestNativePlatform _nativePlatform;

  /// Creates a new legacy [FakePlatform] with the specified properties.
  ///
  /// Unspecified properties will *not* be assigned default values (they will
  /// remain `null`). If an unset non-null value is read, a [StateError] will
  /// be thrown instead of returning `null`.
  FakePlatform({
    int? numberOfProcessors,
    String? pathSeparator,
    String? operatingSystem,
    String? operatingSystemVersion,
    String? localHostname,
    Map<String, String>? environment,
    String? executable,
    String? resolvedExecutable,
    Uri? script,
    List<String>? executableArguments,
    String? packageConfig,
    String? version,
    bool? stdinSupportsAnsi,
    bool? stdoutSupportsAnsi,
    String? localeName,
  }) : this._(
         // ignore: invalid_use_of_visible_for_testing_member
         TestNativePlatform(
           numberOfProcessors: numberOfProcessors,
           pathSeparator: pathSeparator,
           operatingSystem: operatingSystem,
           operatingSystemVersion: operatingSystemVersion,
           localHostname: localHostname,
           environment: environment,
           executable: executable,
           resolvedExecutable: resolvedExecutable,
           script: script,
           executableArguments: executableArguments,
           packageConfig: packageConfig,
           version: version,
           stdinSupportsAnsi: stdinSupportsAnsi,
           stdoutSupportsAnsi: stdoutSupportsAnsi,
           localeName: localeName,
         ),
       );

  FakePlatform._(this._nativePlatform);

  /// Creates a new [FakePlatform] with properties extracted from the encoded
  /// JSON string.
  ///
  /// [json] must be a JSON string that matches the encoding produced by
  /// [toJson].
  factory FakePlatform.fromJson(String json) {
    final map = const JsonDecoder().convert(json) as Map<String, dynamic>;
    return FakePlatform(
      numberOfProcessors: map[json_key.numberOfProcessors] as int?,
      pathSeparator: map[json_key.pathSeparator] as String?,
      operatingSystem: map[json_key.operatingSystem] as String?,
      operatingSystemVersion: map[json_key.operatingSystemVersion] as String?,
      localHostname: map[json_key.localHostname] as String?,
      environment: (map[json_key.environment] as Map<Object?, Object?>)
          .cast<String, String>(),
      executable: map[json_key.executable] as String?,
      resolvedExecutable: map[json_key.resolvedExecutable] as String?,
      script: Uri.parse(map[json_key.script] as String),
      executableArguments: (map[json_key.executableArguments] as List<Object?>)
          .cast<String>(),
      packageConfig: map[json_key.packageConfig] as String?,
      version: map[json_key.version] as String?,
      stdinSupportsAnsi: map[json_key.stdinSupportsAnsi] as bool?,
      stdoutSupportsAnsi: map[json_key.stdoutSupportsAnsi] as bool?,
      localeName: map[json_key.localeName] as String?,
    );
  }

  /// Creates a new [FakePlatform] with properties values mirroring [platform].
  FakePlatform.fromPlatform(Platform platform)
    : this(
        numberOfProcessors: platform.numberOfProcessors,
        pathSeparator: platform.pathSeparator,
        operatingSystem: platform.operatingSystem,
        operatingSystemVersion: platform.operatingSystemVersion,
        localHostname: platform.localHostname,
        environment: Map<String, String>.from(platform.environment),
        executable: platform.executable,
        resolvedExecutable: platform.resolvedExecutable,
        script: platform.script,
        executableArguments: List<String>.from(platform.executableArguments),
        packageConfig: platform.packageConfig,
        version: platform.version,
        stdinSupportsAnsi: platform.stdinSupportsAnsi,
        stdoutSupportsAnsi: platform.stdoutSupportsAnsi,
        localeName: platform.localeName,
      );

  @override
  NativePlatform get nativePlatform => _nativePlatform;

  @override
  Map<String, String> get environment => _nativePlatform.environment;

  @override
  String get executable => _nativePlatform.executable;

  @override
  List<String> get executableArguments => _nativePlatform.executableArguments;

  @override
  String get localeName => _nativePlatform.localeName;

  @override
  String get localHostname => _nativePlatform.localHostname;

  @override
  int get numberOfProcessors => _nativePlatform.numberOfProcessors;

  @override
  String get operatingSystem => _nativePlatform.operatingSystem;

  @override
  String get operatingSystemVersion => _nativePlatform.operatingSystemVersion;

  @override
  String? get packageConfig => _nativePlatform.packageConfig;

  @override
  String get pathSeparator => _nativePlatform.pathSeparator;

  @override
  String get resolvedExecutable => _nativePlatform.resolvedExecutable;

  @override
  Uri get script => _nativePlatform.script;

  @override
  bool get stdinSupportsAnsi => _nativePlatform.stdinSupportsAnsi;

  @override
  bool get stdoutSupportsAnsi => _nativePlatform.stdoutSupportsAnsi;

  @override
  String get version => _nativePlatform.version;

  /// Creates a new [FakePlatform] from this one,
  /// with some properties replaced by the given properties.
  @Deprecated('Use NativePlatform.copyWith instead')
  FakePlatform copyWith({
    int? numberOfProcessors,
    String? pathSeparator,
    String? operatingSystem,
    String? operatingSystemVersion,
    String? localHostname,
    Map<String, String>? environment,
    String? executable,
    String? resolvedExecutable,
    Uri? script,
    List<String>? executableArguments,
    String? packageConfig,
    String? version,
    bool? stdinSupportsAnsi,
    bool? stdoutSupportsAnsi,
    String? localeName,
  }) => FakePlatform._(
    // ignore: invalid_use_of_visible_for_testing_member
    _nativePlatform.copyWith(
      numberOfProcessors: numberOfProcessors,
      pathSeparator: pathSeparator,
      operatingSystem: operatingSystem,
      operatingSystemVersion: operatingSystemVersion,
      localHostname: localHostname,
      environment: environment,
      executable: executable,
      resolvedExecutable: resolvedExecutable,
      script: script,
      executableArguments: executableArguments,
      packageConfig: packageConfig,
      version: version,
      stdinSupportsAnsi: stdinSupportsAnsi,
      stdoutSupportsAnsi: stdoutSupportsAnsi,
      localeName: localeName,
    ),
  );

  @override
  String toJson() {
    return const JsonEncoder.withIndent('  ').convert(<String, dynamic>{
      json_key.numberOfProcessors: numberOfProcessors,
      json_key.pathSeparator: pathSeparator,
      json_key.operatingSystem: operatingSystem,
      json_key.operatingSystemVersion: operatingSystemVersion,
      json_key.localHostname: localHostname,
      json_key.environment: environment,
      json_key.executable: executable,
      json_key.resolvedExecutable: resolvedExecutable,
      json_key.script: script.toString(),
      json_key.executableArguments: executableArguments,
      json_key.packageConfig: packageConfig,
      json_key.version: version,
      json_key.stdinSupportsAnsi: stdinSupportsAnsi,
      json_key.stdoutSupportsAnsi: stdoutSupportsAnsi,
      json_key.localeName: localeName,
    });
  } // New API on a legacy class. It works, but use the new API instead.
}

@Deprecated('Use NativePlatform.current! instead')
final class LocalPlatform extends PlatformTestBase {
  static const _instance = LocalPlatform._();
  @Deprecated('Use NativePlatform.current! instead')
  const factory LocalPlatform() = _LocalPlatformInstance;

  const LocalPlatform._();

  @Deprecated('Use BrowserPlatform.current instead')
  @override
  BrowserPlatform? get browserPlatform;

  @override
  @Deprecated('Use NativePlatform.current!.environment instead')
  Map<String, String> get environment => NativePlatform.current!.environment;

  @override
  @Deprecated('Use NativePlatform.current!.executable instead')
  String get executable => NativePlatform.current!.executable;

  @override
  @Deprecated('Use NativePlatform.current!.executableArguments instead')
  List<String> get executableArguments =>
      NativePlatform.current!.executableArguments;

  @Deprecated('Use Platform.current.isBrowser instead')
  @override
  bool get isBrowser;

  @Deprecated('Use Platform.current.isNative instead')
  @override
  bool get isNative;

  @override
  @Deprecated('Use NativePlatform.current!.localeName instead')
  String get localeName => NativePlatform.current!.localeName;

  @override
  @Deprecated('Use NativePlatform.current!.localHostname instead')
  String get localHostname => NativePlatform.current!.localHostname;

  @override
  NativePlatform? get nativePlatform;

  @override
  @Deprecated('Use NativePlatform.current!.numberOfProcessors instead')
  int get numberOfProcessors => NativePlatform.current!.numberOfProcessors;

  // Implements existing behavior through `NativePlatform`.
  @override
  @Deprecated('Use NativePlatform.current!.operatingSystem instead')
  String get operatingSystem => NativePlatform.current!.operatingSystem;

  @override
  @Deprecated('Use NativePlatform.current!.operatingSystemVersion instead')
  String get operatingSystemVersion =>
      NativePlatform.current!.operatingSystemVersion;

  @override
  @Deprecated('Use NativePlatform.current!.packageConfig instead')
  String? get packageConfig => NativePlatform.current!.packageConfig;

  @override
  @Deprecated('Use NativePlatform.current!.pathSeparator instead')
  String get pathSeparator => NativePlatform.current!.pathSeparator;

  @override
  @Deprecated('Use NativePlatform.current!.resolvedExecutable instead')
  String get resolvedExecutable => NativePlatform.current!.resolvedExecutable;

  @override
  @Deprecated('Use NativePlatform.current!.script instead')
  Uri get script => NativePlatform.current!.script;

  @override
  @Deprecated('Use NativePlatform.current!.stdinSupportsAnsi instead')
  bool get stdinSupportsAnsi => NativePlatform.current!.stdinSupportsAnsi;

  @override
  @Deprecated('Use NativePlatform.current!.stdoutSupportsAnsi instead')
  bool get stdoutSupportsAnsi => NativePlatform.current!.stdoutSupportsAnsi;

  @override
  @Deprecated('Use NativePlatform.current!.version instead')
  String get version => NativePlatform.current!.version;

  @override
  String toJson() => NativePlatform.current!.toJson();
}

extension type const _LocalPlatformInstance._(LocalPlatform _)
    implements LocalPlatform {
  const _LocalPlatformInstance() : this._(LocalPlatform._instance);
}
