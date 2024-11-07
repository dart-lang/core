// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Test the generated automatons directly.

import 'package:characters/src/grapheme_clusters/breaks.dart';
import 'package:characters/src/grapheme_clusters/constants.dart';
import 'package:characters/src/grapheme_clusters/table.dart';
import "package:test/test.dart";

import 'src/equiv.dart';
import "src/unicode_tests.dart";

void main() {
  // Test [Breaks] on all the available Unicode tests.
  group("forward automaton:", () {
    for (var (expectedParts, _) in splitTests) {
      for (var (variantParts, kind) in testVariants(expectedParts)) {
        test(testDescription(variantParts) + kind, () {
          var input = variantParts.join("");
          var breaks = Breaks(input, 0, input.length, stateSoTNoBreak);
          var parts = <String>[];
          var start = 0;
          while (start < input.length) {
            var next = breaks.nextBreak();
            expect(next, greaterThan(start));
            parts.add(input.substring(start, next));
            start = next;
          }
          expect(parts, variantParts, reason: partCategories(parts) + kind);
        });
      }
    }
  });

  // Test [BackBreaks] directly on all the available Unicode tests.
  group("backward automaton:", () {
    for (var (expectedParts, _) in splitTests) {
      for (var (variantParts, kind) in testVariants(expectedParts)) {
        test(testDescription(variantParts) + kind, () {
          var input = variantParts.join("");
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
          expect(parts, variantParts, reason: partCategories(parts) + kind);
        });
      }
    }
  });

  // Test the [nextBreak] function on all positions of all the Unicode tests.
  group("nextBreak", () {
    // Should find the next break at any position.
    for (var (expectedParts, _) in splitTests) {
      for (var (variantParts, kind) in testVariants(expectedParts)) {
        test(testDescription(variantParts) + kind, () {
          var input = variantParts.join("");
          var description = partCategories(expectedParts);
          var partCursor = 0;
          var nextExpectedBreak = 0;

          for (var i = 0; i <= input.length; i++) {
            var actualBreak = nextBreak(input, 0, input.length, i);
            expect(actualBreak, nextExpectedBreak,
                reason: "at $i: $description$kind");
            if (i == nextExpectedBreak && i < input.length) {
              nextExpectedBreak += variantParts[partCursor].length;
              partCursor++;
            }
          }
        });
      }
    }
  });

  // Check that automatons are minimal.
  //
  // * All states are reachable from the start states.
  // * No states are indistinguishable wrt. all inputs.
  //
  // That means that no state can be removed, because it is unique and
  // used.
  group("Minimal automaton:", () {
    test("States reachable", () {
      // Expected reachable states.
      var states = {
        stateBreak,
        stateCR,
        stateOther,
        statePrepend,
        scaledStateL,
        scaledStateV,
        scaledStateT,
        statePictographic,
        statePictographicZWJ,
        stateRegionalSingle,
        stateInC,
        stateInCL,
        // Not expected in output.
        // stateSoT,
        // Used as filler and as state after EoT.
        stateSoTNoBreak,
      };
      // Standard reachability algorithm.
      // Fringe of reachable states. Will contain all reachable states once.
      var workList = <int>[idStateSoTNoBreak];
      // All reachable state will be removed from this set,
      // and added to the worklist the first time they are seen.
      var unreachableStates = {...states};

      var step = 0;
      // Continue until all states reachable, or no states left in fringe.
      while (workList.isNotEmpty && unreachableStates.isNotEmpty) {
        step++;
        var state = workList.removeLast();
        for (var c = 0; c < categoryCount; c++) {
          var newState = move(state, c) & ~maskBreak;
          // No unexpected output states.
          expect(states, contains(newState),
              reason: "($state,$c): Unexpected output state");
          // Add to fringe the first time a state is seen.
          if (unreachableStates.remove(newState)) {
            workList.add(newState);
          }
        }
      }
      expect(unreachableStates, isEmpty, reason: "Should be reachable");
      print("Forward states reachable in $step steps");
    });

    test("States distinguishable", () {
      // Classify states into equivalence categories based on whether they
      // can be distinguished by *n* transitions. Start with all states
      // indistinguishable, then create new equivalence classes by splitting
      // existing equivalence classes by whether they transition differ in
      // whether to break on any input category, or whether they transition
      // to states that are distinguishable in the existing equivalence.
      // Continue until no further equivalence classes are introduced,
      // the equivalence classes are trivial (one element each),
      // or (as sanity check) at most `idStateCount` rounds.
      var states = [for (var i = 0; i < idStateCount; i++) i * scaleState];
      var eqClasses = [states];
      var eq = Equivalence(eqClasses);
      for (var r = 0; r <= idStateCount; r++) {
        // Sanity limit.
        var nextEq = Equivalence.distinct(states);
        // Upper bound.
        for (var eqClass in eqClasses) {
          for (var i = 0; i < eqClass.length - 1; i++) {
            var state1 = eqClass[i];
            nextPair:
            for (var j = i + 1; j < eqClass.length; j++) {
              var state2 = eqClass[j];
              for (var c = 0; c < categoryCount; c++) {
                var newState1 = move(state1, c);
                var newState2 = move(state2, c);

                if ((newState1 ^ newState2) & maskBreak != 0 ||
                    !eq.eq(newState1 & ~maskBreak, newState2 & ~maskBreak)) {
                  continue nextPair; // Keep distinguishable.
                }
              }
              nextEq.equate(state1, state2);
            }
          }
        }
        var nextEqClasses = nextEq.classes;
        if (nextEqClasses.length == states.length) {
          print("Forwards states distinguishable in $r steps");
          return; // All needed.
        }
        if (nextEqClasses.length == eqClasses.length) {
          // No progress.
          break;
        }
        eq = nextEq;
        eqClasses = nextEqClasses;
      }
      expect(eqClasses.where((l) => l.length != 1).toList(), isEmpty,
          reason: "Not distinguishable in $idStateCount steps");
    });

    test("States backward reachable", () {
      var workList = <int>[idStateEoTNoBreak];
      var states = {
        stateBreak,
        stateLF,
        stateOther,
        stateExtend,
        scaledStateL,
        scaledStateV,
        scaledStateT,
        statePictographic,
        // -- Only reachable through lookahead.
        stateZWJPictographic | stateRegionalOdd,
        stateRegionalSingle,
        stateInC,
        // -- Only reachable through lookahead.
        stateRegionalEven,
        // -- Not reachable, only used as start state.
        // stateEoT,
        // Used as filler, and state after EoT.
        stateEoTNoBreak,
        stateRegionalLookahead,
        stateZWJPictographicLookahead,
        stateInCLookahead,
        stateInCLLookahead,
      };
      var unreachableStates = {...states};
      var step = 0;
      void visit(int state) {
        if (unreachableStates.remove(state)) {
          workList.add(state);
        }
      }

      while (workList.isNotEmpty) {
        step += 1;
        var state = workList.removeLast();
        for (var c = 0; c < categoryCount; c++) {
          var newState = moveBack(state, c) & ~maskBreak;
          expect(states, contains(newState), reason: "Unexpected output state");
          if (newState == stateRegionalLookahead) {
            if (unreachableStates.remove(newState)) {
              visit(stateRegionalEven);
              visit(stateRegionalOdd);
            }
          } else if (newState == stateZWJPictographicLookahead) {
            if (unreachableStates.remove(newState)) {
              visit(stateZWJPictographic);
              visit(stateExtend);
            }
          } else if (newState == stateInCLookahead ||
              newState == stateInCLLookahead) {
            if (unreachableStates.remove(newState)) {
              visit(stateExtend);
            }
          } else {
            visit(newState);
          }
        }
        if (unreachableStates.isEmpty) {
          print("Backward states reachable in $step steps");
          return;
        }
      }
      expect(unreachableStates, isEmpty, reason: "Should be reachable");
    });

    test("Backward states distinguishable", () {
      // Classify states into equivalence categories based on whether they
      // can be distinguished by *n* transitions. Start with all states
      // indistinguishable, then create new equivalence classes by splitting
      // existing equivalence classes by whether they transition differ in
      // whether to break on any input category, or whether they transition
      // to states that are distinguishable in the existing equivalence.
      // Continue until no further equivalence classes are introduced,
      // the equivalence classes are trivial (one element each),
      // or (as sanity check) at most `idStateCount` rounds.
      //
      // Assume that any lookahead state can be distinguished from any other
      // state.
      var states = [for (var i = 0; i < idStateCount; i++) i * scaleState];
      var eqClasses = [states];
      var eq = Equivalence(eqClasses);

      for (var r = 0; r <= idStateCount; r++) {
        var nextEq = Equivalence<int>.distinct(states);
        // Upper bound.
        for (var eqClass in eqClasses) {
          for (var i = 0; i < eqClass.length - 1; i++) {
            var state1 = eqClass[i];
            nextPair:
            for (var j = i + 1; j < eqClass.length; j++) {
              var state2 = eqClass[j];
              for (var c = 0; c < categoryCount; c++) {
                var backState1 = moveBack(state1, c);
                var backState2 = moveBack(state2, c);
                if ((backState1 ^ backState2) & maskBreak != 0 ||
                    backState1 >= idStateLookaheadMin ||
                    backState2 >= idStateLookaheadMin ||
                    !eq.eq(backState1 & ~maskBreak, backState2 & ~maskBreak)) {
                  continue nextPair; // Keep distinguishable.
                }
              }
              nextEq.equate(state1, state2);
            }
          }
        }
        var nextEqClasses = nextEq.classes;
        if (nextEqClasses.length == eqClasses.length) break;
        if (nextEqClasses.length == states.length) {
          print("Backwards states distinguishable in $r steps");
          return; // All needed.
        }
        eqClasses = nextEqClasses;
      }
      expect(
        eqClasses.where((l) => l.length != 1).toList(),
        isEmpty,
      );
    });
  });
}

List<(List<String> parts, String kind)> testVariants(List<String> parts) {
  // Create three variants of the test by replacing a character with another
  // character in the same category, but opposite BMP-ness, if possible.
  // - One where all possible characters are BMP characters.
  // - One where all possible characters are non-BMP characters.
  // - One where the BMP/non-BMP is the opposite of the original where possible.

  var flipped = <List<int>>[]; // Flipped BMP.
  var upper = <List<int>>[]; // Upper-planes.
  var lower = <List<int>>[]; // BMP only.
  const hasNonBmp = 1; // Has character that is non-BMP where base was BMP.
  const hasBmp = 2; // Has character that is BMP where base was non-BMP.
  var changes = 0; // Or'ed with `hasNonBmp` and `hasBmp`.
  for (var part in parts) {
    flipped.add([]);
    upper.add([]);
    lower.add([]);
    for (var rune in part.runes) {
      int category, runeLC = rune, runeFC = rune, runeUC = rune;
      if (rune < 0x10000) {
        runeLC = rune;
        category = low(rune);
        var other = upperChars[category];
        if (other >= 0) {
          changes |= hasNonBmp;
          runeUC = runeFC = other;
        }
      } else {
        runeUC = rune;
        category = high((rune - 0x10000) >> 10, rune & 0x3FF);
        var other = lowerChars[category];
        if (other >= 0) {
          changes |= hasBmp;
          runeLC = runeFC = other;
        }
      }
      flipped.last.add(runeFC);
      upper.last.add(runeUC);
      lower.last.add(runeLC);
    }
  }
  var variants = [
    (parts, ""),
    if (changes == hasNonBmp | hasBmp)
      // If it's only one or the other, then upperCase or lowerCase has the
      // same content.
      ([...flipped.map(String.fromCharCodes)], "(Flip)"),
    if (changes & hasNonBmp != 0)
      ([...upper.map(String.fromCharCodes)], "(non-BMP)"),
    if (changes & hasBmp != 0) ([...lower.map(String.fromCharCodes)], "(BMP)")
  ];
  return variants;
}
