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
const _ansiBoldTextSpecificReset =
    'This is normal, \x1B[1mthis is bold\x1B[22m, and this uses specific reset.';
const _ansiMixedStyles =
    'Normal, \x1B[31mRed\x1B[0m, \x1B[1mBold\x1B[0m, \x1B[4mUnderline\x1B[0m, \x1B[1;34mBold Blue\x1B[0m, Normal again.';
const _ansiLongSequence =
    'Start \x1B[1;3;4;5;7;9;31;42;38;5;196;48;5;226m Beaucoup formatting! \x1B[0m End';
const _ansiCombined256 =
    '\x1B[1;38;5;27;48;5;220mBold Bright Blue FG (27) on Gold BG (220)\x1B[0m';
const _ansiCombinedTrueColor =
    '\x1B[4;48;2;50;50;50;38;2;150;250;150mUnderlined Light Green FG on Dark Grey BG\x1B[0m';

void main() {
  group('padding', () {
    test('can pad on the right.', () {
      expect('foo'.padRightIgnoreAnsi(6), equals('foo   '));
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

  group('lengthWithoutAnsi with no ANSI sequences', () {
    test('equals length for a plain line', () {
      expect(_longLine.lengthWithoutAnsi, equals(_longLine.length));
    });
    test('equals length for a line with newlines', () {
      expect(_longLineWithNewlines.lengthWithoutAnsi,
          equals(_longLineWithNewlines.length));
    });
    test('equals length for an indented line with newlines', () {
      expect(_indentedLongLineWithNewlines.lengthWithoutAnsi,
          equals(_indentedLongLineWithNewlines.length));
    });
    test('equals length for a short line', () {
      expect(_shortLine.lengthWithoutAnsi, equals(_shortLine.length));
    });
  });

  group('lengthWithoutAnsi with a variety of ANSI sequences', () {
    test('single reset', () {
      expect(_ansiReset.lengthWithoutAnsi, equals(36));
    });
    test('bold with a specific reset', () {
      expect(_ansiBoldTextSpecificReset.lengthWithoutAnsi, equals(59));
    });
    test('mixed styles', () {
      expect(_ansiMixedStyles.lengthWithoutAnsi, equals(54));
    });
    test('long sequence', () {
      expect(_ansiLongSequence.lengthWithoutAnsi, equals(32));
    });
    test('256 color sequence', () {
      expect(_ansiCombined256.lengthWithoutAnsi, equals(41));
    });
    test('true color sequence', () {
      expect(_ansiCombinedTrueColor.lengthWithoutAnsi, equals(41));
    });
    test('strips only the escapes from a mixed string', () {
      const text = 'Hello \x1b[32mWorld\x1b[0m';
      expect(text.length, equals(20));
      expect(text.lengthWithoutAnsi, equals('Hello World'.length));
    });
    test('multiple adjacent sequences', () {
      const adjacent = '\x1b[1m\x1b[31m\x1b[4mText\x1b[0m';
      expect(adjacent.lengthWithoutAnsi, equals(4));
    });
  });

  group('lengthWithoutAnsi recognizes valid CSI sequences fully', () {
    test('standard SGR codes', () {
      for (final sgr in ['\x1b[0m', '\x1b[1;31m', '\x1b[44m']) {
        expect(sgr.lengthWithoutAnsi, equals(0), reason: 'Failed on: $sgr');
      }
    });
    test('private mode sequences (starting with ?)', () {
      for (final seq in ['\x1b[?25l', '\x1b[?25h']) {
        expect(seq.lengthWithoutAnsi, equals(0), reason: 'Failed on: $seq');
      }
    });
    test('semicolon-separated parameters', () {
      expect('\x1b[38;5;209;48;5;255m'.lengthWithoutAnsi, equals(0));
    });
    test('every parameter and intermediate byte in the allowed ranges', () {
      expect('\x1b[0123456789:;<=>?m'.lengthWithoutAnsi, equals(0));

      final intermediateBytes =
          String.fromCharCodes([for (var c = 0x20; c <= 0x2f; c++) c]);
      expect('\x1b[${intermediateBytes}m'.lengthWithoutAnsi, equals(0));
    });
    test('every valid final byte terminates a sequence', () {
      // Final bytes span 0x40-0x7e; skip the 0x5b-0x60 non-alpha gap.
      for (var i = 0x40; i <= 0x7e; i++) {
        if (i > 0x5a && i < 0x61) continue;
        final sequence = '\x1b[1;2;3${String.fromCharCode(i)}';
        expect(sequence.lengthWithoutAnsi, equals(0),
            reason: 'Failed on final byte 0x${i.toRadixString(16)}');
      }
    });
  });

  group('lengthWithoutAnsi respects CSI structure and terminators', () {
    test('sequence with an intermediate byte', () {
      // CSI 1 <space> q sets the cursor style; the space is an intermediate.
      expect('\x1b[1 q'.lengthWithoutAnsi, equals(0));
    });
    test('stops at the first final byte, leaving trailing text intact', () {
      // '\x1b[m' matches (final byte 'm'), so '/ ' is left behind.
      expect('\x1b[m/ '.lengthWithoutAnsi, equals(2));
      // '\x1b[m' matches, so the trailing '?' is left behind.
      expect('\x1b[m?'.lengthWithoutAnsi, equals(1));
      // 'H' is a final byte, so the sequence ends before ';24m'.
      expect('\x1b[1H;24m'.lengthWithoutAnsi, equals(4));
    });
    test('private parameter range (< = > ?) is allowed', () {
      expect('\x1b[>4;2m'.lengthWithoutAnsi, equals(0));
    });
  });

  group('lengthWithoutAnsi ignores broken or invalid sequences', () {
    test('a partial sequence missing a terminator is left intact', () {
      const broken = ' \x1b[31';
      expect(broken.lengthWithoutAnsi, equals(broken.length));
      const justEsc = '\x1b';
      expect(justEsc.lengthWithoutAnsi, equals(justEsc.length));
    });
    test('a character between ESC and [ breaks the sequence', () {
      for (final char in ['\\', 'a', ' ', '\x1c']) {
        final str = '\x1b$char[m';
        expect(str.lengthWithoutAnsi, equals(str.length),
            reason: 'Failed on char: $char');
      }
    });
    test('a non-CSI character where a terminator is expected', () {
      final chars = <String>[
        String.fromCharCode(0x7f),
        ...List.generate(0x20, String.fromCharCode),
        String.fromCharCode('m'.codeUnitAt(0) + 0x80),
        String.fromCharCode('m'.codeUnitAt(0) + 0x100),
        String.fromCharCode('m'.codeUnitAt(0) + 0xD800),
        String.fromCharCode('m'.codeUnitAt(0) + 0x10000),
      ];
      for (final char in chars) {
        final str = '\x1b[$char';
        expect(str.lengthWithoutAnsi, equals(str.length),
            reason: 'Failed on char: $char');
      }
    });
    test('out-of-range code points at each position break the sequence', () {
      for (final offset in [0x80, 0x100, 0x1000, 0xd800, 0x10000]) {
        // ESC replaced.
        var str = '${String.fromCharCode(0x1b + offset)}[0m';
        expect(str.lengthWithoutAnsi, equals(str.length),
            reason: 'Failed on ESC + 0x${offset.toRadixString(16)}');
        // '[' replaced.
        str = '\x1b${String.fromCharCode(0x5b + offset)}0m';
        expect(str.lengthWithoutAnsi, equals(str.length),
            reason: 'Failed on [ + 0x${offset.toRadixString(16)}');
        // Parameter byte replaced.
        str = '\x1b[${String.fromCharCode(0x30 + offset)}m';
        expect(str.lengthWithoutAnsi, equals(str.length),
            reason: 'Failed on param + 0x${offset.toRadixString(16)}');
        // Intermediate byte replaced.
        str = '\x1b[0${String.fromCharCode(0x20 + offset)}m';
        expect(str.lengthWithoutAnsi, equals(str.length),
            reason: 'Failed on intermediate + 0x${offset.toRadixString(16)}');
        // Terminator byte replaced.
        str = '\x1b[0${String.fromCharCode(0x6d + offset)}';
        expect(str.lengthWithoutAnsi, equals(str.length),
            reason: 'Failed on terminator + 0x${offset.toRadixString(16)}');
      }
    });
  });

  group('padRightIgnoreAnsi', () {
    test('pads plain text like padRight', () {
      expect('foo'.padRightIgnoreAnsi(6), equals('foo   '));
    });
    test('accounts for ANSI length to align by visible width', () {
      // '\x1B[31mRed\x1B[0m' is 3 visible chars but 12 literal chars.
      // Padding to a visible width of 10 should add 7 trailing spaces.
      const red = '\x1B[31mRed\x1B[0m';
      final padded = red.padRightIgnoreAnsi(10);
      expect(padded.lengthWithoutAnsi, equals(10));
      expect(padded.startsWith(red), isTrue);
      expect(padded.endsWith(' ' * 7), isTrue);
    });
  });
}
