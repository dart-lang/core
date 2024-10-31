// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Unicode Grapheme Breaking Algorithm Character Categories.
/// (Order is irrelevant to correctness, so it is chosen
/// to minimize the size of the generated table strings
/// by avoiding many bytes that need escapes).
const int categoryCR = 0;
const int categoryControl = 1;
const int categoryOther = 2; // Any character not in any other category.
const int categoryExtend = 3;
const int categorySpacingMark = 4;
const int categoryRegionalIndicator = 5;
const int categoryPictographic = 6;
const int categoryLF = 7;
const int categoryPrepend = 8;
const int categoryL = 9;
const int categoryV = 10;
const int categoryT = 11;
const int categoryLV = 12;
const int categoryLVT = 13;
const int categoryOtherIndicConsonant = 14; // Other + InCB=Consonant.
const int categoryZWJ = 15; // Is also InCB=Extend.
const int categoryExtendIndicExtend = 16; // Extend + InCB=Extend.
const int categoryExtendIndicLinked = 17; // Extend + InCB=Linked.
const int categoryEoT = 18; // End of Text (synthetic input)

const int categoryCount = categoryEoT + 1;

const int regionalIndicatorStart = 0x1F1E6; // A
const int regionalIndicatorEnd = 0x1F1FF; // Z

// Automaton states for forwards automaton.

/// Bit flag or'ed to the automaton output if there should not be a break
/// before the most recent input character.
const int flagNoBreak  = 1;

/// Automaton row length, number of input categories rounded
/// to an even number, so that an entry can store a state multiplied by
/// the row length and always use the first bit for [flagNoBreak].
const automatonRowLength = categoryCount + (categoryCount & 1);

// Let states be the position of their entries in the automaton data.

// States of forwards automaton ---------------------------------------

// For each state, also have a `scaledState...` for the value of that
// state that occurs in the automaton tables (and which is an index
// into the automaton tables).

/// Start of text (or grapheme).
const int stateSoT = 0x00;
const int scaledStateSoT = stateSoT * automatonRowLength;

/// Always break before next.
const int stateBreak = 0x01;
const int scaledStateBreak = stateBreak * automatonRowLength;

/// Break unless next is LF.
const int stateCR = 0x02;
const int scaledStateCR = stateCR * automatonRowLength;

/// Break unless next is Extend, ZWJ, SpacingMark.
const int stateOther = 0x03;
const int scaledStateOther = stateOther * automatonRowLength;

/// Break only if next is Control/CR/LF/eot.
const int statePrepend = 0x04;
const int scaledStatePrepend = statePrepend * automatonRowLength;

/// As Other unless next is L, V, LV, LVT.
///
/// Seen `L+`
const int stateL = 0x05;
const int scaledStateL = stateL * automatonRowLength;

/// As Other unless next is V, T.
/// Seen: `L* (LV|V) V*`
const int stateV = 0x06;
const int scaledStateV = stateV * automatonRowLength;

/// As Other unless next is T.
///
/// Seen `L*(LV?V*T|LVT)T*`.
const int stateT = 0x07;
const int scaledStateT = stateT * automatonRowLength;

/// As Other unless followed by Ext* ZWJ Pic.
const int statePictographic = 0x08;
const int scaledStatePictographic = statePictographic * automatonRowLength;

/// As Other unless followed by Pic.
const int statePictographicZWJ = 0x09;
const int scaledStatePictographicZWJ =
    statePictographicZWJ * automatonRowLength;

/// As Other unless followed by RI. 
/// 
/// Unknown whether there is an even or odd number of prior RIs.
const int stateRegionalSingle = 0x0A;
const int scaledStateRegionalSingle = stateRegionalSingle * automatonRowLength;

/// As SoT but never cause break before next.
const int stateSoTNoBreak = 0x0B;
const int scaledStateSoTNoBreak = stateSoTNoBreak * automatonRowLength;

/// As Other unless next is InCB=Extend|Linked|.
/// Has seen `{InCB=Consonant} {InCB=Extend}*`.
const int stateInC = 0x0C;
const int scaledStateInC = stateInC * automatonRowLength;

/// As Other unless InCB=Extend|Linked|Consonant.
/// Seen `{InCB=Consonant} {InCB=Extend}* {InCB=Linked} {InCB=Extend|Linked}*`.
/// Don't break before a following `{InCB=Consonant}`.
const int stateInCL = 0x0D;
const int scaledStateInCL = stateInCL * automatonRowLength;

// --------------------------------------------------------------------

/// Number of states in forward automaton.
const int stateCount = stateInCL + 1;

// ---------------------------------------------------------------------
// Backwards Automaton extra/alternative states and categories.
//
// Reuses state positions that are not used in backwards search,
// possibly because they are replaced by look-behind.

const int categorySoT = categoryEoT; // Start of Text (synthetic input)

/// Start of text (or grapheme).
const int stateEoT = stateSoT;
const int scaledStateEoT = scaledStateSoT;

/// Break unless prev is CR.
const int stateLF = stateCR;
const int scaledStateLF = scaledStateCR;

/// Only break if prev is Control/CR/LF/sot.
const int stateExtend = statePrepend;
const int scaledStateExtend = scaledStatePrepend;

/// Preceded by Pic Ext*.
const int stateZWJPictographic = statePictographicZWJ;
const int scaledStateZWJPictographic = scaledStatePictographicZWJ;

/// As EoT but never cause break before.
const int stateEoTNoBreak = stateSoTNoBreak;
const int scaledStateEoTNoBreak = scaledStateSoTNoBreak;

/// There is an even number of RIs before.
const int stateRegionalEven = stateInCL;
const int scaledStateRegionalEven = scaledStateInCL;

/// There is an odd (non-zero!) number of RIs before.
const int stateRegionalOdd = stateZWJPictographic;
const int scaledStateRegionalOdd = scaledStateZWJPictographic;

// Backwards automaton sometimes needs to perform lookahead.
// The rules for grapheme cluster breaking can depend on knowing
// the categories of multiple *prior* code points. When getting to such a point
// during backwards movement, the automaton breaks out and runs specialized
// code that looks back on prior characters to decide whether the current
// position should break.
// (TODO: Also allow updating the position if it's known where the next break
// is in the scanned characters.)

// It triggers that by entering a synthetic state.
// After doing the lookahead, that synthetic state is replaced by a
// conventional state that allows it to proceed.
// The extra states are not part of the state machine.

/// Minimum state requesting a look-ahead.
const int stateLookaheadMin = stateRegionalLookahead;
const int scaledStateLookaheadMin = scaledStateRegionalLookahead;

/// State requesting a look-ahead for an even or odd number of RIs.
const int stateRegionalLookahead = 0x0E;
const int scaledStateRegionalLookahead =
    stateRegionalLookahead * automatonRowLength;

/// State requesting a look-ahead for Pic Ext*.
const int stateZWJPictographicLookahead = 0x0F;
const int scaledStateZWJPictographicLookahead =
    stateZWJPictographicLookahead * automatonRowLength;

/// State requesting a look-ahead for InCB consonant + InCB (Extend + Linked)+
/// with at least one Linked.
const int stateInCLookahead = 0x10;
const int scaledStateInCLookahead = stateInCLookahead * automatonRowLength;

/// State requesting a look-ahead for InCB consonant + InCB (Extend + Linked)+
/// ending with a linked.
const int stateInCLLookahead = 0x11;
const int scaledStateInCLLookahead = stateInCLLookahead * automatonRowLength;

/// Number of real states in backwards automaton.
const int backStateCount = stateLookaheadMin;

/// Number of output states in backwards automaton, including synthetic states
/// that trigger lookahead computations. (Those have no entries in the
/// automaton, they are handled by code and then change to a real state
/// depending on the lookahead.)
const int backStateWithLACount = stateInCLLookahead + 1;
