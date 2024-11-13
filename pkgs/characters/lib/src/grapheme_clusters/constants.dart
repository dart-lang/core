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
const int flagLookaheadBreakLate = flagLookahead | flagNoBreak; // Not used.
const int flagLookaheadBreakBoth = flagLookahead | flagBreak;

/// Automaton row length, number of input categories rounded up
/// to a multiple of `maskFlags + 1`, so that the state value
/// has room for flags in the low bits.
/// (Rather than having to right-shift the state to find the
/// table entry.)
/// All state integers are multiples of this value.
const automatonRowLength = (categoryCount + maskFlags) & maskState;

// Let states be the position of their entries in the automaton data.

// States of forwards automaton ---------------------------------------

// For each state, also have a `automatonRowLength...` for the value of that
// state that occurs in the automaton tables (and which is an index
// into the automaton tables).

/// Always break before next.
const int stateBreak = 0x00 * automatonRowLength;

/// Break unless next is LF.
const int stateCR = 0x01 * automatonRowLength;

/// Break unless next is Extend, ZWJ, SpacingMark.
const int stateOther = 0x02 * automatonRowLength;

/// Break only if next is Control/CR/LF/eot.
const int statePrepend = 0x03 * automatonRowLength;

/// As Other unless next is L, V, LV, LVT.
///
/// Seen `L+`
const int stateL = 0x04 * automatonRowLength;

/// As Other unless next is V, T.
/// Seen: `L* (LV|V) V*`
const int stateV = 0x05 * automatonRowLength;

/// As Other unless next is T.
///
/// Seen `L*(LV?V*T|LVT)T*`.
const int stateT = 0x06 * automatonRowLength;

/// As Other unless followed by Ext* ZWJ Pic.
const int statePictographic = 0x07 * automatonRowLength;

/// As Other unless followed by Pic.
const int statePictographicZWJ = 0x08 * automatonRowLength;

/// As Other unless followed by RI.
///
/// Unknown whether there is an even or odd number of prior RIs.
const int stateRegionalSingle = 0x09 * automatonRowLength;

/// As Other unless next is InCB=Extend|Linked|.
/// Has seen `{InCB=Consonant} {InCB=Extend}*`.
const int stateInC = 0x0A * automatonRowLength;

/// As Other unless InCB=Extend|Linked|Consonant.
/// Seen `{InCB=Consonant} {InCB=Extend}* {InCB=Linked} {InCB=Extend|Linked}*`.
/// Don't break before a following `{InCB=Consonant}`.
/// (Not used in backwards automaton).
const int stateInCL = 0x0B * automatonRowLength;

/// As SoT, but never cause break before next character.
///
/// Not reachable in automaton, only used as start state.
/// Used internally at start of inputs, which is automatically considered a
/// break anyway.
const int stateSoTNoBreak = 0x0C * automatonRowLength;

/// Start of text (or known start of grapheme).
///
/// Not reachable in automaton, only used as start state.
const int stateSoT = 0x0D * automatonRowLength;

// Context-unaware states in forward automaton.
// States that do not know what's behind the current sequence of Ext{InCB=?}+ZWJ
// sequence, and which may need to trigger a look-behind in some cases.

/// Start of context=unaware lookahead, no characters seen.
const int stateCAny = 0x0E * automatonRowLength;

/// Seen ZWJ only, as the first (prior) character.
const int stateCZWJ = 0x0F * automatonRowLength;

/// Seen Extend{InCB=Extend}+ only.
const int stateCIE = 0x10 * automatonRowLength;

/// Seen Extend{InCB=Extend|Lined}+, with at least one Linked
const int stateCIL = 0x11 * automatonRowLength;

/// Seen Extend{InCB=Extend}+ + ZWJ
const int stateCIEZ = 0x12 * automatonRowLength;

/// Seen Extend{InCB=Extend|Linked}+ + ZWJ with at least one Linked
const int stateCILZ = 0x13 * automatonRowLength;

/// Seen (Extend{InCB=Extend}|ZWJ)+ with at least one non-trailing ZWJ
const int stateCZIE = 0x14 * automatonRowLength;

/// Seen (Extend{InCB=Extend|Linked}|ZWJ)+
/// with at least one non-trailing ZWJ and at least one Linked.
const int stateCZIL = 0x15 * automatonRowLength;

/// Seen Extend{InCB=?}+ with at least one Extend{InCB=None}
const int stateCExt = 0x16 * automatonRowLength;

/// Seen Extend{InCB=?}+ + ZWJ with at least one Extend{InCB=None}
const int stateCExZ = 0x17 * automatonRowLength;

/// Seen single RegionalIndicator only.
const int stateCReg = 0x18 * automatonRowLength;

// --------------------------------------------------------------------

/// First state which might trigger look-behind.
const int stateMinContextUnaware = stateCAny;

/// Number of states in forward automaton.
const int stateLimit = stateCReg + automatonRowLength;

// ---------------------------------------------------------------------
// Backwards Automaton extra/alternative states and categories.
//
// Reuses state positions that are not used in backwards search,
// possibly because they are replaced by look-behind.

const int categorySoT = categoryEoT; // Start of Text (synthetic input)

/// Start of text (or grapheme).
const int stateEoT = stateSoT;

/// Break unless prev is CR.
const int stateLF = stateCR;

/// Only break if prev is Control/CR/LF/sot.
const int stateExtend = statePrepend;

/// As EoT but never cause break before.
const int stateEoTNoBreak = stateSoTNoBreak;

/// There is an even number of RIs before.
const int stateRegionalEven = stateInCL;

/// There is an odd (non-zero!) number of RIs before.
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
const int stateLookaheadMin = stateLookaheadZWJPictographic;

/// State requesting a look-ahead for Pic Ext*.
const int stateLookaheadZWJPictographic = 0x0E * automatonRowLength;

/// State requesting a look-ahead for InCB consonant + InCB (Extend + inked)+
/// with at least one inked.
const int stateLookaheadInC = 0x0F * automatonRowLength;

/// State requesting a look-ahead for InCB consonant + InCB (Extend + inked)+
/// ending with a linked.
const int stateLookaheadInCL = 0x10 * automatonRowLength;

/// Look-ahead state for regional indicators, having seen an even number.
const int stateLookaheadRegionalEven = 0x11 * automatonRowLength;

/// Look-ahead state for regional indicators, having seen an odd number.
const int stateLookaheadRegionalOdd = 0x12 * automatonRowLength;

/// Limit on the entries of states in backwards automaton.
const int backStateLimit = stateLookaheadRegionalOdd + automatonRowLength;
