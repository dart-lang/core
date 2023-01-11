// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../override.dart';

const String _os =
    String.fromEnvironment('dart.os.name', defaultValue: 'unknown');
const String _osVersion = String.fromEnvironment('dart.os.version');

const OperatingSystem platformOS = OperatingSystem(_os, _osVersion);
