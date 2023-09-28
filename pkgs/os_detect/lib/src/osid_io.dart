// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'os_kind.dart';
import 'os_override.dart';

// Uses VM platform-constant functionality to constant fold this expression
// when `Platform.operatingSystem` is known at compile-time.
// Uses a valid "potentially constant" expression for this, instead of, e.g.,
// a `switch` expression.
@pragma('vm:platform-const')
final RecognizedOS? _osType = Platform.operatingSystem == RecognizedOS.linuxId
    ? const LinuxOS()
    : Platform.operatingSystem == RecognizedOS.macOSId
        ? const MacOS()
        : Platform.operatingSystem == RecognizedOS.windowsId
            ? const WindowsOS()
            : Platform.operatingSystem == RecognizedOS.androidId
                ? const AndroidOS()
                : Platform.operatingSystem == RecognizedOS.iOSId
                    ? const IOS()
                    : Platform.operatingSystem == RecognizedOS.fuchsiaId
                        ? const FuchsiaOS()
                        : Platform.operatingSystem == RecognizedOS.browserId
                            ? const BrowserOS()
                            : null;

final OperatingSystem platformOS = OperatingSystemInternal(
    _osType ?? UnknownOS(Platform.operatingSystem),
    Platform.operatingSystemVersion);
