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
Stat: Cat
    : CR   Ctl  Otr  Ext  Spc  Reg  Pic  LF   Pre  L    V    T    LV   LVT  OInC ZWJ  EInE EInL EoT :
-----------------------------------------------------------------------------------------------------
Brk :!CR  !Brk !Otr !Otr !Otr !Reg !Pic !Brk !Pre !L   !V   !T   !V   !T   !InC !Otr !Otr !Otr ! -  :
CR  :!CR  !Brk !Otr !Otr !Otr !Reg !Pic  Brk !Pre !L   !V   !T   !V   !T   !InC !Otr !Otr !Otr ! -  :
Otr :!CR  !Brk !Otr  Otr  Otr !Reg !Pic !Brk !Pre !L   !V   !T   !V   !T   !InC  Otr  Otr  Otr ! -  :
Pre :!CR  !Brk  Otr  Otr  Otr  Reg  Pic !Brk  Pre  L    V    T    V    T    InC  Otr  Otr  Otr ! -  :
L   :!CR  !Brk !Otr  Otr  Otr !Reg !Pic !Brk !Pre  L    V   !T    V    T   !InC  Otr  Otr  Otr ! -  :
V   :!CR  !Brk !Otr  Otr  Otr !Reg !Pic !Brk !Pre !L    V    T   !V   !T   !InC  Otr  Otr  Otr ! -  :
T   :!CR  !Brk !Otr  Otr  Otr !Reg !Pic !Brk !Pre !L   !V    T   !V   !T   !InC  Otr  Otr  Otr ! -  :
Pic :!CR  !Brk !Otr  Pic  Otr !Reg !Pic !Brk !Pre !L   !V   !T   !V   !T   !InC  PicZ Pic  Pic ! -  :
PicZ:!CR  !Brk !Otr  Otr  Otr !Reg  Pic !Brk !Pre !L   !V   !T   !V   !T   !InC  Otr  Otr  Otr ! -  :
Reg :!CR  !Brk !Otr  Otr  Otr  Otr !Pic !Brk !Pre !L   !V   !T   !V   !T   !InC  Otr  Otr  Otr ! -  :
InC :!CR  !Brk !Otr  Otr  Otr !Reg !Pic !Brk !Pre !L   !V   !T   !V   !T   !InC  InC  InC  InCL! -  :
InCL:!CR  !Brk !Otr  Otr  Otr !Reg !Pic !Brk !Pre !L   !V   !T   !V   !T    InC  InCL InCL InCL! -  :
SoTN: CR   Brk  Otr  Otr  Otr  Reg  Pic  Brk  Pre  L    V    T    V    T    InC  Otr  Otr  Otr   -  :
SoT :!CR  !Brk !Otr !Otr !Otr !Reg !Pic !Brk !Pre !L   !V   !T   !V   !T   !InC !Otr !Otr !Otr   -  :
CAny:!CR  !Brk  Otr  CExt Otr  CReg!Pic !Brk  Pre  L    V    T    V    T    InC  CZWJ CIE  CIL   -  :
CZWJ:!CR  !Brk !Otr  Otr  Otr !Reg $LAZP!Brk !Pre !L   !V   !T   !V   !T   $LAIC CZIE CZIE CZIL! -  :
CIE :!CR  !Brk !Otr  CExt Otr !Reg !Pic !Brk !Pre !L   !V   !T   !V   !T   $LAIC CIEZ CIE  CIL ! -  :
CIL :!CR  !Brk !Otr  CExt Otr !Reg !Pic !Brk !Pre !L   !V   !T   !V   !T   $LAIL CILZ CIL  CIL ! -  :
CIEZ:!CR  !Brk !Otr  Otr  Otr !Reg $LAZP!Brk !Pre !L   !V   !T   !V   !T   !InC  CZIE CZIE CZIL! -  :
CILZ:!CR  !Brk !Otr  Otr  Otr !Reg $LAZP!Brk !Pre !L   !V   !T   !V   !T   $LAIL CZIL CZIL CZIL! -  :
CZIE:!CR  !Brk !Otr  Otr  Otr !Reg !Pic !Brk !Pre !L   !V   !T   !V   !T   $LAIC CZIE CZIE CZIL! -  :
CZIL:!CR  !Brk !Otr  Otr  Otr !Reg !Pic !Brk !Pre !L   !V   !T   !V   !T   $LAIL CZIL CZIL CZIL! -  :
CExt:!CR  !Brk !Otr  CExt Otr !Reg !Pic !Brk !Pre !L   !V   !T   !V   !T   !InC  CExZ CExt CExt! -  :
CExZ:!CR  !Brk !Otr  Otr  Otr !Reg $LAZP!Brk !Pre !L   !V   !T   !V   !T   !InC  Otr  Otr  Otr ! -  :
CReg:!CR  !Brk !Otr  Otr  Otr $LARe!Pic !Brk !Pre !L   !V   !T   !V   !T   !InC  Otr  Otr  Otr ! -  :
""";

void writeForwardAutomaton(StringSink buffer, {required bool verbose}) {
  assert(categories.length == categoryCount);
  assert(automatonRowLength.isEven && automatonRowLength >= categoryCount);
  var table = Uint16List(idStateCount * automatonRowLength);
  void transitionLA(
      StateId stateId, int category, StateId newStateId, int flags) {
    assert(flags <= maskFlags);
    assert(flags & flagLookahead == 0 || newStateId >= idStateLookaheadMin);
    table[stateId * automatonRowLength + category] =
        (newStateId * scaleState) + flags;
  }

  void transition(
      StateId stateId, int category, StateId newStateId, bool breakBefore) {
    assert(newStateId < idStateCount, "$stateId + $category -> $newStateId");
    transitionLA(
        stateId, category, newStateId, breakBefore ? flagBreak : flagNoBreak);
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
    var neverBreakBefore = state == idStateSoTNoBreak ||
        state == idStateCAny || // Break in this state never matters.
        state == idStatePrepend;

    // Other with InCB=None.
    // No rules apply specifically to Other, so break unless an
    // Any rule applies.
    transition(state, categoryOther, idStateOther, !neverBreakBefore);
    // Other with InCB=Consonant.
    // GB9C. (Break unless Any rule applies, or preceded by indic sequence
    // with at least one Linked, `idStateInCL`).
    // Remember having seen InCB=Consonant and no InCB=Linked yet.

    if (state == idStateCZWJ || state == idStateCIE || state == idStateCZIE) {
      transitionLA(state, categoryOtherIndicConsonant, idStateLookaheadInC,
          flagLookahead);
    } else if (state == idStateCIL ||
        state == idStateCILZ ||
        state == idStateCZIL) {
      transitionLA(state, categoryOtherIndicConsonant, idStateLookaheadInCL,
          flagLookahead);
    } else {
      transition(state, categoryOtherIndicConsonant, idStateInC,
          !(neverBreakBefore || state == idStateInCL || state == idStateCAny));
    }
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
    } else if (state < idStateMinContextUnaware || state == idStateCReg) {
      // GB9 alone.
      // No special rules for breaking after,
      // break before only if required by GB1-GB5.
      transition(state, categoryExtend, idStateOther, alwaysBreakBefore);
      transition(
          state, categoryExtendIndicExtend, idStateOther, alwaysBreakBefore);
      transition(
          state, categoryExtendIndicLinked, idStateOther, alwaysBreakBefore);
      transition(state, categoryZWJ, idStateOther, alwaysBreakBefore);
    } else {
      transition(
          state,
          categoryZWJ,
          switch (state) {
            idStateCAny => idStateCZWJ,
            idStateCZWJ => idStateCZIE,
            idStateCIE => idStateCIEZ,
            idStateCIL => idStateCILZ,
            idStateCIEZ => idStateCZIE,
            idStateCILZ => idStateCZIL,
            idStateCZIE => idStateCZIE,
            idStateCZIL => idStateCZIL,
            idStateCExt => idStateCExZ,
            _ => idStateOther,
          },
          false);
      transition(
          state,
          categoryExtend,
          (state == idStateCAny ||
                  state == idStateCIE ||
                  state == idStateCIL ||
                  state == idStateCExt)
              ? idStateCExt
              : idStateOther,
          false);
      transition(
          state,
          categoryExtendIndicExtend,
          switch (state) {
            idStateCAny => idStateCIE,
            idStateCZWJ => idStateCZIE,
            idStateCIE => idStateCIE,
            idStateCIL => idStateCIL,
            idStateCIEZ => idStateCZIE,
            idStateCILZ => idStateCZIL,
            idStateCZIE => idStateCZIE,
            idStateCZIL => idStateCZIL,
            idStateCExt => idStateCExt,
            _ => idStateOther,
          },
          false);
      transition(
          state,
          categoryExtendIndicLinked,
          switch (state) {
            idStateCAny => idStateCIL,
            idStateCZWJ => idStateCZIL,
            idStateCIE => idStateCIL,
            idStateCIL => idStateCIL,
            idStateCIEZ => idStateCZIL,
            idStateCILZ => idStateCZIL,
            idStateCZIE => idStateCZIL,
            idStateCZIL => idStateCZIL,
            idStateCExt => idStateCExt,
            _ => idStateOther,
          },
          false);
    }
    // Regional indicator.
    // GB12 + GB13: Don't break if after an odd number of Reg.
    // Otherwise remember an odd number of Reg, and break before unless
    // prior state says not to.
    if (state == idStateRegionalSingle) {
      transition(state, categoryRegionalIndicator, idStateOther, false);
    } else if (state == idStateCAny) {
      transition(state, categoryRegionalIndicator, idStateCReg, false);
    } else if (state == idStateCReg) {
      transitionLA(state, categoryRegionalIndicator,
          idStateLookaheadRegionalEven, flagLookahead);
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
    if (state == idStateCZWJ ||
        state == idStateCExZ ||
        state == idStateCIEZ ||
        state == idStateCILZ) {
      transitionLA(state, categoryPictographic, idStateLookaheadZWJPictographic,
          flagLookahead);
    } else {
      transition(
          state,
          categoryPictographic,
          idStatePictographic,
          state != idStatePrepend &&
              state != idStatePictographicZWJ &&
              state != idStateSoTNoBreak);
    }
    // End of input.
    // GB2.
    transition(
        state,
        categoryEoT,
        idStateSoTNoBreak,
        state != idStateSoT &&
            state != idStateSoTNoBreak &&
            state != idStateCAny);

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
Stat: Cat
    : CR   Ctl  Otr  Ext  Spc  Reg  Pic  LF   Pre  L    V    T    LV   LVT  OInC ZWJ  EInE EInL SoT :
-----------------------------------------------------------------------------------------------------
Brk :!Brk !Brk !Otr !Ext !Ext !Reg !Pic !LF  !Otr !L   !V   !T   !L   !L   !InC !Ext !Ext !Ext ! -  :
LF  : Brk !Brk !Otr !Ext !Ext !Reg !Pic !LF  !Otr !L   !V   !T   !L   !L   !InC !Ext !Ext !Ext ! -  :
Otr :!Brk !Brk !Otr !Ext !Ext !Reg !Pic !LF   Otr !L   !V   !T   !L   !L   !InC !Ext !Ext !Ext ! -  :
Ext :!Brk !Brk  Otr  Ext  Ext  Reg  Pic !LF   Otr  L    V    T    L    L    InC  Ext  Ext  Ext ! -  :
L   :!Brk !Brk !Otr !Ext !Ext !Reg !Pic !LF   Otr  L   !V   !T   !L   !L   !InC !Ext !Ext !Ext ! -  :
V   :!Brk !Brk !Otr !Ext !Ext !Reg !Pic !LF   Otr  L    V   !T    L   !L   !InC !Ext !Ext !Ext ! -  :
T   :!Brk !Brk !Otr !Ext !Ext !Reg !Pic !LF   Otr !L    V    T    L    L   !InC !Ext !Ext !Ext ! -  :
Pic :!Brk !Brk !Otr !Ext !Ext !Reg !Pic !LF   Otr !L   !V   !T   !L   !L   !InC $LAZP!Ext !Ext ! -  :
RegO:  -    -    -    -    -   RegE  -    -    -    -    -    -    -    -    -    -    -    -    -  :
Reg :!Brk !Brk !Otr !Ext !Ext $LARe!Pic !LF   Otr !L   !V   !T   !L   !L   !InC !Ext !Ext !Ext ! -  :
InC :!Brk !Brk !Otr !Ext !Ext !Reg !Pic !LF   Otr !L   !V   !T   !L   !L   !InC $LAIC$LAIC$LAIL! -  :
RegE:!Brk !Brk !Otr !Ext !Ext !RegO!Pic !LF   Otr !L   !V   !T   !L   !L   !InC !Ext !Ext !Ext ! -  :
EoTN: Brk  Brk  Otr  Ext  Ext  Reg  Pic  LF   Otr  L    V    T    L    L    InC  Ext  Ext  Ext   -  :
EoT :!Brk !Brk !Otr !Ext !Ext !Reg !Pic !LF  !Otr !L   !V   !T   !L   !L   !InC !Ext !Ext !Ext   -  :
LAZP:#Ext #Ext !Otr  LAZP!Ext !Reg  Pic #Ext !Otr !L   !V   !T   !L   !L   !InC !Ext  LAZP LAZP#Ext :
LAIC:#Ext #Ext !Otr !Ext !Ext !Reg !Pic #Ext !Otr !L   !V   !T   !L   !L   !InC  LAIC LAIC LAIL#Ext :
LAIL:#Ext #Ext !Otr !Ext !Ext !Reg !Pic #Ext !Otr !L   !V   !T   !L   !L    InC  LAIL LAIL LAIL#Ext :
LARe: RegE RegE RegE RegE RegE LARo RegE RegE RegE RegE RegE RegE RegE RegE RegE RegE RegE RegE RegE:
LARo:!RegO!RegO!RegO!RegO!RegO LARe!RegO!RegO!RegO!RegO!RegO!RegO!RegO!RegO!RegO!RegO!RegO!RegO!RegO:
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
  var automaton = _generateTable(
      table,
      automatonRowLength,
      idStateCount,
      stateShortNames,
      backStateShortNames,
      categoryShortNames,
      idStateSoTNoBreak);
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
/// The table has size `maxState * automatonRowLength`,
/// and `automatonRowLength >= categoryCount`.
/// The [stateNames] are the names of the states for this particular automaton
/// (differs between forward and backward automaton).
/// It has a name for every target state that occurs in the *table*.
/// The table contains states multiplied by `automatonRowLength`, possibly with
/// the first bit set as a break-before/after flag.
/// The [stateCount] is the number of "real" states that occur in the table,
/// states above that, if any, are synthetic states that trigger non-
/// automaton based scanning.
/// The [ignoreState] is a single state that is not displayed.
String _generateTable(
    Uint16List table,
    int automatonRowLength,
    int stateCount,
    List<String> stateNames,
    List<String> lookaheadStateNames,
    List<String> categoryNames,
    int ignoreState) {
  assert(automatonRowLength >= categoryCount);
  assert(table.length == stateCount * automatonRowLength);
  var buf = StringBuffer();
  buf.writeln("Stat: Cat");
  var preHeaderLength = buf.length;
  buf.write("    :");
  for (var i = 0; i < categoryCount; i++) {
    buf
      ..write(' ')
      ..write(categoryNames[i].padRight(4));
  }
  buf.writeln(":");
  var lineLength = buf.length - preHeaderLength;
  buf.writeln("-" * (lineLength - 1));
  for (var si = 0; si < stateCount; si++) {
    var stateName = stateNames[si];
    buf
      ..write(stateName.padRight(4))
      ..write(':');
    for (var ci = 0; ci < categoryCount; ci++) {
      var value = table[si * automatonRowLength + ci];
      var targetState = value ~/ automatonRowLength;
      var flags = value & maskFlags;
      var prefix = r" !$#"[flags];

      var targetStateName = (flags == flagLookahead)
          ? lookaheadStateNames[targetState]
          : stateNames[targetState];
      // EoT is marker for unreachable states.
      if (targetState == ignoreState) targetStateName = " -  ";
      buf
        ..write(prefix)
        ..write(targetStateName.padRight(4));
    }
    buf.writeln(":");
  }
  return buf.toString();
}
