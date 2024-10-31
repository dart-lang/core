// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Not all categories are currently used in tests.
// They're retained in case we add more tests.
// ignore_for_file: unreachable_from_main

import 'package:characters/src/grapheme_clusters/breaks.dart';
import 'package:characters/src/grapheme_clusters/constants.dart';
import "package:test/test.dart";

import '../tool/src/automaton_builder.dart';
import "src/unicode_tests.dart";

void main() {
  group("forward automaton:", () {
    for (var (expectedParts, _) in splitTests) {
      test(testDescription(expectedParts), () {
        var input = expectedParts.join("");
        var breaks = Breaks(input, 0, input.length, stateSoTNoBreak);
        var parts = <String>[];
        var start = 0;
        while (start < input.length) {
          var next = breaks.nextBreak();
          expect(next, greaterThan(start));
          parts.add(input.substring(start, next));
          start = next;
        }
        expect(parts, expectedParts, reason: partCategories(parts));
      });
    }
  });
  group("backward automaton:", () {
    for (var (expectedParts, _) in splitTests) {
      test(testDescription(expectedParts), () {
        var input = expectedParts.join("");
        var breaks = BackBreaks(input, input.length, 0, stateEoTNoBreak);
        var parts = <String>[];
        var start = input.length;
        while (start > 0) {
          var next = breaks.nextBreak();
          expect(next, lessThan(start));
          parts.add(input.substring(next, start));
          start = next;
        }
        parts = [...parts.reversed];
        expect(parts, expectedParts, reason: partCategories(parts));
      });
    }
  });
}
