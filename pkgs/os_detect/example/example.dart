// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:os_detect/os_detect.dart' as os_detect;

void main() {
  print('''
     OS ID: ${os_detect.operatingSystem}
OS Version: ${os_detect.operatingSystemVersion}''');
  if (os_detect.isAndroid) {
    print('   OS Type: Android');
  } else if (os_detect.isBrowser) {
    print('   OS Type: Browser');
  } else if (os_detect.isFuchsia) {
    print('   OS Type: Fuchsia');
  } else if (os_detect.isIOS) {
    print('   OS Type: iOS');
  } else if (os_detect.isLinux) {
    print('   OS Type: Linux');
  } else if (os_detect.isMacOS) {
    print('   OS Type: MacOS');
  } else if (os_detect.isWindows) {
    print('   OS Type: Windows');
  }
}
