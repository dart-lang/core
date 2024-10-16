// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'os_kind.dart';
import 'os_override.dart';

@pragma('vm:platform-const')
const String _os =
    String.fromEnvironment('dart.os.name', defaultValue: 'unknown');
const String _osVersion = String.fromEnvironment('dart.os.version');

const OperatingSystem platformOS = OperatingSystemInternal(
    _os == RecognizedOS.linuxId
        ? LinuxOS()
        : _os == RecognizedOS.macOSId
            ? MacOS()
            : _os == RecognizedOS.windowsId
                ? WindowsOS()
                : _os == RecognizedOS.androidId
                    ? AndroidOS()
                    : _os == RecognizedOS.iOSId
                        ? IOS()
                        : _os == RecognizedOS.fuchsiaId
                            ? FuchsiaOS()
                            : _os == RecognizedOS.browserId
                                ? BrowserOS()
                                : UnknownOS(_os),
    _osVersion);
