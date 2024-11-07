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
const int inputCategoryCount = categoryEoT;

const int regionalIndicatorStart = 0x1F1E6; // A
const int regionalIndicatorEnd = 0x1F1FF; // Z

// Automaton states for forwards automaton.

/// Bit flag or'ed to the automaton output if there should not be a break
/// before the most recent input character.
const int flagNoBreak = 1;
const int flagBreak = 0;
const int maskBreak = 1;

/// Automaton row length, number of input categories rounded
/// to an even number, so that an entry can store a state multiplied by
/// the row length and always use the first bit for [flagNoBreak].
const automatonRowLength = categoryCount + (categoryCount & 1);

/// Stored states must be shifted by this amount to match
/// [automatonRowLength].
const stateShift = 1;

/// State IDs are multiplied by this to become state values.
const scaleState = automatonRowLength >> stateShift;

// Let states be the position of their entries in the automaton data.

// States of forwards automaton ---------------------------------------

// For each state, also have a `scaledState...` for the value of that
// state that occurs in the automaton tables (and which is an index
// into the automaton tables).

/// Always break before next.
const int idStateBreak = 0x00;
const int stateBreak = idStateBreak * scaleState;

/// Break unless next is LF.
const int idStateCR = 0x01;
const int stateCR = idStateCR * scaleState;

/// Break unless next is Extend, ZWJ, SpacingMark.
const int idStateOther = 0x02;
const int stateOther = idStateOther * scaleState;

/// Break only if next is Control/CR/LF/eot.
const int idStatePrepend = 0x03;
const int statePrepend = idStatePrepend * scaleState;

/// As Other unless next is L, V, LV, LVT.
///
/// Seen `L+`
const int stateL = 0x04;
const int scaledStateL = stateL * scaleState;

/// As Other unless next is V, T.
/// Seen: `L* (LV|V) V*`
const int stateV = 0x05;
const int scaledStateV = stateV * scaleState;

/// As Other unless next is T.
///
/// Seen `L*(LV?V*T|LVT)T*`.
const int stateT = 0x06;
const int scaledStateT = stateT * scaleState;

/// As Other unless followed by Ext* ZWJ Pic.
const int idStatePictographic = 0x07;
const int statePictographic = idStatePictographic * scaleState;

/// As Other unless followed by Pic.
const int idStatePictographicZWJ = 0x08;
const int statePictographicZWJ = idStatePictographicZWJ * scaleState;

/// As Other unless followed by RI.
///
/// Unknown whether there is an even or odd number of prior RIs.
const int idStateRegionalSingle = 0x09;
const int stateRegionalSingle = idStateRegionalSingle * scaleState;

/// As Other unless next is InCB=Extend|Linked|.
/// Has seen `{InCB=Consonant} {InCB=Extend}*`.
const int idStateInC = 0x0A;
const int stateInC = idStateInC * scaleState;

/// As Other unless InCB=Extend|Linked|Consonant.
/// Seen `{InCB=Consonant} {InCB=Extend}* {InCB=Linked} {InCB=Extend|Linked}*`.
/// Don't break before a following `{InCB=Consonant}`.
/// (Not used in backwards automaton).
const int idStateInCL = 0x0B;
const int stateInCL = idStateInCL * scaleState;

/// As SoT, but never cause break before next character.
///
/// Not reachable in automaton, only used as start state.
/// Used internally at start of inputs, which is automatically considered a
/// break anyway.
const int idStateSoTNoBreak = 0x0C;
const int stateSoTNoBreak = idStateSoTNoBreak * scaleState;

/// Start of text (or known start of grapheme).
///
/// Not reachable in automaton, only used as start state.
const int idStateSoT = 0x0D;
const int stateSoT = idStateSoT * scaleState;

// --------------------------------------------------------------------

/// Number of states in forward automaton.
const int idStateCount = idStateSoT + 1;

// ---------------------------------------------------------------------
// Backwards Automaton extra/alternative states and categories.
//
// Reuses state positions that are not used in backwards search,
// possibly because they are replaced by look-behind.

const int categorySoT = categoryEoT; // Start of Text (synthetic input)

/// Start of text (or grapheme).
const int idStateEoT = idStateSoT;
const int stateEoT = stateSoT;

/// Break unless prev is CR.
const int idStateLF = idStateCR;
const int stateLF = stateCR;

/// Only break if prev is Control/CR/LF/sot.
const int idStateExtend = idStatePrepend;
const int stateExtend = statePrepend;

/// Preceded by Pic Ext*.
const int idStateZWJPictographic = idStatePictographicZWJ;
const int stateZWJPictographic = statePictographicZWJ;

/// As EoT but never cause break before.
const int idStateEoTNoBreak = idStateSoTNoBreak;
const int stateEoTNoBreak = stateSoTNoBreak;

/// There is an even number of RIs before.
const int idStateRegionalEven = idStateInCL;
const int stateRegionalEven = stateInCL;

/// There is an odd (non-zero!) number of RIs before.
const int idStateRegionalOdd = idStateZWJPictographic;
const int stateRegionalOdd = stateZWJPictographic;

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
const int idStateLookaheadMin = idStateRegionalLookahead;
const int stateLookaheadMin = stateRegionalLookahead;

/// State requesting a look-ahead for an even or odd number of RIs.
const int idStateRegionalLookahead = 0x0E;
const int stateRegionalLookahead = idStateRegionalLookahead * scaleState;

/// State requesting a look-ahead for Pic Ext*.
const int idStateZWJPictographicLookahead = 0x0F;
const int stateZWJPictographicLookahead =
    idStateZWJPictographicLookahead * scaleState;

/// State requesting a look-ahead for InCB consonant + InCB (Extend + Linked)+
/// with at least one Linked.
const int idStateInCLookahead = 0x10;
const int stateInCLookahead = idStateInCLookahead * scaleState;

/// State requesting a look-ahead for InCB consonant + InCB (Extend + Linked)+
/// ending with a linked.
const int idStateInCLLookahead = 0x11;
const int stateInCLLookahead = idStateInCLLookahead * scaleState;

/// Number of real states in backwards automaton.
const int backStateCount = idStateLookaheadMin;

/// Number of output states in backwards automaton, including synthetic states
/// that trigger lookahead computations. (Those have no entries in the
/// automaton, they are handled by code and then change to a real state
/// depending on the lookahead.)
const int backStateWithLACount = idStateInCLLookahead + 1;
