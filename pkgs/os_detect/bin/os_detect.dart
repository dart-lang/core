// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Prints the operating system detected by the current compilation environment.
library pkg.os_detect.run;

import 'package:os_detect/os_detect.dart' as os_detect;

void main() {
  final knownName = knownOSName();
  print('OS name    : ${os_detect.operatingSystem} '
      '${knownName != null ? '($knownName)' : ''}');
  print('OS version : ${os_detect.operatingSystemVersion}');
}

String? knownOSName() {
  if (os_detect.isAndroid) {
    return 'Android';
  }
  if (os_detect.isBrowser) {
    return 'Browser';
  }
  if (os_detect.isFuchsia) {
    return 'Fuchsia';
  }
  if (os_detect.isIOS) {
    return 'iOS';
  }
  if (os_detect.isLinux) {
    return 'Linux';
  }
  if (os_detect.isMacOS) {
    return 'MacOS';
  }
  if (os_detect.isWindows) {
    return 'Windows';
  }
  return null;
}
