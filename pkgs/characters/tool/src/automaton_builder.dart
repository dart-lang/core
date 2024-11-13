// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';
import 'dart:typed_data';

import 'package:characters/src/grapheme_clusters/constants.dart';

import 'debug_names.dart';
import 'string_literal_writer.dart';

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
const expectedAutomatonDescription = r'''
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
''';

void writeForwardAutomaton(StringSink buffer, {required bool verbose}) {
  assert(categories.length == categoryCount);
  assert(automatonRowLength & maskFlags == 0 &&
      automatonRowLength >= categoryCount);
  var table = Uint16List(stateLimit);
  void transitionLA(int state, int category, int targetState, int flags) {
    assert(flags <= maskFlags);
    assert(
        flags != flagLookahead || targetState >= stateLookaheadMin,
        '${stateShortName(state)} x ${categoryNames[category]} -> '
        '${_targetStateName(targetState, flags)} | $flags');
    table[state + category] = targetState + flags;
  }

  void transition(int state, int category, int targetState, bool breakBefore) {
    assert(targetState < stateLimit, '$state + $category -> $targetState');
    transitionLA(
        state, category, targetState, breakBefore ? flagBreak : flagNoBreak);
  }

  for (var state = 0; state < stateLimit; state += automatonRowLength) {
    // States that should always be broken after, unless something specifically
    // says otherwise. (And does so in GB1..G5).
    var alwaysBreakBefore =
        state == stateSoT || state == stateBreak || state == stateCR;

    // States that should never be broken after, unless `alwaysBreakBefore`
    // says otherwise (for example the rules in GB1..GB5).
    var neverBreakBefore = state == stateSoTNoBreak ||
        state == stateCAny || // Break in this state never matters.
        state == statePrepend;

    // Other with InCB=None.
    // No rules apply specifically to Other, so break unless an
    // Any rule applies.
    transition(state, categoryOther, stateOther, !neverBreakBefore);
    // Other with InCB=Consonant.
    // GB9C. (Break unless Any rule applies, or preceded by indic sequence
    // with at least one Linked, `stateInCL`).
    // Remember having seen InCB=Consonant and no InCB=Linked yet.

    if (state == stateCZWJ || state == stateCIE || state == stateCZIE) {
      transitionLA(
          state, categoryOtherIndicConsonant, stateLookaheadInC, flagLookahead);
    } else if (state == stateCIL || state == stateCILZ || state == stateCZIL) {
      transitionLA(state, categoryOtherIndicConsonant, stateLookaheadInCL,
          flagLookahead);
    } else {
      transition(state, categoryOtherIndicConsonant, stateInC,
          !(neverBreakBefore || state == stateInCL || state == stateCAny));
    }
    // CR.
    // GB4 + GB5. Always break, after unless followed by LF, so remember
    // having seen CR (`stateCR`).
    transition(state, categoryCR, stateCR, state != stateSoTNoBreak);

    // LF.
    // GB3 + GB4 + GB5. Always break after. Break before unless following CR.
    transition(state, categoryLF, stateBreak,
        state != stateCR && state != stateSoTNoBreak);

    // Control. (Like CR+LF, without their mutual exception.)
    // GB4 + GB5. Always break before, even after Prepend,
    // and always break after (`stateBreak`).
    transition(state, categoryControl, stateBreak, state != stateSoTNoBreak);

    // Ext + ZWJ (including InCB Extend and Linked).
    // GB9 + GB9c + GB11. Never break before Ext or ZWJ,
    // unless required by earlier rule (after Control, CR, LF, SoT).
    // Remember whether after Pic+Ext* or InCB=Consonant(Extend|Linked)*
    if (state == statePictographic) {
      // GB9 + GB11, after Pic+Ext*.
      // Extend with InCB=None.
      transition(state, categoryExtend, statePictographic, false);
      // Extend with InCB=Extend.
      transition(state, categoryExtendIndicExtend, statePictographic, false);
      // Extend with InCB=Linked.
      transition(state, categoryExtendIndicLinked, statePictographic, false);
      // ZWJ.
      transition(state, categoryZWJ, statePictographicZWJ, false);
    } else if (state == stateInC || state == stateInCL) {
      // GB9 + GB9c, after InCB Consonant + (Extend|Linked)*.
      // Extend with InCB=None.
      transition(state, categoryExtend, stateOther, false);
      // Extend with InCB=Extend.
      transition(state, categoryExtendIndicExtend, state, false);
      // ZWJ (which has InCB=Extend).
      transition(state, categoryZWJ, state, false);
      // Extend with InCB=Linked.
      transition(state, categoryExtendIndicLinked, stateInCL, false);
    } else if (state < stateMinContextUnaware || state == stateCReg) {
      // GB9 alone.
      // No special rules for breaking after,
      // break before only if required by GB1-GB5.
      transition(state, categoryExtend, stateOther, alwaysBreakBefore);
      transition(
          state, categoryExtendIndicExtend, stateOther, alwaysBreakBefore);
      transition(
          state, categoryExtendIndicLinked, stateOther, alwaysBreakBefore);
      transition(state, categoryZWJ, stateOther, alwaysBreakBefore);
    } else {
      transition(
          state,
          categoryZWJ,
          switch (state) {
            stateCAny => stateCZWJ,
            stateCZWJ => stateCZIE,
            stateCIE => stateCIEZ,
            stateCIL => stateCILZ,
            stateCIEZ => stateCZIE,
            stateCILZ => stateCZIL,
            stateCZIE => stateCZIE,
            stateCZIL => stateCZIL,
            stateCExt => stateCExZ,
            _ => stateOther,
          },
          false);
      transition(
          state,
          categoryExtend,
          (state == stateCAny ||
                  state == stateCIE ||
                  state == stateCIL ||
                  state == stateCExt)
              ? stateCExt
              : stateOther,
          false);
      transition(
          state,
          categoryExtendIndicExtend,
          switch (state) {
            stateCAny => stateCIE,
            stateCZWJ => stateCZIE,
            stateCIE => stateCIE,
            stateCIL => stateCIL,
            stateCIEZ => stateCZIE,
            stateCILZ => stateCZIL,
            stateCZIE => stateCZIE,
            stateCZIL => stateCZIL,
            stateCExt => stateCExt,
            _ => stateOther,
          },
          false);
      transition(
          state,
          categoryExtendIndicLinked,
          switch (state) {
            stateCAny => stateCIL,
            stateCZWJ => stateCZIL,
            stateCIE => stateCIL,
            stateCIL => stateCIL,
            stateCIEZ => stateCZIL,
            stateCILZ => stateCZIL,
            stateCZIE => stateCZIL,
            stateCZIL => stateCZIL,
            stateCExt => stateCExt,
            _ => stateOther,
          },
          false);
    }
    // Regional indicator.
    // GB12 + GB13: Don't break if after an odd number of Reg.
    // Otherwise remember an odd number of Reg, and break before unless
    // prior state says not to.
    if (state == stateRegionalSingle) {
      transition(state, categoryRegionalIndicator, stateOther, false);
    } else if (state == stateCAny) {
      transition(state, categoryRegionalIndicator, stateCReg, false);
    } else if (state == stateCReg) {
      transitionLA(state, categoryRegionalIndicator, stateLookaheadRegionalEven,
          flagLookahead);
    } else {
      // Break unless prior state says not to.
      transition(state, categoryRegionalIndicator, stateRegionalSingle,
          !neverBreakBefore);
    }

    // Prepend.
    // GB9b: Never break after Prepend (unless required by next character
    // due to GB1..GB5).
    // Break before unless prior state says not to.
    transition(state, categoryPrepend, statePrepend, !neverBreakBefore);
    // Spacing mark. (Like Extend but doesn't interact with emojis).
    // GB9a. Don't break before, unless must always break after prior char.
    transition(state, categorySpacingMark, stateOther, alwaysBreakBefore);
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
    if (state == stateCZWJ ||
        state == stateCExZ ||
        state == stateCIEZ ||
        state == stateCILZ) {
      transitionLA(state, categoryPictographic, stateLookaheadZWJPictographic,
          flagLookahead);
    } else {
      transition(
          state,
          categoryPictographic,
          statePictographic,
          state != statePrepend &&
              state != statePictographicZWJ &&
              state != stateSoTNoBreak);
    }
    // End of input.
    // GB2.
    transition(state, categoryEoT, stateSoTNoBreak,
        state != stateSoT && state != stateSoTNoBreak && state != stateCAny);

    // Pad table if necessary.
    for (var c = categoryCount; c < automatonRowLength; c++) {
      transition(state, c, stateSoTNoBreak, false);
    }
  }
  const prefix = 'const _stateMachine = ';
  buffer.write(prefix);
  var stringWriter = StringLiteralWriter(buffer, padding: 4);
  stringWriter.start(prefix.length);
  for (var i = 0; i < table.length; i++) {
    stringWriter.add(table[i]);
  }
  stringWriter.end();
  buffer.write(';\n');
  buffer.write(_moveMethod);

  if (verbose) _writeForwardTable(table, automatonRowLength);
}

const String _moveMethod = '''
$preferInline
int move(int state, int inputCategory) =>
    _stateMachine.codeUnitAt((state & $maskState) + inputCategory);
''';

const String _moveBackMethod = '''
$preferInline
int moveBack(int state, int inputCategory) =>
    _backStateMachine.codeUnitAt((state & $maskState) + inputCategory);
''';

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
const expectedBackAutomatonDescription = r'''
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
''';

// The look-ahead part of the state machine is triggered by the `$`-transitions
// above.
// It is really a combination of three state machines, one for RI, one
// for ZWJ+Pic and one for InCB. The backwards automaton always knows
// which one it starts in.
// A state not in the LA-range means to end lookahead with that state.
// If starting with `stateLookaheadRegional`,
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
const backStates = <int>[
  stateBreak,
  stateLF,
  stateOther,
  stateExtend,
  stateL,
  stateV,
  stateT,
  statePictographic,
  stateRegionalOdd, // Known disjoint look-ahead.
  stateRegionalSingle,
  stateInC,
  stateRegionalEven,
  stateEoTNoBreak,
  stateEoT,
  stateLookaheadRegionalEven,
  stateLookaheadRegionalOdd,
  stateLookaheadZWJPictographic,
  stateLookaheadInC,
  stateLookaheadInCL,
];

void writeBackwardAutomaton(StringSink buffer, {required bool verbose}) {
  assert(categories.length <= automatonRowLength);
  var table = Uint16List(backStateLimit);
  void transitionLA(int state, int category, int targetState, int flags) {
    assert(state < backStateLimit && targetState < backStateLimit,
        '$state + $category -> $targetState');
    assert(
        switch ((state, targetState)) {
          (< stateLookaheadMin, < stateLookaheadMin) => flags < flagLookahead,
          // Entering lookahead. Always sets the flagLookahead bit.
          (< stateLookaheadMin, _) => flags == flagLookahead,
          // Exiting lookahead, can have any flag value.
          (_, < stateLookaheadMin) => flags <= maskFlags,
          // Inside lookahead, not done yet.
          (_, _) => flags == 0,
        },
        '$state + $category => $targetState | $flags');
    table[state + category] = targetState | flags;
  }

  void transition(int state, int category, int targetState, bool breakBefore) {
    assert(state < stateLookaheadMin && targetState < stateLookaheadMin);
    transitionLA(
        state, category, targetState, (breakBefore ? flagBreak : flagNoBreak));
  }

  for (var state in backStates) {
    if (state < stateLookaheadMin) {
      if (state == stateRegionalOdd) {
        // Special state where we know the previous character
        // to some degree, due to having done look-ahead.
        // Most inputs are unreachable. Use EoT-nobreak as unreachable marker.
        for (var i = 0; i <= categoryCount; i++) {
          transition(state, i, stateEoTNoBreak, false);
        }
        transition(state, categoryRegionalIndicator, stateRegionalEven, false);
        // Remaining inputs are unreachable.
        continue;
      }
      transition(state, categoryOther, stateOther,
          state != stateExtend && state != stateEoTNoBreak);
      transition(state, categoryOtherIndicConsonant, stateInC,
          state != stateExtend && state != stateEoTNoBreak);
      transition(state, categoryLF, stateLF, state != stateEoTNoBreak);
      transition(state, categoryCR, stateBreak,
          state != stateLF && state != stateEoTNoBreak);
      transition(state, categoryControl, stateBreak, state != stateEoTNoBreak);

      var breakBeforeExtend = state != stateExtend &&
          state != stateRegionalOdd &&
          state != stateEoTNoBreak;
      transition(state, categoryExtend, stateExtend, breakBeforeExtend);
      if (state != stateInC) {
        transition(
            state, categoryExtendIndicExtend, stateExtend, breakBeforeExtend);
        transition(
            state, categoryExtendIndicLinked, stateExtend, breakBeforeExtend);
      } else {
        // If these come just before an InCB Consonant, look ahead.
        transitionLA(
            state, categoryExtendIndicExtend, stateLookaheadInC, flagLookahead);
        transitionLA(state, categoryExtendIndicLinked, stateLookaheadInCL,
            flagLookahead);
      }
      transition(state, categorySpacingMark, stateExtend,
          state != stateExtend && state != stateEoTNoBreak);
      if (state == statePictographic) {
        // Break-before value has no effect on lookahead states.
        transitionLA(
            state, categoryZWJ, stateLookaheadZWJPictographic, flagLookahead);
      } else if (state == stateInC) {
        transitionLA(state, categoryZWJ, stateLookaheadInC, flagLookahead);
      } else {
        transition(state, categoryZWJ, stateExtend,
            state != stateExtend && state != stateEoTNoBreak);
      }
      if (state == stateRegionalEven) {
        transition(state, categoryRegionalIndicator, stateRegionalOdd, true);
      } else if (state == stateRegionalSingle) {
        transitionLA(state, categoryRegionalIndicator,
            stateLookaheadRegionalEven, flagLookahead);
      } else {
        transition(state, categoryRegionalIndicator, stateRegionalSingle,
            state != stateExtend && state != stateEoTNoBreak);
      }
      transition(state, categoryPrepend, stateOther,
          state == stateBreak || state == stateCR || state == stateEoT);
      transition(
          state,
          categoryL,
          stateL,
          state != stateExtend &&
              state != stateL &&
              state != stateV &&
              state != stateEoTNoBreak);
      transition(
          state,
          categoryLV,
          stateL,
          state != stateExtend &&
              state != stateV &&
              state != stateT &&
              state != stateEoTNoBreak);
      transition(state, categoryLVT, stateL,
          state != stateExtend && state != stateT && state != stateEoTNoBreak);
      transition(
          state,
          categoryV,
          stateV,
          state != stateExtend &&
              state != stateT &&
              state != stateV &&
              state != stateEoTNoBreak);
      transition(state, categoryT, stateT,
          state != stateExtend && state != stateT && state != stateEoTNoBreak);
      transition(
          state,
          categoryPictographic,
          statePictographic,
          state != stateExtend &&
              state != stateRegionalOdd &&
              state != stateEoTNoBreak);
      // Use EoT-NoBreak as marker for unreachable.
      transition(state, categorySoT, stateEoTNoBreak,
          state != stateEoT && state != stateEoTNoBreak);
    } else {
      if (state == stateLookaheadRegionalEven) {
        transitionLA(
            state, categoryRegionalIndicator, stateLookaheadRegionalOdd, 0);
        for (var c = 0; c < categoryCount; c++) {
          if (c != categoryRegionalIndicator) {
            transitionLA(state, c, stateRegionalEven, 0);
          }
        }
        continue;
      }
      if (state == stateLookaheadRegionalOdd) {
        transitionLA(
            state, categoryRegionalIndicator, stateLookaheadRegionalEven, 0);
        for (var c = 0; c < categoryCount; c++) {
          if (c != categoryRegionalIndicator) {
            transitionLA(state, c, stateRegionalOdd, flagBreak);
          }
        }
        continue;
      }
      transitionLA(state, categoryControl, stateExtend, flagLookaheadBreakBoth);
      transitionLA(state, categoryCR, stateExtend, flagLookaheadBreakBoth);
      transitionLA(state, categoryLF, stateExtend, flagLookaheadBreakBoth);
      transitionLA(state, categoryOther, stateOther, flagLookaheadBreakEarly);
      transitionLA(
          state, categorySpacingMark, stateExtend, flagLookaheadBreakEarly);
      transitionLA(state, categoryOther, stateOther, flagLookaheadBreakEarly);
      transitionLA(state, categoryRegionalIndicator, stateRegionalSingle,
          flagLookaheadBreakEarly);
      transitionLA(
          state,
          categoryPictographic,
          statePictographic,
          state == stateLookaheadZWJPictographic
              ? flagLookaheadBreakNone
              : flagLookaheadBreakEarly);
      transitionLA(state, categoryPrepend, stateOther, flagLookaheadBreakEarly);
      transitionLA(state, categoryL, stateL, flagLookaheadBreakEarly);
      transitionLA(state, categoryLV, stateL, flagLookaheadBreakEarly);
      transitionLA(state, categoryLVT, stateL, flagLookaheadBreakEarly);
      transitionLA(state, categoryV, stateV, flagLookaheadBreakEarly);
      transitionLA(state, categoryT, stateT, flagLookaheadBreakEarly);
      transitionLA(
          state,
          categoryOtherIndicConsonant,
          stateInC,
          state == stateLookaheadInCL
              ? flagLookaheadBreakNone
              : flagLookaheadBreakEarly);
      if (state == stateLookaheadZWJPictographic) {
        transitionLA(state, categoryExtend, state, 0);
        transitionLA(state, categoryZWJ, stateExtend, flagLookaheadBreakEarly);
        transitionLA(state, categoryExtendIndicLinked, state, 0);
      } else {
        transitionLA(
            state, categoryExtend, stateExtend, flagLookaheadBreakEarly);
        transitionLA(state, categoryZWJ, state, 0);
        transitionLA(state, categoryExtendIndicLinked, stateLookaheadInCL, 0);
      }
      transitionLA(state, categoryExtendIndicExtend, state, 0);
      transitionLA(state, categorySoT, stateExtend, flagLookaheadBreakBoth);
    }
    for (var i = categoryCount; i < automatonRowLength; i++) {
      transitionLA(state, i, stateEoTNoBreak, 0);
    }
  }
  var stringWriter = StringLiteralWriter(buffer, padding: 4);
  buffer.write('const _backStateMachine = ');
  stringWriter.start('const _backStateMachine = '.length);
  for (var i = 0; i < table.length; i++) {
    stringWriter.add(table[i]);
  }
  stringWriter.end();
  buffer.write(';\n');
  buffer.write(_moveBackMethod);
  if (verbose) _writeBackTable(table, automatonRowLength);
}

void _writeForwardTable(Uint16List table, int automatonRowLength) {
  var automaton = _generateTable(table, automatonRowLength, stateLimit,
      stateShortName, backStateShortName, categoryShortNames, stateSoTNoBreak);
  stdout.write(automaton);
  if (automaton != expectedAutomatonDescription) {
    stderr
      ..writeln('DIFFERS FROM EXPECTATION:')
      ..write(expectedAutomatonDescription);
  }
}

void _writeBackTable(Uint16List table, int automatonRowLength) {
  var backCategoryNames = [...categoryShortNames]..[categorySoT] = 'SoT';
  var backAutomaton = _generateTable(
    table,
    automatonRowLength,
    backStateLimit,
    backStateShortName,
    backStateShortName,
    backCategoryNames,
    stateEoTNoBreak,
  );
  stdout.write(backAutomaton);
  if (backAutomaton != expectedBackAutomatonDescription) {
    stderr
      ..writeln('DIFFERS FROM EXPECTATION:')
      ..write(expectedBackAutomatonDescription);
  }
}

/// Writes an automaton table to string, for debugging.
///
/// The table has size `stateLimit`, which is a multiple of
/// `automatonRowLength` and `automatonRowLength >= categoryCount`.
/// The [stateNames] provide the names of the states for this particular
/// automaton (differs between forward and backward automaton).
/// It has a name for every target state that occurs in the *table*.
/// The table contains states multiplied by `automatonRowLength`, possibly with
/// the first bit set as a break-before/after flag.
/// The [stateLimit] is an upper limit of "real" states that occur in the table,
/// states above that, if any, are synthetic states that trigger non-
/// automaton based scanning.
/// The [ignoreState] is a single state that is not displayed.
String _generateTable(
    Uint16List table,
    int automatonRowLength,
    int stateLimit, // A multiple of automatonRowLength
    String Function(int) stateNames,
    String Function(int) lookaheadStateNames,
    List<String> categoryNames,
    int ignoreState) {
  assert(automatonRowLength >= categoryCount);
  assert(table.length == stateLimit);
  var buf = StringBuffer();
  buf.writeln('Stat: Cat');
  var preHeaderLength = buf.length;
  buf.write('    :');
  for (var i = 0; i < categoryCount; i++) {
    buf
      ..write(' ')
      ..write(categoryNames[i].padRight(4));
  }
  buf.writeln(':');
  var lineLength = buf.length - preHeaderLength;
  buf.writeln('-' * (lineLength - 1));
  for (var si = 0; si < stateLimit; si += automatonRowLength) {
    var stateName = stateNames(si);
    buf
      ..write(stateName.padRight(4))
      ..write(':');
    for (var ci = 0; ci < categoryCount; ci++) {
      var value = table[si + ci];
      var targetState = value & maskState;
      var flags = value & maskFlags;
      var prefix = r' !$#'[flags];

      var targetStateName = (flags == flagLookahead)
          ? lookaheadStateNames(targetState)
          : stateNames(targetState);
      // EoT is marker for unreachable states.
      if (targetState == ignoreState) targetStateName = ' -  ';
      buf
        ..write(prefix)
        ..write(targetStateName.padRight(4));
    }
    buf.writeln(':');
  }
  return buf.toString();
}

/// Target state name for forward automaton.
String _targetStateName(int state, int flags) {
  if (flags == flagLookahead) return backStateShortName(state);
  return stateShortName(state);
}

const preferInline = """
@pragma('dart2js:prefer-inline')
@pragma('vm:prefer-inline')
@pragma('wasm:prefer-inline')""";
