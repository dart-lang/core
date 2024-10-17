// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "dart:io";
import "dart:typed_data";

import "package:characters/src/grapheme_clusters/constants.dart";

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
// Cat  : State
//      :  SoT  Brk  CR   Otr  Pre  L    V    T    Pic  PicZ Reg  SoTN :
// ---------------------------------------------------------------------
// Other: !Otr !Otr !Otr !Otr  Otr !Otr !Otr !Otr !Otr !Otr !Otr  Otr  :
// CR   : !CR  !CR  !CR  !CR  !CR  !CR  !CR  !CR  !CR  !CR  !CR   CR   :
// LF   : !Brk !Brk  Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk  Brk  :
// Ctrl : !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk  Brk  :
// Ext  : !Otr !Otr !Otr  Otr  Otr  Otr  Otr  Otr  Pic  Otr  Otr  Otr  :
// ZWJ  : !Otr !Otr !Otr  Otr  Otr  Otr  Otr  Otr  PicZ Otr  Otr  Otr  :
// Spac : !Otr !Otr !Otr  Otr  Otr  Otr  Otr  Otr  Otr  Otr  Otr  Otr  :
// Prep : !Pre !Pre !Pre !Pre  Pre !Pre !Pre !Pre !Pre !Pre !Pre  Pre  :
// Reg  : !Reg !Reg !Reg !Reg  Reg !Reg !Reg !Reg !Reg !Reg  Otr  Reg  :
// L    : !L   !L   !L   !L    L    L   !L   !L   !L   !L   !L    L    :
// V    : !V   !V   !V   !V    V    V    V   !V   !V   !V   !V    V    :
// T    : !T   !T   !T   !T    T   !T    T    T   !T   !T   !T    T    :
// LV   : !V   !V   !V   !V    V    V   !V   !V   !V   !V   !V    V    :
// LVT  : !T   !T   !T   !T    T    T   !T   !T   !T   !T   !T    T    :
// Pic  : !Pic !Pic !Pic !Pic  Pic !Pic !Pic !Pic !Pic  Pic !Pic  Pic  :
// EoT  :   -  ! -  ! -  ! -  ! -  ! -  ! -  ! -  ! -  ! -  ! -    -   :

void writeForwardAutomaton(StringSink buffer, {required bool verbose}) {
  assert(categories.length == 16);
  var table = Uint8List(states.length * categories.length);
  void transition(int state, int category, int newState, bool breakBefore) {
    table[state + category] = newState | (breakBefore ? 0 : stateNoBreak);
  }

  for (var state in states) {
    transition(state, categoryOther, stateOther,
        state != statePrepend && state != stateSoTNoBreak);
    transition(state, categoryCR, stateCR, state != stateSoTNoBreak);
    transition(state, categoryLF, stateBreak,
        state != stateCR && state != stateSoTNoBreak);
    transition(state, categoryControl, stateBreak, state != stateSoTNoBreak);
    if (state != statePictographic) {
      transition(state, categoryExtend, stateOther, state <= stateCR);
      transition(state, categoryZWJ, stateOther, state <= stateCR);
    } else {
      transition(state, categoryExtend, statePictographic, false);
      transition(state, categoryZWJ, statePictographicZWJ, false);
    }
    if (state != stateRegionalSingle) {
      transition(state, categoryRegionalIndicator, stateRegionalSingle,
          state != statePrepend && state != stateSoTNoBreak);
    } else {
      transition(state, categoryRegionalIndicator, stateOther, false);
    }
    transition(state, categoryPrepend, statePrepend,
        state != statePrepend && state != stateSoTNoBreak);
    transition(state, categorySpacingMark, stateOther, state <= stateCR);
    transition(state, categoryL, stateL,
        state != statePrepend && state != stateL && state != stateSoTNoBreak);
    transition(state, categoryLV, stateV,
        state != statePrepend && state != stateL && state != stateSoTNoBreak);
    transition(state, categoryLVT, stateT,
        state != statePrepend && state != stateL && state != stateSoTNoBreak);
    transition(
        state,
        categoryV,
        stateV,
        state != statePrepend &&
            state != stateL &&
            state != stateV &&
            state != stateSoTNoBreak);
    transition(
        state,
        categoryT,
        stateT,
        state != statePrepend &&
            state != stateV &&
            state != stateT &&
            state != stateSoTNoBreak);
    transition(
        state,
        categoryPictographic,
        statePictographic,
        state != statePrepend &&
            state != statePictographicZWJ &&
            state != stateSoTNoBreak);
    transition(state, categoryEoT, stateSoTNoBreak,
        state != stateSoT && state != stateSoTNoBreak);
  }
  var stringWriter = StringLiteralWriter(buffer, padding: 4);
  buffer.write("const _stateMachine = ");
  stringWriter.start("const _stateMachine = ".length);
  for (var i = 0; i < table.length; i++) {
    stringWriter.add(table[i]);
  }
  stringWriter.end();
  buffer.write(";\n");
  buffer.write(_moveMethod);

  if (verbose) _writeForwardTable(table);
}

const String _moveMethod = """
int move(int state, int inputCategory) =>
    _stateMachine.codeUnitAt((state & 0xF0) | inputCategory);
""";

const String _moveBackMethod = """
int moveBack(int state, int inputCategory) =>
    _backStateMachine.codeUnitAt((state & 0xF0) | inputCategory);
""";

const states = [
  stateSoT,
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
  stateSoTNoBreak,
];

const categories = [
  categoryOther,
  categoryCR,
  categoryLF,
  categoryControl,
  categoryExtend,
  categoryZWJ,
  categoryRegionalIndicator,
  categoryPrepend,
  categorySpacingMark,
  categoryL,
  categoryV,
  categoryT,
  categoryLV,
  categoryLVT,
  categoryPictographic,
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
// Cat  : State:
//      :  EoT  Brk  LF   Otr  Ext  L    V    T    Pic  LA   Reg  EoTN RegE :
// --------------------------------------------------------------------------
// Other: !Otr !Otr !Otr !Otr  Otr !Otr !Otr !Otr !Otr   -  !Otr  Otr !Otr  :
// LF   : !LF  !LF  !LF  !LF  !LF  !LF  !LF  !LF  !LF    -  !LF   LF  !LF   :
// CR   : !Brk !Brk  Brk !Brk !Brk !Brk !Brk !Brk !Brk   -  !Brk  Brk !Brk  :
// Ctrl : !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk   -  !Brk  Brk !Brk  :
// Ext  : !Ext !Ext !Ext !Ext  Ext !Ext !Ext !Ext !Ext  LA  !Ext  Ext !Ext  :
// ZWJ  : !Ext !Ext !Ext !Ext  Ext !Ext !Ext !Ext $LAZP  -  !Ext  Ext !Ext  :
// Spac : !Ext !Ext !Ext !Ext  Ext !Ext !Ext !Ext !Ext   -  !Ext  Ext !Ext  :
// Prep : !Otr !Otr !Otr  Otr  Otr  Otr  Otr  Otr  Otr   -   Otr  Otr  Otr  :
// Reg  : !Reg !Reg !Reg !Reg  Reg !Reg !Reg !Reg !Reg  RegE$LARe Reg !LA   :
// L    : !L   !L   !L   !L    L    L    L   !L   !L     -  !L    L   !L    :
// V    : !V   !V   !V   !V    V   !V    V    V   !V     -  !V    V   !V    :
// T    : !T   !T   !T   !T    T   !T   !T    T   !T     -  !T    T   !T    :
// LV   : !L   !L   !L   !L    L   !L    L    L   !L     -  !L    L   !L    :
// LVT  : !L   !L   !L   !L    L   !L   !L    L   !L     -  !L    L   !L    :
// Pic  : !Pic !Pic !Pic !Pic  Pic !Pic !Pic !Pic !Pic  Pic !Pic  Pic !Pic  :
// SoT  :   -  ! -  ! -  ! -  ! -  ! -  ! -  ! -  ! -    -  ! -    -  ! -   :

const backStates = [
  stateEoT,
  stateBreak,
  stateLF,
  stateOther,
  stateExtend,
  stateL,
  stateV,
  stateT,
  statePictographic,
  stateZWJPictographic | stateRegionalOdd, // Known disjoint look-ahead.
  stateRegionalSingle,
  stateEoTNoBreak,
  stateRegionalEven,
];

void writeBackwardAutomaton(StringSink buffer, {required bool verbose}) {
  assert(categories.length == 16);
  var table = Uint8List(backStates.length * categories.length);
  void transition(int state, int category, int newState, bool breakBefore) {
    table[state + category] = newState | (breakBefore ? 0 : stateNoBreak);
  }

  for (var state in backStates) {
    if (state == stateZWJPictographic | stateRegionalOdd) {
      // Special state where we know the previous character
      // to some degree.
      // Most inputs are unreachable. Use EoT-nobreak as unreachable marker.
      for (var i = 0; i <= categoryEoT; i++) {
        transition(state, i, stateEoTNoBreak, false);
      }
      transition(state, categoryExtend, stateZWJPictographic, false);
      transition(state, categoryPictographic, statePictographic, false);
      transition(state, categoryRegionalIndicator, stateRegionalEven, false);
      // Remaining inputs are unreachable.
      continue;
    }
    transition(state, categoryOther, stateOther,
        state != stateExtend && state != stateEoTNoBreak);
    transition(state, categoryLF, stateLF, state != stateEoTNoBreak);
    transition(state, categoryCR, stateBreak,
        state != stateLF && state != stateEoTNoBreak);
    transition(state, categoryControl, stateBreak, state != stateEoTNoBreak);
    if (state != stateZWJPictographic) {
      transition(
          state,
          categoryExtend,
          stateExtend,
          state != stateExtend &&
              state != stateZWJPictographic &&
              state != stateEoTNoBreak);
    }
    transition(state, categorySpacingMark, stateExtend,
        state != stateExtend && state != stateEoTNoBreak);
    if (state != statePictographic) {
      transition(state, categoryZWJ, stateExtend,
          state != stateExtend && state != stateEoTNoBreak);
    } else {
      transition(state, categoryZWJ, stateZWJPictographicLookahead, true);
    }
    if (state == stateRegionalEven) {
      transition(state, categoryRegionalIndicator, stateRegionalOdd, true);
    } else if (state == stateRegionalSingle) {
      transition(
          state, categoryRegionalIndicator, stateRegionalLookahead, true);
    } else {
      transition(state, categoryRegionalIndicator, stateRegionalSingle,
          state != stateExtend && state != stateEoTNoBreak);
    }
    transition(state, categoryPrepend, stateOther, state <= stateLF);
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
            state != stateZWJPictographic &&
            state != stateEoTNoBreak);
    // Use EoT-NoBreak as maker for unreachable.
    transition(state, categorySoT, stateEoTNoBreak,
        state != stateEoT && state != stateEoTNoBreak);
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
  if (verbose) _writeBackTable(table);
}

void _writeForwardTable(Uint8List table) {
  _writeTable(
      table,
      const [
        "SoT",
        "Brk",
        "CR",
        "Otr",
        "Pre",
        "L",
        "V",
        "T",
        "Pic",
        "PicZ",
        "Reg",
        "SoTN",
      ],
      const [
        "Other",
        "CR",
        "LF",
        "Ctrl",
        "Ext",
        "ZWJ",
        "Spac",
        "Prep",
        "Reg",
        "L",
        "V",
        "T",
        "LV",
        "LVT",
        "Pic",
        "EoT",
      ],
      stateSoTNoBreak,
      stateSoTNoBreak);
}

void _writeBackTable(Uint8List table) {
  _writeTable(
      table,
      const [
        "EoT",
        "Brk",
        "LF",
        "Otr",
        "Ext",
        "L",
        "V",
        "T",
        "Pic",
        "LA",
        "Reg",
        "EoTN",
        "RegE",
        "LARe",
        "LAZP",
      ],
      const [
        "Other",
        "LF",
        "CR",
        "Ctrl",
        "Ext",
        "ZWJ",
        "Spac",
        "Prep",
        "Reg",
        "L",
        "V",
        "T",
        "LV",
        "LVT",
        "Pic",
        "SoT",
      ],
      stateEoTNoBreak,
      stateRegionalEven);
}

void _writeTable(Uint8List table, List<String> stateNames,
    List<String> catNames, int ignoreState, int maxState) {
  const catIndex = {
    "Other": categoryOther,
    "LF": categoryLF,
    "CR": categoryCR,
    "Ctrl": categoryControl,
    "Ext": categoryExtend,
    "ZWJ": categoryZWJ,
    "Spac": categorySpacingMark,
    "Prep": categoryPrepend,
    "Reg": categoryRegionalIndicator,
    "L": categoryL,
    "V": categoryV,
    "T": categoryT,
    "LV": categoryLV,
    "LVT": categoryLVT,
    "Pic": categoryPictographic,
    "SoT": categorySoT,
    "EoT": categoryEoT,
  };

  var buf = StringBuffer();
  buf.write("     :  ");
  for (var i = 0; i <= maxState; i += 0x10) {
    buf.write(stateNames[i >> 4].padRight(5, " "));
  }
  buf.writeln(":");
  buf.writeln("-" * (buf.length - 1));
  for (var ci = 0; ci < catNames.length; ci++) {
    var catName = catNames[ci];
    buf
      ..write(catName.padRight(5))
      ..write(": ");
    var cat = catIndex[catName]!;
    for (var si = 0; si <= maxState; si += 0x10) {
      var value = table[si + cat];
      var prefix = " ";
      if (value & 0xF0 > maxState) {
        prefix = r"$";
      } else if (value & stateNoBreak == 0) {
        prefix = "!";
      }
      var stateName = stateNames[value >> 4];
      // EoT is marker for unreachable states.
      if ((value & 0xF0) == ignoreState) stateName = " - ";
      buf
        ..write(prefix)
        ..write(stateName.padRight(4, " "));
    }
    buf.writeln(" :");
  }
  stderr.writeln(buf);
}
