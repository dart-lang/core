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
        if (state & maskBreak != flagNoBreak) {
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
      if (state & maskBreak != flagNoBreak) {
        return breakAt;
      }
    }
    state = move(state, categoryEoT);
    if (state & maskBreak != flagNoBreak) return cursor;
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
        if (state & maskFlags == flagNoBreak) {
          continue;
        }
      } else {
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
        if (state & maskFlags == flagNoBreak) {
          continue;
        }
      }
      if (state & maskLookahead != 0) {
        _lookahead();
      }
      if (state & maskBreak != flagNoBreak) {
        return breakAt;
      }
    }
    state = moveBack(state, categoryEoT);
    assert(state < stateLookaheadMin, state);
    if (state & maskBreak != flagNoBreak) return cursor;
    return -1;
  }

  void _lookahead() {
    assert(state >= stateLookaheadMin, state);
    // To check if this was a regional lookahead afterwards.
    var preState = state;
    // Regional lookahead resets to this position.
    var preCursor = cursor;
    // Non-regional lookahead may reset to the position before the last seen,
    // to avoid having to report two breaks.
    var breakAt = preCursor;
    lookahead:
    {
      while (cursor > start) {
        breakAt = cursor;
        var char = base.codeUnitAt(--cursor);
        if (char & 0xFC00 != 0xDC00) {
          var category = low(char);

          state = moveBack(state, category);
          if (state < stateLookaheadMin) {
            break lookahead;
          }
        } else {
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
          if (state < stateLookaheadMin) {
            break lookahead;
          }
        }
      }
      breakAt = start;
      state = moveBack(state, categorySoT);
      assert(state < stateLookaheadMin, state);
    }
    if (preState >= stateLookaheadRegionalEven) {
      assert(
          preState == (stateLookaheadRegionalOdd | flagLookahead) ||
              preState == (stateLookaheadRegionalEven | flagLookahead),
          preState);
      assert(state == (stateRegionalEven | flagNoBreak) ||
          state == (stateRegionalOdd | flagBreak));
      // Always reset cursor for regional lookahead.
      cursor = preCursor;
    } else {
      // Keep cursor at or just before last read.
      if (state & maskFlags == flagLookaheadBreakBoth) {
        cursor = breakAt;
      }
      state &= ~maskLookahead;
    }
  }
}

// -------------------------------------------------------------------
// Only used by `nextBreak`.
// TODO: Convert that to automaton states too.

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
int lookaheadRegional(String base, int start, int cursor) {
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
int lookaheadPictographicExtend(String base, int start, int cursor) {
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
int lookaheadInCBLinkedConsonant(
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
    int prevCategory, nextCategory;
    var cursorBefore = index - 1;
    var prevChar = text.codeUnitAt(cursorBefore);
    var nextChar = text.codeUnitAt(index);
    if (prevChar & 0xF800 != 0xD800) {
      prevCategory = low(prevChar);
    } else if (prevChar & 0xFC00 == 0xD800) {
      // Either not a break because it's in the middle of a surrogate pair,
      // or always a break after an unpaired surrogate.
      return nextChar & 0xFC00 != 0xDC00;
    } else if (start < cursorBefore) {
      assert(prevChar & 0xFC00 == 0xDC00);
      var headChar = text.codeUnitAt(--cursorBefore);
      if (headChar & 0xFC00 != 0xD800) {
        // Always break after unpaired tail surrogate.
        return true;
      }
      prevCategory = high(headChar, prevChar);
    } else {
      // Break after unpaired tail surrogate.
      return true;
    }
    if (nextChar & 0xF800 != 0xD800) {
      nextCategory = low(nextChar);
    } else if (nextChar & 0xFC00 == 0xD800 && index + 1 < end) {
      var tailChar = text.codeUnitAt(index + 1);
      if (tailChar & 0xFC00 != 0xDC00) {
        // Always break before unpaired head surrogate.
        return true;
      }
      nextCategory = high(nextChar, tailChar);
    } else {
      // Always break before unpaired tail surrogate.
      return true;
    }
    var state = move(move(stateCAny, prevCategory), nextCategory);
    if (state & maskBreak != flagNoBreak) {
      return true;
    }
    if (state & maskLookahead == 0) return false;
    return _lookaheadSimple(text, start, cursorBefore, state);
  }
  return true;
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
  var state = move(stateCAny, prevCategory);
  while (index < end) {
    var nextChar = text.codeUnitAt(index);
    var nextIndex = index + 1;
    int category;
    if (nextChar & 0xFC00 != 0xD800 || nextIndex == end) {
      category = low(nextChar);
      state = move(state, category);
      if (state & maskFlags == flagNoBreak) {
        index++;
        continue;
      }
    } else {
      var tail = text.codeUnitAt(nextIndex);
      category = categoryControl;
      if (tail & 0xFC00 == 0xDC00) {
        nextIndex += 1;
        category = high(nextChar, tail);
      }
      state = move(state, category);
      if (state & maskFlags == flagNoBreak) {
        index = nextIndex;
        continue;
      }
    }
    if (state & maskFlags == flagBreak) return index;
    assert(state & maskFlags == flagLookahead);

    if (_lookaheadSimple(text, start, indexBefore, state)) return index;

    // Find the correct forward category.
    // There are only three possible character categories that can trigger
    // a look-behind.
    if (category == categoryRegionalIndicator) {
      assert(state == stateLookaheadRegionalEven | flagLookahead);
      // Started by RI+RI.
      state = stateRegionalEven;
    } else if (category == categoryOtherIndicConsonant) {
      assert(
          state == (stateLookaheadInC | flagLookahead) ||
              state == (stateLookaheadInCL | flagLookahead),
          state);
      state = stateInC;
    } else {
      assert(category == categoryPictographic);
      assert(state == (stateLookaheadZWJPictographic | flagLookahead));
      state = statePictographic;
    }
    index = nextIndex;
  }
  assert(index == end);
  return index;
}

/// Whether to break before a later character.
///
/// Used only to find grapheme category breaks, not part of moving forwards
/// or backwards from known breaks.
///
/// That character is always one of [categoryOtherIndicConsonant],
/// [categoryPictographic] or [categoryRegionalIndicator], the only
/// characters where knowing whether to break before them depends on
/// more than the single prior character.
bool _lookaheadSimple(String text, int start, int cursor, int backState) {
  while (cursor > start) {
    var prevChar = text.codeUnitAt(--cursor);
    if (prevChar & 0xFC00 != 0xDC00 || cursor == start) {
      backState = moveBack(backState, low(prevChar));
      if (backState >= stateLookaheadMin) continue;
    } else {
      var headChar = text.codeUnitAt(--cursor);
      int category;
      if (headChar & 0xFC00 == 0xD800) {
        category = high(headChar, prevChar);
      } else {
        category = categoryControl;
        cursor++;
      }
      backState = moveBack(backState, category);
      if (backState >= stateLookaheadMin) continue;
    }
    return (backState & maskBreak != flagNoBreak);
  }
  return moveBack(backState, categorySoT) & maskBreak != flagNoBreak;
}
