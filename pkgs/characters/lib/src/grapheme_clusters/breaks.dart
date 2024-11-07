// BSD-style license that can be found in the LICENSE file.

/// API for accessing the generated state and category tables.
///
/// Use only [Breaks], [BackBreaks] and [nextBreak] from files other than this.
/// Do not use any function from `table.dart` directly.
/// (In both cases this package's own testing is exempted.)

library;

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
/// If you use [idStateSoTNoBreak] instead of [idStateSoT], the
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

  Breaks(this.base, this.cursor, this.end, this.state);

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
        if (state & maskBreak == flagBreak) {
          return breakAt;
        }
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
      if (state & maskBreak == flagBreak) {
        return breakAt;
      }
    }
    state = move(state, categoryEoT);
    if (state & maskBreak == flagBreak) return cursor;
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
/// var breaks = BackBreaks(string, start, end, idStateEoT);
/// int brk = 0;
/// while ((brk = breaks.nextBreak()) >= 0) {
///   print("Break at index $brk");
/// }
/// ```
/// If the initial [state] is [idStateEoTNoBreak] instead of [idStateEoT],
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

  BackBreaks(this.base, this.cursor, this.start, this.state);

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
        var category = low(char);
        state = moveBack(state, category);
        if (state >= stateLookaheadMin) {
          state = _lookAhead(state, category);
        }
        if (state & maskBreak == flagBreak) {
          return breakAt;
        }
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
      if (state >= stateLookaheadMin) {
        assert(state & maskBreak == flagBreak);
        state = _lookAhead(state, category);
      }
      if (state & maskBreak == flagBreak) {
        return breakAt;
      }
    }
    state = moveBack(state, categoryEoT);
    assert(state < stateLookaheadMin, state);
    if (state & maskBreak == flagBreak) return cursor;
    return -1;
  }

  int _lookAhead(int state, int category) =>
      lookAhead(base, start, cursor, state, category);
}

/// Request a lookahead for [state].
///
/// The [state] was output by the backwards grapheme cluster state
/// machine and is above [idStateLookaheadMin].
/// The lookahead looks at the [base] string from just before [cursor]
/// back to [start], to detect which actual state to enter.
int lookAhead(String base, int start, int cursor, int state, int nextCategory) {
  assert(state & maskBreak == flagBreak);
  assert(state >= stateLookaheadMin, state);
  if (state == stateRegionalLookahead) {
    return lookAheadRegional(base, start, cursor);
  }
  if (state == stateZWJPictographicLookahead) {
    assert(nextCategory == categoryZWJ, nextCategory);
    var prevPic = lookAheadPictographicExtend(base, start, cursor);
    if (prevPic >= 0) {
      // Can do: {cursor = prevPic; return statePic | flagNoBreak;} ??
      // (if was inside class).
      return stateZWJPictographic | flagNoBreak;
    }
    return stateExtend; // State for break before seeing ZWJ.
  }
  if (state >= stateInCLookahead) {
    // Next character after this was `categoryOtherIndicConsonant`.
    assert(
        (nextCategory == categoryZWJ ||
                    nextCategory == categoryExtendIndicExtend) &&
                state == stateInCLookahead ||
            nextCategory == categoryExtendIndicLinked &&
                state == stateInCLLookahead,
        (state, nextCategory));
    var prevLinkedConsonant =
        lookAheadInCBLinkedConsonant(base, start, cursor, nextCategory);

    if (prevLinkedConsonant.isOdd) {
      // Bit zero set if linked found, which means not to break.
      // Can update cursor:
      // { cursor -= prevLinked >> 1; state = stateInC | flagNoBreak; }
      // ?
      return stateExtend | flagNoBreak;
    }
    // Just act like an Extend or ZWJ before an Other.
    return stateExtend;
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
  assert(cursor <= base.length - 4);
  assert(_isRegionalIndicator(base, cursor + 2),
      base.substring(cursor + 2).runes.first.toRadixString(16));
  assert(_isRegionalIndicator(base, cursor),
      base.substring(cursor).runes.first.toRadixString(16));
  var count = 0;
  var index = cursor;
  while ((index -= 2) >= start) {
    if (!_isRegionalIndicator(base, index)) break;
    count ^= 1;
  }
  if (count == 0) {
    return stateRegionalEven | flagNoBreak;
  } else {
    return stateRegionalOdd | flagBreak;
  }
}

/// Whether the two code points at [index] is a regional indicator.
@pragma("vm:prefer-inline")
@pragma("wasm:prefer-inline")
@pragma("dart2js:prefer-inline")
bool _isRegionalIndicator(String text, int index) {
  // ALL REGIONAL INDICATORS ARE NON-BMP CHARACTERS
  // in the same short range (1F1E6..1F1FF).
  assert(index >= 0);
  assert(index <= text.length - 2);
  const riLead = 0xD800 + ((regionalIndicatorStart - 0x10000) >> 10);
  const riTailMin = regionalIndicatorStart & 0x3FF | 0xDC00;
  const riTailMax = regionalIndicatorEnd & 0x3FF | 0xDC00;
  const riCount = (regionalIndicatorEnd + 1) - regionalIndicatorStart; // 26

  var tail = text.codeUnitAt(index + 1);
  if (tail ^ riTailMax >= riCount) return false;
  assert(tail >= riTailMin && tail <= riTailMax);
  var lead = text.codeUnitAt(index);
  return lead == riLead;
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

/// Look behind for Indic Conjunct Break information.
///
/// Looks for previous characters of the form:
/// (InCB=Consonant + InCB={Extend|Linked}*)
/// and if found, whether there was any InCB=Linked among the characters.
///
/// There should not be a break before InCB=Consonant if it was preceded
/// by such a chain containing at least one InCB=Linked.
///
/// The [nextCategory] should be the category of the character after [cursor].
/// It should always be an input character category of
/// [categoryOtherIndicConsonant] or above ([categoryZWJ],
/// [categoryExtendIndicExtend] or [categoryExtendIndicLinked]).
/// It will only be a consonant if used by [nextBreak], otherwise
/// lookahead is only used after seeing a consonant and then one of the
/// other categories, which will be the [nextCategory] then.
///
/// Returns the number of code units back that a consonant is found,
/// multiplied by 2, and with bit 0 set if an InCB=Linked character
/// was seen in [nextCategory] or before.
/// Returns an (even) negative value if no such consonant is found.
int lookAheadInCBLinkedConsonant(
    String base, int start, int cursor, int nextCategory) {
  assert(
      nextCategory == categoryOtherIndicConsonant ||
          nextCategory == categoryExtendIndicExtend ||
          nextCategory == categoryExtendIndicLinked ||
          nextCategory == categoryZWJ,
      nextCategory);

  // Include character at cursor in "is linked" information.
  var isLinked = nextCategory == categoryExtendIndicLinked ? 1 : 0;
  var index = cursor;
  while (index > start) {
    var char = base.codeUnitAt(--index);
    int category;
    if (char & 0xFC00 != 0xDC00) {
      category = low(char);
    } else {
      // InCB=Extend occurs in both low and high planes.
      int prevChar;
      if (index > start &&
          (prevChar = base.codeUnitAt(--index)) & 0xFC00 == 0xD800) {
        category = high(prevChar, char);
      } else {
        // Category of unpaired surrogate is Control.
        break;
      }
    }
    if (category >= categoryZWJ) {
      assert(category == categoryExtendIndicExtend ||
          category == categoryExtendIndicLinked ||
          category == categoryZWJ);
      if (category == categoryExtendIndicLinked) {
        isLinked = 1;
      }
    } else if (category == categoryOtherIndicConsonant) {
      return ((cursor - index) << 2) + isLinked;
    } else {
      break;
    }
  }
  return -2;
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
    var state = stateEoTNoBreak;
    state = moveBack(state, catAfter);
    // It requires at least two moves from EoT to trigger a lookahead,
    // either ZWJ+Pic or RI+RI.
    assert(state < stateLookaheadMin);
    state = moveBack(state & ~maskBreak, catBefore);
    if (state >= stateLookaheadMin) {
      state = lookAhead(text, start, index, state, catBefore);
    }
    return state & maskBreak == flagBreak;
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
/// Uniquely to this function, the index need not be at a grapheme cluster
/// boundary. That means there may be need for look-behind to find a character
/// where the exact state is known.
int nextBreak(String text, int start, int end, int index) {
  assert(0 <= start);
  assert(start <= index);
  assert(index <= end);
  assert(end <= text.length);
  // Always break at start or end (GB1).
  if (index == start || index == end) return index;
  // Find (category of) of first character which ends no earlier than [index].
  // If [index] is in the middle of a surrogate pair, it may end at `index + 1`.
  // Position before character before first possible break after [index].
  var indexBefore = index - 1;
  var prevChar = text.codeUnitAt(indexBefore);
  int prevCategory;
  if (prevChar & 0xF800 != 0xD800) {
    // Not surrogate.
    prevCategory = low(prevChar);
  } else if (prevChar & 0xFC00 == 0xD800) {
    // Surrogate lead. Check next character.
    var tailChar = text.codeUnitAt(index);
    if (tailChar & 0xFC00 == 0xDC00) {
      index += 1;
      if (index == end) return end;
      prevCategory = high(prevChar, tailChar);
    } else {
      // Unpaired surrogate, treat as control. Always break after control.
      return index;
    }
  } else {
    // Surrogate tail. If there is not a prior surrogate head,
    // treat as control and break immediately.
    if (indexBefore <= start) return index;
    var leadIndex = indexBefore - 1;
    var lead = text.codeUnitAt(leadIndex);
    if (lead & 0xFC00 != 0xD800) return index;
    indexBefore = leadIndex;
    prevCategory = high(lead, prevChar);
  }
  // The `prevCategory` now is the category for the character
  // from `indexBefore` to `index`, and `index` is the minium valid
  // return value (earliest next break).

  var state = stateSoTNoBreak;
  // In many cases, the state at `index` can be predicted precisely
  // from just the one prior character. That's the case for every
  // input category where the output state doesn't depend on the input
  // state (ignoring whether it breaks before the previous character or not).
  //
  // The cases where that is not possible are:
  // - A regional indicator (need to know if there is an even or odd number
  //   of regional indicators before that).
  // - An Extend{InCB=None|Extend|Linked} or ZWJ
  //   - For Extends{...} and ZWJ, it behaves differently if in state Pic
  //     (after Pictographic+Extend*).
  //   - For {InCB=Extend|Linked} or ZWJ (which is InCB=Extend),
  //     it behaves differently if in state InC or InCL, so after
  //     Other(InCB=Consonant)+(InCB={Extend|Linked})*
  // In those cases, check the next character first. It may make the look-behind
  // unnecessary, if it's a character that guarantees a break.
  // Otherwise look-behind to see if the prior characters are `Pic+Extend`
  // or `InCB=Consonant+InCB={Extend+Linked}` (and whether at least one Linked).
  if (prevCategory == categoryRegionalIndicator ||
      prevCategory == categoryExtend ||
      prevCategory >= categoryZWJ) {
    // >= ZWJ implies ZWJ|Extend(InCB={Extend|Linked}) for an input character.
    // Only higher categories are synthetic EoT/SoT characters.

    // TODO: Can this be made into an automaton?

    var indexAfter = index + 1;
    var nextChar = text.codeUnitAt(index);
    int nextCategory;
    if (nextChar & 0xFC00 != 0xD800) {
      nextCategory = low(nextChar);
    } else if (indexAfter < end) {
      // Lead surrogate.
      var tailChar = text.codeUnitAt(indexAfter);
      if (tailChar & 0xFC00 == 0xDC00) {
        indexAfter += 1;
        nextCategory = high(nextChar, tailChar);
      } else {
        return index; // Unpaired surrogate
      }
    } else {
      return index; // Unpaired surrogate, treat as control.
    }

    // The `nextCategory is the category of the character at positions
    // from `index` to `indexAfter`.

    if (prevCategory == categoryRegionalIndicator) {
      if (nextCategory == categoryRegionalIndicator) {
        // Prev = RI, next = RI.
        var idStateBefore = lookAheadRegional(text, start, indexBefore);
        if (idStateBefore & maskBreak == flagBreak) {
          // Break after previous character.
          return index;
        }
        state = stateOther;
        // Move index to after RI+RI.
        index = indexAfter;
      } else {
        state = move(stateOther, nextCategory);
        if (state & maskBreak == flagBreak) return index;
        index = indexAfter;
      }
    } else if (prevCategory == categoryZWJ) {
      if (nextCategory == categoryPictographic) {
        var prevPic = lookAheadPictographicExtend(text, start, indexBefore);
        if (prevPic < 0) {
          return index;
        }
        state = statePictographic;
      } else {
        // Default for ZWJ if not after Pic+Ext* or
        // InCB=Consonant+InCB={Extend|Linked}*
        state = stateOther;
        if (nextCategory >= categoryOtherIndicConsonant) {
          var prevConsonant = lookAheadInCBLinkedConsonant(
              text, start, indexBefore, prevCategory);
          if (prevConsonant >= 0) {
            state = prevConsonant.isOdd ? stateInCL : stateInC;
          }
        }
        state = move(state, nextCategory);
        if (state & maskBreak == flagBreak) return index;
      }
    } else if (prevCategory == categoryExtend ||
        nextCategory == categoryExtend) {
      // The `categoryExtend` has InCB=None, so not affected by GB9c, only GB9b.

      // At this point `prevCategory` is definitely an Extend.
      // Do Pictographic lookbehind if `nextCategory` is any Extend or ZWJ.
      assert(prevCategory == categoryExtend ||
          prevCategory == categoryExtendIndicExtend ||
          prevCategory == categoryExtendIndicLinked);
      state = stateOther;
      if (nextCategory == categoryExtend || nextCategory >= categoryZWJ) {
        // Look behind for Pic+Ext*.
        var prevPic = lookAheadPictographicExtend(text, start, indexBefore);
        if (prevPic >= 0) {
          state = statePictographic;
        }
      }
      state = move(state, nextCategory);
      if (state & maskBreak == flagBreak) return index;
    } else if (nextCategory == categoryOtherIndicConsonant) {
      assert(prevCategory >= categoryExtendIndicExtend);
      var prevConsonant =
          lookAheadInCBLinkedConsonant(text, start, indexBefore, prevCategory);
      if (prevConsonant.isEven) {
        return index;
      }
      state = stateInC | flagNoBreak;
    } else if (nextCategory >= categoryZWJ) {
      assert(prevCategory >= categoryExtendIndicExtend);
      // It's all Extend{InCB!=None}, can't say whether to look for
      // Pic or InCB=Consonant.
      state = lookAheadPictographicExtendOrIndic(
          text, start, indexBefore, prevCategory, nextCategory);
      if (state & maskBreak == flagBreak) {
        return index;
      }
    } else {
      // Doesn't need further lookahead, one character is enough.
      state = move(stateSoTNoBreak, prevCategory);
      state = move(state, nextCategory);
      if (state & maskBreak == flagBreak) return index;
    }
    index = indexAfter;
  } else {
    // Just look at one prior character.
    state = move(stateSoTNoBreak, prevCategory);
  }
  // Break wasn't at index, so move forward until finding the break.
  return Breaks(text, index, text.length, state).nextBreak();
}

// Look behind for a Pic+Ext+ZWJ? or Consonant+(Extend|Linked)* sequence.
// Given the last two categories.
//
// The categories are ones that allow both prefixes, so
// [category1] is either [categoryExtendInCBExtend] or
// [categoryExtendInCBLinked], and [category2] is one of those or [categoryZWJ].
//
// Returns the state after `category2`, with the break flag reporting
// whether to break before `category2` or not.
int lookAheadPictographicExtendOrIndic(
    String text, int start, int cursor, int category1, int category2) {
  assert(
      category1 == categoryExtendIndicExtend ||
          category1 == categoryExtendIndicLinked,
      category1);
  assert(
      category2 == categoryZWJ ||
          category2 == categoryExtendIndicExtend ||
          category2 == categoryExtendIndicLinked,
      category2);
  var linked = (category1 == categoryExtendIndicLinked ||
          category2 == categoryExtendIndicLinked)
      ? (stateInCL | flagNoBreak)
      : (stateInC | flagNoBreak);
  loop:
  while (cursor > start) {
    int category;
    var char = text.codeUnitAt(--cursor);
    if (char & 0xFC00 != 0xDC00) {
      category = low(char);
    } else {
      if (cursor <= start) break;
      var head = text.codeUnitAt(--cursor);
      if (head & 0xFC00 != 0xD800) break;
      category = high(head, char);
    }
    switch (category) {
      case categoryExtend:
        var prevPic = lookAheadPictographicExtend(text, start, cursor);
        if (prevPic < 0) break loop;
        continue pictographic;
      pictographic:
      case categoryPictographic:
        return category2 == categoryZWJ
            ? (statePictographicZWJ | flagNoBreak)
            : (statePictographic | flagNoBreak);
      case categoryZWJ:
        var prevConsonant =
            lookAheadInCBLinkedConsonant(text, start, cursor, category);
        if (prevConsonant < 0) break loop;
        if (prevConsonant.isOdd) {
          return stateInCL | flagNoBreak;
        }
        return linked;
      case categoryOtherIndicConsonant:
        return linked;
      case categoryExtendIndicLinked:
        linked = stateInCL | flagNoBreak;
      case categoryExtendIndicExtend:
        break; // No change.
      default:
        break loop;
    }
  }
  // Default behavior if no Pic or InCB=Consonant found.
  return move(move(stateSoTNoBreak, category1), category2);
}
