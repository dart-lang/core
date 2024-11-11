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
const int flagNoBreak = 0;
const int flagBreak = 1;
const int maskBreak = 1;

/// Extra bit used to trigger or modify the effect of lookahead/lookbehind.
///
/// Requires [automatonRowLength] to be a multiple of 4.
/// It is currently 20.
const int flagLookahead = 2;
const int maskLookahead = 2;

/// Mask of entry in automatons without low flag bits.
const int maskFlags = maskLookahead | maskBreak;
const int maskState = ~maskFlags;

// For complex lookahead (Indic Ext/Lnk+Con, ZWJ+PIC), where to put the
// breaks and cursor afterwards.
const int flagLookaheadBreakNone = flagNoBreak;
const int flagLookaheadBreakEarly = flagBreak;
const int flagLookaheadBreakLate = flagLookahead | flagNoBreak; // Not used?
const int flagLookaheadBreakBoth = flagLookahead | flagBreak;

/// Automaton row length, number of input categories rounded up
/// to a multiple of `maskFlags + 1`, so that the state value
/// has room for flags in the low bits.
/// (Rather than having to right-shift the state to find the
/// table entry.)
const automatonRowLength = (categoryCount + maskFlags) & maskState;

/// State IDs are multiplied by this to become state values.
const scaleState = automatonRowLength;

// Let states be the position of their entries in the automaton data.

// States of forwards automaton ---------------------------------------

// For each state, also have a `scaleState...` for the value of that
// state that occurs in the automaton tables (and which is an index
// into the automaton tables).

/// Always break before next.
const StateId idStateBreak = 0x00 as StateId;
const int stateBreak = idStateBreak * scaleState;

/// Break unless next is LF.
const StateId idStateCR = 0x01 as StateId;
const int stateCR = idStateCR * scaleState;

/// Break unless next is Extend, ZWJ, SpacingMark.
const StateId idStateOther = 0x02 as StateId;
const int stateOther = idStateOther * scaleState;

/// Break only if next is Control/CR/LF/eot.
const StateId idStatePrepend = 0x03 as StateId;
const int statePrepend = idStatePrepend * scaleState;

/// As Other unless next is L, V, LV, LVT.
///
/// Seen `L+`
const StateId idStateL = 0x04 as StateId;
const int stateL = idStateL * scaleState;

/// As Other unless next is V, T.
/// Seen: `L* (LV|V) V*`
const StateId idStateV = 0x05 as StateId;
const int stateV = idStateV * scaleState;

/// As Other unless next is T.
///
/// Seen `L*(LV?V*T|LVT)T*`.
const StateId idStateT = 0x06 as StateId;
const int stateT = idStateT * scaleState;

/// As Other unless followed by Ext* ZWJ Pic.
const StateId idStatePictographic = 0x07 as StateId;
const int statePictographic = idStatePictographic * scaleState;

/// As Other unless followed by Pic.
const StateId idStatePictographicZWJ = 0x08 as StateId;
const int statePictographicZWJ = idStatePictographicZWJ * scaleState;

/// As Other unless followed by RI.
///
/// Unknown whether there is an even or odd number of prior RIs.
const StateId idStateRegionalSingle = 0x09 as StateId;
const int stateRegionalSingle = idStateRegionalSingle * scaleState;

/// As Other unless next is InCB=Extend|Linked|.
/// Has seen `{InCB=Consonant} {InCB=Extend}*`.
const StateId idStateInC = 0x0A as StateId;
const int stateInC = idStateInC * scaleState;

/// As Other unless InCB=Extend|Linked|Consonant.
/// Seen `{InCB=Consonant} {InCB=Extend}* {InCB=Linked} {InCB=Extend|Linked}*`.
/// Don't break before a following `{InCB=Consonant}`.
/// (Not used in backwards automaton).
const StateId idStateInCL = 0x0B as StateId;
const int stateInCL = idStateInCL * scaleState;

/// As SoT, but never cause break before next character.
///
/// Not reachable in automaton, only used as start state.
/// Used internally at start of inputs, which is automatically considered a
/// break anyway.
const StateId idStateSoTNoBreak = 0x0C as StateId;
const int stateSoTNoBreak = idStateSoTNoBreak * scaleState;

/// Start of text (or known start of grapheme).
///
/// Not reachable in automaton, only used as start state.
const StateId idStateSoT = 0x0D as StateId;
const int stateSoT = idStateSoT * scaleState;

// Context-unaware states in forward automaton.
// States that do not know what's behind the current sequence of Ext{InCB=?}+ZWJ
// sequence, and which may need to trigger a look-behind in some cases.

/// Start of context=unaware lookahead, no characters seen.
const StateId idStateCAny = 0x0E as StateId;
const int stateCAny = idStateCAny * scaleState;

/// Seen ZWJ only, as the first (prior) character.
const StateId idStateCZWJ = 0x0F as StateId;
const stateCZWJ = idStateCZWJ * scaleState;

/// Seen Extend{InCB=Extend}+ only.
const StateId idStateCIE = 0x10 as StateId;
const stateCIE = idStateCIE * scaleState;

/// Seen Extend{InCB=Extend|Lined}+, with at least one Linked
const StateId idStateCIL = 0x11 as StateId;
const stateCIL = idStateCIL * scaleState;

/// Seen Extend{InCB=Extend}+ + ZWJ
const StateId idStateCIEZ = 0x12 as StateId;
const stateCIEZ = idStateCIEZ * scaleState;

/// Seen Extend{InCB=Extend|Linked}+ + ZWJ with at least one Linked
const StateId idStateCILZ = 0x13 as StateId;
const stateCILZ = idStateCILZ * scaleState;

/// Seen (Extend{InCB=Extend}|ZWJ)+ with at least one non-trailing ZWJ
const StateId idStateCZIE = 0x14 as StateId;
const stateCZIE = idStateCZIE * scaleState;

/// Seen (Extend{InCB=Extend|Linked}|ZWJ)+
/// with at least one non-trailing ZWJ and at least one Linked.
const StateId idStateCZIL = 0x15 as StateId;
const stateCZIL = idStateCZIL * scaleState;

/// Seen Extend{InCB=?}+ with at least one Extend{InCB=None}
const StateId idStateCExt = 0x16 as StateId;
const stateCExt = idStateCExt * scaleState;

/// Seen Extend{InCB=?}+ + ZWJ with at least one Extend{InCB=None}
const StateId idStateCExZ = 0x17 as StateId;
const stateCExZ = idStateCExZ * scaleState;

/// Seen single RegionalIndicator only.
const StateId idStateCReg = 0x18 as StateId;
const stateCReg = idStateCReg * scaleState;

// --------------------------------------------------------------------

/// First state which might trigger look-behind.
const StateId idStateMinContextUnaware = idStateCAny;

/// Number of states in forward automaton.
const StateId idStateCount = idStateCReg + 1 as StateId;

// ---------------------------------------------------------------------
// Backwards Automaton extra/alternative states and categories.
//
// Reuses state positions that are not used in backwards search,
// possibly because they are replaced by look-behind.

const int categorySoT = categoryEoT; // Start of Text (synthetic input)

/// Start of text (or grapheme).
const StateId idStateEoT = idStateSoT;
const int stateEoT = stateSoT;

/// Break unless prev is CR.
const StateId idStateLF = idStateCR;
const int stateLF = stateCR;

/// Only break if prev is Control/CR/LF/sot.
const StateId idStateExtend = idStatePrepend;
const int stateExtend = statePrepend;

/// As EoT but never cause break before.
const StateId idStateEoTNoBreak = idStateSoTNoBreak;
const int stateEoTNoBreak = stateSoTNoBreak;

/// There is an even number of RIs before.
const StateId idStateRegionalEven = idStateInCL;
const int stateRegionalEven = stateInCL;

/// There is an odd (non-zero!) number of RIs before.
const StateId idStateRegionalOdd = idStatePictographicZWJ;
const int stateRegionalOdd = statePictographicZWJ;

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
const StateId idStateLookaheadMin = idStateLookaheadZWJPictographic;
const int stateLookaheadMin = idStateLookaheadMin * scaleState;

/// State requesting a look-ahead for Pic Ext*.
const StateId idStateLookaheadZWJPictographic = 0x0E as StateId;
const int stateLookaheadZWJPictographic =
    idStateLookaheadZWJPictographic * scaleState;

/// State requesting a look-ahead for InCB consonant + InCB (Extend + inked)+
/// with at least one inked.
const StateId idStateLookaheadInC = 0x0F as StateId;
const int stateLookaheadInC = idStateLookaheadInC * scaleState;

/// State requesting a look-ahead for InCB consonant + InCB (Extend + inked)+
/// ending with a linked.
const StateId idStateLookaheadInCL = 0x10 as StateId;
const int stateLookaheadInCL = idStateLookaheadInCL * scaleState;

/// Look-ahead state for regional indicators, having seen an even number.
const StateId idStateLookaheadRegionalEven = 0x11 as StateId;
const int stateLookaheadRegionalEven =
    idStateLookaheadRegionalEven * scaleState;

/// Look-ahead state for regional indicators, having seen an odd number.
const StateId idStateLookaheadRegionalOdd = 0x12 as StateId;
const int stateLookaheadRegionalOdd = idStateLookaheadRegionalOdd * scaleState;

/// Number of real states in backwards automaton.
const int backStateCount = idStateLookaheadMin;

/// Number of output states in backwards automaton, including synthetic states
/// that trigger lookahead computations. (Those have no entries in the
/// automaton, they are handled by code and then change to a real state
/// depending on the lookahead.)
const int backStateWithLACount = idStateLookaheadRegionalOdd + 1;

// Distinguishing types to avoid mixing states and IDs.
extension type const State._(int _) implements int {}
extension type const StateId._(int _) implements int {}
