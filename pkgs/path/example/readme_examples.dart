// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// This file contains the code snippets for path/README.md.

// ignore_for_file: unused_import, unused_local_variable, prefer_final_locals

// #docregion import
import 'package:path/path.dart' as p;
// #enddocregion import

void main() {
  // #docregion join
  p.join('directory', 'file.txt');
  // #enddocregion join

  // #docregion context
  var context = p.Context(style: p.Style.windows);
  context.join('directory', 'file.txt');
  // #enddocregion context
}
