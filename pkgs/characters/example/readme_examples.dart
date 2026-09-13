// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// This file contains the code snippets for characters/README.md.

import 'package:characters/characters.dart';

// #docregion source-index-vs-range
// Using String indices.
String? firstTagString(String source) {
  var start = source.indexOf('<') + 1;
  if (start > 0) {
    var end = source.indexOf('>', start);
    if (end >= 0) {
      return source.substring(start, end);
    }
  }
  return null;
}

// Using CharacterRange operations.
Characters? firstTagCharacters(Characters source) {
  var range = source.findFirst('<'.characters);
  if (range != null && range.moveUntil('>'.characters)) {
    return range.currentCharacters;
  }
  return null;
}
// #enddocregion source-index-vs-range
