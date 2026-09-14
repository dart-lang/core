// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// A case that `dart fix` currently migrates *incorrectly*.
//
// Every transform in `lib/fix_data.yaml` replaces a simple identifier with a
// dotted expression, and the analyzer does not add the `{}` braces that a
// string interpolation then requires. The `.expect` file records today's
// (broken) output on purpose, so this test starts failing if the analyzer ever
// learns to add the braces. See `README.md`.

import 'package:os_detect/os_detect.dart';

// Bare `$identifier` interpolation: migrated to invalid code.
String get broken1 => 'OS: $operatingSystem';
String get broken2 => 'Linux: $isLinux';

// Already braced: migrated correctly.
String get ok => 'OS: ${operatingSystemVersion}';
