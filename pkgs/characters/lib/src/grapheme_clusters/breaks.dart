// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "constants.dart";
import "table.dart";

/// Iterates grapheme cluster breaks of a string.
///
/// Iterates the grapheme cluster breaks of the substring of
/// [base] from [cursor] to [end].
///
/// To iterate a substring, use:
/// ```dart
/// var breaks = Breaks(string, start, end, stateSoT);
/// int brk = 0;
/// while((brk = breaks.nextBreak) >= 0) {
///   print("Break at index $brk");
/// }
/// ```
/// If you use [stateSoTNoBreak] instead of [stateSoT], the
/// initial break between the start-of-text and the first grapheme
/// is suppressed.
class Breaks {
  /// Text being iterated.
  final String base;

  /// end of substring of [base] being iterated.
  final int end;

  /// Position of the first yet-unprocessed code point.
  int cursor;

  /// Current state based on code points processed so far.
  ///
  /// Scaled by [automatonRowLength], same as the values stored in the
  /// automaton tables.
  int state;

  Breaks(this.base, this.cursor, this.end, int state)
      : state = state * automatonRowLength;

  Breaks.scaled(this.base, this.cursor, this.end, this.state);

  /// Creates a copy of the current iteration, at the exact same state.
  Breaks copy() => Breaks(base, cursor, end, state);

  /// The index of the next grapheme cluster break in last-to-first index order.
  ///
  /// Returns a negative number if there are no further breaks,
  /// which means that [cursor] has reached [end].
  int nextBreak() {
    while (cursor < end) {
      var breakAt = cursor;
      var char = base.codeUnitAt(cursor++);
      if (char & 0xFC00 != 0xD800) {
        state = move(state, low(char));
        if (state & flagNoBreak == 0) {
          return breakAt;
        }
        state &= ~flagNoBreak;
        continue;
      }
      // The category of an unpaired lead surrogate is Control.
      var category = categoryControl;
      if (cursor < end) {
        var nextChar = base.codeUnitAt(cursor);
        if (nextChar & 0xFC00 == 0xDC00) {
          category = high(char, nextChar);
          cursor++;
        }
      }
      state = move(state, category);
      if (state & flagNoBreak == 0) {
        return breakAt;
      }
      state &= ~flagNoBreak;
    }
    state = move(state, categoryEoT);
    if (state & flagNoBreak == 0) return cursor;
    state &= ~flagNoBreak;
    return -1;
  }
}

/// Iterates grapheme cluster breaks backwards.
///
/// Given a substring of a [base] string from [start] to [cursor],
/// iterates the grapheme cluster breaks from [cursor] to [start].
///
/// To iterate a substring, do
/// ```dart
/// var breaks = BackBreaks(string, start, end, stateEoT);
/// int brk = 0;
/// while ((brk = breaks.nextBreak()) >= 0) {
///   print("Break at index $brk");
/// }
/// ```
/// If the initial [state] is [stateEoTNoBreak] instead of [stateEoT],
/// the initial break between the last grapheme and the end-of-text
/// is suppressed.
class BackBreaks {
  /// Text being iterated.
  final String base;

  /// Start of substring of [base] being iterated.
  final int start;

  /// Position after the last yet-unprocessed code point.
  int cursor;

  /// Current state based on code points processed so far.
  int state;
  BackBreaks(this.base, this.cursor, this.start, int state)
      : state = state * automatonRowLength;

  BackBreaks copy() => BackBreaks(base, cursor, start, state);

  /// The index of the next grapheme cluster break in first-to-last index order.
  ///
  /// Returns a negative number if there are no further breaks,
  /// which means that [cursor] has reached [start].
  int nextBreak() {
    while (cursor > start) {
      var breakAt = cursor;
      var char = base.codeUnitAt(--cursor);
      if (char & 0xFC00 != 0xDC00) {
        state = moveBack(state, low(char));
        if (state >= scaledStateLookaheadMin) {
          state = _lookAhead(state);
        }
        if (state & flagNoBreak == 0) {
          return breakAt;
        }
        state &= ~flagNoBreak;
        continue;
      }
      // Found tail surrogate, check for prior lead surrogate.
      // The category of an unpaired tail surrogate is Control.
      var category = categoryControl;
      if (cursor >= start) {
        var prevChar = base.codeUnitAt(cursor - 1);
        if (prevChar & 0xFC00 == 0xD800) {
          category = high(prevChar, char);
          cursor -= 1;
        }
      }
      state = moveBack(state, category);
      if (state >= scaledStateLookaheadMin) {
        assert(state & flagNoBreak == 0);
        state = _lookAhead(state);
      }
      if (state & flagNoBreak == 0) {
        return breakAt;
      }
      state &= ~flagNoBreak;
    }
    state = moveBack(state, categoryEoT);
    if (state >= scaledStateLookaheadMin) {
      state = _lookAhead(state);
    }
    if (state & flagNoBreak == 0) return cursor;
    state &= ~flagNoBreak;
    return -1;
  }

  int _lookAhead(int state) => lookAhead(base, start, cursor, state);
}

/// Request a lookahead for [state].
///
/// The [state] was output by the backwards grapheme cluster state
/// machine and is above [stateLookaheadMin].
/// The lookahead looks at the [base] string from just before [cursor]
/// back to [start], to detect which actual state to enter.
int lookAhead(String base, int start, int cursor, int state) {
  assert(state & flagNoBreak == 0);
  assert(state >= scaledStateLookaheadMin);
  if (state == scaledStateRegionalLookahead) {
    return lookAheadRegional(base, start, cursor);
  }
  if (state == scaledStateZWJPictographicLookahead) {
    var prevPic = lookAheadPictographicExtend(base, start, cursor);
    if (prevPic >= 0) {
      // Can do: {cursor = prevPic; return scaledStatePic | flagNoBreak;} ??
      // (if was inside class).
      return scaledStateZWJPictographic | flagNoBreak;
    }
    return scaledStateExtend; // State for break before seeing ZWJ.
  }
  if (state >= scaledStateInCLookahead) {
    assert(
        state == scaledStateInCLookahead || state == scaledStateInCLLookahead);
    var prevLinkedConsonant = lookAheadInCBLinkedConsonant(
        base, start, cursor, state - scaledStateInCLLookahead);

    if (prevLinkedConsonant >= 0) {
      // Can do {cursor = prevLinkedConsonant; return scaledStateInC | flagNoBreak;} ??
      return scaledStateExtend | flagNoBreak;
    }
    // Just act like an Extend or ZWJ before an Other.
    return scaledStateExtend;
  }
  throw StateError("Unexpected state: ${state.toRadixString(16)}");
}

/// Counts preceding regional indicators.
///
/// The look-ahead for the backwards moving grapheme cluster
/// state machine is called when two RIs are found in a row.
/// The [cursor] points to the first code unit of the former of those RIs,
/// and it preceding RIs until [start].
/// If that count is even, there should not be a break before
/// the second of the original RIs.
/// If the count is odd, there should be a break, because that RI
/// is combined with a prior RI in the string.
int lookAheadRegional(String base, int start, int cursor) {
  // Has just seen second regional indicator.
  // Figure out if there are an odd or even number of preceding RIs.
  // ALL REGIONAL INDICATORS ARE NON-BMP CHARACTERS
  // in the same short range (1F1E6..1F1FF).
  var count = 0;
  var index = cursor;
  while (index - 2 >= start) {
    var tail = base.codeUnitAt(index - 1);
    const tailMin = regionalIndicatorStart & 0x3FF | 0xDC00;
    const tailMax = regionalIndicatorEnd & 0x3FF | 0xDC00;
    if (tail < tailMin || tail > tailMax) break;
    assert(tail & 0xFC00 == 0xDC00);
    var lead = base.codeUnitAt(index - 2);
    // All regional indicators have the same high-bits.
    const regionalIndicatorLead =
        0xD800 + ((regionalIndicatorStart - 0x10000) >> 10);
    if (lead != regionalIndicatorLead) break;
    assert(high(lead, tail) == categoryRegionalIndicator);
    index -= 2;
    count ^= 1;
  }
  if (count == 0) {
    return scaledStateRegionalEven | flagNoBreak;
  } else {
    return scaledStateRegionalOdd;
  }
}

/// Checks if a ZWJ+Pictographic token sequence should be broken.
///
/// Checks whether the characters preceding [cursor] are Pic Ext*.
/// Only the [base] string from [start] to [cursor] is checked.
///
/// Returns the index of the Pic character if preceded by Pic Ext*,
/// and negative if not.
int lookAheadPictographicExtend(String base, int start, int cursor) {
  // Has just seen ZWJ+Pictographic. Check if preceding is Pic Ext*.
  // (If so, just move cursor back to the Pic).
  var index = cursor;
  while (index > start) {
    var char = base.codeUnitAt(--index);
    int category;
    if (char & 0xFC00 != 0xDC00) {
      category = low(char);
    } else {
      int prevChar;
      if (index > start &&
          (prevChar = base.codeUnitAt(--index)) & 0xFC00 == 0xD800) {
        category = high(prevChar, char);
      } else {
        break;
      }
    }
    if (category == categoryPictographic) {
      return index;
    }
    if (category != categoryExtend &&
        category != categoryExtendIndicExtend &&
        category != categoryExtendIndicLinked) {
      break;
    }
  }
  return -1;
}

/// Looks back behind an InCB consonant to see if should break or not.
///
/// It should not break if preceded by an InCB consonant followed by
/// one or more InCB Extend or Linked characters, with at least one Linked.
///
/// The [linked] is \>= 0 if the first character was a Linked character.
int lookAheadInCBLinkedConsonant(
    String base, int start, int cursor, int linked) {
  var index = cursor;
  // Check character at cursor, we need to know if it's a linked.
  while (index > start) {
    var char = base.codeUnitAt(--index);
    int category;
    if (char & 0xFC00 != 0xDC00) {
      category = low(char);
    } else {
      // TODO: Check if characters are all or never in the non-BMP.
      int prevChar;
      if (index > start &&
          (prevChar = base.codeUnitAt(--index)) & 0xFC00 == 0xD800) {
        category = high(prevChar, char);
      } else {
        break;
      }
    }
    if (category >= categoryZWJ) {
      assert(category == categoryExtendIndicExtend ||
          category == categoryExtendIndicLinked ||
          category == categoryZWJ);
      if (category == categoryExtendIndicLinked) {
        linked = index;
      }
    } else if (category == categoryOtherIndicConsonant && linked >= 0) {
      return index;
    } else {
      break;
    }
  }
  return -1;
}

/// Whether there is a grapheme cluster boundary before [index] in [text].
///
/// This is a low-level function. There is no validation of the arguments.
/// They should satisfy `0 <= start <= index <= end <= text.length`.
bool isGraphemeClusterBoundary(String text, int start, int end, int index) {
  assert(0 <= start);
  assert(start <= index);
  assert(index <= end);
  assert(end <= text.length);
  // Uses the backwards automaton because answering the question
  // might be answered by looking only at the code points around the
  // index, but it may also require looking further back. It never
  // requires looking further ahead, though.
  // The backwards automaton is built for this use case.
  // Most of the apparent complication in this function is merely dealing with
  // surrogates.
  if (start < index && index < end) {
    // Something on both sides of index.
    var char = text.codeUnitAt(index);
    var prevChar = text.codeUnitAt(index - 1);
    var catAfter = categoryControl;
    if (char & 0xF800 != 0xD800) {
      catAfter = low(char);
    } else if (char & 0xFC00 == 0xD800) {
      // Lead surrogate. Combine with following tail surrogate,
      // otherwise it's a control and always a boundary.
      if (index + 1 >= end) return true;
      var nextChar = text.codeUnitAt(index + 1);
      if (nextChar & 0xFC00 != 0xDC00) return true;
      catAfter = high(char, nextChar);
    } else {
      // Tail surrogate after index. Either combines with lead surrogate
      // before or is always a boundary.
      return prevChar & 0xFC00 != 0xD800;
    }
    var catBefore = categoryControl;
    if (prevChar & 0xFC00 != 0xDC00) {
      catBefore = low(prevChar);
      index -= 1;
    } else {
      // If no prior lead surrogate, it's a control and always a boundary.
      index -= 2;
      if (start <= index) {
        var prevPrevChar = text.codeUnitAt(index);
        if (prevPrevChar & 0xFC00 != 0xD800) {
          return true;
        }
        catBefore = high(prevPrevChar, prevChar);
      } else {
        return true;
      }
    }
    var state = scaledStateEoTNoBreak;
    state = moveBack(state, catAfter);
    // It requires at least two moves from EoT to trigger a lookahead,
    // either ZWJ+Pic or RI+RI.
    assert(state < scaledStateLookaheadMin);
    state = moveBack(state & ~flagNoBreak, catBefore);
    if (state >= scaledStateLookaheadMin) {
      state = lookAhead(text, start, index, state);
    }
    return state & flagNoBreak == 0;
  }
  // Always boundary at EoT or SoT, unless there is nothing between them.
  return start != end;
}

/// The most recent break no later than [index] in
/// `string.substring(start, end)`.
int previousBreak(String text, int start, int end, int index) {
  assert(0 <= start);
  assert(start <= index);
  assert(index <= end);
  assert(end <= text.length);
  if (index == start || index == end) return index;
  var indexBefore = index;
  var nextChar = text.codeUnitAt(index);
  var category = categoryControl;
  if (nextChar & 0xF800 != 0xD800) {
    category = low(nextChar);
  } else if (nextChar & 0xFC00 == 0xD800) {
    var indexAfter = index + 1;
    if (indexAfter < end) {
      var secondChar = text.codeUnitAt(indexAfter);
      if (secondChar & 0xFC00 == 0xDC00) {
        category = high(nextChar, secondChar);
      }
    }
  } else {
    var prevChar = text.codeUnitAt(index - 1);
    if (prevChar & 0xFC00 == 0xD800) {
      category = high(prevChar, nextChar);
      indexBefore -= 1;
    }
  }
  return BackBreaks(
          text, indexBefore, start, moveBack(stateEoTNoBreak, category))
      .nextBreak();
}

/// The next break no earlier than [index] in `string.substring(start, end)`.
///
/// The index need not be at a grapheme cluster boundary.
int nextBreak(String text, int start, int end, int index) {
  assert(0 <= start);
  assert(start <= index);
  assert(index <= end);
  assert(end <= text.length);
  if (index == start || index == end) return index;
  var indexBefore = index - 1;
  var prevChar = text.codeUnitAt(indexBefore);
  var prevCategory = categoryControl;
  if (prevChar & 0xF800 != 0xD800) {
    // Not surrogate.
    prevCategory = low(prevChar);
  } else if (prevChar & 0xFC00 == 0xD800) {
    // Surrogate lead. Check next character.
    var nextChar = text.codeUnitAt(index);
    if (nextChar & 0xFC00 == 0xDC00) {
      index += 1;
      if (index == end) return end;
      prevCategory = high(prevChar, nextChar);
    }
  } else if (indexBefore > start) {
    // Surrogate tail. Check previous character if any.
    var secondCharIndex = indexBefore - 1;
    var secondChar = text.codeUnitAt(secondCharIndex);
    if (secondChar & 0xFC00 == 0xD800) {
      indexBefore = secondCharIndex;
      prevCategory = high(secondChar, prevChar);
    }
  }

  var state = scaledStateSoTNoBreak;
  // In most cases, the state at `index` can be predicted precisely
  // from just the one prior character.
  // The cases where that is not possible are:
  // - A regional indicator (need to know if there is an even or odd number
  //   of regional indicators before that).
  // - An Extend{InCB=None|Extend|Linked} or ZWJ
  //   - For {InCB=Extend|Linked} or ZWJ, need to check if it comes after
  //     an Other{InCB=Constant} (Extend{InCB=Extend|Linked}|ZWJ)*
  //   - For any Extend or ZWJ, need to know if it comes after Pic Extend{..}*
  // In those cases, check the next character first.
  if (prevCategory == categoryRegionalIndicator ||
      prevCategory == categoryExtend ||
      prevCategory >= categoryZWJ) {
    var indexAfter = index + 1;
    var nextChar = text.codeUnitAt(index);
    var nextCategory = categoryControl;
    if (nextChar & 0xFC00 != 0xD800) {
      nextCategory = low(nextChar);
    } else if (indexAfter < end) {
      var nextNextChar = text.codeUnitAt(indexAfter);
      if (nextChar & 0xFC00 == 0xDC00) {
        indexAfter += 1;
        nextCategory = high(nextChar, nextNextChar);
      }
    }
    if (prevCategory == categoryRegionalIndicator) {
      if (nextCategory == categoryRegionalIndicator) {
        var countBefore = lookAheadRegional(text, start, indexBefore);
        if (countBefore & flagNoBreak == 0) {
          // Break after prevChar.
          return index;
        } else {
          // No break after prevChar, so continue after RI+RI
          index = indexAfter;
          state = scaledStateOther;
        }
      } else if (prevCategory == categoryZWJ) {
        // Pic+ZWJ -> PicZ
        // Extend+ZWJ -> LA for Pic Ext*
        // Extend + Extend -> LA for Pic Ext*
        var prevPic = lookAheadPictographicExtend(text, start, indexBefore);
      } else if (prevCategory >= categoryZWJ &&
          nextCategory >= categoryOtherIndicConsonant) {}
      state = scaledStateOther;
    }
  } else {
    state = move(state, prevCategory);
  }

  // var nextCategory = categoryControl;
  // var char = text.codeUnitAt(index);
  // var nextIndex = index + 1;
  // if (char & 0xFC00 != 0xD800) {
  //   nextCategory = low(char);
  // } else {
  //   if (nextIndex < end) {
  //     var nextChar = text.codeUnitAt(nextIndex);
  //     if (nextChar & 0xFC00 == 0xDC00) {
  //       nextIndex += 1;
  //       nextCategory = high(char, nextChar);
  //     }
  //   }
  // }
  // int state
  // if (nextCategory == categoryRegionalIndicator &&
  //     prevCategory == categoryRegionalIndicator) {
  //   state = lookAheadRegional(text, start, indexBefore);
  //   if (state == scaledStateRegionalEven) {
  //     return nextIndex;
  //   }
  //   return index;
  // }
  // if (nextCategory == categoryOtherIndicConsonant &&
  //     (prevCategory == categoryExtendIndicExtend ||
  //         prevCategory == categoryExtendIndicLinked ||
  //         prevCategory == categoryZWJ) &&
  //     lookAheadInCBLinkedConsonant(text, start, indexBefore,
  //             prevCategory - categoryExtendIndicLinked) >=
  //         0) {
  //   state = scaledStateInCL;
  // } else if (nextCategory == categoryZWJ)

  // The following combinations warrant looking back:
  // prev/next        look for
  // Extend/Extend(InE,InL) -> Pic Ext*
  // Extend(InE,InL)/Extend -> Pic Ext*
  // Extend(InE,InL)/Extend(InE,InL) -> Pic Ext* | Con (Ext|Lnk)*
  // ZWJ/(InE,InL)    -> Con (Ext|Lnk)*
  // Ext(InE,InL)/ZWJ -> Con (Ext|Lnk)*

  // The only boundaries which depend on more information than
  // the previous character are the [^RI] (RI RI)* RI x RI,
  // Pic Ext* ZWJ x Pic, and INcB Consonant breaks.
  // In all other cases, all the necessary
  // information is in the last seen category.
  var state = scaledStateOther;
  if (prevCategory == categoryRegionalIndicator) {
    var prevState = lookAheadRegional(text, start, indexBefore);
    if (prevState != scaledStateRegionalOdd) {
      state = scaledStateRegionalSingle;
    }
  } else if (prevCategory == categoryZWJ ||
      prevCategory == categoryExtend ||
      prevCategory == categoryExtendIndicExtend ||
      prevCategory == categoryExtendIndicLinked) {
    var newState = lookAheadPictographicExtendOrIndic(
        text, start, indexBefore, prevCategory);
    if (newState >= 0) {
      state = newState;
    }
  } else {
    state = move(scaledStateSoTNoBreak, prevCategory);
  }
  return Breaks.scaled(text, index, text.length, state).nextBreak();
}

// Look behind for a Pic+Ext+ZWJ? or Consonant+(Extend|Linked)* sequence.
int lookAheadPictographicExtendOrIndic(
    String text, int start, int cursor, int category) {
  var canBeIndic = category != categoryExtend;
  var isInCL = category == categoryExtendIndicLinked;
  var canBePic = category != categoryZWJ;
  var isPicZ = !canBePic;
  while (cursor > start) {
    var char = text.codeUnitAt(--cursor);
    if (char & 0xFC00 != 0xDC00) {
      category = low(char);
    } else {
      category = categoryControl;
      if (cursor > start) {
        var prevPosition = cursor - 1;
        var head = text.codeUnitAt(prevPosition);
        if (head & 0xFC00 == 0xD800) {
          category = high(head, char);
          cursor = prevPosition;
        }
      }
    }
    switch (category) {
      case categoryExtend:
        canBeIndic = false;
      case categoryZWJ:
        canBePic = false;
      case categoryExtendIndicExtend:
        break; // All is well, continue.
      case categoryExtendIndicLinked:
        isInCL = true;
      case categoryPictographic:
        if (canBePic) {
          return isPicZ ? scaledStatePictographicZWJ : scaledStatePictographic;
        }
        return scaledStateOther;
      case categoryOtherIndicConsonant:
        if (canBeIndic) return isInCL ? scaledStateInCL : scaledStateInC;
        return scaledStateOther;
      default:
        return scaledStateOther;
    }
  }
  return scaledStateOther;
}
