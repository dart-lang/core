// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import '../override.dart';

String get _os => Platform.operatingSystem;
String get _osVersion => Platform.operatingSystemVersion;

final OperatingSystem platformOS = OperatingSystem(_os, _osVersion);
