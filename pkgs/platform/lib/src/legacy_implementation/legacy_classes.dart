// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: deprecated_member_use_from_same_package

@Deprecated('Import package:platform/testing.dart for testing')
library;

import 'dart:convert' show JsonDecoder, JsonEncoder;

import '../platform_apis.dart'
    show BrowserPlatform, NativePlatform, Platform, PlatformBase;

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
final class FakePlatform extends PlatformBase {
  int? _numberOfProcessors;
  String? _pathSeparator;
  String? _operatingSystem;
  String? _operatingSystemVersion;
  String? _localHostname;
  Map<String, String>? _environment;
  String? _executable;
  String? _resolvedExecutable;
  Uri? _script;
  List<String>? _executableArguments;
  String? _version;
  bool? _stdinSupportsAnsi;
  bool? _stdoutSupportsAnsi;
  String? _localeName;
  @override
  String? packageConfig;

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
    this.packageConfig,
    String? version,
    bool? stdinSupportsAnsi,
    bool? stdoutSupportsAnsi,
    String? localeName,
  }) : _numberOfProcessors = numberOfProcessors,
       _pathSeparator = pathSeparator,
       _operatingSystem = operatingSystem,
       _operatingSystemVersion = operatingSystemVersion,
       _localHostname = localHostname,
       _environment = environment,
       _executable = executable,
       _resolvedExecutable = resolvedExecutable,
       _script = script,
       _executableArguments = executableArguments,
       _version = version,
       _stdinSupportsAnsi = stdinSupportsAnsi,
       _stdoutSupportsAnsi = stdoutSupportsAnsi,
       _localeName = localeName;

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

  /// Creates a new [FakePlatform] with properties whose initial values mirror
  /// the specified [platform].
  FakePlatform.fromPlatform(Platform platform)
    : _numberOfProcessors = platform.numberOfProcessors,
      _pathSeparator = platform.pathSeparator,
      _operatingSystem = platform.operatingSystem,
      _operatingSystemVersion = platform.operatingSystemVersion,
      _localHostname = platform.localHostname,
      _environment = Map<String, String>.from(platform.environment),
      _executable = platform.executable,
      _resolvedExecutable = platform.resolvedExecutable,
      _script = platform.script,
      _executableArguments = List<String>.from(platform.executableArguments),
      packageConfig = platform.packageConfig,
      _version = platform.version,
      _stdinSupportsAnsi = platform.stdinSupportsAnsi,
      _stdoutSupportsAnsi = platform.stdoutSupportsAnsi,
      _localeName = platform.localeName;

  @override
  Map<String, String> get environment => _throwIfNull(_environment);

  @override
  String get executable => _throwIfNull(_executable);

  @override
  List<String> get executableArguments => _throwIfNull(_executableArguments);

  @override
  String get localeName => _throwIfNull(_localeName);

  @override
  String get localHostname => _throwIfNull(_localHostname);

  @override
  int get numberOfProcessors => _throwIfNull(_numberOfProcessors);

  @override
  String get operatingSystem => _throwIfNull(_operatingSystem);

  @override
  String get operatingSystemVersion => _throwIfNull(_operatingSystemVersion);

  @override
  String get pathSeparator => _throwIfNull(_pathSeparator);

  @override
  String get resolvedExecutable => _throwIfNull(_resolvedExecutable);

  @override
  Uri get script => _throwIfNull(_script);

  @override
  bool get stdinSupportsAnsi => _throwIfNull(_stdinSupportsAnsi);

  @override
  bool get stdoutSupportsAnsi => _throwIfNull(_stdoutSupportsAnsi);

  @override
  String get version => _throwIfNull(_version);

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
  }) {
    return FakePlatform(
      numberOfProcessors: numberOfProcessors ?? this.numberOfProcessors,
      pathSeparator: pathSeparator ?? this.pathSeparator,
      operatingSystem: operatingSystem ?? this.operatingSystem,
      operatingSystemVersion:
          operatingSystemVersion ?? this.operatingSystemVersion,
      localHostname: localHostname ?? this.localHostname,
      environment: environment ?? this.environment,
      executable: executable ?? this.executable,
      resolvedExecutable: resolvedExecutable ?? this.resolvedExecutable,
      script: script ?? this.script,
      executableArguments: executableArguments ?? this.executableArguments,
      packageConfig: packageConfig ?? this.packageConfig,
      version: version ?? this.version,
      stdinSupportsAnsi: stdinSupportsAnsi ?? this.stdinSupportsAnsi,
      stdoutSupportsAnsi: stdoutSupportsAnsi ?? this.stdoutSupportsAnsi,
      localeName: localeName ?? this.localeName,
    );
  }

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

  T _throwIfNull<T>(T? value) {
    if (value == null) {
      throw StateError(
        'Tried to read property of FakePlatform but it was unset.',
      );
    }
    return value;
  }

  @override
  BrowserPlatform? get browserPlatform => null;

  @override
  bool get isBrowser => false;

  @override
  bool get isNative => true;

  @override
  NativePlatform? get nativePlatform => Platform.current.nativePlatform;
}

@Deprecated('Use NativePlatform.current! instead')
final class LocalPlatform extends PlatformBase {
  static const _instance = LocalPlatform._();
  @Deprecated('Use NativePlatform.current! instead')
  const factory LocalPlatform() = _LocalPlatformInstance;

  const LocalPlatform._();

  @Deprecated('Use BrowserPlatform.current instead')
  @override
  BrowserPlatform? get browserPlatform => null;

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
  bool get isBrowser => false;

  @Deprecated('Use Platform.current.isNative instead')
  @override
  bool get isNative => true;

  @override
  @Deprecated('Use NativePlatform.current!.localeName instead')
  String get localeName => NativePlatform.current!.localeName;

  @override
  @Deprecated('Use NativePlatform.current!.localHostname instead')
  String get localHostname => NativePlatform.current!.localHostname;

  @override
  NativePlatform? get nativePlatform => NativePlatform.current;

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
