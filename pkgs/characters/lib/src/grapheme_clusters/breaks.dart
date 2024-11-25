// BSD-style license that can be found in the LICENSE file.

/// API for accessing the generated state and category tables.
///
/// Use only [Breaks], [BackBreaks] and [nextBreak] from files other than this.
/// Do not use any function from `table.dart` directly.
/// (In both cases this package's own testing is exempted.)

library;

import 'constants.dart';
import 'table.dart';

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
///   print('Break at index $brk');
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
  /// A state value is a multiple of [automatonRowLength] plus possibly
  /// a few bits of flags.
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
    var cursorBefore = cursor - 1;
    var prevChar = base.codeUnitAt(cursorBefore);
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
      var leadIndex = cursorBefore - 1;
      if (leadIndex >= start &&
          (leadChar = base.codeUnitAt(leadIndex)) & 0xFC00 == 0xD800) {
        prevCategory = high(leadChar, prevChar);
        cursorBefore = leadIndex;
      } else {
        prevCategory = categoryControl;
      }
    }
    state = move(stateCAny, prevCategory);
    return cursorBefore;
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
///   print('Break at index $brk');
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

  BackBreaks(this.base, this.cursor, this.start, this.state);

  BackBreaks copy() => BackBreaks(base, cursor, start, state);

  /// The index of the next grapheme cluster break in first-to-last index order.
  ///
  /// Returns a negative number if there are no further breaks,
  /// which means that [cursor] was already at [start].
  int nextBreak() {
    while (cursor > start) {
      var breakAt = cursor;
      step();
      if (state & maskFlags == flagNoBreak) {
        continue;
      }
      if (state & maskLookahead != 0) {
        _lookaheadInNextBreak();
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

  /// Reads a single code point before [cursor] and transition on it.
  ///
  /// Puts cursor before the code point.
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

  /// Steps back using lookahead states.
  ///
  /// Returns the position before the last scanned character.
  /// (Because in some cases the next break will be at that point.)
  int _lookahead() {
    assert(state >= stateLookaheadMin);
    while (cursor > start) {
      var cursorBeforeLast = cursor;
      step();
      if (state < stateLookaheadMin) return cursorBeforeLast;
    }
    state = moveBack(state, categorySoT);
    assert(state < stateLookaheadMin, state);
    return start;
  }

  /// Called from [nextBreak] to perform a lookahead, and set the result state.
  ///
  /// After this call, the state has [flagBreak] set if it should break
  /// between the two characters which triggered lookahead.
  /// The state and cursor are set to a position prior to reaching the next
  /// break.
  void _lookaheadInNextBreak() {
    assert(state >= stateLookaheadMin, state);
    // To check if this was a regional lookahead afterwards.
    var preState = state;
    // Regional lookahead resets to this position.
    var preCursor = cursor;
    // Non-regional lookahead may reset to the position before the last seen,
    // to avoid having to report two breaks.
    var breakAt = _lookahead();

    if (preState >= stateLookaheadRegionalEven) {
      // Result is always one of one of flagBreak or flagNoBreak.
      assert(
          preState == (stateLookaheadRegionalOdd | flagLookahead) ||
              preState == (stateLookaheadRegionalEven | flagLookahead),
          preState);
      assert(state == (stateRegionalEven | flagNoBreak) ||
          state == (stateRegionalOdd | flagBreak));
      // Always reset cursor for regional lookahead.
      // (Could detect stateRegionalOdd, decrease cursor two positions and
      // switch to stateRegionalEven. Not worth the extra code.)
      cursor = preCursor;
    } else {
      // Flags mean:
      // flagNoBreak: Do not break before position, or before cursor.
      // flagBreak: break at position before lookahead, keep cursor.
      // flagLookahead: Not used.
      // flagBreak+flagLookahead: Break at position before lookahead,
      //   set cursor to reread the last character before cursor
      //   (because it'll break again there.)

      // Keep cursor at or just before last read.
      if (state & maskFlags == flagLookaheadBreakBoth) {
        cursor = breakAt;
      }
    }
  }
}

/// Whether there is a grapheme cluster boundary before [index] in [text].
///
/// This is a low-level function. There is no validation of the arguments.
/// They should satisfy `0 <= start <= index <= end <= text.length`.
///
/// Allows [index] to not be at a grapheme cluster boundary
/// (or even a code point boundary).
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

    var backBreaks = BackBreaks(text, cursorBefore, start, breaks.state);
    backBreaks._lookahead();
    return (backBreaks.state & maskBreak != flagNoBreak);
  }
  return true;
}

/// The most recent break no later than [index] in
/// `string.substring(start, end)`.
///
/// Allows [index] to not be at a grapheme cluster boundary
/// (or even a code point boundary).
int previousBreak(String text, int start, int end, int index) {
  assert(0 <= start);
  assert(start <= index);
  assert(index <= end);
  assert(end <= text.length);
  // First character ending after `index`.
  // Accounts for an `index` in the middle of a surrogate pair.
  if (start < index && index < end) {
    var cursorBefore = index;
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
        cursorBefore -= 1;
      }
    }
    return BackBreaks(
            text, cursorBefore, start, moveBack(stateEoTNoBreak, category))
        .nextBreak();
  }
  return index;
}

/// The next break no earlier than [index] in `string.substring(start, end)`.
///
/// Allows [index] to not be at a grapheme cluster boundary
/// (or even a code point boundary).
int nextBreak(String text, int start, int end, int index) {
  assert(0 <= start);
  assert(start <= index);
  assert(index <= end);
  assert(end <= text.length);
  // Always break at start or end (GB1).
  if (index == start || index == end) return index;
  var breaks = Breaks(text, index, end, stateCAny);
  var cursorBefore = breaks._unknownPositionFirstStep(start);
  var possibleBreak = breaks.nextBreak();
  assert(breaks.state & maskFlags != 0);
  if (breaks.state & maskFlags == flagBreak) return possibleBreak;
  var lookbehindState = breaks.state;
  assert(lookbehindState & maskFlags == flagLookahead);
  assert(lookbehindState & maskState >= stateLookaheadMin);

  var backBreaks = BackBreaks(text, cursorBefore, start, lookbehindState);
  backBreaks._lookahead();
  if (backBreaks.state & maskBreak != flagNoBreak) {
    return possibleBreak;
  }

  // Find the correct forward category to continue with.
  // There are only three possible character categories that can trigger
  // a look-behind.
  if (lookbehindState == stateLookaheadRegionalEven | flagLookahead) {
    assert(backBreaks.state == stateRegionalEven);
    // Started by RI+RI.
    breaks.state = stateRegionalEven;
  } else {
    // Was triggered by ZWJ+Pic or InCB={Extend|Linked}+InCB=Consonant.
    assert(lookbehindState == (stateLookaheadZWJPictographic | flagLookahead) ||
        lookbehindState == (stateLookaheadInC | flagLookahead) ||
        lookbehindState == (stateLookaheadInCL | flagLookahead));
    // If starting in lookahead state ZWJ+Pic, and not breaking,
    // final backwards state is Pic.
    assert(lookbehindState != (stateLookaheadZWJPictographic | flagLookahead) ||
        backBreaks.state == statePictographic);
    // If starting in lookahead state InC or InCL, and not breaking,
    // final backwards state is Inc.
    assert(lookbehindState != (stateLookaheadInC | flagLookahead) &&
            lookbehindState != (stateLookaheadInCL | flagLookahead) ||
        backBreaks.state == stateInC);
    // In both cases, that's the same as the forward state
    // at the point that triggered the look-behind.
    breaks.state = backBreaks.state;
  }
  var result = breaks.nextBreak();
  assert(breaks.state & maskFlags == flagBreak);
  return result;
}
