// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// `dart:html` is only available on dart2js (dart2wasm won't support it), so we
// can check availability of it to test whether we're compiling to JS. Other
// targets (AOT, JIT, Wasm) support 64-bit `int`s.
export 'int64_native.dart' if (dart.library.html) 'int64_emulated.dart';
