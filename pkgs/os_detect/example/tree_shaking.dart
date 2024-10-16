// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Try compiling this example with (if on Linux):
//
//   dart compile exe --target-os=linux tree_shaking.dart
//
// then check that "SOMETHING ELSE" does not occur in the
// output `tree_shaking.exe` program, e.g.:
//
//   strings tree_shaking.exe | grep SOMETHING
//
// which shows no matches.

import 'package:os_detect/os_detect.dart' as platform;

void main() {
  if (platform.isLinux) {
    print('Is Linux');
  } else {
    print('SOMETHING ELSE');
  }
  if (platform.operatingSystem == 'linux') {
    print('Is Linux');
  } else {
    print('SOMETHING ELSE');
  }
}
