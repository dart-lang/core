// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Test the generated automatons directly.

import 'package:characters/src/grapheme_clusters/breaks.dart';
import 'package:characters/src/grapheme_clusters/constants.dart';
import 'package:characters/src/grapheme_clusters/table.dart';
import 'package:test/test.dart';

import '../tool/src/debug_names.dart';
import 'src/equiv.dart';
import 'src/unicode_tests.dart';

// Can be set to true while debugging.
const verbose = false;

void main() {
  // Test [Breaks] on all the available Unicode tests.
  group('forward automaton:', () {
    for (var expectedParts in splitTests) {
      for (var (variantParts, kind) in testVariants(expectedParts)) {
        test(testDescription(variantParts) + kind, () {
          var input = variantParts.join('');
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
  group('backward automaton:', () {
    for (var expectedParts in splitTests) {
      for (var (variantParts, kind) in testVariants(expectedParts)) {
        test(testDescription(variantParts) + kind, () {
          var input = variantParts.join('');
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

  // Test the top-level [nextBreak] function on all positions of all
  // the Unicode tests.
  group('nextBreak', () {
    // Should find the next break at any position.
    for (var expectedParts in splitTests) {
      for (var (variantParts, kind) in testVariants(expectedParts)) {
        test(testDescription(variantParts) + kind, () {
          var input = variantParts.join('');
          var description = partCategories(expectedParts);
          var partCursor = 0;
          var nextExpectedBreak = 0;

          for (var i = 0; i <= input.length; i++) {
            var actualBreak = nextBreak(input, 0, input.length, i);
            expect(actualBreak, nextExpectedBreak,
                reason: 'at $i: $description$kind');
            if (i == nextExpectedBreak && i < input.length) {
              nextExpectedBreak += variantParts[partCursor].length;
              partCursor++;
            }
          }
        });
      }
    }
  });

  // Test the top-level [previousBreak] function on all positions of all
  // the Unicode tests.
  group('previousBreak', () {
    // Should find the next break at any position.
    for (var expectedParts in splitTests) {
      for (var (variantParts, kind) in testVariants(expectedParts)) {
        test(testDescription(variantParts) + kind, () {
          var input = variantParts.join('');
          var description = partCategories(expectedParts);
          var partCursor = 0;
          var nextBreak = 0;
          var expectedBreak = 0;

          for (var i = 0; i <= input.length; i++) {
            if (i == nextBreak) {
              expectedBreak = nextBreak;
              if (i < input.length) {
                nextBreak += variantParts[partCursor++].length;
              }
            }
            var actualBreak = previousBreak(input, 0, input.length, i);
            expect(actualBreak, expectedBreak,
                reason: 'at $i: $description$kind');
          }
        });
      }
    }
  });

  // Test the top-level [previousBreak] function on all positions of all
  // the Unicode tests.
  group('isGraphemeClusterBreak', () {
    // Should find the next break at any position.
    for (var expectedParts in splitTests) {
      for (var (variantParts, kind) in testVariants(expectedParts)) {
        test(testDescription(variantParts) + kind, () {
          var input = variantParts.join('');
          var description = partCategories(expectedParts);
          var partCursor = 0;
          var nextBreak = 0;

          for (var i = 0; i <= input.length; i++) {
            expect(isGraphemeClusterBoundary(input, 0, input.length, i),
                i == nextBreak,
                reason: 'at $i: $description');

            if (i == nextBreak && i < input.length) {
              nextBreak += variantParts[partCursor++].length;
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
  group('Minimal automaton:', () {
    test('States reachable', () {
      // Expected reachable states.
      var states = {
        stateBreak,
        stateCR,
        stateOther,
        statePrepend,
        stateL,
        stateV,
        stateT,
        statePictographic,
        statePictographicZWJ,
        stateRegionalSingle,
        stateInC,
        stateInCL,
        stateSoT, // Entry point.
        stateSoTNoBreak, // Entry point.
        stateCAny, // Entry point.
        stateCZWJ,
        stateCExZ,
        stateCIE,
        stateCIEZ,
        stateCIL,
        stateCILZ,
        stateCZIE,
        stateCZIL,
        stateCReg,
        stateCExt,
      };
      // Standard reachability algorithm.
      // Fringe of reachable states. Will contain all reachable states once.

      var entryStates = [stateSoTNoBreak, stateSoT, stateCAny];

      // All reachable state will be removed from this set,
      // and added to the worklist the first time they are seen.
      var unreachableStates = {...states}..removeAll(entryStates);
      // Start with entry points.
      var workList = <int>[...entryStates];
      var nextStepList = <int>[];

      var step = 1;
      // Continue until all states reachable, or no states left in fringe.
      while ((workList.isNotEmpty || nextStepList.isNotEmpty) &&
          unreachableStates.isNotEmpty) {
        if (workList.isEmpty) {
          workList = nextStepList;
          nextStepList = [];
          step++;
        }
        var state = workList.removeLast();
        for (var c = 0; c < categoryCount; c++) {
          var newState = move(state, c) & maskState;
          if (newState & maskFlags == flagLookahead) {
            // A lookahead in the forwards automaton uses the
            // backwards automaton to determine whether to break.
            // It should leave the context-unaware part of the states
            // and reach a state that should otherwise be reachable too.
            continue;
          }
          // No unexpected output states.
          expect(states, contains(newState),
              reason: '($state,$c): Unexpected output state');
          // Add to fringe the first time a state is seen.
          if (unreachableStates.remove(newState)) {
            nextStepList.add(newState);
          }
        }
      }
      if (unreachableStates.isNotEmpty) {
        expect(unreachableStates.map(stateShortName).toList(), isEmpty,
            reason: 'Should be reachable');
      }
      if (verbose) print('Forward states reachable in $step steps');
    });

    test('States distinguishable', () {
      // Classify states into equivalence categories based on whether they
      // can be distinguished by *n* transitions. Start with all states
      // indistinguishable, then create new equivalence classes by splitting
      // existing equivalence classes by whether they transition differ in
      // whether to break on any input category, or whether they transition
      // to states that are distinguishable in the existing equivalence.
      // Continue until no further equivalence classes are introduced,
      // the equivalence classes are trivial (one element each),
      // or (as sanity check) at most `idStateCount` rounds.

      var states = [for (var i = 0; i < stateLimit; i += automatonRowLength) i];
      var eqClasses = [states];
      var eq = Equivalence(eqClasses);
      var stateCount = stateLimit ~/ automatonRowLength;
      for (var r = 0; r <= stateCount; r++) {
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

                if ((newState1 ^ newState2) & maskFlags != 0 ||
                    !eq.eq(newState1 & maskState, newState2 & maskState)) {
                  continue nextPair; // Keep distinguishable.
                }
              }
              nextEq.equate(state1, state2);
            }
          }
        }
        var prevEqClasses = eqClasses;
        eqClasses = nextEq.classes;
        eq = nextEq;
        if (prevEqClasses.length == eqClasses.length) break; // No progress.
        if (prevEqClasses.length == states.length) {
          // Maximal progress achieved.
          if (verbose) print('Forwards states distinguishable in $r steps');
          break;
        }
      }
      expect(eqClasses, everyElement(hasLength(1)),
          reason: 'Not distinguishable in $stateCount steps');
    });

    test('States backward reachable', () {
      var states = {
        stateBreak,
        stateLF,
        stateOther,
        stateExtend,
        stateL,
        stateV,
        stateT,
        statePictographic,
        // -- Only reachable through lookahead.
        stateRegionalOdd,
        stateRegionalSingle,
        stateInC,
        // -- Only reachable through lookahead.
        stateRegionalEven,
        // -- Not reachable, only used as start state.
        stateEoT,
        // Used as filler, and state after EoT.
        stateEoTNoBreak,
        stateLookaheadZWJPictographic,
        stateLookaheadInC,
        stateLookaheadInCL,
        stateLookaheadRegionalEven,
        stateLookaheadRegionalOdd,
      };
      var entryStates = <int>[stateEoTNoBreak, stateEoT];
      var unreachableStates = {...states}..removeAll(entryStates);
      var workList = <int>[...entryStates];
      var nextStepList = <int>[];
      var step = 1;

      while ((workList.isNotEmpty || nextStepList.isNotEmpty) &&
          unreachableStates.isNotEmpty) {
        if (workList.isEmpty) {
          step++;
          workList = nextStepList;
          nextStepList = [];
        }
        var state = workList.removeLast();
        for (var c = 0; c < categoryCount; c++) {
          var newState = moveBack(state, c) & maskState;
          expect(states, contains(newState), reason: 'Unexpected output state');
          if (unreachableStates.remove(newState)) {
            nextStepList.add(newState);
          }
        }
        if (unreachableStates.isEmpty) {
          if (verbose) print('Backward states reachable in $step steps');
          return;
        }
      }
      if (unreachableStates.isNotEmpty) {
        expect(unreachableStates.map(stateShortName).toList(), isEmpty,
            reason: 'Should be reachable, not reached in $step steps');
      }
    });

    test('Backward states distinguishable', () {
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
      var states = [
        for (var i = 0; i < backStateLimit; i += automatonRowLength) i
      ];
      var eqClasses = [states];
      var eq = Equivalence(eqClasses);

      var stateCount = backStateLimit ~/ automatonRowLength;
      for (var r = 0; r <= stateCount; r++) {
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
                if ((backState1 ^ backState2) & maskFlags != 0 ||
                    backState1 >= stateLookaheadMin ||
                    backState2 >= stateLookaheadMin ||
                    !eq.eq(backState1 & maskState, backState2 & maskState)) {
                  continue nextPair; // Keep distinguishable.
                }
              }
              nextEq.equate(state1, state2);
            }
          }
        }
        var prevEqClasses = eqClasses;
        eqClasses = nextEq.classes;
        eq = nextEq;
        if (prevEqClasses.length == eqClasses.length) break; // No progress.
        if (prevEqClasses.length == states.length) {
          // Maximal progress achieved.
          if (verbose) print('Backwards states distinguishable in $r steps');
          break;
        }
      }
      expect(eqClasses, everyElement(hasLength(1)));
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
      category = categoryOf(rune);
      if (rune < 0x10000) {
        runeLC = rune;
        var other = upperChars[category];
        if (other >= 0) {
          changes |= hasNonBmp;
          runeUC = runeFC = other;
        }
      } else {
        runeUC = rune;
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
    (parts, ''),
    if (changes == hasNonBmp | hasBmp)
      // If it's only one or the other, then upperCase or lowerCase has the
      // same content.
      ([...flipped.map(String.fromCharCodes)], '(Flip)'),
    if (changes & hasNonBmp != 0)
      ([...upper.map(String.fromCharCodes)], '(non-BMP)'),
    if (changes & hasBmp != 0) ([...lower.map(String.fromCharCodes)], '(BMP)'),
    // Also include a version where the case is not at start/end of input.
    // (Wrap in control characters to ensure the breaks are still correct.)
    (['\x00', ...parts, '\x00'], '(Wrapped)'),
  ];
  return variants;
}
