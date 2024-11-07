// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "dart:io";
import "dart:typed_data";

import "package:characters/src/grapheme_clusters/constants.dart";

import 'debug_names.dart';
import "string_literal_writer.dart";

// Builder for state automata used to find
// next/previous grapheme cluster break.

// The automaton states are described below, and the code builds tables
// for those automatons, then writes the table bytes as a string literal.

//////////////////////////////////////////////////////////////////////////////
// Transition table for grapheme cluster break automaton.
// For each previous state and each input character category,
// emit a new state and whether to break before that input character.
// The table uses `!` to mark a break before the input character,
// and then the output state.
//
// We do not care that there is no break between a start-of-text and
// and end-of-text (and empty text). We could handle that with one extra
// state, but it will never matter for the code using this table.
//
// Stored as string for comparison to actual generated automaton.
const expectedAutomatonDescription = r"""
Cat : State
    :  Brk  CR   Otr  Pre  L    V    T    Pic  PicZ Reg  InC  InCL SoTN SoT :
-----------------------------------------------------------------------------
CR  : !CR  !CR  !CR  !CR  !CR  !CR  !CR  !CR  !CR  !CR  !CR  !CR   CR  !CR  :
Ctl : !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk  Brk !Brk :
Otr : !Otr !Otr !Otr  Otr !Otr !Otr !Otr !Otr !Otr !Otr !Otr !Otr  Otr !Otr :
Ext : !Otr !Otr  Otr  Otr  Otr  Otr  Otr  Pic  Otr  Otr  Otr  Otr  Otr !Otr :
Spc : !Otr !Otr  Otr  Otr  Otr  Otr  Otr  Otr  Otr  Otr  Otr  Otr  Otr !Otr :
Reg : !Reg !Reg !Reg  Reg !Reg !Reg !Reg !Reg !Reg  Otr !Reg !Reg  Reg !Reg :
Pic : !Pic !Pic !Pic  Pic !Pic !Pic !Pic !Pic  Pic !Pic !Pic !Pic  Pic !Pic :
LF  : !Brk  Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk  Brk !Brk :
Pre : !Pre !Pre !Pre  Pre !Pre !Pre !Pre !Pre !Pre !Pre !Pre !Pre  Pre !Pre :
L   : !L   !L   !L    L    L   !L   !L   !L   !L   !L   !L   !L    L   !L   :
V   : !V   !V   !V    V    V    V   !V   !V   !V   !V   !V   !V    V   !V   :
T   : !T   !T   !T    T   !T    T    T   !T   !T   !T   !T   !T    T   !T   :
LV  : !V   !V   !V    V    V   !V   !V   !V   !V   !V   !V   !V    V   !V   :
LVT : !T   !T   !T    T    T   !T   !T   !T   !T   !T   !T   !T    T   !T   :
OInC: !InC !InC !InC  InC !InC !InC !InC !InC !InC !InC !InC  InC  InC !InC :
ZWJ : !Otr !Otr  Otr  Otr  Otr  Otr  Otr  PicZ Otr  Otr  InC  InCL Otr !Otr :
EInE: !Otr !Otr  Otr  Otr  Otr  Otr  Otr  Pic  Otr  Otr  InC  InCL Otr !Otr :
EInL: !Otr !Otr  Otr  Otr  Otr  Otr  Otr  Pic  Otr  Otr  InCL InCL Otr !Otr :
EoT : ! -  ! -  ! -  ! -  ! -  ! -  ! -  ! -  ! -  ! -  ! -  ! -    -    -  :
""";

void writeForwardAutomaton(StringSink buffer, {required bool verbose}) {
  assert(categories.length == categoryCount);
  assert(rowLength.isEven && rowLength >= categoryCount);
  var table = Uint16List(idStateCount * rowLength);
  void transition(int state, int category, int newState, bool breakBefore) {
    table[state * rowLength + category] =
        (newState * scaleState) | (breakBefore ? 0 : flagNoBreak);
    assert(newState < idStateCount, "$state + $category -> $newState");
  }

  for (var state = 0; state < idStateCount; state++) {
    // States that should always be broken after, unless something specifically
    // says otherwise. (And does so in GB1..G5).
    var alwaysBreakBefore =
        state == idStateSoT || state == idStateBreak || state == idStateCR;

    // States that should never be broken after, unless `alwaysBreakBefore`
    // says otherwise (for example the rules in GB1..GB5).
    var neverBreakBefore =
        state == idStateSoTNoBreak || state == idStatePrepend;

    // Other with InCB=None.
    // No rules apply specifically to Other, so break unless an
    // Any rule applies.
    transition(state, categoryOther, idStateOther, !neverBreakBefore);
    // Other with InCB=Consonant.
    // GB9C. (Break unless Any rule applies, or preceded by indic sequence
    // with at least one Linked, `idStateInCL`).
    // Remember having seen InCB=Consonant and no InCB=Linked yet.
    transition(state, categoryOtherIndicConsonant, idStateInC,
        !(neverBreakBefore || state == idStateInCL));

    // CR.
    // GB4 + GB5. Always break, after unless followed by LF, so remember
    // having seen CR (`idStateCR`).
    transition(state, categoryCR, idStateCR, state != idStateSoTNoBreak);

    // LF.
    // GB3 + GB4 + GB5. Always break after. Break before unless following CR.
    transition(state, categoryLF, idStateBreak,
        state != idStateCR && state != idStateSoTNoBreak);

    // Control. (Like CR+LF, without their mutual exception.)
    // GB4 + GB5. Always break before, even after Prepend,
    // and always break after (`idStateBreak`).
    transition(
        state, categoryControl, idStateBreak, state != idStateSoTNoBreak);

    // Ext + ZWJ (including InCB Extend and Linked).
    // GB9 + GB9c + GB11. Never break before Ext or ZWJ,
    // unless required by earlier rule (after Control, CR, LF, SoT).
    // Remember whether after Pic+Ext* or InCB=Consonant(Extend|Linked)*
    if (state == idStatePictographic) {
      // GB9 + GB11, after Pic+Ext*.
      // Extend with InCB=None.
      transition(state, categoryExtend, idStatePictographic, false);
      // Extend with InCB=Extend.
      transition(state, categoryExtendIndicExtend, idStatePictographic, false);
      // Extend with InCB=Linked.
      transition(state, categoryExtendIndicLinked, idStatePictographic, false);
      // ZWJ.
      transition(state, categoryZWJ, idStatePictographicZWJ, false);
    } else if (state == idStateInC || state == idStateInCL) {
      // GB9 + GB9c, after InCB Consonant + (Extend|Linked)*.
      // Extend with InCB=None.
      transition(state, categoryExtend, idStateOther, false);
      // Extend with InCB=Extend.
      transition(state, categoryExtendIndicExtend, state, false);
      // ZWJ (which has InCB=Extend).
      transition(state, categoryZWJ, state, false);
      // Extend with InCB=Linked.
      transition(state, categoryExtendIndicLinked, idStateInCL, false);
    } else {
      // GB9 alone.
      // No special rules for breaking after,
      // break before only if required by GB1-GB5.
      transition(state, categoryExtend, idStateOther, alwaysBreakBefore);
      transition(
          state, categoryExtendIndicExtend, idStateOther, alwaysBreakBefore);
      transition(
          state, categoryExtendIndicLinked, idStateOther, alwaysBreakBefore);
      transition(state, categoryZWJ, idStateOther, alwaysBreakBefore);
    }
    // Regional indicator.
    // GB12 + GB13: Don't break if after an odd number of Reg.
    // Otherwise remember an odd number of Reg, and break before unless
    // prior state says not to.
    if (state == idStateRegionalSingle) {
      transition(state, categoryRegionalIndicator, idStateOther, false);
    } else {
      // Break unless prior state says not to.
      transition(state, categoryRegionalIndicator, idStateRegionalSingle,
          !neverBreakBefore);
    }
    // Prepend.
    // GB9b: Never break after Prepend (unless required by next character
    // due to GB1..GB5).
    // Break before unless prior state says not to.
    transition(state, categoryPrepend, idStatePrepend, !neverBreakBefore);
    // Spacing mark. (Like Extend but doesn't interact with emojis).
    // GB9a. Don't break before, unless must always break after prior char.
    transition(state, categorySpacingMark, idStateOther, alwaysBreakBefore);
    // Hangul.
    // GB6+GB7+GB8.
    // Don't break if T follows V and V follows L.
    transition(
        state, categoryL, stateL, !(neverBreakBefore || state == stateL));
    transition(
        state, categoryLV, stateV, !(neverBreakBefore || state == stateL));
    transition(
        state, categoryLVT, stateT, !(neverBreakBefore || state == stateL));
    transition(state, categoryV, stateV,
        !(neverBreakBefore || state == stateL || state == stateV));
    transition(state, categoryT, stateT,
        !(neverBreakBefore || state == stateV || state == stateT));
    // Emoji
    // GB11.
    transition(
        state,
        categoryPictographic,
        idStatePictographic,
        state != idStatePrepend &&
            state != idStatePictographicZWJ &&
            state != idStateSoTNoBreak);
    // End of input.
    // GB2.
    transition(state, categoryEoT, idStateSoTNoBreak,
        state != idStateEoT && state != idStateSoTNoBreak);

    // Pad table if necessary.
    for (var c = categoryCount; c < rowLength; c++) {
      transition(state, c, idStateSoTNoBreak, false);
    }
  }
  const prefix = "const _stateMachine = ";
  buffer.write(prefix);
  var stringWriter = StringLiteralWriter(buffer, padding: 4);
  stringWriter.start(prefix.length);
  for (var i = 0; i < table.length; i++) {
    stringWriter.add(table[i]);
  }
  stringWriter.end();
  buffer.write(";\n");
  buffer.write(_moveMethod);

  if (verbose) _writeForwardTable(table, rowLength);
}

// Round up to multiple of shift. (Chosen because the value is 19.)
const rowLength = automatonRowLength;

const String _moveMethod = """
int move(int state, int inputCategory) =>
    _stateMachine.codeUnitAt(((state & ~$maskBreak) << $stateShift) + inputCategory);
""";

const String _moveBackMethod = """
int moveBack(int state, int inputCategory) =>
    _backStateMachine.codeUnitAt(((state & ~$maskBreak) << $stateShift) + inputCategory);
""";

const categories = [
  categoryOther,
  categoryCR,
  categoryLF,
  categoryControl,
  categoryExtend,
  categoryRegionalIndicator,
  categoryPrepend,
  categorySpacingMark,
  categoryL,
  categoryV,
  categoryT,
  categoryLV,
  categoryLVT,
  categoryPictographic,
  categoryOtherIndicConsonant,
  categoryZWJ,
  categoryExtendIndicExtend,
  categoryExtendIndicLinked,
  categoryEoT,
];

//////////////////////////////////////////////////////////////////////////////
// Transition table for *reverse* grapheme cluster break automaton.
// For each previous state and each previous input character category,
// emit a new state and whether to break after that input character.
// The table uses `!` to mark a break before the input character,
// and then the output state.
// Some breaks cannot be determined without look-ahead. Those return
// specially marked states, with `$` in the name.
// Those states will trigger a special code path which will then update
// the state and/or index as necessary.
//
// Stored as string for comparison to actual generated automaton.
const expectedBackAutomatonDescription = r"""
Cat : State
    :  Brk  LF   Otr  Ext  L    V    T    Pic  LA   Reg  InC  RegE EoTN EoT :
-----------------------------------------------------------------------------
CR  : !Brk  Brk !Brk !Brk !Brk !Brk !Brk !Brk   -  !Brk !Brk !Brk  Brk !Brk :
Ctl : !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk   -  !Brk !Brk !Brk  Brk !Brk :
Otr : !Otr !Otr !Otr  Otr !Otr !Otr !Otr !Otr   -  !Otr !Otr !Otr  Otr !Otr :
Ext : !Ext !Ext !Ext  Ext !Ext !Ext !Ext !Ext  LA  !Ext !Ext !Ext  Ext !Ext :
Spc : !Ext !Ext !Ext  Ext !Ext !Ext !Ext !Ext   -  !Ext !Ext !Ext  Ext !Ext :
Reg : !Reg !Reg !Reg  Reg !Reg !Reg !Reg !Reg  RegE$LARe!Reg !LA   Reg !Reg :
Pic : !Pic !Pic !Pic  Pic !Pic !Pic !Pic !Pic  Pic !Pic !Pic !Pic  Pic !Pic :
LF  : !LF  !LF  !LF  !LF  !LF  !LF  !LF  !LF    -  !LF  !LF  !LF   LF  !LF  :
Pre : !Otr !Otr  Otr  Otr  Otr  Otr  Otr  Otr   -   Otr  Otr  Otr  Otr !Otr :
L   : !L   !L   !L    L    L    L   !L   !L     -  !L   !L   !L    L   !L   :
V   : !V   !V   !V    V   !V    V    V   !V     -  !V   !V   !V    V   !V   :
T   : !T   !T   !T    T   !T   !T    T   !T     -  !T   !T   !T    T   !T   :
LV  : !L   !L   !L    L   !L    L    L   !L     -  !L   !L   !L    L   !L   :
LVT : !L   !L   !L    L   !L   !L    L   !L     -  !L   !L   !L    L   !L   :
OInC: !InC !InC !InC  InC !InC !InC !InC !InC   -  !InC !InC !InC  InC !InC :
ZWJ : !Ext !Ext !Ext  Ext !Ext !Ext !Ext $LAZP  -  !Ext $LAIC!Ext  Ext !Ext :
EInE: !Ext !Ext !Ext  Ext !Ext !Ext !Ext !Ext  LA  !Ext $LAIC!Ext  Ext !Ext :
EInL: !Ext !Ext !Ext  Ext !Ext !Ext !Ext !Ext  LA  !Ext $LAIL!Ext  Ext !Ext :
SoT : ! -  ! -  ! -  ! -  ! -  ! -  ! -  ! -    -  ! -  ! -  ! -    -    -  :
""";

// The look-ahead states are recognized and calls out to code that looks
// ahead (backwards in the string) to see what the state should really be after
const backStates = [
  idStateBreak,
  idStateLF,
  idStateOther,
  idStateExtend,
  stateL,
  stateV,
  stateT,
  idStatePictographic,
  idStateZWJPictographic | idStateRegionalOdd, // Known disjoint look-ahead.
  idStateRegionalSingle,
  idStateInC,
  idStateRegionalEven,
  idStateEoTNoBreak,
  idStateEoT,
];

void writeBackwardAutomaton(StringSink buffer, {required bool verbose}) {
  assert(categories.length <= rowLength);
  var table = Uint16List(backStateCount * rowLength);
  assert(scaleState << stateShift == rowLength);
  void transition(int state, int category, int newState, bool breakBefore) {
    table[state * rowLength + category] =
        (newState * scaleState) | (breakBefore ? 0 : flagNoBreak);
    assert(newState < idStateCount || newState >= idStateLookaheadMin,
        "$state + $category -> $newState");
  }

  for (var state in backStates) {
    if (state == idStateZWJPictographic | idStateRegionalOdd) {
      // Special state where we know the previous character
      // to some degree, due to having done look-ahead.
      // Most inputs are unreachable. Use EoT-nobreak as unreachable marker.
      for (var i = 0; i <= categoryCount; i++) {
        transition(state, i, idStateEoTNoBreak, false);
      }
      transition(state, categoryExtend, idStateZWJPictographic, false);
      // Indic Conjunct "extend" and "Linked" behave like "Extend" here.
      transition(
          state, categoryExtendIndicExtend, idStateZWJPictographic, false);
      transition(
          state, categoryExtendIndicLinked, idStateZWJPictographic, false);
      transition(state, categoryPictographic, idStatePictographic, false);
      transition(state, categoryRegionalIndicator, idStateRegionalEven, false);
      // Remaining inputs are unreachable.
      continue;
    }
    transition(state, categoryOther, idStateOther,
        state != idStateExtend && state != idStateEoTNoBreak);
    transition(state, categoryOtherIndicConsonant, idStateInC,
        state != idStateExtend && state != idStateEoTNoBreak);
    transition(state, categoryLF, idStateLF, state != idStateEoTNoBreak);
    transition(state, categoryCR, idStateBreak,
        state != idStateLF && state != idStateEoTNoBreak);
    transition(
        state, categoryControl, idStateBreak, state != idStateEoTNoBreak);

    var breakBeforeExtend = state != idStateExtend &&
        state != idStateZWJPictographic &&
        state != idStateEoTNoBreak;
    transition(state, categoryExtend, idStateExtend, breakBeforeExtend);
    if (state != idStateInC) {
      transition(
          state, categoryExtendIndicExtend, idStateExtend, breakBeforeExtend);
      transition(
          state, categoryExtendIndicLinked, idStateExtend, breakBeforeExtend);
    } else {
      // If these come just before an InCB Consonant, look ahead.
      transition(state, categoryExtendIndicExtend, idStateInCLookahead, true);
      transition(state, categoryExtendIndicLinked, idStateInCLLookahead, true);
    }
    transition(state, categorySpacingMark, idStateExtend,
        state != idStateExtend && state != idStateEoTNoBreak);
    if (state == idStatePictographic) {
      // Break-before value has no effect on lookahead states.
      transition(state, categoryZWJ, idStateZWJPictographicLookahead, true);
    } else if (state == idStateInC) {
      transition(state, categoryZWJ, idStateInCLookahead, true);
    } else {
      transition(state, categoryZWJ, idStateExtend,
          state != idStateExtend && state != idStateEoTNoBreak);
    }
    if (state == idStateRegionalEven) {
      transition(state, categoryRegionalIndicator, idStateRegionalOdd, true);
    } else if (state == idStateRegionalSingle) {
      transition(
          state, categoryRegionalIndicator, idStateRegionalLookahead, true);
    } else {
      transition(state, categoryRegionalIndicator, idStateRegionalSingle,
          state != idStateExtend && state != idStateEoTNoBreak);
    }
    transition(state, categoryPrepend, idStateOther,
        state == idStateBreak || state == idStateCR || state == idStateEoT);
    transition(
        state,
        categoryL,
        stateL,
        state != idStateExtend &&
            state != stateL &&
            state != stateV &&
            state != idStateEoTNoBreak);
    transition(
        state,
        categoryLV,
        stateL,
        state != idStateExtend &&
            state != stateV &&
            state != stateT &&
            state != idStateEoTNoBreak);
    transition(
        state,
        categoryLVT,
        stateL,
        state != idStateExtend &&
            state != stateT &&
            state != idStateEoTNoBreak);
    transition(
        state,
        categoryV,
        stateV,
        state != idStateExtend &&
            state != stateT &&
            state != stateV &&
            state != idStateEoTNoBreak);
    transition(
        state,
        categoryT,
        stateT,
        state != idStateExtend &&
            state != stateT &&
            state != idStateEoTNoBreak);
    transition(
        state,
        categoryPictographic,
        idStatePictographic,
        state != idStateExtend &&
            state != idStateZWJPictographic &&
            state != idStateEoTNoBreak);
    // Use EoT-NoBreak as marker for unreachable.
    transition(state, categorySoT, idStateEoTNoBreak,
        state != idStateEoT && state != idStateEoTNoBreak);
    for (var i = categoryCount; i < rowLength; i++) {
      transition(state, i, idStateEoTNoBreak, false);
    }
  }
  var stringWriter = StringLiteralWriter(buffer, padding: 4);
  buffer.write("const _backStateMachine = ");
  stringWriter.start("const _backStateMachine = ".length);
  for (var i = 0; i < table.length; i++) {
    stringWriter.add(table[i]);
  }
  stringWriter.end();
  buffer.write(";\n");
  buffer.write(_moveBackMethod);
  if (verbose) _writeBackTable(table, rowLength);
}

void _writeForwardTable(Uint16List table, int rowLength) {
  var automaton = _generateTable(table, rowLength, idStateCount,
      stateShortNames, categoryShortNames, idStateSoTNoBreak);
  stdout.write(automaton);
  if (automaton != expectedAutomatonDescription) {
    stderr
      ..writeln("DIFFERS FROM EXPECTATION:")
      ..write(expectedAutomatonDescription);
  }
}

void _writeBackTable(Uint16List table, int rowLength) {
  var backCategoryNames = [...categoryShortNames]..[categorySoT] = "SoT";
  var backAutomaton = _generateTable(
    table,
    rowLength,
    backStateCount,
    backStateShortNames,
    backCategoryNames,
    idStateEoTNoBreak,
  );
  stdout.write(backAutomaton);
  if (backAutomaton != expectedBackAutomatonDescription) {
    stderr
      ..writeln("DIFFERS FROM EXPECTATION:")
      ..write(expectedBackAutomatonDescription);
  }
}

/// Writes an automaton table to string, for debugging.
///
/// The table has size `maxState * rowLength`, and `rowLength >= categoryCount`.
/// The [stateNames] are the names of the states for this particular automaton
/// (differs between forward and backward automaton).
/// It has a name for every target state that occurs in the *table*.
/// The table contains states multiplied by `rowLength`, possibly with the
/// first bit set as a break-before/after flag.
/// The [stateCount] is the number of "real" states that occur in the table,
/// states above that, if any, are synthetic states that trigger non-
/// automaton based scanning.
/// The [ignoreState] is a single state that is not displayed.
String _generateTable(Uint16List table, int rowLength, int stateCount,
    List<String> stateNames, List<String> categoryNames, int ignoreState) {
  assert(rowLength >= categoryCount);
  assert(table.length == stateCount * rowLength);
  var buf = StringBuffer();
  buf.writeln("Cat : State");
  var preHeaderLength = buf.length;
  buf.write("    : ");
  for (var i = 0; i < stateCount; i++) {
    buf
      ..write(' ')
      ..write(stateNames[i].padRight(4));
  }
  buf.writeln(":");
  var lineLength = buf.length - preHeaderLength;
  buf.writeln("-" * (lineLength - 1));
  for (var ci = 0; ci < categoryCount; ci++) {
    var catName = categoryNames[ci];
    buf
      ..write(catName.padRight(4))
      ..write(': ');

    for (var si = 0; si < stateCount; si++) {
      var value = table[si * rowLength + ci];
      var noBreak = value & maskBreak != flagBreak;
      var targetState = value ~/ rowLength;
      var prefix = " ";
      if (targetState >= stateCount) {
        // Synthetic state (look ahead).
        prefix = r"$";
      } else if (!noBreak) {
        prefix = "!";
      }
      var idStateName = stateNames[targetState];
      // EoT is marker for unreachable states.
      if (targetState == ignoreState) idStateName = " -  ";
      buf
        ..write(prefix)
        ..write(idStateName.padRight(4));
    }
    buf.writeln(":");
  }
  return buf.toString();
}
