// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Uses of the deprecated `package:os_detect` API through a prefixed import.
//
// Note: a prefix named `Platform` is *not* migrated correctly, because the
// generated `Platform.current...` references would resolve to the prefix
// instead of to `Platform` from `package:platform`. See `README.md`.

import 'package:platform/platform.dart';

String describeOS() =>
    '${NativePlatform.current!.operatingSystem} ${NativePlatform.current!.operatingSystemVersion}';

bool get onAndroid => Platform.current.isAndroid;
bool get onBrowser => Platform.current.isBrowser;
bool get onFuchsia => Platform.current.isFuchsia;
bool get onIOS => Platform.current.isIOS;
bool get onLinux => Platform.current.isLinux;
bool get onMacOS => Platform.current.isMacOS;
bool get onWindows => Platform.current.isWindows;
