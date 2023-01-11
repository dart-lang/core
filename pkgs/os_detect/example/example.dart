// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:os_detect/os_detect.dart' as os_detect;

void main() {
  print('''
        OS: ${os_detect.operatingSystem}
OS Version: ${os_detect.operatingSystemVersion}
''');
}
