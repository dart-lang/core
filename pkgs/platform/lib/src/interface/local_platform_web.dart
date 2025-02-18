// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'platform.dart';

/// `Platform` implementation that .
class LocalPlatform extends Platform {
  /// Creates a new [LocalPlatform].
  const LocalPlatform();

  @override
  int get numberOfProcessors => 0;

  @override
  String get pathSeparator => '/';

  @override
  String get operatingSystem => 'TODO'; // see web.window.navigator.platform

  @override
  String get operatingSystemVersion => 'TODO';

  @override
  String get localHostname => 'TODO';

  @override
  Map<String, String> get environment => {};

  @override
  String get executable => 'TODO';

  @override
  String get resolvedExecutable => 'TODO';

  @override
  Uri get script => Uri.base;

  @override
  List<String> get executableArguments => [];

  @override
  String? get packageConfig => 'TODO';

  @override
  String get version => 'TODO';

  @override
  bool get stdinSupportsAnsi => false;

  @override
  bool get stdoutSupportsAnsi => false;

  @override
  String get localeName => 'TODO';
}
