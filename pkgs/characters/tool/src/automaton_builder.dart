// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "dart:io";
import "dart:typed_data";

import "package:characters/src/grapheme_clusters/constants.dart";

import 'category_names.dart';
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
// Cat\  State
//     \  SoT  Brk  CR   Otr  Pre  L    V    T    Pic  PicZ Reg  SoTN  InC InCL
// -----------------------------------------------------------------------------
// Otr : !Otr !Otr !Otr !Otr  Otr !Otr !Otr !Otr !Otr !Otr !Otr  Otr  !Otr !Otr
// CR  : !CR  !CR  !CR  !CR  !CR  !CR  !CR  !CR  !CR  !CR  !CR   CR   !CR  !CR
// LF  : !Brk !Brk  Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk  Brk  !Brk !Brk
// Ctrl: !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk  Brk  !Brk !Brk
// Ext : !Otr !Otr !Otr  Otr  Otr  Otr  Otr  Otr  Pic  Otr  Otr  Otr   Otr  Otr
// Spac: !Otr !Otr !Otr  Otr  Otr  Otr  Otr  Otr  Otr  Otr  Otr  Otr   Otr  Otr
// Prep: !Pre !Pre !Pre !Pre  Pre !Pre !Pre !Pre !Pre !Pre !Pre  Pre  !Pre !Pre
// Reg : !Reg !Reg !Reg !Reg  Reg !Reg !Reg !Reg !Reg !Reg  Otr  Reg  !Reg !Reg
// L   : !L   !L   !L   !L    L    L   !L   !L   !L   !L   !L    L    !L   !L
// V   : !V   !V   !V   !V    V    V    V   !V   !V   !V   !V    V    !V   !V
// T   : !T   !T   !T   !T    T   !T    T    T   !T   !T   !T    T    !T   !T
// LV  : !V   !V   !V   !V    V    V   !V   !V   !V   !V   !V    V    !V   !V
// LVT : !T   !T   !T   !T    T    T   !T   !T   !T   !T   !T    T    !T   !T
// Pic : !Pic !Pic !Pic !Pic  Pic !Pic !Pic !Pic !Pic  Pic !Pic  Pic  !Pic !Pic
// EoT :   -  ! -  ! -  ! -  ! -  ! -  ! -  ! -  ! -  ! -  ! -    -   ! -  ! -
// OInC: !InC !InC !InC  InC !InC !InC !InC !InC !InC !InC !InC  InC  !InC  InC
// ZWJ : !Otr !Otr !Otr  Otr  Otr  Otr  Otr  Otr  PicZ Otr  Otr  Otr   InC  InCL
// EInE: !Otr !Otr !Otr  Otr  Otr  Otr  Otr  Otr  Pic  Otr  Otr  Otr   InC  InCL
// EInL: !Otr !Otr !Otr  Otr  Otr  Otr  Otr  Otr  Pic  Otr  Otr  Otr   InCL InCL
void writeForwardAutomaton(StringSink buffer, {required bool verbose}) {
  assert(categories.length == categoryCount);
  assert(rowLength.isEven && rowLength >= categoryCount);
  var table = Uint16List(stateCount * rowLength);
  void transition(int state, int category, int newState, bool breakBefore) {
    table[state * rowLength + category] =
        // TODO: Multiply only by rowLength~/2, to keep inside one byte.
        // Shift the rest when doing lookup. CPUs are great at that.
        (newState * rowLength) | (breakBefore ? 0 : flagNoBreak);
  }

  for (var state = 0; state < stateCount; state++) {
    // States that should always be broken after, unless something specifically
    // says otherwise. (And does so in GB1..G5).
    var alwaysBreakBefore =
        state == stateSoT || state == stateBreak || state == stateCR;

    // States that should never be broken after, unless `alwaysBreakBefore`
    // says otherwise (for example the rules in GB1..GB5).
    var neverBreakBefore = state == stateSoTNoBreak || state == statePrepend;

    // Other with InCB=None.
    // No rules apply specifically to Other, so break unless an Any rule applies.
    transition(state, categoryOther, stateOther, !neverBreakBefore);
    // Other with InCB=Consonant.
    // GB9C. (Break unless Any rule applies, or preceded by indic sequence
    // with at least one Linked, `stateInCL`).
    // Remember having seen InCB=Consonant and no InCB=Linked yet.
    transition(state, categoryOtherIndicConsonant, stateInC,
        !(neverBreakBefore || state == stateInCL));

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
    } else {
      // GB9 alone.
      // No special rules for breaking after,
      // break before only if required by GB1-GB5.
      transition(state, categoryExtend, stateOther, alwaysBreakBefore);
      transition(
          state, categoryExtendIndicExtend, stateOther, alwaysBreakBefore);
      transition(
          state, categoryExtendIndicLinked, stateOther, alwaysBreakBefore);
      transition(state, categoryZWJ, stateOther, alwaysBreakBefore);
    }
    // Regional indicator.
    // GB12 + GB13: Don't break if after an odd number of Reg.
    // Otherwise remember an odd number of Reg, and break before unless
    // prior state says not to.
    if (state == stateRegionalSingle) {
      transition(state, categoryRegionalIndicator, stateOther, false);
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
    transition(
        state,
        categoryPictographic,
        statePictographic,
        state != statePrepend &&
            state != statePictographicZWJ &&
            state != stateSoTNoBreak);
    // End of input.
    // GB2.
    transition(state, categoryEoT, stateSoTNoBreak,
        state != stateSoT && state != stateSoTNoBreak);

    // Pad table if necessary.
    for (var c = categoryCount; c < rowLength; c++) {
      transition(state, c, stateSoTNoBreak, false);
    }

    print([
      for (var i = 0; i < categoryCount; i++)
        table[state * rowLength + i].toRadixString(rowLength)
    ].join(" "));
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
    _stateMachine.codeUnitAt((state & ~$flagNoBreak) + inputCategory);
""";

const String _moveBackMethod = """
int moveBack(int state, int inputCategory) =>
    _backStateMachine.codeUnitAt((state & ~$flagNoBreak) + inputCategory);
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
// Cat  : State:
//      :  EoT  Brk  LF   Otr  Ext  L    V    T    Pic  LA   Reg  EoTN RegE InC
// -----------------------------------------------------------------------------
// Other: !Otr !Otr !Otr !Otr  Otr !Otr !Otr !Otr !Otr   -  !Otr  Otr !Otr !Otr
// LF   : !LF  !LF  !LF  !LF  !LF  !LF  !LF  !LF  !LF    -  !LF   LF  !LF  !LF
// CR   : !Brk !Brk  Brk !Brk !Brk !Brk !Brk !Brk !Brk   -  !Brk  Brk !Brk !Brk
// Ctrl : !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk !Brk   -  !Brk  Brk !Brk !Brk
// Ext  : !Ext !Ext !Ext !Ext  Ext !Ext !Ext !Ext !Ext  LA  !Ext  Ext !Ext !Ext
// Spac : !Ext !Ext !Ext !Ext  Ext !Ext !Ext !Ext !Ext   -  !Ext  Ext !Ext !Ext
// Prep : !Otr !Otr !Otr  Otr  Otr  Otr  Otr  Otr  Otr   -   Otr  Otr  Otr  Otr
// Reg  : !Reg !Reg !Reg !Reg  Reg !Reg !Reg !Reg !Reg  RegE$LARe Reg !LA  !Reg
// L    : !L   !L   !L   !L    L    L    L   !L   !L     -  !L    L   !L   !L
// V    : !V   !V   !V   !V    V   !V    V    V   !V     -  !V    V   !V   !V
// T    : !T   !T   !T   !T    T   !T   !T    T   !T     -  !T    T   !T   !T
// LV   : !L   !L   !L   !L    L   !L    L    L   !L     -  !L    L   !L   !L
// LVT  : !L   !L   !L   !L    L   !L   !L    L   !L     -  !L    L   !L   !L
// Pic  : !Pic !Pic !Pic !Pic  Pic !Pic !Pic !Pic !Pic  Pic !Pic  Pic !Pic !Pic
// SoT  :   -  ! -  ! -  ! -  ! -  ! -  ! -  ! -  ! -    -  ! -    -  ! -  ! -
// OinC : !InC !InC !InC !InC  InC !InC !InC !InC !InC   -  !InC  InC !InC !InC
// ZWJ  : !Ext !Ext !Ext !Ext  Ext !Ext !Ext !Ext $LAZP  -  !Ext  Ext !Ext $LAIC
// EinE : !Ext !Ext !Ext !Ext  Ext !Ext !Ext !Ext !Ext  LA  !Ext  Ext !Ext $LAIC
// EinL : !Ext !Ext !Ext !Ext  Ext !Ext !Ext !Ext !Ext  LA  !Ext  Ext !Ext $LAIL

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
  stateInC,
  stateRegionalEven,
];

void writeBackwardAutomaton(StringSink buffer, {required bool verbose}) {
  assert(categories.length <= rowLength);
  var table = Uint16List(backStateCount * rowLength);
  void transition(int state, int category, int newState, bool breakBefore) {
    table[state * rowLength + category] =
        (newState * rowLength) | (breakBefore ? 0 : flagNoBreak);
  }

  for (var state in backStates) {
    if (state == stateZWJPictographic | stateRegionalOdd) {
      // Special state where we know the previous character
      // to some degree, due to having done look-ahead.
      // Most inputs are unreachable. Use EoT-nobreak as unreachable marker.
      for (var i = 0; i <= categoryCount; i++) {
        transition(state, i, stateEoTNoBreak, false);
      }
      transition(state, categoryExtend, stateZWJPictographic, false);
      // Indic Conjunct "extend" and "Linked" behave like "Extend" here.
      transition(state, categoryExtendIndicExtend, stateZWJPictographic, false);
      transition(state, categoryExtendIndicLinked, stateZWJPictographic, false);
      transition(state, categoryPictographic, statePictographic, false);
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
        state != stateZWJPictographic &&
        state != stateEoTNoBreak;
    transition(state, categoryExtend, stateExtend, breakBeforeExtend);
    if (state != stateInC) {
      transition(
          state, categoryExtendIndicExtend, stateExtend, breakBeforeExtend);
      transition(
          state, categoryExtendIndicLinked, stateExtend, breakBeforeExtend);
    } else {
      // If these come just before an InCB Consonant, look ahead.
      transition(state, categoryExtendIndicExtend, stateInCLookahead, true);
      transition(state, categoryExtendIndicLinked, stateInCLLookahead, true);
    }
    transition(state, categorySpacingMark, stateExtend,
        state != stateExtend && state != stateEoTNoBreak);
    if (state == statePictographic) {
      // Break-before value has no effect on lookahead states.
      transition(state, categoryZWJ, stateZWJPictographicLookahead, true);
    } else if (state == stateInC) {
      transition(state, categoryZWJ, stateInCLookahead, true);
    } else {
      transition(state, categoryZWJ, stateExtend,
          state != stateExtend && state != stateEoTNoBreak);
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
    // Use EoT-NoBreak as marker for unreachable.
    transition(state, categorySoT, stateEoTNoBreak,
        state != stateEoT && state != stateEoTNoBreak);
    for (var i = categoryCount; i < rowLength; i++) {
      transition(state, i, stateEoTNoBreak, false);
    }

    print([
      state.toRadixString(rowLength),
      ":",
      for (var i = 0; i < categoryCount; i++)
        table[state * rowLength + i].toRadixString(rowLength)
    ].join(" "));
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
  _writeTable(
      table,
      rowLength,
      stateCount,
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
        "InC",
        "InCL"
      ],
      stateSoTNoBreak);
}

void _writeBackTable(Uint16List table, int rowLength) {
  _writeTable(
    table,
    rowLength,
    backStateCount,
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
      "InC",
      "RegE",
      "LARe",
      "LAZP",
      "LAIC",
      "LAIL",
    ],
    stateEoTNoBreak,
  );
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
void _writeTable(Uint16List table, int rowLength, int stateCount,
    List<String> stateNames, int ignoreState) {
  assert(rowLength >= categoryCount);
  assert(table.length == stateCount * rowLength);
  var buf = StringBuffer();
  buf.write("     :  ");
  for (var i = 0; i < stateCount; i++) {
    buf.write(stateNames[i].padRight(5, " "));
  }
  buf.writeln(":");
  buf.writeln("-" * (buf.length - 1));
  for (var ci = 0; ci < categoryCount; ci++) {
    var catName = categoryShortNames[ci];
    buf
      ..write(catName.padRight(5))
      ..write(": ");
    for (var si = 0; si < stateCount; si++) {
      var value = table[si * rowLength + ci];
      var noBreak = value & flagNoBreak != 0;
      var targetState = value ~/ rowLength;
      var prefix = " ";
      if (targetState >= stateCount) {
        // Synthetic state (look ahead).
        prefix = r"$";
      } else if (!noBreak) {
        prefix = "!";
      }
      var stateName = stateNames[targetState];
      // EoT is marker for unreachable states.
      if (targetState == ignoreState) stateName = " - ";
      buf
        ..write(prefix)
        ..write(stateName.padRight(4, " "));
    }
    buf.writeln(" :");
  }
  stderr.writeln(buf);
}
