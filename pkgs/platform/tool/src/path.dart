// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:path/path.dart';

export 'package:path/path.dart' show basename, dirname, join;

/// The parent directory of the directory of [path].
String parentDirectory(String path) => dirname(dirname(path));
