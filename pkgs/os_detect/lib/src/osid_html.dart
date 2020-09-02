// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "dart:html";

import '../override.dart';

const String _os = "browser";
String get _osVersion => window.navigator.appVersion;

final OperatingSystemID platformOSID = OperatingSystemID(_os, _osVersion);
