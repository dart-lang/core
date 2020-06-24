// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Unsound entry point. Use until all dependencies are sound.
// Then move `characters_test.dart` back out from `sound_tests/`.

// @dart=2.8
import 'sound_tests/characters_test.dart' as sound;

void main() {
  sound.main();
}
