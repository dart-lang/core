// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// This file contains the code snippets for collection/README.md.

import 'package:collection/collection.dart';

void main() {
  // #docregion map-equality
  const MapEquality<String, List<int>>(
    keys: IdentityEquality<String>(),
    values: ListEquality<int>(),
  );
  // #enddocregion map-equality
}
