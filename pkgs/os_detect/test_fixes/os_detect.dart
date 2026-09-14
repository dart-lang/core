// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Every deprecated member of `package:os_detect/os_detect.dart`, used through
// an unprefixed import.

import 'package:os_detect/os_detect.dart';

String describeOS() => '${operatingSystem} ${operatingSystemVersion}';

bool get onAndroid => isAndroid;
bool get onBrowser => isBrowser;
bool get onFuchsia => isFuchsia;
bool get onIOS => isIOS;
bool get onLinux => isLinux;
bool get onMacOS => isMacOS;
bool get onWindows => isWindows;

void report() {
  if (isBrowser) {
    print(operatingSystemVersion);
  } else if (isLinux || isMacOS || isWindows) {
    print(operatingSystem);
  } else if (isAndroid || isIOS || isFuchsia) {
    print(operatingSystem);
  }
}
