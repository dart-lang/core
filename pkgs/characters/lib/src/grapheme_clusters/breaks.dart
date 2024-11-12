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
  ///
  /// Also stops if reaching a state with the `flagLookahead` bit set,
  /// with the returned position being before the character which triggered
  /// that look-behind.
  /// If the state is not one which can trigger a look-behind, the exit position
  /// is always the next break (if any, or -1 if none, which only happens on
  /// empty strings.)
  int nextBreak() {
    while (cursor < end) {
      var breakAt = cursor;
      step();
      if (state & maskFlags != flagNoBreak) {
        return breakAt;
      }
    }
    state = move(state, categoryEoT);
    if (state & maskFlags != flagNoBreak) return cursor;
    return -1;
  }

  /// Takes one step forward in the state machine.
  void step() {
    assert(cursor < end);
    var char = base.codeUnitAt(cursor++);
    if (char & 0xFC00 != 0xD800) {
      state = move(state, low(char));
      return;
    }
    // The category of an unpaired lead surrogate is Control.
    int category;
    int nextChar;
    if (cursor < end &&
        (nextChar = base.codeUnitAt(cursor)) & 0xFC00 == 0xDC00) {
      category = high(char, nextChar);
      cursor++;
    } else {
      category = categoryControl;
    }
    state = move(state, category);
  }

  /// Start with no knowledge about the position at [cursor].
  ///
  /// Starts from state `CAny` and takes one step based on the
  /// latest character starting earlier than [cursor].
  ///
  /// Can be used if the [cursor] isn't even known to be at
  /// a grapheme cluster boundary.
  ///
  /// Returns the start of that prior character, which is
  /// one of `cursor` (if cursor is at start of input) or
  /// `cursor - 1`or `cursor - 2` depending whether
  /// it is a surrogate pair, and if so, where it ends.
  int _unknownPositionFirstStep(int start) {
    if (cursor == start) {
      state = stateSoTNoBreak;
      return cursor;
    }
    var indexBefore = cursor - 1;
    var prevChar = base.codeUnitAt(indexBefore);
    int prevCategory;
    if (prevChar & 0xF800 != 0xD800) {
      // Not surrogate.
      prevCategory = low(prevChar);
    } else if (prevChar & 0xFC00 == 0xD800) {
      // Lead surrogate. Check for a following tail surrogate.
      int tailChar;
      if (cursor < end &&
          (tailChar = base.codeUnitAt(cursor)) & 0xFC00 == 0xDC00) {
        cursor += 1;
        prevCategory = high(prevChar, tailChar);
      } else {
        prevCategory = categoryControl;
      }
    } else {
      // Tail surrogate, check for prior lead surrogate.
      int leadChar;
      var leadIndex = indexBefore - 1;
      if (leadIndex >= start &&
          (leadChar = base.codeUnitAt(leadIndex)) & 0xFC00 == 0xD800) {
        prevCategory = high(leadChar, prevChar);
        indexBefore = leadIndex;
      } else {
        prevCategory = categoryControl;
      }
    }
    state = move(stateCAny, prevCategory);
    return indexBefore;
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
      step();
      if (state & maskFlags == flagNoBreak) {
        continue;
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

  void step() {
    assert(cursor > start);
    var char = base.codeUnitAt(--cursor);
    if (char & 0xFC00 != 0xDC00) {
      var category = low(char);
      state = moveBack(state, category);
      return;
    }
    // Found tail surrogate, check for prior lead surrogate.
    // The category of an unpaired tail surrogate is Control.
    int category;
    int prevChar;
    if (cursor >= start &&
        (prevChar = base.codeUnitAt(--cursor)) & 0xFC00 == 0xD800) {
      category = high(prevChar, char);
    } else {
      category = categoryControl;
      cursor++;
    }
    state = moveBack(state, category);
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
    var breaks = Breaks(text, index, end, stateCAny);
    var cursorBefore = breaks._unknownPositionFirstStep(start);
    // If cursor moved, index is in the middle of a surrogate pair.
    if (breaks.cursor != index) return false;
    breaks.step();
    if (breaks.state & maskBreak != flagNoBreak) {
      return true;
    }
    if (breaks.state & maskLookahead == 0) return false;
    assert(breaks.state >= stateLookaheadMin);
    return _lookaheadSimple(text, start, cursorBefore, breaks.state);
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
  // First character after `index`. Account for it if `index` is in the
  // middle of a surrogate pair.
  if (start < index && index < end) {
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
  return index;
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
  var breaks = Breaks(text, index, end, stateCAny);
  var indexBefore = breaks._unknownPositionFirstStep(start);
  var possibleBreak = breaks.nextBreak();
  assert(breaks.state & maskFlags != 0);
  if (breaks.state & maskFlags == flagBreak) return possibleBreak;
  var lookbehindState = breaks.state;
  assert(lookbehindState & maskFlags == flagLookahead);
  assert(lookbehindState & maskState >= stateLookaheadMin);

  if (_lookaheadSimple(text, start, indexBefore, lookbehindState)) {
    return possibleBreak;
  }

  // Find the correct forward category.
  // There are only three possible character categories that can trigger
  // a look-behind.
  if (lookbehindState == stateLookaheadRegionalEven | flagLookahead) {
    // Started by RI+RI.
    breaks.state = stateRegionalEven;
  } else if (lookbehindState ==
      (stateLookaheadZWJPictographic | flagLookahead)) {
    breaks.state = statePictographic;
  } else {
    assert(lookbehindState == (stateLookaheadInC | flagLookahead) ||
        lookbehindState == (stateLookaheadInCL | flagLookahead));
    breaks.state = stateInC;
  }
  return breaks.nextBreak();
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
  var backBreaks = BackBreaks(text, cursor, start, backState);
  while (true) {
    if (backBreaks.cursor > start) {
      backBreaks.step();
      if (backBreaks.state < stateLookaheadMin) {
        return backBreaks.state & maskBreak != flagNoBreak;
      }
    } else {
      return moveBack(backBreaks.state, categorySoT) & maskBreak != flagNoBreak;
    }
  }
}
