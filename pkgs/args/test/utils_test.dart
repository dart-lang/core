// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:args/src/utils.dart';
import 'package:test/test.dart';

const _lineLength = 40;
const _longLine = 'This is a long line that needs to be wrapped.';
final _longLineWithNewlines =
    'This is a long line with newlines that\nneeds to be wrapped.\n\n'
    '${'0123456789' * 5}';
final _indentedLongLineWithNewlines =
    '    This is an indented long line with newlines that\nneeds to be wrapped.'
    '\n\tAnd preserves tabs.\n      \n  ${'0123456789' * 5}';
const _shortLine = 'Short line.';
const _indentedLongLine = '    This is an indented long line that needs to be '
    'wrapped and indentation preserved.';
const _ansiReset = 'This is normal text. \x1B[0m<- Reset point.';
const _ansiBoldTextSpecificReset = 'This is normal, \x1B[1mthis is bold\x1B[22m, and this uses specific reset.';
const _ansiMixedStyles = 'Normal, \x1B[31mRed\x1B[0m, \x1B[1mBold\x1B[0m, \x1B[4mUnderline\x1B[0m, \x1B[1;34mBold Blue\x1B[0m, Normal again.';
const _ansiLongSequence = 'Start \x1B[1;3;4;5;7;9;31;42;38;5;196;48;5;226m Beaucoup formatting! \x1B[0m End';
const _ansiCombined256 = '\x1B[1;38;5;27;48;5;220mBold Bright Blue FG (27) on Gold BG (220)\x1B[0m';
const _ansiCombinedTrueColor = '\x1B[4;48;2;50;50;50;38;2;150;250;150mUnderlined Light Green FG on Dark Grey BG\x1B[0m';

void main() {
  group('padding', () {
    test('can pad on the right.', () {
      expect(padRight('foo', 6), equals('foo   '));
    });
  });
  group('text wrapping', () {
    test("doesn't wrap short lines.", () {
      expect(wrapText(_shortLine, length: _lineLength), equals(_shortLine));
    });
    test("doesn't wrap at all if not given a length", () {
      expect(wrapText(_longLine), equals(_longLine));
    });
    test('able to wrap long lines', () {
      expect(wrapText(_longLine, length: _lineLength), equals('''
This is a long line that needs to be
wrapped.'''));
    });
    test('wrap long lines with no whitespace', () {
      expect(wrapText('0123456789' * 5, length: _lineLength), equals('''
0123456789012345678901234567890123456789
0123456789'''));
    });
    test('refuses to wrap to a column smaller than 10 characters', () {
      expect(wrapText('$_longLine ${'0123456789' * 4}', length: 1), equals('''
This is a
long line
that needs
to be
wrapped.
0123456789
0123456789
0123456789
0123456789'''));
    });
    test('preserves indentation', () {
      expect(wrapText(_indentedLongLine, length: _lineLength), equals('''
    This is an indented long line that
    needs to be wrapped and indentation
    preserved.'''));
    });
    test('preserves indentation and stripping trailing whitespace', () {
      expect(wrapText('$_indentedLongLine   ', length: _lineLength), equals('''
    This is an indented long line that
    needs to be wrapped and indentation
    preserved.'''));
    });
    test('wraps text with newlines', () {
      expect(wrapText(_longLineWithNewlines, length: _lineLength), equals('''
This is a long line with newlines that
needs to be wrapped.

0123456789012345678901234567890123456789
0123456789'''));
    });
    test('preserves indentation in the presence of newlines', () {
      expect(wrapText(_indentedLongLineWithNewlines, length: _lineLength),
          equals('''
    This is an indented long line with
    newlines that
needs to be wrapped.
\tAnd preserves tabs.

  01234567890123456789012345678901234567
  890123456789'''));
    });
    test('removes trailing whitespace when wrapping', () {
      expect(wrapText('$_longLine     \t', length: _lineLength), equals('''
This is a long line that needs to be
wrapped.'''));
    });
    test('preserves trailing whitespace when not wrapping', () {
      expect(wrapText('$_longLine     \t'), equals('$_longLine     \t'));
    });
    test('honors hangingIndent parameter', () {
      expect(
          wrapText(_longLine, length: _lineLength, hangingIndent: 6), equals('''
This is a long line that needs to be
      wrapped.'''));
    });
    test('handles hangingIndent with a single unwrapped line.', () {
      expect(wrapText(_shortLine, length: _lineLength, hangingIndent: 6),
          equals('''
Short line.'''));
    });
    test(
      'handles hangingIndent with two unwrapped lines and the second is empty.',
      () {
        expect(wrapText('$_shortLine\n', length: _lineLength, hangingIndent: 6),
            equals('''
Short line.
'''));
      },
    );
    test('honors hangingIndent parameter on already indented line.', () {
      expect(wrapText(_indentedLongLine, length: _lineLength, hangingIndent: 6),
          equals('''
    This is an indented long line that
          needs to be wrapped and
          indentation preserved.'''));
    });
    test('honors hangingIndent parameter on already indented line.', () {
      expect(
          wrapText(_indentedLongLineWithNewlines,
              length: _lineLength, hangingIndent: 6),
          equals('''
    This is an indented long line with
          newlines that
needs to be wrapped.
	And preserves tabs.

  01234567890123456789012345678901234567
        890123456789'''));
    });
  });
  group('text wrapping as lines', () {
    test("doesn't wrap short lines.", () {
      expect(wrapTextAsLines(_shortLine, length: _lineLength),
          equals([_shortLine]));
    });
    test("doesn't wrap at all if not given a length", () {
      expect(wrapTextAsLines(_longLine), equals([_longLine]));
    });
    test('able to wrap long lines', () {
      expect(wrapTextAsLines(_longLine, length: _lineLength),
          equals(['This is a long line that needs to be', 'wrapped.']));
    });
    test('wrap long lines with no whitespace', () {
      expect(wrapTextAsLines('0123456789' * 5, length: _lineLength),
          equals(['0123456789012345678901234567890123456789', '0123456789']));
    });

    test('refuses to wrap to a column smaller than 10 characters', () {
      expect(
          wrapTextAsLines('$_longLine ${'0123456789' * 4}', length: 1),
          equals([
            'This is a',
            'long line',
            'that needs',
            'to be',
            'wrapped.',
            '0123456789',
            '0123456789',
            '0123456789',
            '0123456789'
          ]));
    });
    test("doesn't preserve indentation", () {
      expect(
          wrapTextAsLines(_indentedLongLine, length: _lineLength),
          equals([
            'This is an indented long line that needs',
            'to be wrapped and indentation preserved.'
          ]));
    });
    test('strips trailing whitespace', () {
      expect(
          wrapTextAsLines('$_indentedLongLine   ', length: _lineLength),
          equals([
            'This is an indented long line that needs',
            'to be wrapped and indentation preserved.'
          ]));
    });
    test('splits text with newlines properly', () {
      expect(
          wrapTextAsLines(_longLineWithNewlines, length: _lineLength),
          equals([
            'This is a long line with newlines that',
            'needs to be wrapped.',
            '',
            '0123456789012345678901234567890123456789',
            '0123456789'
          ]));
    });
    test('does not preserves indentation in the presence of newlines', () {
      expect(
          wrapTextAsLines(_indentedLongLineWithNewlines, length: _lineLength),
          equals([
            'This is an indented long line with',
            'newlines that',
            'needs to be wrapped.',
            'And preserves tabs.',
            '',
            '0123456789012345678901234567890123456789',
            '0123456789'
          ]));
    });
    test('removes trailing whitespace when wrapping', () {
      expect(wrapTextAsLines('$_longLine     \t', length: _lineLength),
          equals(['This is a long line that needs to be', 'wrapped.']));
    });
    test('preserves trailing whitespace when not wrapping', () {
      expect(
          wrapTextAsLines('$_longLine     \t'), equals(['$_longLine     \t']));
    });
  });

  group('text lengthWithoutAnsi is correct with no ANSI sequences', () {
    test('lengthWithoutAnsi returns correct length on lines without ansi', () {
      expect(_longLine.lengthWithoutAnsi, equals(_longLine.length));
    });
    test('lengthWithoutAnsi returns correct length on lines newlines and without ansi', () {
      expect(_longLineWithNewlines.lengthWithoutAnsi, equals(_longLineWithNewlines.length));
    });
    test('lengthWithoutAnsi returns correct length on lines indented/newlines and without ansi', () {
      expect(_indentedLongLineWithNewlines.lengthWithoutAnsi, equals(_indentedLongLineWithNewlines.length));
    });    
    test('lengthWithoutAnsi returns correct length on short line without ansi', () {
      expect(_shortLine.lengthWithoutAnsi, equals(_shortLine.length));
    });      
  });

  group('lengthWithoutAnsi is correct with no ANSI sequences', () {
    test('lengthWithoutAnsi returns correct length on lines without ansi', () {
      expect(_longLine.lengthWithoutAnsi, equals(_longLine.length));
    });
    test('lengthWithoutAnsi returns correct length on lines newlines and without ansi', () {
      expect(_longLineWithNewlines.lengthWithoutAnsi, equals(_longLineWithNewlines.length));
    });
    test('lengthWithoutAnsi returns correct length on lines indented/newlines and without ansi', () {
      expect(_indentedLongLineWithNewlines.lengthWithoutAnsi, equals(_indentedLongLineWithNewlines.length));
    });    
    test('lengthWithoutAnsi returns correct length on short line without ansi', () {
      expect(_shortLine.lengthWithoutAnsi, equals(_shortLine.length));
    });      
  });

  group('lengthWithoutAnsi is correct with variety of ANSI sequences', () {
    test('lengthWithoutAnsi returns correct length - ansi reset', () {
      expect(_ansiReset.lengthWithoutAnsi, equals(36));
    });
    test('lengthWithoutAnsi returns correct length - ansi bold, bold specific reset', () {
      expect(_ansiBoldTextSpecificReset.lengthWithoutAnsi, equals(59));
    });
    test('lengthWithoutAnsi returns correct length - ansi mixed styles', () {
      expect(_ansiMixedStyles.lengthWithoutAnsi, equals(54));
    });    
    test('lengthWithoutAnsi returns correct length- ansi long sequence', () {
      expect(_ansiLongSequence.lengthWithoutAnsi, equals(32));
    });      
    test('lengthWithoutAnsi returns correct length - ansi 256 color sequence', () {
      expect(_ansiCombined256.lengthWithoutAnsi, equals(41));
    });    
    test('lengthWithoutAnsi returns correct length - ansi true color sequences', () {
      expect(_ansiCombinedTrueColor.lengthWithoutAnsi, equals(41));
    });
  });

  group('ANSI RegEx Systematic Tests', () {
    
    test('Identifies standard SGR (Select Graphic Rendition) codes', () {
      const reset = '\x1b[0m';
      const boldRed = '\x1b[1;31m';
      const bgBlue = '\x1b[44m';
      
      expect(reset.ansiLength, equals(4));
      expect(boldRed.ansiLength, equals(7));
      expect(bgBlue.ansiLength, equals(5));
    });

    test('Identifies Private Mode sequences (starting with ?)', () {
      const hideCursor = '\x1b[?25l';
      const showCursor = '\x1b[?25h';
      
      expect(hideCursor.ansiLength, equals(6));
      expect(showCursor.ansiLength, equals(6));
    });

    test('Matches every valid termination character (A-Z, a-z)', () {
      // CSI sequences usually end in the range 0x40 to 0x7E
      // We check all standard alphabetic termination characters.
      for (int i = 65; i <= 122; i++) {
        if (i > 90 && i < 97) continue; // Skip non-alphas like [ \ ] ^ _ `
        
        final char = String.fromCharCode(i);
        final sequence = '\x1b[1;2;3$char';
        
        // The RegEx should match the entire string
        expect(sequence.ansiLength, equals(sequence.length), 
          reason: 'Failed on character: $char (ASCII $i)');
      }
    });

    test('Correctly calculates length in mixed strings', () {
      const text = 'Hello \x1b[32mWorld\x1b[0m';
      // "Hello " (6) + "World" (5) = 11 visible
      // "\x1b[32m" (5) + "\x1b[0m" (4) = 9 ANSI
      
      expect(text.ansiLength, equals(9));
      expect(text.stripAnsi().length, equals(11));
      expect(text.length, equals(20));
    });

    test('Handles complex semicolon separators', () {
      const complex = '\x1b[38;5;209;48;5;255m'; // Extended 256-color sequence
      expect(complex.ansiLength, equals(20));
    });

    test('Does not match partial or broken sequences', () {
      const broken = ' \x1b[31'; // Missing the terminator 'm'
      expect(broken.ansiLength, equals(0));
      
      const justEsc = '\x1b';
      expect(justEsc.ansiLength, equals(0));
    });
  });

  group('AnsiStringExtension specific getters', () {
    test('ansiLength returns the literal character count of sequences', () {
      // ESC [ 0 m  (4 chars)
      expect('\x1B[0m'.ansiLength, equals(4));
      // ESC [ 3 8 ; 5 ; 2 0 9 m (11 chars)
      expect('\x1B[38;5;209m'.ansiLength, equals(11));
    });

    test('hasAnsi correctly identifies presence of sequences', () {
      expect(_ansiReset.hasAnsi(), isTrue);
      expect(_ansiMixedStyles.hasAnsi(), isTrue);
      expect(_shortLine.hasAnsi(), isFalse);
      expect('Plain text'.hasAnsi(), isFalse);
    });

    test('lengthWithoutAnsi and ansiLength sum to total length', () {
      final cases = [
        _ansiReset,
        _ansiBoldTextSpecificReset,
        _ansiMixedStyles,
        _ansiCombined256,
        _ansiCombinedTrueColor
      ];

      for (var testCase in cases) {
        expect(testCase.lengthWithoutAnsi + testCase.ansiLength, 
               equals(testCase.length),
               reason: 'Failed sum check for: $testCase');
      }
    });
  });

  group('ANSI-aware padding', () {
    test('padRight accounts for ANSI length to align visually', () {
      // "Red" is 3 visual chars, but 12 literal chars
      // \x1B[31mRed\x1B[0m
      const red = '\x1B[31mRed\x1B[0m';
      
      // We want a visual width of 10. 
      // Traditional padRight(10) would see 12 chars and add nothing.
      // Our utility padRight should add 7 spaces (10 - 3 visual).
      final padded = padRight(red, 10);
      
      expect(padded.lengthWithoutAnsi, equals(10));
      expect(padded.startsWith(red), isTrue);
      expect(padded.endsWith(' ' * 7), isTrue);
    });

    test('padRight works with plain text', () {
      expect(padRight('foo', 6), equals('foo   '));
    });
  });

  group('Complex/Edge ANSI sequences', () {
    test('handles multiple adjacent sequences', () {
      const adjacent = '\x1b[1m\x1b[31m\x1b[4mText\x1b[0m';
      // [1m (4) + [31m (5) + [4m (4) + [0m (4) = 17 ANSI chars
      expect(adjacent.ansiLength, equals(17));
      expect(adjacent.lengthWithoutAnsi, equals(4));
    });

    test('handles sequences with question marks (private modes)', () {
      const hideCursor = '\x1b[?25l'; // Common in CLI apps
      expect(hideCursor.ansiLength, equals(6));
      expect(hideCursor.lengthWithoutAnsi, equals(0));
    });
  });
}
