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
  assert(automatonRowLength.isEven && automatonRowLength >= categoryCount);
  var table = Uint16List(idStateCount * automatonRowLength);
  void transition(
      StateId stateId, int category, StateId newStateId, bool breakBefore) {
    assert(newStateId < idStateCount, "$stateId + $category -> $newStateId");
    table[stateId * automatonRowLength + category] =
        (newStateId * scaleState) | (breakBefore ? flagBreak : flagNoBreak);
  }

  for (var state = 0 as StateId;
      state < idStateCount;
      state = (state + 1) as StateId) {
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
        state, categoryL, idStateL, !(neverBreakBefore || state == idStateL));
    transition(
        state, categoryLV, idStateV, !(neverBreakBefore || state == idStateL));
    transition(
        state, categoryLVT, idStateT, !(neverBreakBefore || state == idStateL));
    transition(state, categoryV, idStateV,
        !(neverBreakBefore || state == idStateL || state == idStateV));
    transition(state, categoryT, idStateT,
        !(neverBreakBefore || state == idStateV || state == idStateT));
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
    for (var c = categoryCount; c < automatonRowLength; c++) {
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

  if (verbose) _writeForwardTable(table, automatonRowLength);
}

const String _moveMethod = """
int move(int state, int inputCategory) =>
    _stateMachine.codeUnitAt((state & $maskState) + inputCategory);
""";

const String _moveBackMethod = """
int moveBack(int state, int inputCategory) =>
    _backStateMachine.codeUnitAt((state & $maskState) + inputCategory);
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
    :  Brk  LF   Otr  Ext  L    V    T    Pic  RegO Reg  InC  RegE EoTN EoT  LAZP LAIC LAIL LARe LARo:
------------------------------------------------------------------------------------------------------
CR  : !Brk  Brk !Brk !Brk !Brk !Brk !Brk !Brk   -  !Brk !Brk !Brk  Brk !Brk #Ext #Ext #Ext  RegE!RegO:
Ctl : !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk   -  !Brk !Brk !Brk  Brk !Brk #Ext #Ext #Ext  RegE!RegO:
Otr : !Otr !Otr !Otr  Otr !Otr !Otr !Otr !Otr   -  !Otr !Otr !Otr  Otr !Otr !Otr !Otr !Otr  RegE!RegO:
Ext : !Ext !Ext !Ext  Ext !Ext !Ext !Ext !Ext   -  !Ext !Ext !Ext  Ext !Ext  LAZP!Ext !Ext  RegE!RegO:
Spc : !Ext !Ext !Ext  Ext !Ext !Ext !Ext !Ext   -  !Ext !Ext !Ext  Ext !Ext !Ext !Ext !Ext  RegE!RegO:
Reg : !Reg !Reg !Reg  Reg !Reg !Reg !Reg !Reg  RegE$LARe!Reg !RegO Reg !Reg !Reg !Reg !Reg  LARo LARe:
Pic : !Pic !Pic !Pic  Pic !Pic !Pic !Pic !Pic   -  !Pic !Pic !Pic  Pic !Pic  Pic !Pic !Pic  RegE!RegO:
LF  : !LF  !LF  !LF  !LF  !LF  !LF  !LF  !LF    -  !LF  !LF  !LF   LF  !LF  #Ext #Ext #Ext  RegE!RegO:
Pre : !Otr !Otr  Otr  Otr  Otr  Otr  Otr  Otr   -   Otr  Otr  Otr  Otr !Otr !Otr !Otr !Otr  RegE!RegO:
L   : !L   !L   !L    L    L    L   !L   !L     -  !L   !L   !L    L   !L   !L   !L   !L    RegE!RegO:
V   : !V   !V   !V    V   !V    V    V   !V     -  !V   !V   !V    V   !V   !V   !V   !V    RegE!RegO:
T   : !T   !T   !T    T   !T   !T    T   !T     -  !T   !T   !T    T   !T   !T   !T   !T    RegE!RegO:
LV  : !L   !L   !L    L   !L    L    L   !L     -  !L   !L   !L    L   !L   !L   !L   !L    RegE!RegO:
LVT : !L   !L   !L    L   !L   !L    L   !L     -  !L   !L   !L    L   !L   !L   !L   !L    RegE!RegO:
OInC: !InC !InC !InC  InC !InC !InC !InC !InC   -  !InC !InC !InC  InC !InC !InC !InC  InC  RegE!RegO:
ZWJ : !Ext !Ext !Ext  Ext !Ext !Ext !Ext $LAZP  -  !Ext $LAIC!Ext  Ext !Ext !Ext  LAIC LAIL RegE!RegO:
EInE: !Ext !Ext !Ext  Ext !Ext !Ext !Ext !Ext   -  !Ext $LAIC!Ext  Ext !Ext  LAZP LAIC LAIL RegE!RegO:
EInL: !Ext !Ext !Ext  Ext !Ext !Ext !Ext !Ext   -  !Ext $LAIL!Ext  Ext !Ext  LAZP LAIL LAIL RegE!RegO:
SoT : ! -  ! -  ! -  ! -  ! -  ! -  ! -  ! -    -  ! -  ! -  ! -    -    -  #Ext #Ext #Ext  RegE!RegO:
""";

// The look-ahead part of the state machine is triggered by the `$`-transitions
// above.
// It is really a combination of three state machines, one for RI, one
// for ZWJ+Pic and one for InCB. The backwards automaton always knows
// which one it starts in.
// A state not in the LA-range means to end lookahead with that state.
// If starting with `idStateLookaheadRegional`,
// the result always resets the position to before the lookahead,
// and the output state only states whether to break before that position.
// (The output states are always one of `stateRegionalEven` or
// `stateRegionalOdd`+break-before.)
// Represented by ` ` for not breaking and `!` for breaking.
//
// For the other lookaheads, the output flags represent one of:
// The marker before the target state means one of four things:
// - ' ': No break up to and including last seen character.
// - '!': Break before char before lookahead, none up to last seen character.
// - '#`: Break before char before lookahead and before last seen character.
//        In this case, the output state is the state before that character.
//        (So move character position to before last lookahead step.)
//
// Examples of '≮' the last would be ZWJ + EXT + ZWJ + PIC which does lookahead
// after seeing ZWJ+PIC. Seeing the second ZWJ, it knows it's not
// a PIC+EXT*+ZWJ+PIC sequence, so it must break before the second ZWJ.
// It also knows that it doesn't need to break again up to the first ZWJ,
// because it's all EXT characters. It's output state is `≮Ext`.
// An example of `#` would be `CR + EXT + ZWJ + PIC` which knows when it's
// seen the `CR` that it should break after CR and ZWJ.
// (Since it can only return one break at a time, it'll keep the position after
// CR with a state of Ext and return the position between ZWJ and PIC.)

// The look-ahead states are recognized and calls out to code that looks
// ahead (backwards in the string) to see what the state should really be after
const backStates = <StateId>[
  idStateBreak,
  idStateLF,
  idStateOther,
  idStateExtend,
  idStateL,
  idStateV,
  idStateT,
  idStatePictographic,
  idStateRegionalOdd, // Known disjoint look-ahead.
  idStateRegionalSingle,
  idStateInC,
  idStateRegionalEven,
  idStateEoTNoBreak,
  idStateEoT,
  idStateLookaheadRegionalEven,
  idStateLookaheadRegionalOdd,
  idStateLookaheadZWJPictographic,
  idStateLookaheadInC,
  idStateLookaheadInCL,
];

void writeBackwardAutomaton(StringSink buffer, {required bool verbose}) {
  assert(categories.length <= automatonRowLength);
  var table = Uint16List(backStateWithLACount * automatonRowLength);
  void transitionLA(
      StateId stateId, int category, StateId newStateId, int flags) {
    assert(stateId < backStateWithLACount && newStateId < backStateWithLACount,
        "$stateId + $category -> $newStateId");
    assert(
        switch ((stateId, newStateId)) {
          (< idStateLookaheadMin, < idStateLookaheadMin) =>
            flags < flagLookahead,
          // Entering lookahead. Always sets the flagLookahead bit.
          (< idStateLookaheadMin, _) => flags == flagLookahead,
          // Exiting lookahead, can have any flag value.
          (_, < idStateLookaheadMin) => flags <= maskFlags,
          // Inside lookahead, not done yet.
          (_, _) => flags == 0,
        },
        "$stateId + $category => $newStateId | $flags");
    table[stateId * automatonRowLength + category] =
        (newStateId * scaleState) | flags;
  }

  void transition(
      StateId stateId, int category, StateId newStateId, bool breakBefore) {
    assert(stateId < idStateLookaheadMin && newStateId < idStateLookaheadMin);
    transitionLA(
        stateId, category, newStateId, (breakBefore ? flagBreak : flagNoBreak));
  }

  for (var state in backStates) {
    if (state < idStateLookaheadMin) {
      if (state == idStateRegionalOdd) {
        // Special state where we know the previous character
        // to some degree, due to having done look-ahead.
        // Most inputs are unreachable. Use EoT-nobreak as unreachable marker.
        for (var i = 0; i <= categoryCount; i++) {
          transition(state, i, idStateEoTNoBreak, false);
        }
        transition(
            state, categoryRegionalIndicator, idStateRegionalEven, false);
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
          state != idStateRegionalOdd &&
          state != idStateEoTNoBreak;
      transition(state, categoryExtend, idStateExtend, breakBeforeExtend);
      if (state != idStateInC) {
        transition(
            state, categoryExtendIndicExtend, idStateExtend, breakBeforeExtend);
        transition(
            state, categoryExtendIndicLinked, idStateExtend, breakBeforeExtend);
      } else {
        // If these come just before an InCB Consonant, look ahead.
        transitionLA(state, categoryExtendIndicExtend, idStateLookaheadInC,
            flagLookahead);
        transitionLA(state, categoryExtendIndicLinked, idStateLookaheadInCL,
            flagLookahead);
      }
      transition(state, categorySpacingMark, idStateExtend,
          state != idStateExtend && state != idStateEoTNoBreak);
      if (state == idStatePictographic) {
        // Break-before value has no effect on lookahead states.
        transitionLA(
            state, categoryZWJ, idStateLookaheadZWJPictographic, flagLookahead);
      } else if (state == idStateInC) {
        transitionLA(state, categoryZWJ, idStateLookaheadInC, flagLookahead);
      } else {
        transition(state, categoryZWJ, idStateExtend,
            state != idStateExtend && state != idStateEoTNoBreak);
      }
      if (state == idStateRegionalEven) {
        transition(state, categoryRegionalIndicator, idStateRegionalOdd, true);
      } else if (state == idStateRegionalSingle) {
        transitionLA(state, categoryRegionalIndicator,
            idStateLookaheadRegionalEven, flagLookahead);
      } else {
        transition(state, categoryRegionalIndicator, idStateRegionalSingle,
            state != idStateExtend && state != idStateEoTNoBreak);
      }
      transition(state, categoryPrepend, idStateOther,
          state == idStateBreak || state == idStateCR || state == idStateEoT);
      transition(
          state,
          categoryL,
          idStateL,
          state != idStateExtend &&
              state != idStateL &&
              state != idStateV &&
              state != idStateEoTNoBreak);
      transition(
          state,
          categoryLV,
          idStateL,
          state != idStateExtend &&
              state != idStateV &&
              state != idStateT &&
              state != idStateEoTNoBreak);
      transition(
          state,
          categoryLVT,
          idStateL,
          state != idStateExtend &&
              state != idStateT &&
              state != idStateEoTNoBreak);
      transition(
          state,
          categoryV,
          idStateV,
          state != idStateExtend &&
              state != idStateT &&
              state != idStateV &&
              state != idStateEoTNoBreak);
      transition(
          state,
          categoryT,
          idStateT,
          state != idStateExtend &&
              state != idStateT &&
              state != idStateEoTNoBreak);
      transition(
          state,
          categoryPictographic,
          idStatePictographic,
          state != idStateExtend &&
              state != idStateRegionalOdd &&
              state != idStateEoTNoBreak);
      // Use EoT-NoBreak as marker for unreachable.
      transition(state, categorySoT, idStateEoTNoBreak,
          state != idStateEoT && state != idStateEoTNoBreak);
    } else {
      if (state == idStateLookaheadRegionalEven) {
        transitionLA(
            state, categoryRegionalIndicator, idStateLookaheadRegionalOdd, 0);
        for (var c = 0; c < categoryCount; c++) {
          if (c != categoryRegionalIndicator) {
            transitionLA(state, c, idStateRegionalEven, 0);
          }
        }
        continue;
      }
      if (state == idStateLookaheadRegionalOdd) {
        transitionLA(
            state, categoryRegionalIndicator, idStateLookaheadRegionalEven, 0);
        for (var c = 0; c < categoryCount; c++) {
          if (c != categoryRegionalIndicator) {
            transitionLA(state, c, idStateRegionalOdd, flagBreak);
          }
        }
        continue;
      }
      transitionLA(
          state, categoryControl, idStateExtend, flagLookaheadBreakBoth);
      transitionLA(state, categoryCR, idStateExtend, flagLookaheadBreakBoth);
      transitionLA(state, categoryLF, idStateExtend, flagLookaheadBreakBoth);
      transitionLA(state, categoryOther, idStateOther, flagLookaheadBreakEarly);
      transitionLA(
          state, categorySpacingMark, idStateExtend, flagLookaheadBreakEarly);
      transitionLA(state, categoryOther, idStateOther, flagLookaheadBreakEarly);
      transitionLA(state, categoryRegionalIndicator, idStateRegionalSingle,
          flagLookaheadBreakEarly);
      transitionLA(
          state,
          categoryPictographic,
          idStatePictographic,
          state == idStateLookaheadZWJPictographic
              ? flagLookaheadBreakNone
              : flagLookaheadBreakEarly);
      transitionLA(
          state, categoryPrepend, idStateOther, flagLookaheadBreakEarly);
      transitionLA(state, categoryL, idStateL, flagLookaheadBreakEarly);
      transitionLA(state, categoryLV, idStateL, flagLookaheadBreakEarly);
      transitionLA(state, categoryLVT, idStateL, flagLookaheadBreakEarly);
      transitionLA(state, categoryV, idStateV, flagLookaheadBreakEarly);
      transitionLA(state, categoryT, idStateT, flagLookaheadBreakEarly);
      transitionLA(
          state,
          categoryOtherIndicConsonant,
          idStateInC,
          state == idStateLookaheadInCL
              ? flagLookaheadBreakNone
              : flagLookaheadBreakEarly);
      if (state == idStateLookaheadZWJPictographic) {
        transitionLA(state, categoryExtend, state, 0);
        transitionLA(
            state, categoryZWJ, idStateExtend, flagLookaheadBreakEarly);
        transitionLA(state, categoryExtendIndicLinked, state, 0);
      } else {
        transitionLA(
            state, categoryExtend, idStateExtend, flagLookaheadBreakEarly);
        transitionLA(state, categoryZWJ, state, 0);
        transitionLA(state, categoryExtendIndicLinked, idStateLookaheadInCL, 0);
      }
      transitionLA(state, categoryExtendIndicExtend, state, 0);
      transitionLA(state, categorySoT, idStateExtend, flagLookaheadBreakBoth);
    }
    for (var i = categoryCount; i < automatonRowLength; i++) {
      transitionLA(state, i, idStateEoTNoBreak, 0);
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
  if (verbose) _writeBackTable(table, automatonRowLength);
}

void _writeForwardTable(Uint16List table, int automatonRowLength) {
  var automaton = _generateTable(table, automatonRowLength, idStateCount,
      stateShortNames, categoryShortNames, idStateSoTNoBreak);
  stdout.write(automaton);
  if (automaton != expectedAutomatonDescription) {
    stderr
      ..writeln("DIFFERS FROM EXPECTATION:")
      ..write(expectedAutomatonDescription);
  }
}

void _writeBackTable(Uint16List table, int automatonRowLength) {
  var backCategoryNames = [...categoryShortNames]..[categorySoT] = "SoT";
  var backAutomaton = _generateTable(
    table,
    automatonRowLength,
    backStateWithLACount,
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
/// The table has size `maxState * automatonRowLength`, and `automatonRowLength >= categoryCount`.
/// The [stateNames] are the names of the states for this particular automaton
/// (differs between forward and backward automaton).
/// It has a name for every target state that occurs in the *table*.
/// The table contains states multiplied by `automatonRowLength`, possibly with
/// the first bit set as a break-before/after flag.
/// The [stateCount] is the number of "real" states that occur in the table,
/// states above that, if any, are synthetic states that trigger non-
/// automaton based scanning.
/// The [ignoreState] is a single state that is not displayed.
String _generateTable(Uint16List table, int automatonRowLength, int stateCount,
    List<String> stateNames, List<String> categoryNames, int ignoreState) {
  assert(automatonRowLength >= categoryCount);
  assert(table.length == stateCount * automatonRowLength);
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
      var value = table[si * automatonRowLength + ci];
      var targetState = value ~/ automatonRowLength;
      var prefix = r" !$#"[value & maskFlags];
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
