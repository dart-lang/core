// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Generated code. Do not edit.
// Generated from:
// - [https://unicode.org/Public/UCD/latest/ucd/auxiliary/GraphemeBreakTest.txt](../../third_party/Unicode_Consortium/GraphemeBreakTest.txt)
// - [https://unicode.org/Public/emoji/latest/emoji-test.txt](../../third_party/Unicode_Consortium/emoji_test.txt)
// - [https://unicode.org/Public/UCD/latest/ucd/auxiliary/GraphemeBreakProperty.txt](../../third_party/Unicode_Consortium/GraphemeBreakProperty.txt)
// - [https://unicode.org/Public/UCD/latest/ucd/emoji/emoji-data.txt](../../third_party/Unicode_Consortium/emoji_data.txt)
// - [https://unicode.org/Public/UCD/latest/ucd/DerivedCoreProperties.txt](../../third_party/Unicode_Consortium/DerivedCoreProperties.txt)
// Licensed under the Unicode Inc. License Agreement
// (https://www.unicode.org/license.txt, ../../third_party/third_party/Unicode_Consortium/UNICODE_LICENSE.txt)
// ignore_for_file: lines_longer_than_80_chars
// dart format off

// Grapheme cluster tests.
const List<List<String>> splitTests = [
  [
    ' ',
    ' ',
  ], // ÷ [0.2] SPACE (Other) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    ' \u0308',
    ' ',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    ' ',
    '\r',
  ], // ÷ [0.2] SPACE (Other) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    ' \u0308',
    '\r',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    ' ',
    '\n',
  ], // ÷ [0.2] SPACE (Other) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    ' \u0308',
    '\n',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    ' ',
    '\x01',
  ], // ÷ [0.2] SPACE (Other) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    ' \u0308',
    '\x01',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    ' \u200c',
  ], // ÷ [0.2] SPACE (Other) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    ' \u0308\u200c',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    ' ',
    '\u{1f1e6}',
  ], // ÷ [0.2] SPACE (Other) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    ' \u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    ' ',
    '\u0600',
  ], // ÷ [0.2] SPACE (Other) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    ' \u0308',
    '\u0600',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    ' \u0a03',
  ], // ÷ [0.2] SPACE (Other) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    ' \u0308\u0a03',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    ' ',
    '\u1100',
  ], // ÷ [0.2] SPACE (Other) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    ' \u0308',
    '\u1100',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    ' ',
    '\u1160',
  ], // ÷ [0.2] SPACE (Other) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    ' \u0308',
    '\u1160',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    ' ',
    '\u11a8',
  ], // ÷ [0.2] SPACE (Other) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    ' \u0308',
    '\u11a8',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    ' ',
    '\uac00',
  ], // ÷ [0.2] SPACE (Other) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    ' \u0308',
    '\uac00',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    ' ',
    '\uac01',
  ], // ÷ [0.2] SPACE (Other) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    ' \u0308',
    '\uac01',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    ' \u0903',
  ], // ÷ [0.2] SPACE (Other) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    ' \u0308\u0903',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    ' ',
    '\u0904',
  ], // ÷ [0.2] SPACE (Other) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    ' \u0308',
    '\u0904',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    ' ',
    '\u0d4e',
  ], // ÷ [0.2] SPACE (Other) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    ' \u0308',
    '\u0d4e',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    ' ',
    '\u0915',
  ], // ÷ [0.2] SPACE (Other) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    ' \u0308',
    '\u0915',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    ' ',
    '\u231a',
  ], // ÷ [0.2] SPACE (Other) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    ' \u0308',
    '\u231a',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    ' \u0300',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    ' \u0308\u0300',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    ' \u0900',
  ], // ÷ [0.2] SPACE (Other) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    ' \u0308\u0900',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    ' \u094d',
  ], // ÷ [0.2] SPACE (Other) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    ' \u0308\u094d',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    ' \u200d',
  ], // ÷ [0.2] SPACE (Other) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    ' \u0308\u200d',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    ' ',
    '\u0378',
  ], // ÷ [0.2] SPACE (Other) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    ' \u0308',
    '\u0378',
  ], // ÷ [0.2] SPACE (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\r',
    ' ',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] SPACE (Other) ÷ [0.3]
  [
    '\r',
    '\u0308',
    ' ',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\r',
    '\r',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\r',
    '\u0308',
    '\r',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\r\n',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) × [3.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\r',
    '\u0308',
    '\n',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\r',
    '\x01',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\r',
    '\u0308',
    '\x01',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\r',
    '\u200c',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\r',
    '\u0308\u200c',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\r',
    '\u{1f1e6}',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\r',
    '\u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\r',
    '\u0600',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\r',
    '\u0308',
    '\u0600',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\r',
    '\u0a03',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\r',
    '\u0308\u0a03',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\r',
    '\u1100',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\r',
    '\u0308',
    '\u1100',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\r',
    '\u1160',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\r',
    '\u0308',
    '\u1160',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\r',
    '\u11a8',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\r',
    '\u0308',
    '\u11a8',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\r',
    '\uac00',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\r',
    '\u0308',
    '\uac00',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\r',
    '\uac01',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\r',
    '\u0308',
    '\uac01',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\r',
    '\u0903',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\r',
    '\u0308\u0903',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\r',
    '\u0904',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\r',
    '\u0308',
    '\u0904',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\r',
    '\u0d4e',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\r',
    '\u0308',
    '\u0d4e',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\r',
    '\u0915',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\r',
    '\u0308',
    '\u0915',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\r',
    '\u231a',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\r',
    '\u0308',
    '\u231a',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\r',
    '\u0300',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\r',
    '\u0308\u0300',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\r',
    '\u0900',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\r',
    '\u0308\u0900',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\r',
    '\u094d',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\r',
    '\u0308\u094d',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\r',
    '\u200d',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\r',
    '\u0308\u200d',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\r',
    '\u0378',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\r',
    '\u0308',
    '\u0378',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\n',
    ' ',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] SPACE (Other) ÷ [0.3]
  [
    '\n',
    '\u0308',
    ' ',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\n',
    '\r',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\n',
    '\u0308',
    '\r',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\n',
    '\n',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\n',
    '\u0308',
    '\n',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\n',
    '\x01',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\n',
    '\u0308',
    '\x01',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\n',
    '\u200c',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\n',
    '\u0308\u200c',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\n',
    '\u{1f1e6}',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\n',
    '\u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\n',
    '\u0600',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\n',
    '\u0308',
    '\u0600',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\n',
    '\u0a03',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\n',
    '\u0308\u0a03',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\n',
    '\u1100',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\n',
    '\u0308',
    '\u1100',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\n',
    '\u1160',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\n',
    '\u0308',
    '\u1160',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\n',
    '\u11a8',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\n',
    '\u0308',
    '\u11a8',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\n',
    '\uac00',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\n',
    '\u0308',
    '\uac00',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\n',
    '\uac01',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\n',
    '\u0308',
    '\uac01',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\n',
    '\u0903',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\n',
    '\u0308\u0903',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\n',
    '\u0904',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\n',
    '\u0308',
    '\u0904',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\n',
    '\u0d4e',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\n',
    '\u0308',
    '\u0d4e',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\n',
    '\u0915',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\n',
    '\u0308',
    '\u0915',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\n',
    '\u231a',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\n',
    '\u0308',
    '\u231a',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\n',
    '\u0300',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\n',
    '\u0308\u0300',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\n',
    '\u0900',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\n',
    '\u0308\u0900',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\n',
    '\u094d',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\n',
    '\u0308\u094d',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\n',
    '\u200d',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\n',
    '\u0308\u200d',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\n',
    '\u0378',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\n',
    '\u0308',
    '\u0378',
  ], // ÷ [0.2] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\x01',
    ' ',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] SPACE (Other) ÷ [0.3]
  [
    '\x01',
    '\u0308',
    ' ',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\x01',
    '\r',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\x01',
    '\u0308',
    '\r',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\x01',
    '\n',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\x01',
    '\u0308',
    '\n',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\x01',
    '\x01',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\x01',
    '\u0308',
    '\x01',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\x01',
    '\u200c',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\x01',
    '\u0308\u200c',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\x01',
    '\u{1f1e6}',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\x01',
    '\u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\x01',
    '\u0600',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\x01',
    '\u0308',
    '\u0600',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\x01',
    '\u0a03',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\x01',
    '\u0308\u0a03',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\x01',
    '\u1100',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\x01',
    '\u0308',
    '\u1100',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\x01',
    '\u1160',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\x01',
    '\u0308',
    '\u1160',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\x01',
    '\u11a8',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\x01',
    '\u0308',
    '\u11a8',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\x01',
    '\uac00',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\x01',
    '\u0308',
    '\uac00',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\x01',
    '\uac01',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\x01',
    '\u0308',
    '\uac01',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\x01',
    '\u0903',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\x01',
    '\u0308\u0903',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\x01',
    '\u0904',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\x01',
    '\u0308',
    '\u0904',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\x01',
    '\u0d4e',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\x01',
    '\u0308',
    '\u0d4e',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\x01',
    '\u0915',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\x01',
    '\u0308',
    '\u0915',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\x01',
    '\u231a',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\x01',
    '\u0308',
    '\u231a',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\x01',
    '\u0300',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\x01',
    '\u0308\u0300',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\x01',
    '\u0900',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\x01',
    '\u0308\u0900',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\x01',
    '\u094d',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\x01',
    '\u0308\u094d',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\x01',
    '\u200d',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\x01',
    '\u0308\u200d',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\x01',
    '\u0378',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\x01',
    '\u0308',
    '\u0378',
  ], // ÷ [0.2] <START OF HEADING> (Control) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u200c',
    ' ',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u200c\u0308',
    ' ',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u200c',
    '\r',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u200c\u0308',
    '\r',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u200c',
    '\n',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u200c\u0308',
    '\n',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u200c',
    '\x01',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u200c\u0308',
    '\x01',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u200c\u200c',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u200c\u0308\u200c',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u200c',
    '\u{1f1e6}',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u200c\u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u200c',
    '\u0600',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u200c\u0308',
    '\u0600',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u200c\u0a03',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u200c\u0308\u0a03',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u200c',
    '\u1100',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u200c\u0308',
    '\u1100',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u200c',
    '\u1160',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u200c\u0308',
    '\u1160',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u200c',
    '\u11a8',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u200c\u0308',
    '\u11a8',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u200c',
    '\uac00',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u200c\u0308',
    '\uac00',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u200c',
    '\uac01',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u200c\u0308',
    '\uac01',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u200c\u0903',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u200c\u0308\u0903',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u200c',
    '\u0904',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u200c\u0308',
    '\u0904',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u200c',
    '\u0d4e',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u200c\u0308',
    '\u0d4e',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u200c',
    '\u0915',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u200c\u0308',
    '\u0915',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u200c',
    '\u231a',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u200c\u0308',
    '\u231a',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u200c\u0300',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u200c\u0308\u0300',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u200c\u0900',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u200c\u0308\u0900',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u200c\u094d',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u200c\u0308\u094d',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u200c\u200d',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u200c\u0308\u200d',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u200c',
    '\u0378',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u200c\u0308',
    '\u0378',
  ], // ÷ [0.2] ZERO WIDTH NON-JOINER (Extend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u{1f1e6}',
    ' ',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u{1f1e6}\u0308',
    ' ',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u{1f1e6}',
    '\r',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u{1f1e6}\u0308',
    '\r',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u{1f1e6}',
    '\n',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u{1f1e6}\u0308',
    '\n',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u{1f1e6}',
    '\x01',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u{1f1e6}\u0308',
    '\x01',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u{1f1e6}\u200c',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u{1f1e6}\u0308\u200c',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u{1f1e6}\u{1f1e6}',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [12.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u{1f1e6}\u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u{1f1e6}',
    '\u0600',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u{1f1e6}\u0308',
    '\u0600',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u{1f1e6}\u0a03',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u{1f1e6}\u0308\u0a03',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u{1f1e6}',
    '\u1100',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u{1f1e6}\u0308',
    '\u1100',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u{1f1e6}',
    '\u1160',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u{1f1e6}\u0308',
    '\u1160',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u{1f1e6}',
    '\u11a8',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u{1f1e6}\u0308',
    '\u11a8',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u{1f1e6}',
    '\uac00',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u{1f1e6}\u0308',
    '\uac00',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u{1f1e6}',
    '\uac01',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u{1f1e6}\u0308',
    '\uac01',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u{1f1e6}\u0903',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u{1f1e6}\u0308\u0903',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u{1f1e6}',
    '\u0904',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u{1f1e6}\u0308',
    '\u0904',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u{1f1e6}',
    '\u0d4e',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u{1f1e6}\u0308',
    '\u0d4e',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u{1f1e6}',
    '\u0915',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u{1f1e6}\u0308',
    '\u0915',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u{1f1e6}',
    '\u231a',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u{1f1e6}\u0308',
    '\u231a',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u{1f1e6}\u0300',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u{1f1e6}\u0308\u0300',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u{1f1e6}\u0900',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u{1f1e6}\u0308\u0900',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u{1f1e6}\u094d',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u{1f1e6}\u0308\u094d',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u{1f1e6}\u200d',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u{1f1e6}\u0308\u200d',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u{1f1e6}',
    '\u0378',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u{1f1e6}\u0308',
    '\u0378',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u0600 ',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] SPACE (Other) ÷ [0.3]
  [
    '\u0600\u0308',
    ' ',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u0600',
    '\r',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u0600\u0308',
    '\r',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u0600',
    '\n',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u0600\u0308',
    '\n',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u0600',
    '\x01',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u0600\u0308',
    '\x01',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u0600\u200c',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u0600\u0308\u200c',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u0600\u{1f1e6}',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u0600\u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u0600\u0600',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u0600\u0308',
    '\u0600',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u0600\u0a03',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u0600\u0308\u0a03',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u0600\u1100',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u0600\u0308',
    '\u1100',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u0600\u1160',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u0600\u0308',
    '\u1160',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u0600\u11a8',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u0600\u0308',
    '\u11a8',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u0600\uac00',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u0600\u0308',
    '\uac00',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u0600\uac01',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u0600\u0308',
    '\uac01',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u0600\u0903',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0600\u0308\u0903',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0600\u0904',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0600\u0308',
    '\u0904',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0600\u0d4e',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0600\u0308',
    '\u0d4e',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0600\u0915',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0600\u0308',
    '\u0915',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0600\u231a',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] WATCH (ExtPict) ÷ [0.3]
  [
    '\u0600\u0308',
    '\u231a',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u0600\u0300',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u0600\u0308\u0300',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u0600\u0900',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u0600\u0308\u0900',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u0600\u094d',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u0600\u0308\u094d',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u0600\u200d',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u0600\u0308\u200d',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u0600\u0378',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.2] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u0600\u0308',
    '\u0378',
  ], // ÷ [0.2] ARABIC NUMBER SIGN (Prepend) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u0a03',
    ' ',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u0a03\u0308',
    ' ',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u0a03',
    '\r',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u0a03\u0308',
    '\r',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u0a03',
    '\n',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u0a03\u0308',
    '\n',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u0a03',
    '\x01',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u0a03\u0308',
    '\x01',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u0a03\u200c',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u0a03\u0308\u200c',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u0a03',
    '\u{1f1e6}',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u0a03\u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u0a03',
    '\u0600',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u0a03\u0308',
    '\u0600',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u0a03\u0a03',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u0a03\u0308\u0a03',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u0a03',
    '\u1100',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u0a03\u0308',
    '\u1100',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u0a03',
    '\u1160',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u0a03\u0308',
    '\u1160',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u0a03',
    '\u11a8',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u0a03\u0308',
    '\u11a8',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u0a03',
    '\uac00',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u0a03\u0308',
    '\uac00',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u0a03',
    '\uac01',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u0a03\u0308',
    '\uac01',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u0a03\u0903',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0a03\u0308\u0903',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0a03',
    '\u0904',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0a03\u0308',
    '\u0904',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0a03',
    '\u0d4e',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0a03\u0308',
    '\u0d4e',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0a03',
    '\u0915',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0a03\u0308',
    '\u0915',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0a03',
    '\u231a',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u0a03\u0308',
    '\u231a',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u0a03\u0300',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u0a03\u0308\u0300',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u0a03\u0900',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u0a03\u0308\u0900',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u0a03\u094d',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u0a03\u0308\u094d',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u0a03\u200d',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u0a03\u0308\u200d',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u0a03',
    '\u0378',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u0a03\u0308',
    '\u0378',
  ], // ÷ [0.2] GURMUKHI SIGN VISARGA (SpacingMark) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u1100',
    ' ',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u1100\u0308',
    ' ',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u1100',
    '\r',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u1100\u0308',
    '\r',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u1100',
    '\n',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u1100\u0308',
    '\n',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u1100',
    '\x01',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u1100\u0308',
    '\x01',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u1100\u200c',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u1100\u0308\u200c',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u1100',
    '\u{1f1e6}',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u1100\u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u1100',
    '\u0600',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u1100\u0308',
    '\u0600',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u1100\u0a03',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u1100\u0308\u0a03',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u1100\u1100',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [6.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u1100\u0308',
    '\u1100',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u1100\u1160',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [6.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u1100\u0308',
    '\u1160',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u1100',
    '\u11a8',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u1100\u0308',
    '\u11a8',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u1100\uac00',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [6.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u1100\u0308',
    '\uac00',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u1100\uac01',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [6.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u1100\u0308',
    '\uac01',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u1100\u0903',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u1100\u0308\u0903',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u1100',
    '\u0904',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u1100\u0308',
    '\u0904',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u1100',
    '\u0d4e',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u1100\u0308',
    '\u0d4e',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u1100',
    '\u0915',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u1100\u0308',
    '\u0915',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u1100',
    '\u231a',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u1100\u0308',
    '\u231a',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u1100\u0300',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u1100\u0308\u0300',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u1100\u0900',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u1100\u0308\u0900',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u1100\u094d',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u1100\u0308\u094d',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u1100\u200d',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u1100\u0308\u200d',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u1100',
    '\u0378',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u1100\u0308',
    '\u0378',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u1160',
    ' ',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u1160\u0308',
    ' ',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u1160',
    '\r',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u1160\u0308',
    '\r',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u1160',
    '\n',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u1160\u0308',
    '\n',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u1160',
    '\x01',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u1160\u0308',
    '\x01',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u1160\u200c',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u1160\u0308\u200c',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u1160',
    '\u{1f1e6}',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u1160\u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u1160',
    '\u0600',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u1160\u0308',
    '\u0600',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u1160\u0a03',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u1160\u0308\u0a03',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u1160',
    '\u1100',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u1160\u0308',
    '\u1100',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u1160\u1160',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [7.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u1160\u0308',
    '\u1160',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u1160\u11a8',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [7.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u1160\u0308',
    '\u11a8',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u1160',
    '\uac00',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u1160\u0308',
    '\uac00',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u1160',
    '\uac01',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u1160\u0308',
    '\uac01',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u1160\u0903',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u1160\u0308\u0903',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u1160',
    '\u0904',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u1160\u0308',
    '\u0904',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u1160',
    '\u0d4e',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u1160\u0308',
    '\u0d4e',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u1160',
    '\u0915',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u1160\u0308',
    '\u0915',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u1160',
    '\u231a',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u1160\u0308',
    '\u231a',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u1160\u0300',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u1160\u0308\u0300',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u1160\u0900',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u1160\u0308\u0900',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u1160\u094d',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u1160\u0308\u094d',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u1160\u200d',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u1160\u0308\u200d',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u1160',
    '\u0378',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u1160\u0308',
    '\u0378',
  ], // ÷ [0.2] HANGUL JUNGSEONG FILLER (V) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u11a8',
    ' ',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u11a8\u0308',
    ' ',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u11a8',
    '\r',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u11a8\u0308',
    '\r',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u11a8',
    '\n',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u11a8\u0308',
    '\n',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u11a8',
    '\x01',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u11a8\u0308',
    '\x01',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u11a8\u200c',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u11a8\u0308\u200c',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u11a8',
    '\u{1f1e6}',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u11a8\u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u11a8',
    '\u0600',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u11a8\u0308',
    '\u0600',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u11a8\u0a03',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u11a8\u0308\u0a03',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u11a8',
    '\u1100',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u11a8\u0308',
    '\u1100',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u11a8',
    '\u1160',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u11a8\u0308',
    '\u1160',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u11a8\u11a8',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [8.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u11a8\u0308',
    '\u11a8',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u11a8',
    '\uac00',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u11a8\u0308',
    '\uac00',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u11a8',
    '\uac01',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u11a8\u0308',
    '\uac01',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u11a8\u0903',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u11a8\u0308\u0903',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u11a8',
    '\u0904',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u11a8\u0308',
    '\u0904',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u11a8',
    '\u0d4e',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u11a8\u0308',
    '\u0d4e',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u11a8',
    '\u0915',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u11a8\u0308',
    '\u0915',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u11a8',
    '\u231a',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u11a8\u0308',
    '\u231a',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u11a8\u0300',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u11a8\u0308\u0300',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u11a8\u0900',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u11a8\u0308\u0900',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u11a8\u094d',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u11a8\u0308\u094d',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u11a8\u200d',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u11a8\u0308\u200d',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u11a8',
    '\u0378',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u11a8\u0308',
    '\u0378',
  ], // ÷ [0.2] HANGUL JONGSEONG KIYEOK (T) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\uac00',
    ' ',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\uac00\u0308',
    ' ',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\uac00',
    '\r',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\uac00\u0308',
    '\r',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\uac00',
    '\n',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\uac00\u0308',
    '\n',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\uac00',
    '\x01',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\uac00\u0308',
    '\x01',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\uac00\u200c',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\uac00\u0308\u200c',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\uac00',
    '\u{1f1e6}',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\uac00\u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\uac00',
    '\u0600',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\uac00\u0308',
    '\u0600',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\uac00\u0a03',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\uac00\u0308\u0a03',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\uac00',
    '\u1100',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\uac00\u0308',
    '\u1100',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\uac00\u1160',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [7.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\uac00\u0308',
    '\u1160',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\uac00\u11a8',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [7.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\uac00\u0308',
    '\u11a8',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\uac00',
    '\uac00',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\uac00\u0308',
    '\uac00',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\uac00',
    '\uac01',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\uac00\u0308',
    '\uac01',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\uac00\u0903',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\uac00\u0308\u0903',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\uac00',
    '\u0904',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\uac00\u0308',
    '\u0904',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\uac00',
    '\u0d4e',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\uac00\u0308',
    '\u0d4e',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\uac00',
    '\u0915',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\uac00\u0308',
    '\u0915',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\uac00',
    '\u231a',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\uac00\u0308',
    '\u231a',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\uac00\u0300',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\uac00\u0308\u0300',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\uac00\u0900',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\uac00\u0308\u0900',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\uac00\u094d',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\uac00\u0308\u094d',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\uac00\u200d',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\uac00\u0308\u200d',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\uac00',
    '\u0378',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\uac00\u0308',
    '\u0378',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\uac01',
    ' ',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\uac01\u0308',
    ' ',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\uac01',
    '\r',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\uac01\u0308',
    '\r',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\uac01',
    '\n',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\uac01\u0308',
    '\n',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\uac01',
    '\x01',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\uac01\u0308',
    '\x01',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\uac01\u200c',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\uac01\u0308\u200c',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\uac01',
    '\u{1f1e6}',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\uac01\u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\uac01',
    '\u0600',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\uac01\u0308',
    '\u0600',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\uac01\u0a03',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\uac01\u0308\u0a03',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\uac01',
    '\u1100',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\uac01\u0308',
    '\u1100',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\uac01',
    '\u1160',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\uac01\u0308',
    '\u1160',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\uac01\u11a8',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [8.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\uac01\u0308',
    '\u11a8',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\uac01',
    '\uac00',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\uac01\u0308',
    '\uac00',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\uac01',
    '\uac01',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\uac01\u0308',
    '\uac01',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\uac01\u0903',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\uac01\u0308\u0903',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\uac01',
    '\u0904',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\uac01\u0308',
    '\u0904',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\uac01',
    '\u0d4e',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\uac01\u0308',
    '\u0d4e',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\uac01',
    '\u0915',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\uac01\u0308',
    '\u0915',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\uac01',
    '\u231a',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\uac01\u0308',
    '\u231a',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\uac01\u0300',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\uac01\u0308\u0300',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\uac01\u0900',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\uac01\u0308\u0900',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\uac01\u094d',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\uac01\u0308\u094d',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\uac01\u200d',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\uac01\u0308\u200d',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\uac01',
    '\u0378',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\uac01\u0308',
    '\u0378',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u0903',
    ' ',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u0903\u0308',
    ' ',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u0903',
    '\r',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u0903\u0308',
    '\r',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u0903',
    '\n',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u0903\u0308',
    '\n',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u0903',
    '\x01',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u0903\u0308',
    '\x01',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u0903\u200c',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u0903\u0308\u200c',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u0903',
    '\u{1f1e6}',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u0903\u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u0903',
    '\u0600',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u0903\u0308',
    '\u0600',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u0903\u0a03',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u0903\u0308\u0a03',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u0903',
    '\u1100',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u0903\u0308',
    '\u1100',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u0903',
    '\u1160',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u0903\u0308',
    '\u1160',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u0903',
    '\u11a8',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u0903\u0308',
    '\u11a8',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u0903',
    '\uac00',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u0903\u0308',
    '\uac00',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u0903',
    '\uac01',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u0903\u0308',
    '\uac01',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u0903\u0903',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0903\u0308\u0903',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0903',
    '\u0904',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0903\u0308',
    '\u0904',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0903',
    '\u0d4e',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0903\u0308',
    '\u0d4e',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0903',
    '\u0915',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0903\u0308',
    '\u0915',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0903',
    '\u231a',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u0903\u0308',
    '\u231a',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u0903\u0300',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u0903\u0308\u0300',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u0903\u0900',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u0903\u0308\u0900',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u0903\u094d',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u0903\u0308\u094d',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u0903\u200d',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u0903\u0308\u200d',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u0903',
    '\u0378',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u0903\u0308',
    '\u0378',
  ], // ÷ [0.2] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u0904',
    ' ',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u0904\u0308',
    ' ',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u0904',
    '\r',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u0904\u0308',
    '\r',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u0904',
    '\n',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u0904\u0308',
    '\n',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u0904',
    '\x01',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u0904\u0308',
    '\x01',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u0904\u200c',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u0904\u0308\u200c',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u0904',
    '\u{1f1e6}',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u0904\u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u0904',
    '\u0600',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u0904\u0308',
    '\u0600',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u0904\u0a03',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u0904\u0308\u0a03',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u0904',
    '\u1100',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u0904\u0308',
    '\u1100',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u0904',
    '\u1160',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u0904\u0308',
    '\u1160',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u0904',
    '\u11a8',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u0904\u0308',
    '\u11a8',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u0904',
    '\uac00',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u0904\u0308',
    '\uac00',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u0904',
    '\uac01',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u0904\u0308',
    '\uac01',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u0904\u0903',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0904\u0308\u0903',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0904',
    '\u0904',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0904\u0308',
    '\u0904',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0904',
    '\u0d4e',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0904\u0308',
    '\u0d4e',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0904',
    '\u0915',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0904\u0308',
    '\u0915',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0904',
    '\u231a',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u0904\u0308',
    '\u231a',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u0904\u0300',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u0904\u0308\u0300',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u0904\u0900',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u0904\u0308\u0900',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u0904\u094d',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u0904\u0308\u094d',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u0904\u200d',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u0904\u0308\u200d',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u0904',
    '\u0378',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u0904\u0308',
    '\u0378',
  ], // ÷ [0.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u0d4e ',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.2] SPACE (Other) ÷ [0.3]
  [
    '\u0d4e\u0308',
    ' ',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u0d4e',
    '\r',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u0d4e\u0308',
    '\r',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u0d4e',
    '\n',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u0d4e\u0308',
    '\n',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u0d4e',
    '\x01',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u0d4e\u0308',
    '\x01',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u0d4e\u200c',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u0d4e\u0308\u200c',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u0d4e\u{1f1e6}',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u0d4e\u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u0d4e\u0600',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.2] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u0d4e\u0308',
    '\u0600',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u0d4e\u0a03',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u0d4e\u0308\u0a03',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u0d4e\u1100',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.2] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u0d4e\u0308',
    '\u1100',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u0d4e\u1160',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.2] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u0d4e\u0308',
    '\u1160',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u0d4e\u11a8',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.2] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u0d4e\u0308',
    '\u11a8',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u0d4e\uac00',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.2] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u0d4e\u0308',
    '\uac00',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u0d4e\uac01',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.2] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u0d4e\u0308',
    '\uac01',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u0d4e\u0903',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0d4e\u0308\u0903',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0d4e\u0904',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.2] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0d4e\u0308',
    '\u0904',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0d4e\u0d4e',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0d4e\u0308',
    '\u0d4e',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0d4e\u0915',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0d4e\u0308',
    '\u0915',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0d4e\u231a',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.2] WATCH (ExtPict) ÷ [0.3]
  [
    '\u0d4e\u0308',
    '\u231a',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u0d4e\u0300',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u0d4e\u0308\u0300',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u0d4e\u0900',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u0d4e\u0308\u0900',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u0d4e\u094d',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u0d4e\u0308\u094d',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u0d4e\u200d',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u0d4e\u0308\u200d',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u0d4e\u0378',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.2] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u0d4e\u0308',
    '\u0378',
  ], // ÷ [0.2] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u0915',
    ' ',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u0915\u0308',
    ' ',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u0915',
    '\r',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u0915\u0308',
    '\r',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u0915',
    '\n',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u0915\u0308',
    '\n',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u0915',
    '\x01',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u0915\u0308',
    '\x01',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u0915\u200c',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u0915\u0308\u200c',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u0915',
    '\u{1f1e6}',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u0915\u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u0915',
    '\u0600',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u0915\u0308',
    '\u0600',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u0915\u0a03',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u0915\u0308\u0a03',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u0915',
    '\u1100',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u0915\u0308',
    '\u1100',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u0915',
    '\u1160',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u0915\u0308',
    '\u1160',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u0915',
    '\u11a8',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u0915\u0308',
    '\u11a8',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u0915',
    '\uac00',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u0915\u0308',
    '\uac00',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u0915',
    '\uac01',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u0915\u0308',
    '\uac01',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u0915\u0903',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0915\u0308\u0903',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0915',
    '\u0904',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0915\u0308',
    '\u0904',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0915',
    '\u0d4e',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0915\u0308',
    '\u0d4e',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0915',
    '\u0915',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0915\u0308',
    '\u0915',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0915',
    '\u231a',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u0915\u0308',
    '\u231a',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u0915\u0300',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u0915\u0308\u0300',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u0915\u0900',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u0915\u0308\u0900',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u0915\u094d',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u0915\u0308\u094d',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u0915\u200d',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u0915\u0308\u200d',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u0915',
    '\u0378',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u0915\u0308',
    '\u0378',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u231a',
    ' ',
  ], // ÷ [0.2] WATCH (ExtPict) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u231a\u0308',
    ' ',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u231a',
    '\r',
  ], // ÷ [0.2] WATCH (ExtPict) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u231a\u0308',
    '\r',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u231a',
    '\n',
  ], // ÷ [0.2] WATCH (ExtPict) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u231a\u0308',
    '\n',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u231a',
    '\x01',
  ], // ÷ [0.2] WATCH (ExtPict) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u231a\u0308',
    '\x01',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u231a\u200c',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u231a\u0308\u200c',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u231a',
    '\u{1f1e6}',
  ], // ÷ [0.2] WATCH (ExtPict) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u231a\u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u231a',
    '\u0600',
  ], // ÷ [0.2] WATCH (ExtPict) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u231a\u0308',
    '\u0600',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u231a\u0a03',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u231a\u0308\u0a03',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u231a',
    '\u1100',
  ], // ÷ [0.2] WATCH (ExtPict) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u231a\u0308',
    '\u1100',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u231a',
    '\u1160',
  ], // ÷ [0.2] WATCH (ExtPict) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u231a\u0308',
    '\u1160',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u231a',
    '\u11a8',
  ], // ÷ [0.2] WATCH (ExtPict) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u231a\u0308',
    '\u11a8',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u231a',
    '\uac00',
  ], // ÷ [0.2] WATCH (ExtPict) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u231a\u0308',
    '\uac00',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u231a',
    '\uac01',
  ], // ÷ [0.2] WATCH (ExtPict) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u231a\u0308',
    '\uac01',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u231a\u0903',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u231a\u0308\u0903',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u231a',
    '\u0904',
  ], // ÷ [0.2] WATCH (ExtPict) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u231a\u0308',
    '\u0904',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u231a',
    '\u0d4e',
  ], // ÷ [0.2] WATCH (ExtPict) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u231a\u0308',
    '\u0d4e',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u231a',
    '\u0915',
  ], // ÷ [0.2] WATCH (ExtPict) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u231a\u0308',
    '\u0915',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u231a',
    '\u231a',
  ], // ÷ [0.2] WATCH (ExtPict) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u231a\u0308',
    '\u231a',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u231a\u0300',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u231a\u0308\u0300',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u231a\u0900',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u231a\u0308\u0900',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u231a\u094d',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u231a\u0308\u094d',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u231a\u200d',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u231a\u0308\u200d',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u231a',
    '\u0378',
  ], // ÷ [0.2] WATCH (ExtPict) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u231a\u0308',
    '\u0378',
  ], // ÷ [0.2] WATCH (ExtPict) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u0300',
    ' ',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u0300\u0308',
    ' ',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u0300',
    '\r',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u0300\u0308',
    '\r',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u0300',
    '\n',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u0300\u0308',
    '\n',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u0300',
    '\x01',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u0300\u0308',
    '\x01',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u0300\u200c',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u0300\u0308\u200c',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u0300',
    '\u{1f1e6}',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u0300\u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u0300',
    '\u0600',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u0300\u0308',
    '\u0600',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u0300\u0a03',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u0300\u0308\u0a03',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u0300',
    '\u1100',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u0300\u0308',
    '\u1100',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u0300',
    '\u1160',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u0300\u0308',
    '\u1160',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u0300',
    '\u11a8',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u0300\u0308',
    '\u11a8',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u0300',
    '\uac00',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u0300\u0308',
    '\uac00',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u0300',
    '\uac01',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u0300\u0308',
    '\uac01',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u0300\u0903',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0300\u0308\u0903',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0300',
    '\u0904',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0300\u0308',
    '\u0904',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0300',
    '\u0d4e',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0300\u0308',
    '\u0d4e',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0300',
    '\u0915',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0300\u0308',
    '\u0915',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0300',
    '\u231a',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u0300\u0308',
    '\u231a',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u0300\u0300',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u0300\u0308\u0300',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u0300\u0900',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u0300\u0308\u0900',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u0300\u094d',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u0300\u0308\u094d',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u0300\u200d',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u0300\u0308\u200d',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u0300',
    '\u0378',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u0300\u0308',
    '\u0378',
  ], // ÷ [0.2] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u0900',
    ' ',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u0900\u0308',
    ' ',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u0900',
    '\r',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u0900\u0308',
    '\r',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u0900',
    '\n',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u0900\u0308',
    '\n',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u0900',
    '\x01',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u0900\u0308',
    '\x01',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u0900\u200c',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u0900\u0308\u200c',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u0900',
    '\u{1f1e6}',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u0900\u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u0900',
    '\u0600',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u0900\u0308',
    '\u0600',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u0900\u0a03',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u0900\u0308\u0a03',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u0900',
    '\u1100',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u0900\u0308',
    '\u1100',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u0900',
    '\u1160',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u0900\u0308',
    '\u1160',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u0900',
    '\u11a8',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u0900\u0308',
    '\u11a8',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u0900',
    '\uac00',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u0900\u0308',
    '\uac00',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u0900',
    '\uac01',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u0900\u0308',
    '\uac01',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u0900\u0903',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0900\u0308\u0903',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0900',
    '\u0904',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0900\u0308',
    '\u0904',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0900',
    '\u0d4e',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0900\u0308',
    '\u0d4e',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0900',
    '\u0915',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0900\u0308',
    '\u0915',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0900',
    '\u231a',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u0900\u0308',
    '\u231a',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u0900\u0300',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u0900\u0308\u0300',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u0900\u0900',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u0900\u0308\u0900',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u0900\u094d',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u0900\u0308\u094d',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u0900\u200d',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u0900\u0308\u200d',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u0900',
    '\u0378',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u0900\u0308',
    '\u0378',
  ], // ÷ [0.2] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u094d',
    ' ',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u094d\u0308',
    ' ',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u094d',
    '\r',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u094d\u0308',
    '\r',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u094d',
    '\n',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u094d\u0308',
    '\n',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u094d',
    '\x01',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u094d\u0308',
    '\x01',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u094d\u200c',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u094d\u0308\u200c',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u094d',
    '\u{1f1e6}',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u094d\u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u094d',
    '\u0600',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u094d\u0308',
    '\u0600',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u094d\u0a03',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u094d\u0308\u0a03',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u094d',
    '\u1100',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u094d\u0308',
    '\u1100',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u094d',
    '\u1160',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u094d\u0308',
    '\u1160',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u094d',
    '\u11a8',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u094d\u0308',
    '\u11a8',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u094d',
    '\uac00',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u094d\u0308',
    '\uac00',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u094d',
    '\uac01',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u094d\u0308',
    '\uac01',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u094d\u0903',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u094d\u0308\u0903',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u094d',
    '\u0904',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u094d\u0308',
    '\u0904',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u094d',
    '\u0d4e',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u094d\u0308',
    '\u0d4e',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u094d',
    '\u0915',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u094d\u0308',
    '\u0915',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u094d',
    '\u231a',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u094d\u0308',
    '\u231a',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u094d\u0300',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u094d\u0308\u0300',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u094d\u0900',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u094d\u0308\u0900',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u094d\u094d',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u094d\u0308\u094d',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u094d\u200d',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u094d\u0308\u200d',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u094d',
    '\u0378',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u094d\u0308',
    '\u0378',
  ], // ÷ [0.2] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u200d',
    ' ',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u200d\u0308',
    ' ',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u200d',
    '\r',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u200d\u0308',
    '\r',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u200d',
    '\n',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u200d\u0308',
    '\n',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u200d',
    '\x01',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u200d\u0308',
    '\x01',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u200d\u200c',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u200d\u0308\u200c',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u200d',
    '\u{1f1e6}',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u200d\u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u200d',
    '\u0600',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u200d\u0308',
    '\u0600',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u200d\u0a03',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u200d\u0308\u0a03',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u200d',
    '\u1100',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u200d\u0308',
    '\u1100',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u200d',
    '\u1160',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u200d\u0308',
    '\u1160',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u200d',
    '\u11a8',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u200d\u0308',
    '\u11a8',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u200d',
    '\uac00',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u200d\u0308',
    '\uac00',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u200d',
    '\uac01',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u200d\u0308',
    '\uac01',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u200d\u0903',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u200d\u0308\u0903',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u200d',
    '\u0904',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u200d\u0308',
    '\u0904',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u200d',
    '\u0d4e',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u200d\u0308',
    '\u0d4e',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u200d',
    '\u0915',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u200d\u0308',
    '\u0915',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u200d',
    '\u231a',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u200d\u0308',
    '\u231a',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u200d\u0300',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u200d\u0308\u0300',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u200d\u0900',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u200d\u0308\u0900',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u200d\u094d',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u200d\u0308\u094d',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u200d\u200d',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u200d\u0308\u200d',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u200d',
    '\u0378',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u200d\u0308',
    '\u0378',
  ], // ÷ [0.2] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u0378',
    ' ',
  ], // ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u0378\u0308',
    ' ',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u0378',
    '\r',
  ], // ÷ [0.2] <reserved-0378> (Other) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u0378\u0308',
    '\r',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <CARRIAGE RETURN (CR)> (CR) ÷ [0.3]
  [
    '\u0378',
    '\n',
  ], // ÷ [0.2] <reserved-0378> (Other) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u0378\u0308',
    '\n',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [0.3]
  [
    '\u0378',
    '\x01',
  ], // ÷ [0.2] <reserved-0378> (Other) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u0378\u0308',
    '\x01',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [5.0] <START OF HEADING> (Control) ÷ [0.3]
  [
    '\u0378\u200c',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u0378\u0308\u200c',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH NON-JOINER (Extend) ÷ [0.3]
  [
    '\u0378',
    '\u{1f1e6}',
  ], // ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u0378\u0308',
    '\u{1f1e6}',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) ÷ [0.3]
  [
    '\u0378',
    '\u0600',
  ], // ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u0378\u0308',
    '\u0600',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) ÷ [0.3]
  [
    '\u0378\u0a03',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u0378\u0308\u0a03',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] GURMUKHI SIGN VISARGA (SpacingMark) ÷ [0.3]
  [
    '\u0378',
    '\u1100',
  ], // ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u0378\u0308',
    '\u1100',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u0378',
    '\u1160',
  ], // ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u0378\u0308',
    '\u1160',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JUNGSEONG FILLER (V) ÷ [0.3]
  [
    '\u0378',
    '\u11a8',
  ], // ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u0378\u0308',
    '\u11a8',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL JONGSEONG KIYEOK (T) ÷ [0.3]
  [
    '\u0378',
    '\uac00',
  ], // ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u0378\u0308',
    '\uac00',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GA (LV) ÷ [0.3]
  [
    '\u0378',
    '\uac01',
  ], // ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u0378\u0308',
    '\uac01',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] HANGUL SYLLABLE GAG (LVT) ÷ [0.3]
  [
    '\u0378\u0903',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0378\u0308\u0903',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0378',
    '\u0904',
  ], // ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0378\u0308',
    '\u0904',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER SHORT A (ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0378',
    '\u0d4e',
  ], // ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0378\u0308',
    '\u0d4e',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] MALAYALAM LETTER DOT REPH (Prepend_ConjunctLinkingScripts) ÷ [0.3]
  [
    '\u0378',
    '\u0915',
  ], // ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0378\u0308',
    '\u0915',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0378',
    '\u231a',
  ], // ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u0378\u0308',
    '\u231a',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] WATCH (ExtPict) ÷ [0.3]
  [
    '\u0378\u0300',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u0378\u0308\u0300',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] COMBINING GRAVE ACCENT (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u0378\u0900',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u0378\u0308\u0900',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN INVERTED CANDRABINDU (Extend_ConjunctLinkingScripts_ExtCccZwj) ÷ [0.3]
  [
    '\u0378\u094d',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u0378\u0308\u094d',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [0.3]
  [
    '\u0378\u200d',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u0378\u0308\u200d',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    '\u0378',
    '\u0378',
  ], // ÷ [0.2] <reserved-0378> (Other) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\u0378\u0308',
    '\u0378',
  ], // ÷ [0.2] <reserved-0378> (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] <reserved-0378> (Other) ÷ [0.3]
  [
    '\r\n',
    'a',
    '\n',
    '\u0308',
  ], // ÷ [0.2] <CARRIAGE RETURN (CR)> (CR) × [3.0] <LINE FEED (LF)> (LF) ÷ [4.0] LATIN SMALL LETTER A (Other) ÷ [5.0] <LINE FEED (LF)> (LF) ÷ [4.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [0.3]
  [
    'a\u0308',
  ], // ÷ [0.2] LATIN SMALL LETTER A (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [0.3]
  [
    ' \u200d',
    '\u0646',
  ], // ÷ [0.2] SPACE (Other) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] ARABIC LETTER NOON (Other) ÷ [0.3]
  [
    '\u0646\u200d',
    ' ',
  ], // ÷ [0.2] ARABIC LETTER NOON (Other) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] SPACE (Other) ÷ [0.3]
  [
    '\u1100\u1100',
  ], // ÷ [0.2] HANGUL CHOSEONG KIYEOK (L) × [6.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\uac00\u11a8',
    '\u1100',
  ], // ÷ [0.2] HANGUL SYLLABLE GA (LV) × [7.0] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\uac01\u11a8',
    '\u1100',
  ], // ÷ [0.2] HANGUL SYLLABLE GAG (LVT) × [8.0] HANGUL JONGSEONG KIYEOK (T) ÷ [999.0] HANGUL CHOSEONG KIYEOK (L) ÷ [0.3]
  [
    '\u{1f1e6}\u{1f1e7}',
    '\u{1f1e8}',
    'b',
  ], // ÷ [0.2] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [12.0] REGIONAL INDICATOR SYMBOL LETTER B (RI) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER C (RI) ÷ [999.0] LATIN SMALL LETTER B (Other) ÷ [0.3]
  [
    'a',
    '\u{1f1e6}\u{1f1e7}',
    '\u{1f1e8}',
    'b',
  ], // ÷ [0.2] LATIN SMALL LETTER A (Other) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [13.0] REGIONAL INDICATOR SYMBOL LETTER B (RI) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER C (RI) ÷ [999.0] LATIN SMALL LETTER B (Other) ÷ [0.3]
  [
    'a',
    '\u{1f1e6}\u{1f1e7}\u200d',
    '\u{1f1e8}',
    'b',
  ], // ÷ [0.2] LATIN SMALL LETTER A (Other) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [13.0] REGIONAL INDICATOR SYMBOL LETTER B (RI) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER C (RI) ÷ [999.0] LATIN SMALL LETTER B (Other) ÷ [0.3]
  [
    'a',
    '\u{1f1e6}\u200d',
    '\u{1f1e7}\u{1f1e8}',
    'b',
  ], // ÷ [0.2] LATIN SMALL LETTER A (Other) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER B (RI) × [13.0] REGIONAL INDICATOR SYMBOL LETTER C (RI) ÷ [999.0] LATIN SMALL LETTER B (Other) ÷ [0.3]
  [
    'a',
    '\u{1f1e6}\u{1f1e7}',
    '\u{1f1e8}\u{1f1e9}',
    'b',
  ], // ÷ [0.2] LATIN SMALL LETTER A (Other) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER A (RI) × [13.0] REGIONAL INDICATOR SYMBOL LETTER B (RI) ÷ [999.0] REGIONAL INDICATOR SYMBOL LETTER C (RI) × [13.0] REGIONAL INDICATOR SYMBOL LETTER D (RI) ÷ [999.0] LATIN SMALL LETTER B (Other) ÷ [0.3]
  [
    'a\u200d',
  ], // ÷ [0.2] LATIN SMALL LETTER A (Other) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [0.3]
  [
    'a\u0308',
    'b',
  ], // ÷ [0.2] LATIN SMALL LETTER A (Other) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) ÷ [999.0] LATIN SMALL LETTER B (Other) ÷ [0.3]
  [
    'a\u0903',
    'b',
  ], // ÷ [0.2] LATIN SMALL LETTER A (Other) × [9.1] DEVANAGARI SIGN VISARGA (SpacingMark_ConjunctLinkingScripts) ÷ [999.0] LATIN SMALL LETTER B (Other) ÷ [0.3]
  [
    'a',
    '\u0600b',
  ], // ÷ [0.2] LATIN SMALL LETTER A (Other) ÷ [999.0] ARABIC NUMBER SIGN (Prepend) × [9.2] LATIN SMALL LETTER B (Other) ÷ [0.3]
  [
    '\u{1f476}\u{1f3ff}',
    '\u{1f476}',
  ], // ÷ [0.2] BABY (ExtPict) × [9.0] EMOJI MODIFIER FITZPATRICK TYPE-6 (Extend_ExtCccZwj) ÷ [999.0] BABY (ExtPict) ÷ [0.3]
  [
    'a\u{1f3ff}',
    '\u{1f476}',
  ], // ÷ [0.2] LATIN SMALL LETTER A (Other) × [9.0] EMOJI MODIFIER FITZPATRICK TYPE-6 (Extend_ExtCccZwj) ÷ [999.0] BABY (ExtPict) ÷ [0.3]
  [
    'a\u{1f3ff}',
    '\u{1f476}\u200d\u{1f6d1}',
  ], // ÷ [0.2] LATIN SMALL LETTER A (Other) × [9.0] EMOJI MODIFIER FITZPATRICK TYPE-6 (Extend_ExtCccZwj) ÷ [999.0] BABY (ExtPict) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [11.0] OCTAGONAL SIGN (ExtPict) ÷ [0.3]
  [
    '\u{1f476}\u{1f3ff}\u0308\u200d\u{1f476}\u{1f3ff}',
  ], // ÷ [0.2] BABY (ExtPict) × [9.0] EMOJI MODIFIER FITZPATRICK TYPE-6 (Extend_ExtCccZwj) × [9.0] COMBINING DIAERESIS (Extend_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [11.0] BABY (ExtPict) × [9.0] EMOJI MODIFIER FITZPATRICK TYPE-6 (Extend_ExtCccZwj) ÷ [0.3]
  [
    '\u{1f6d1}\u200d\u{1f6d1}',
  ], // ÷ [0.2] OCTAGONAL SIGN (ExtPict) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [11.0] OCTAGONAL SIGN (ExtPict) ÷ [0.3]
  [
    'a\u200d',
    '\u{1f6d1}',
  ], // ÷ [0.2] LATIN SMALL LETTER A (Other) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] OCTAGONAL SIGN (ExtPict) ÷ [0.3]
  [
    '\u2701\u200d\u2701',
  ], // ÷ [0.2] UPPER BLADE SCISSORS (Other) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [11.0] UPPER BLADE SCISSORS (Other) ÷ [0.3]
  [
    'a\u200d',
    '\u2701',
  ], // ÷ [0.2] LATIN SMALL LETTER A (Other) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) ÷ [999.0] UPPER BLADE SCISSORS (Other) ÷ [0.3]
  [
    '\u0915',
    '\u0924',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) ÷ [999.0] DEVANAGARI LETTER TA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0915\u094d\u0924',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.3] DEVANAGARI LETTER TA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0915\u094d\u094d\u0924',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.3] DEVANAGARI LETTER TA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0915\u094d\u200d\u0924',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.3] DEVANAGARI LETTER TA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0915\u093c\u200d\u094d\u0924',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] DEVANAGARI SIGN NUKTA (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.3] DEVANAGARI LETTER TA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0915\u093c\u094d\u200d\u0924',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] DEVANAGARI SIGN NUKTA (Extend_ConjunctLinkingScripts_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] ZERO WIDTH JOINER (ZWJ_ExtCccZwj) × [9.3] DEVANAGARI LETTER TA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0915\u094d\u0924\u094d\u092f',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.3] DEVANAGARI LETTER TA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.3] DEVANAGARI LETTER YA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0915\u094d',
    'a',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [999.0] LATIN SMALL LETTER A (Other) ÷ [0.3]
  [
    'a\u094d',
    '\u0924',
  ], // ÷ [0.2] LATIN SMALL LETTER A (Other) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER TA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '?\u094d',
    '\u0924',
  ], // ÷ [0.2] QUESTION MARK (Other) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) ÷ [999.0] DEVANAGARI LETTER TA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
  [
    '\u0915\u094d\u094d\u0924',
  ], // ÷ [0.2] DEVANAGARI LETTER KA (ConjunctLinkingScripts_LinkingConsonant) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.0] DEVANAGARI SIGN VIRAMA (Extend_ConjunctLinkingScripts_ConjunctLinker_ExtCccZwj) × [9.3] DEVANAGARI LETTER TA (ConjunctLinkingScripts_LinkingConsonant) ÷ [0.3]
];
// Emoji tests.
const List<List<String>> emojis = [
  [
    '#',
  ], // E0.0   [1] (#️)       hash sign
  [
    '*',
  ], // E0.0   [1] (*️)       asterisk
  [
    '©',
  ], // E0.6   [1] (©️)       copyright
  [
    '®',
  ], // E0.6   [1] (®️)       registered
  [
    '\u203c',
  ], // E0.6   [1] (‼️)       double exclamation mark
  [
    '\u2049',
  ], // E0.6   [1] (⁉️)       exclamation question mark
  [
    '\u2122',
  ], // E0.6   [1] (™️)       trade mark
  [
    '\u2139',
  ], // E0.6   [1] (ℹ️)       information
  [
    '\u2328',
  ], // E1.0   [1] (⌨️)       keyboard
  [
    '\u23cf',
  ], // E1.0   [1] (⏏️)       eject button
  [
    '\u23ef',
  ], // E1.0   [1] (⏯️)       play or pause button
  [
    '\u23f0',
  ], // E0.6   [1] (⏰)       alarm clock
  [
    '\u23f3',
  ], // E0.6   [1] (⏳)       hourglass not done
  [
    '\u24c2',
  ], // E0.6   [1] (Ⓜ️)       circled M
  [
    '\u25b6',
  ], // E0.6   [1] (▶️)       play button
  [
    '\u25c0',
  ], // E0.6   [1] (◀️)       reverse button
  [
    '\u2604',
  ], // E1.0   [1] (☄️)       comet
  [
    '\u260e',
  ], // E0.6   [1] (☎️)       telephone
  [
    '\u2611',
  ], // E0.6   [1] (☑️)       check box with check
  [
    '\u2618',
  ], // E1.0   [1] (☘️)       shamrock
  [
    '\u261d',
  ], // E0.6   [1] (☝️)       index pointing up
  [
    '\u2620',
  ], // E1.0   [1] (☠️)       skull and crossbones
  [
    '\u2626',
  ], // E1.0   [1] (☦️)       orthodox cross
  [
    '\u262a',
  ], // E0.7   [1] (☪️)       star and crescent
  [
    '\u262e',
  ], // E1.0   [1] (☮️)       peace symbol
  [
    '\u262f',
  ], // E0.7   [1] (☯️)       yin yang
  [
    '\u263a',
  ], // E0.6   [1] (☺️)       smiling face
  [
    '\u2640',
  ], // E4.0   [1] (♀️)       female sign
  [
    '\u2642',
  ], // E4.0   [1] (♂️)       male sign
  [
    '\u265f',
  ], // E11.0  [1] (♟️)       chess pawn
  [
    '\u2660',
  ], // E0.6   [1] (♠️)       spade suit
  [
    '\u2663',
  ], // E0.6   [1] (♣️)       club suit
  [
    '\u2668',
  ], // E0.6   [1] (♨️)       hot springs
  [
    '\u267b',
  ], // E0.6   [1] (♻️)       recycling symbol
  [
    '\u267e',
  ], // E11.0  [1] (♾️)       infinity
  [
    '\u267f',
  ], // E0.6   [1] (♿)       wheelchair symbol
  [
    '\u2692',
  ], // E1.0   [1] (⚒️)       hammer and pick
  [
    '\u2693',
  ], // E0.6   [1] (⚓)       anchor
  [
    '\u2694',
  ], // E1.0   [1] (⚔️)       crossed swords
  [
    '\u2695',
  ], // E4.0   [1] (⚕️)       medical symbol
  [
    '\u2699',
  ], // E1.0   [1] (⚙️)       gear
  [
    '\u26a7',
  ], // E13.0  [1] (⚧️)       transgender symbol
  [
    '\u26c8',
  ], // E0.7   [1] (⛈️)       cloud with lightning and rain
  [
    '\u26ce',
  ], // E0.6   [1] (⛎)       Ophiuchus
  [
    '\u26cf',
  ], // E0.7   [1] (⛏️)       pick
  [
    '\u26d1',
  ], // E0.7   [1] (⛑️)       rescue worker’s helmet
  [
    '\u26d3',
  ], // E0.7   [1] (⛓️)       chains
  [
    '\u26d4',
  ], // E0.6   [1] (⛔)       no entry
  [
    '\u26e9',
  ], // E0.7   [1] (⛩️)       shinto shrine
  [
    '\u26ea',
  ], // E0.6   [1] (⛪)       church
  [
    '\u26f4',
  ], // E0.7   [1] (⛴️)       ferry
  [
    '\u26f5',
  ], // E0.6   [1] (⛵)       sailboat
  [
    '\u26fa',
  ], // E0.6   [1] (⛺)       tent
  [
    '\u26fd',
  ], // E0.6   [1] (⛽)       fuel pump
  [
    '\u2702',
  ], // E0.6   [1] (✂️)       scissors
  [
    '\u2705',
  ], // E0.6   [1] (✅)       check mark button
  [
    '\u270d',
  ], // E0.7   [1] (✍️)       writing hand
  [
    '\u270f',
  ], // E0.6   [1] (✏️)       pencil
  [
    '\u2712',
  ], // E0.6   [1] (✒️)       black nib
  [
    '\u2714',
  ], // E0.6   [1] (✔️)       check mark
  [
    '\u2716',
  ], // E0.6   [1] (✖️)       multiply
  [
    '\u271d',
  ], // E0.7   [1] (✝️)       latin cross
  [
    '\u2721',
  ], // E0.7   [1] (✡️)       star of David
  [
    '\u2728',
  ], // E0.6   [1] (✨)       sparkles
  [
    '\u2744',
  ], // E0.6   [1] (❄️)       snowflake
  [
    '\u2747',
  ], // E0.6   [1] (❇️)       sparkle
  [
    '\u274c',
  ], // E0.6   [1] (❌)       cross mark
  [
    '\u274e',
  ], // E0.6   [1] (❎)       cross mark button
  [
    '\u2757',
  ], // E0.6   [1] (❗)       red exclamation mark
  [
    '\u2763',
  ], // E1.0   [1] (❣️)       heart exclamation
  [
    '\u2764',
  ], // E0.6   [1] (❤️)       red heart
  [
    '\u27a1',
  ], // E0.6   [1] (➡️)       right arrow
  [
    '\u27b0',
  ], // E0.6   [1] (➰)       curly loop
  [
    '\u27bf',
  ], // E1.0   [1] (➿)       double curly loop
  [
    '\u2b50',
  ], // E0.6   [1] (⭐)       star
  [
    '\u2b55',
  ], // E0.6   [1] (⭕)       hollow red circle
  [
    '\u3030',
  ], // E0.6   [1] (〰️)       wavy dash
  [
    '\u303d',
  ], // E0.6   [1] (〽️)       part alternation mark
  [
    '\u3297',
  ], // E0.6   [1] (㊗️)       Japanese “congratulations” button
  [
    '\u3299',
  ], // E0.6   [1] (㊙️)       Japanese “secret” button
  [
    '\u{1f004}',
  ], // E0.6   [1] (🀄)       mahjong red dragon
  [
    '\u{1f0cf}',
  ], // E0.6   [1] (🃏)       joker
  [
    '\u{1f18e}',
  ], // E0.6   [1] (🆎)       AB button (blood type)
  [
    '\u{1f21a}',
  ], // E0.6   [1] (🈚)       Japanese “free of charge” button
  [
    '\u{1f22f}',
  ], // E0.6   [1] (🈯)       Japanese “reserved” button
  [
    '\u{1f30f}',
  ], // E0.6   [1] (🌏)       globe showing Asia-Australia
  [
    '\u{1f310}',
  ], // E1.0   [1] (🌐)       globe with meridians
  [
    '\u{1f311}',
  ], // E0.6   [1] (🌑)       new moon
  [
    '\u{1f312}',
  ], // E1.0   [1] (🌒)       waxing crescent moon
  [
    '\u{1f319}',
  ], // E0.6   [1] (🌙)       crescent moon
  [
    '\u{1f31a}',
  ], // E1.0   [1] (🌚)       new moon face
  [
    '\u{1f31b}',
  ], // E0.6   [1] (🌛)       first quarter moon face
  [
    '\u{1f31c}',
  ], // E0.7   [1] (🌜)       last quarter moon face
  [
    '\u{1f321}',
  ], // E0.7   [1] (🌡️)       thermometer
  [
    '\u{1f336}',
  ], // E0.7   [1] (🌶️)       hot pepper
  [
    '\u{1f34b}',
  ], // E1.0   [1] (🍋)       lemon
  [
    '\u{1f350}',
  ], // E1.0   [1] (🍐)       pear
  [
    '\u{1f37c}',
  ], // E1.0   [1] (🍼)       baby bottle
  [
    '\u{1f37d}',
  ], // E0.7   [1] (🍽️)       fork and knife with plate
  [
    '\u{1f3c5}',
  ], // E1.0   [1] (🏅)       sports medal
  [
    '\u{1f3c6}',
  ], // E0.6   [1] (🏆)       trophy
  [
    '\u{1f3c7}',
  ], // E1.0   [1] (🏇)       horse racing
  [
    '\u{1f3c8}',
  ], // E0.6   [1] (🏈)       american football
  [
    '\u{1f3c9}',
  ], // E1.0   [1] (🏉)       rugby football
  [
    '\u{1f3ca}',
  ], // E0.6   [1] (🏊)       person swimming
  [
    '\u{1f3e4}',
  ], // E1.0   [1] (🏤)       post office
  [
    '\u{1f3f3}',
  ], // E0.7   [1] (🏳️)       white flag
  [
    '\u{1f3f4}',
  ], // E1.0   [1] (🏴)       black flag
  [
    '\u{1f3f5}',
  ], // E0.7   [1] (🏵️)       rosette
  [
    '\u{1f3f7}',
  ], // E0.7   [1] (🏷️)       label
  [
    '\u{1f408}',
  ], // E0.7   [1] (🐈)       cat
  [
    '\u{1f413}',
  ], // E1.0   [1] (🐓)       rooster
  [
    '\u{1f414}',
  ], // E0.6   [1] (🐔)       chicken
  [
    '\u{1f415}',
  ], // E0.7   [1] (🐕)       dog
  [
    '\u{1f416}',
  ], // E1.0   [1] (🐖)       pig
  [
    '\u{1f42a}',
  ], // E1.0   [1] (🐪)       camel
  [
    '\u{1f43f}',
  ], // E0.7   [1] (🐿️)       chipmunk
  [
    '\u{1f440}',
  ], // E0.6   [1] (👀)       eyes
  [
    '\u{1f441}',
  ], // E0.7   [1] (👁️)       eye
  [
    '\u{1f465}',
  ], // E1.0   [1] (👥)       busts in silhouette
  [
    '\u{1f4ad}',
  ], // E1.0   [1] (💭)       thought balloon
  [
    '\u{1f4ee}',
  ], // E0.6   [1] (📮)       postbox
  [
    '\u{1f4ef}',
  ], // E1.0   [1] (📯)       postal horn
  [
    '\u{1f4f5}',
  ], // E1.0   [1] (📵)       no mobile phones
  [
    '\u{1f4f8}',
  ], // E1.0   [1] (📸)       camera with flash
  [
    '\u{1f4fd}',
  ], // E0.7   [1] (📽️)       film projector
  [
    '\u{1f503}',
  ], // E0.6   [1] (🔃)       clockwise vertical arrows
  [
    '\u{1f508}',
  ], // E0.7   [1] (🔈)       speaker low volume
  [
    '\u{1f509}',
  ], // E1.0   [1] (🔉)       speaker medium volume
  [
    '\u{1f515}',
  ], // E1.0   [1] (🔕)       bell with slash
  [
    '\u{1f57a}',
  ], // E3.0   [1] (🕺)       man dancing
  [
    '\u{1f587}',
  ], // E0.7   [1] (🖇️)       linked paperclips
  [
    '\u{1f590}',
  ], // E0.7   [1] (🖐️)       hand with fingers splayed
  [
    '\u{1f5a4}',
  ], // E3.0   [1] (🖤)       black heart
  [
    '\u{1f5a5}',
  ], // E0.7   [1] (🖥️)       desktop computer
  [
    '\u{1f5a8}',
  ], // E0.7   [1] (🖨️)       printer
  [
    '\u{1f5bc}',
  ], // E0.7   [1] (🖼️)       framed picture
  [
    '\u{1f5e1}',
  ], // E0.7   [1] (🗡️)       dagger
  [
    '\u{1f5e3}',
  ], // E0.7   [1] (🗣️)       speaking head
  [
    '\u{1f5e8}',
  ], // E2.0   [1] (🗨️)       left speech bubble
  [
    '\u{1f5ef}',
  ], // E0.7   [1] (🗯️)       right anger bubble
  [
    '\u{1f5f3}',
  ], // E0.7   [1] (🗳️)       ballot box with ballot
  [
    '\u{1f5fa}',
  ], // E0.7   [1] (🗺️)       world map
  [
    '\u{1f600}',
  ], // E1.0   [1] (😀)       grinning face
  [
    '\u{1f60e}',
  ], // E1.0   [1] (😎)       smiling face with sunglasses
  [
    '\u{1f60f}',
  ], // E0.6   [1] (😏)       smirking face
  [
    '\u{1f610}',
  ], // E0.7   [1] (😐)       neutral face
  [
    '\u{1f611}',
  ], // E1.0   [1] (😑)       expressionless face
  [
    '\u{1f615}',
  ], // E1.0   [1] (😕)       confused face
  [
    '\u{1f616}',
  ], // E0.6   [1] (😖)       confounded face
  [
    '\u{1f617}',
  ], // E1.0   [1] (😗)       kissing face
  [
    '\u{1f618}',
  ], // E0.6   [1] (😘)       face blowing a kiss
  [
    '\u{1f619}',
  ], // E1.0   [1] (😙)       kissing face with smiling eyes
  [
    '\u{1f61a}',
  ], // E0.6   [1] (😚)       kissing face with closed eyes
  [
    '\u{1f61b}',
  ], // E1.0   [1] (😛)       face with tongue
  [
    '\u{1f61f}',
  ], // E1.0   [1] (😟)       worried face
  [
    '\u{1f62c}',
  ], // E1.0   [1] (😬)       grimacing face
  [
    '\u{1f62d}',
  ], // E0.6   [1] (😭)       loudly crying face
  [
    '\u{1f634}',
  ], // E1.0   [1] (😴)       sleeping face
  [
    '\u{1f635}',
  ], // E0.6   [1] (😵)       face with crossed-out eyes
  [
    '\u{1f636}',
  ], // E1.0   [1] (😶)       face without mouth
  [
    '\u{1f680}',
  ], // E0.6   [1] (🚀)       rocket
  [
    '\u{1f686}',
  ], // E1.0   [1] (🚆)       train
  [
    '\u{1f687}',
  ], // E0.6   [1] (🚇)       metro
  [
    '\u{1f688}',
  ], // E1.0   [1] (🚈)       light rail
  [
    '\u{1f689}',
  ], // E0.6   [1] (🚉)       station
  [
    '\u{1f68c}',
  ], // E0.6   [1] (🚌)       bus
  [
    '\u{1f68d}',
  ], // E0.7   [1] (🚍)       oncoming bus
  [
    '\u{1f68e}',
  ], // E1.0   [1] (🚎)       trolleybus
  [
    '\u{1f68f}',
  ], // E0.6   [1] (🚏)       bus stop
  [
    '\u{1f690}',
  ], // E1.0   [1] (🚐)       minibus
  [
    '\u{1f694}',
  ], // E0.7   [1] (🚔)       oncoming police car
  [
    '\u{1f695}',
  ], // E0.6   [1] (🚕)       taxi
  [
    '\u{1f696}',
  ], // E1.0   [1] (🚖)       oncoming taxi
  [
    '\u{1f697}',
  ], // E0.6   [1] (🚗)       automobile
  [
    '\u{1f698}',
  ], // E0.7   [1] (🚘)       oncoming automobile
  [
    '\u{1f6a2}',
  ], // E0.6   [1] (🚢)       ship
  [
    '\u{1f6a3}',
  ], // E1.0   [1] (🚣)       person rowing boat
  [
    '\u{1f6a6}',
  ], // E1.0   [1] (🚦)       vertical traffic light
  [
    '\u{1f6b2}',
  ], // E0.6   [1] (🚲)       bicycle
  [
    '\u{1f6b6}',
  ], // E0.6   [1] (🚶)       person walking
  [
    '\u{1f6bf}',
  ], // E1.0   [1] (🚿)       shower
  [
    '\u{1f6c0}',
  ], // E0.6   [1] (🛀)       person taking bath
  [
    '\u{1f6cb}',
  ], // E0.7   [1] (🛋️)       couch and lamp
  [
    '\u{1f6cc}',
  ], // E1.0   [1] (🛌)       person in bed
  [
    '\u{1f6d0}',
  ], // E1.0   [1] (🛐)       place of worship
  [
    '\u{1f6d5}',
  ], // E12.0  [1] (🛕)       hindu temple
  [
    '\u{1f6dc}',
  ], // E15.0  [1] (🛜)       wireless
  [
    '\u{1f6e9}',
  ], // E0.7   [1] (🛩️)       small airplane
  [
    '\u{1f6f0}',
  ], // E0.7   [1] (🛰️)       satellite
  [
    '\u{1f6f3}',
  ], // E0.7   [1] (🛳️)       passenger ship
  [
    '\u{1f6f9}',
  ], // E11.0  [1] (🛹)       skateboard
  [
    '\u{1f6fa}',
  ], // E12.0  [1] (🛺)       auto rickshaw
  [
    '\u{1f7f0}',
  ], // E14.0  [1] (🟰)       heavy equals sign
  [
    '\u{1f90c}',
  ], // E13.0  [1] (🤌)       pinched fingers
  [
    '\u{1f91f}',
  ], // E5.0   [1] (🤟)       love-you gesture
  [
    '\u{1f930}',
  ], // E3.0   [1] (🤰)       pregnant woman
  [
    '\u{1f93f}',
  ], // E12.0  [1] (🤿)       diving mask
  [
    '\u{1f94c}',
  ], // E5.0   [1] (🥌)       curling stone
  [
    '\u{1f971}',
  ], // E12.0  [1] (🥱)       yawning face
  [
    '\u{1f972}',
  ], // E13.0  [1] (🥲)       smiling face with tear
  [
    '\u{1f979}',
  ], // E14.0  [1] (🥹)       face holding back tears
  [
    '\u{1f97a}',
  ], // E11.0  [1] (🥺)       pleading face
  [
    '\u{1f97b}',
  ], // E12.0  [1] (🥻)       sari
  [
    '\u{1f9c0}',
  ], // E1.0   [1] (🧀)       cheese wedge
  [
    '\u{1f9cb}',
  ], // E13.0  [1] (🧋)       bubble tea
  [
    '\u{1f9cc}',
  ], // E14.0  [1] (🧌)       troll
  [
    '\u{1fa74}',
  ], // E13.0  [1] (🩴)       thong sandal
  [
    '\u{1fa89}',
  ], // E16.0  [1] (🪉)       harp
  [
    '\u{1fa8f}',
  ], // E16.0  [1] (🪏)       shovel
  [
    '\u{1fabe}',
  ], // E16.0  [1] (🪾)       leafless tree
  [
    '\u{1fabf}',
  ], // E15.0  [1] (🪿)       goose
  [
    '\u{1fac6}',
  ], // E16.0  [1] (🫆)       fingerprint
  [
    '\u{1fadc}',
  ], // E16.0  [1] (🫜)       root vegetable
  [
    '\u{1fadf}',
  ], // E16.0  [1] (🫟)       splatter
  [
    '\u{1fae8}',
  ], // E15.0  [1] (🫨)       shaking face
  [
    '\u{1fae9}',
  ], // E16.0  [1] (🫩)       face with bags under eyes
  [
    '\u23f0',
  ], // E0.6   [1] (⏰)       alarm clock
  [
    '\u23f3',
  ], // E0.6   [1] (⏳)       hourglass not done
  [
    '\u267f',
  ], // E0.6   [1] (♿)       wheelchair symbol
  [
    '\u2693',
  ], // E0.6   [1] (⚓)       anchor
  [
    '\u26a1',
  ], // E0.6   [1] (⚡)       high voltage
  [
    '\u26ce',
  ], // E0.6   [1] (⛎)       Ophiuchus
  [
    '\u26d4',
  ], // E0.6   [1] (⛔)       no entry
  [
    '\u26ea',
  ], // E0.6   [1] (⛪)       church
  [
    '\u26f5',
  ], // E0.6   [1] (⛵)       sailboat
  [
    '\u26fa',
  ], // E0.6   [1] (⛺)       tent
  [
    '\u26fd',
  ], // E0.6   [1] (⛽)       fuel pump
  [
    '\u2705',
  ], // E0.6   [1] (✅)       check mark button
  [
    '\u2728',
  ], // E0.6   [1] (✨)       sparkles
  [
    '\u274c',
  ], // E0.6   [1] (❌)       cross mark
  [
    '\u274e',
  ], // E0.6   [1] (❎)       cross mark button
  [
    '\u2757',
  ], // E0.6   [1] (❗)       red exclamation mark
  [
    '\u27b0',
  ], // E0.6   [1] (➰)       curly loop
  [
    '\u27bf',
  ], // E1.0   [1] (➿)       double curly loop
  [
    '\u2b50',
  ], // E0.6   [1] (⭐)       star
  [
    '\u2b55',
  ], // E0.6   [1] (⭕)       hollow red circle
  [
    '\u{1f004}',
  ], // E0.6   [1] (🀄)       mahjong red dragon
  [
    '\u{1f0cf}',
  ], // E0.6   [1] (🃏)       joker
  [
    '\u{1f18e}',
  ], // E0.6   [1] (🆎)       AB button (blood type)
  [
    '\u{1f201}',
  ], // E0.6   [1] (🈁)       Japanese “here” button
  [
    '\u{1f21a}',
  ], // E0.6   [1] (🈚)       Japanese “free of charge” button
  [
    '\u{1f22f}',
  ], // E0.6   [1] (🈯)       Japanese “reserved” button
  [
    '\u{1f30f}',
  ], // E0.6   [1] (🌏)       globe showing Asia-Australia
  [
    '\u{1f310}',
  ], // E1.0   [1] (🌐)       globe with meridians
  [
    '\u{1f311}',
  ], // E0.6   [1] (🌑)       new moon
  [
    '\u{1f312}',
  ], // E1.0   [1] (🌒)       waxing crescent moon
  [
    '\u{1f319}',
  ], // E0.6   [1] (🌙)       crescent moon
  [
    '\u{1f31a}',
  ], // E1.0   [1] (🌚)       new moon face
  [
    '\u{1f31b}',
  ], // E0.6   [1] (🌛)       first quarter moon face
  [
    '\u{1f31c}',
  ], // E0.7   [1] (🌜)       last quarter moon face
  [
    '\u{1f34b}',
  ], // E1.0   [1] (🍋)       lemon
  [
    '\u{1f350}',
  ], // E1.0   [1] (🍐)       pear
  [
    '\u{1f37c}',
  ], // E1.0   [1] (🍼)       baby bottle
  [
    '\u{1f3c5}',
  ], // E1.0   [1] (🏅)       sports medal
  [
    '\u{1f3c6}',
  ], // E0.6   [1] (🏆)       trophy
  [
    '\u{1f3c7}',
  ], // E1.0   [1] (🏇)       horse racing
  [
    '\u{1f3c8}',
  ], // E0.6   [1] (🏈)       american football
  [
    '\u{1f3c9}',
  ], // E1.0   [1] (🏉)       rugby football
  [
    '\u{1f3ca}',
  ], // E0.6   [1] (🏊)       person swimming
  [
    '\u{1f3e4}',
  ], // E1.0   [1] (🏤)       post office
  [
    '\u{1f3f4}',
  ], // E1.0   [1] (🏴)       black flag
  [
    '\u{1f408}',
  ], // E0.7   [1] (🐈)       cat
  [
    '\u{1f413}',
  ], // E1.0   [1] (🐓)       rooster
  [
    '\u{1f414}',
  ], // E0.6   [1] (🐔)       chicken
  [
    '\u{1f415}',
  ], // E0.7   [1] (🐕)       dog
  [
    '\u{1f416}',
  ], // E1.0   [1] (🐖)       pig
  [
    '\u{1f42a}',
  ], // E1.0   [1] (🐪)       camel
  [
    '\u{1f440}',
  ], // E0.6   [1] (👀)       eyes
  [
    '\u{1f465}',
  ], // E1.0   [1] (👥)       busts in silhouette
  [
    '\u{1f4ad}',
  ], // E1.0   [1] (💭)       thought balloon
  [
    '\u{1f4ee}',
  ], // E0.6   [1] (📮)       postbox
  [
    '\u{1f4ef}',
  ], // E1.0   [1] (📯)       postal horn
  [
    '\u{1f4f5}',
  ], // E1.0   [1] (📵)       no mobile phones
  [
    '\u{1f4f8}',
  ], // E1.0   [1] (📸)       camera with flash
  [
    '\u{1f503}',
  ], // E0.6   [1] (🔃)       clockwise vertical arrows
  [
    '\u{1f508}',
  ], // E0.7   [1] (🔈)       speaker low volume
  [
    '\u{1f509}',
  ], // E1.0   [1] (🔉)       speaker medium volume
  [
    '\u{1f515}',
  ], // E1.0   [1] (🔕)       bell with slash
  [
    '\u{1f57a}',
  ], // E3.0   [1] (🕺)       man dancing
  [
    '\u{1f5a4}',
  ], // E3.0   [1] (🖤)       black heart
  [
    '\u{1f600}',
  ], // E1.0   [1] (😀)       grinning face
  [
    '\u{1f60e}',
  ], // E1.0   [1] (😎)       smiling face with sunglasses
  [
    '\u{1f60f}',
  ], // E0.6   [1] (😏)       smirking face
  [
    '\u{1f610}',
  ], // E0.7   [1] (😐)       neutral face
  [
    '\u{1f611}',
  ], // E1.0   [1] (😑)       expressionless face
  [
    '\u{1f615}',
  ], // E1.0   [1] (😕)       confused face
  [
    '\u{1f616}',
  ], // E0.6   [1] (😖)       confounded face
  [
    '\u{1f617}',
  ], // E1.0   [1] (😗)       kissing face
  [
    '\u{1f618}',
  ], // E0.6   [1] (😘)       face blowing a kiss
  [
    '\u{1f619}',
  ], // E1.0   [1] (😙)       kissing face with smiling eyes
  [
    '\u{1f61a}',
  ], // E0.6   [1] (😚)       kissing face with closed eyes
  [
    '\u{1f61b}',
  ], // E1.0   [1] (😛)       face with tongue
  [
    '\u{1f61f}',
  ], // E1.0   [1] (😟)       worried face
  [
    '\u{1f62c}',
  ], // E1.0   [1] (😬)       grimacing face
  [
    '\u{1f62d}',
  ], // E0.6   [1] (😭)       loudly crying face
  [
    '\u{1f634}',
  ], // E1.0   [1] (😴)       sleeping face
  [
    '\u{1f635}',
  ], // E0.6   [1] (😵)       face with crossed-out eyes
  [
    '\u{1f636}',
  ], // E1.0   [1] (😶)       face without mouth
  [
    '\u{1f680}',
  ], // E0.6   [1] (🚀)       rocket
  [
    '\u{1f686}',
  ], // E1.0   [1] (🚆)       train
  [
    '\u{1f687}',
  ], // E0.6   [1] (🚇)       metro
  [
    '\u{1f688}',
  ], // E1.0   [1] (🚈)       light rail
  [
    '\u{1f689}',
  ], // E0.6   [1] (🚉)       station
  [
    '\u{1f68c}',
  ], // E0.6   [1] (🚌)       bus
  [
    '\u{1f68d}',
  ], // E0.7   [1] (🚍)       oncoming bus
  [
    '\u{1f68e}',
  ], // E1.0   [1] (🚎)       trolleybus
  [
    '\u{1f68f}',
  ], // E0.6   [1] (🚏)       bus stop
  [
    '\u{1f690}',
  ], // E1.0   [1] (🚐)       minibus
  [
    '\u{1f694}',
  ], // E0.7   [1] (🚔)       oncoming police car
  [
    '\u{1f695}',
  ], // E0.6   [1] (🚕)       taxi
  [
    '\u{1f696}',
  ], // E1.0   [1] (🚖)       oncoming taxi
  [
    '\u{1f697}',
  ], // E0.6   [1] (🚗)       automobile
  [
    '\u{1f698}',
  ], // E0.7   [1] (🚘)       oncoming automobile
  [
    '\u{1f6a2}',
  ], // E0.6   [1] (🚢)       ship
  [
    '\u{1f6a3}',
  ], // E1.0   [1] (🚣)       person rowing boat
  [
    '\u{1f6a6}',
  ], // E1.0   [1] (🚦)       vertical traffic light
  [
    '\u{1f6b2}',
  ], // E0.6   [1] (🚲)       bicycle
  [
    '\u{1f6b6}',
  ], // E0.6   [1] (🚶)       person walking
  [
    '\u{1f6bf}',
  ], // E1.0   [1] (🚿)       shower
  [
    '\u{1f6c0}',
  ], // E0.6   [1] (🛀)       person taking bath
  [
    '\u{1f6cc}',
  ], // E1.0   [1] (🛌)       person in bed
  [
    '\u{1f6d0}',
  ], // E1.0   [1] (🛐)       place of worship
  [
    '\u{1f6d5}',
  ], // E12.0  [1] (🛕)       hindu temple
  [
    '\u{1f6dc}',
  ], // E15.0  [1] (🛜)       wireless
  [
    '\u{1f6f9}',
  ], // E11.0  [1] (🛹)       skateboard
  [
    '\u{1f6fa}',
  ], // E12.0  [1] (🛺)       auto rickshaw
  [
    '\u{1f7f0}',
  ], // E14.0  [1] (🟰)       heavy equals sign
  [
    '\u{1f90c}',
  ], // E13.0  [1] (🤌)       pinched fingers
  [
    '\u{1f91f}',
  ], // E5.0   [1] (🤟)       love-you gesture
  [
    '\u{1f930}',
  ], // E3.0   [1] (🤰)       pregnant woman
  [
    '\u{1f93f}',
  ], // E12.0  [1] (🤿)       diving mask
  [
    '\u{1f94c}',
  ], // E5.0   [1] (🥌)       curling stone
  [
    '\u{1f971}',
  ], // E12.0  [1] (🥱)       yawning face
  [
    '\u{1f972}',
  ], // E13.0  [1] (🥲)       smiling face with tear
  [
    '\u{1f979}',
  ], // E14.0  [1] (🥹)       face holding back tears
  [
    '\u{1f97a}',
  ], // E11.0  [1] (🥺)       pleading face
  [
    '\u{1f97b}',
  ], // E12.0  [1] (🥻)       sari
  [
    '\u{1f9c0}',
  ], // E1.0   [1] (🧀)       cheese wedge
  [
    '\u{1f9cb}',
  ], // E13.0  [1] (🧋)       bubble tea
  [
    '\u{1f9cc}',
  ], // E14.0  [1] (🧌)       troll
  [
    '\u{1fa74}',
  ], // E13.0  [1] (🩴)       thong sandal
  [
    '\u{1fa89}',
  ], // E16.0  [1] (🪉)       harp
  [
    '\u{1fa8f}',
  ], // E16.0  [1] (🪏)       shovel
  [
    '\u{1fabe}',
  ], // E16.0  [1] (🪾)       leafless tree
  [
    '\u{1fabf}',
  ], // E15.0  [1] (🪿)       goose
  [
    '\u{1fac6}',
  ], // E16.0  [1] (🫆)       fingerprint
  [
    '\u{1fadc}',
  ], // E16.0  [1] (🫜)       root vegetable
  [
    '\u{1fadf}',
  ], // E16.0  [1] (🫟)       splatter
  [
    '\u{1fae8}',
  ], // E15.0  [1] (🫨)       shaking face
  [
    '\u{1fae9}',
  ], // E16.0  [1] (🫩)       face with bags under eyes
  [
    '\u261d',
  ], // E0.6   [1] (☝️)       index pointing up
  [
    '\u26f9',
  ], // E0.7   [1] (⛹️)       person bouncing ball
  [
    '\u270d',
  ], // E0.7   [1] (✍️)       writing hand
  [
    '\u{1f385}',
  ], // E0.6   [1] (🎅)       Santa Claus
  [
    '\u{1f3c7}',
  ], // E1.0   [1] (🏇)       horse racing
  [
    '\u{1f3ca}',
  ], // E0.6   [1] (🏊)       person swimming
  [
    '\u{1f47c}',
  ], // E0.6   [1] (👼)       baby angel
  [
    '\u{1f48f}',
  ], // E0.6   [1] (💏)       kiss
  [
    '\u{1f491}',
  ], // E0.6   [1] (💑)       couple with heart
  [
    '\u{1f4aa}',
  ], // E0.6   [1] (💪)       flexed biceps
  [
    '\u{1f57a}',
  ], // E3.0   [1] (🕺)       man dancing
  [
    '\u{1f590}',
  ], // E0.7   [1] (🖐️)       hand with fingers splayed
  [
    '\u{1f6a3}',
  ], // E1.0   [1] (🚣)       person rowing boat
  [
    '\u{1f6b6}',
  ], // E0.6   [1] (🚶)       person walking
  [
    '\u{1f6c0}',
  ], // E0.6   [1] (🛀)       person taking bath
  [
    '\u{1f6cc}',
  ], // E1.0   [1] (🛌)       person in bed
  [
    '\u{1f90c}',
  ], // E13.0  [1] (🤌)       pinched fingers
  [
    '\u{1f90f}',
  ], // E12.0  [1] (🤏)       pinching hand
  [
    '\u{1f918}',
  ], // E1.0   [1] (🤘)       sign of the horns
  [
    '\u{1f91f}',
  ], // E5.0   [1] (🤟)       love-you gesture
  [
    '\u{1f926}',
  ], // E3.0   [1] (🤦)       person facepalming
  [
    '\u{1f930}',
  ], // E3.0   [1] (🤰)       pregnant woman
  [
    '\u{1f977}',
  ], // E13.0  [1] (🥷)       ninja
  [
    '\u{1f9bb}',
  ], // E12.0  [1] (🦻)       ear with hearing aid
  [
    '#',
  ], // E0.0   [1] (#️)       hash sign
  [
    '*',
  ], // E0.0   [1] (*️)       asterisk
  [
    '\u200d',
  ], // E0.0   [1] (‍)        zero width joiner
  [
    '\u20e3',
  ], // E0.0   [1] (⃣)       combining enclosing keycap
  [
    '\ufe0f',
  ], // E0.0   [1] ()        VARIATION SELECTOR-16
  [
    '©',
  ], // E0.6   [1] (©️)       copyright
  [
    '®',
  ], // E0.6   [1] (®️)       registered
  [
    '\u203c',
  ], // E0.6   [1] (‼️)       double exclamation mark
  [
    '\u2049',
  ], // E0.6   [1] (⁉️)       exclamation question mark
  [
    '\u2122',
  ], // E0.6   [1] (™️)       trade mark
  [
    '\u2139',
  ], // E0.6   [1] (ℹ️)       information
  [
    '\u2328',
  ], // E1.0   [1] (⌨️)       keyboard
  [
    '\u2388',
  ], // E0.0   [1] (⎈)       HELM SYMBOL
  [
    '\u23cf',
  ], // E1.0   [1] (⏏️)       eject button
  [
    '\u23ef',
  ], // E1.0   [1] (⏯️)       play or pause button
  [
    '\u23f0',
  ], // E0.6   [1] (⏰)       alarm clock
  [
    '\u23f3',
  ], // E0.6   [1] (⏳)       hourglass not done
  [
    '\u24c2',
  ], // E0.6   [1] (Ⓜ️)       circled M
  [
    '\u25b6',
  ], // E0.6   [1] (▶️)       play button
  [
    '\u25c0',
  ], // E0.6   [1] (◀️)       reverse button
  [
    '\u2604',
  ], // E1.0   [1] (☄️)       comet
  [
    '\u2605',
  ], // E0.0   [1] (★)       BLACK STAR
  [
    '\u260e',
  ], // E0.6   [1] (☎️)       telephone
  [
    '\u2611',
  ], // E0.6   [1] (☑️)       check box with check
  [
    '\u2612',
  ], // E0.0   [1] (☒)       BALLOT BOX WITH X
  [
    '\u2618',
  ], // E1.0   [1] (☘️)       shamrock
  [
    '\u261d',
  ], // E0.6   [1] (☝️)       index pointing up
  [
    '\u2620',
  ], // E1.0   [1] (☠️)       skull and crossbones
  [
    '\u2621',
  ], // E0.0   [1] (☡)       CAUTION SIGN
  [
    '\u2626',
  ], // E1.0   [1] (☦️)       orthodox cross
  [
    '\u262a',
  ], // E0.7   [1] (☪️)       star and crescent
  [
    '\u262e',
  ], // E1.0   [1] (☮️)       peace symbol
  [
    '\u262f',
  ], // E0.7   [1] (☯️)       yin yang
  [
    '\u263a',
  ], // E0.6   [1] (☺️)       smiling face
  [
    '\u2640',
  ], // E4.0   [1] (♀️)       female sign
  [
    '\u2641',
  ], // E0.0   [1] (♁)       EARTH
  [
    '\u2642',
  ], // E4.0   [1] (♂️)       male sign
  [
    '\u265f',
  ], // E11.0  [1] (♟️)       chess pawn
  [
    '\u2660',
  ], // E0.6   [1] (♠️)       spade suit
  [
    '\u2663',
  ], // E0.6   [1] (♣️)       club suit
  [
    '\u2664',
  ], // E0.0   [1] (♤)       WHITE SPADE SUIT
  [
    '\u2667',
  ], // E0.0   [1] (♧)       WHITE CLUB SUIT
  [
    '\u2668',
  ], // E0.6   [1] (♨️)       hot springs
  [
    '\u267b',
  ], // E0.6   [1] (♻️)       recycling symbol
  [
    '\u267e',
  ], // E11.0  [1] (♾️)       infinity
  [
    '\u267f',
  ], // E0.6   [1] (♿)       wheelchair symbol
  [
    '\u2692',
  ], // E1.0   [1] (⚒️)       hammer and pick
  [
    '\u2693',
  ], // E0.6   [1] (⚓)       anchor
  [
    '\u2694',
  ], // E1.0   [1] (⚔️)       crossed swords
  [
    '\u2695',
  ], // E4.0   [1] (⚕️)       medical symbol
  [
    '\u2698',
  ], // E0.0   [1] (⚘)       FLOWER
  [
    '\u2699',
  ], // E1.0   [1] (⚙️)       gear
  [
    '\u269a',
  ], // E0.0   [1] (⚚)       STAFF OF HERMES
  [
    '\u26a7',
  ], // E13.0  [1] (⚧️)       transgender symbol
  [
    '\u26c8',
  ], // E0.7   [1] (⛈️)       cloud with lightning and rain
  [
    '\u26ce',
  ], // E0.6   [1] (⛎)       Ophiuchus
  [
    '\u26cf',
  ], // E0.7   [1] (⛏️)       pick
  [
    '\u26d0',
  ], // E0.0   [1] (⛐)       CAR SLIDING
  [
    '\u26d1',
  ], // E0.7   [1] (⛑️)       rescue worker’s helmet
  [
    '\u26d2',
  ], // E0.0   [1] (⛒)       CIRCLED CROSSING LANES
  [
    '\u26d3',
  ], // E0.7   [1] (⛓️)       chains
  [
    '\u26d4',
  ], // E0.6   [1] (⛔)       no entry
  [
    '\u26e9',
  ], // E0.7   [1] (⛩️)       shinto shrine
  [
    '\u26ea',
  ], // E0.6   [1] (⛪)       church
  [
    '\u26f4',
  ], // E0.7   [1] (⛴️)       ferry
  [
    '\u26f5',
  ], // E0.6   [1] (⛵)       sailboat
  [
    '\u26f6',
  ], // E0.0   [1] (⛶)       SQUARE FOUR CORNERS
  [
    '\u26fa',
  ], // E0.6   [1] (⛺)       tent
  [
    '\u26fd',
  ], // E0.6   [1] (⛽)       fuel pump
  [
    '\u2702',
  ], // E0.6   [1] (✂️)       scissors
  [
    '\u2705',
  ], // E0.6   [1] (✅)       check mark button
  [
    '\u270d',
  ], // E0.7   [1] (✍️)       writing hand
  [
    '\u270e',
  ], // E0.0   [1] (✎)       LOWER RIGHT PENCIL
  [
    '\u270f',
  ], // E0.6   [1] (✏️)       pencil
  [
    '\u2712',
  ], // E0.6   [1] (✒️)       black nib
  [
    '\u2714',
  ], // E0.6   [1] (✔️)       check mark
  [
    '\u2716',
  ], // E0.6   [1] (✖️)       multiply
  [
    '\u271d',
  ], // E0.7   [1] (✝️)       latin cross
  [
    '\u2721',
  ], // E0.7   [1] (✡️)       star of David
  [
    '\u2728',
  ], // E0.6   [1] (✨)       sparkles
  [
    '\u2744',
  ], // E0.6   [1] (❄️)       snowflake
  [
    '\u2747',
  ], // E0.6   [1] (❇️)       sparkle
  [
    '\u274c',
  ], // E0.6   [1] (❌)       cross mark
  [
    '\u274e',
  ], // E0.6   [1] (❎)       cross mark button
  [
    '\u2757',
  ], // E0.6   [1] (❗)       red exclamation mark
  [
    '\u2763',
  ], // E1.0   [1] (❣️)       heart exclamation
  [
    '\u2764',
  ], // E0.6   [1] (❤️)       red heart
  [
    '\u27a1',
  ], // E0.6   [1] (➡️)       right arrow
  [
    '\u27b0',
  ], // E0.6   [1] (➰)       curly loop
  [
    '\u27bf',
  ], // E1.0   [1] (➿)       double curly loop
  [
    '\u2b50',
  ], // E0.6   [1] (⭐)       star
  [
    '\u2b55',
  ], // E0.6   [1] (⭕)       hollow red circle
  [
    '\u3030',
  ], // E0.6   [1] (〰️)       wavy dash
  [
    '\u303d',
  ], // E0.6   [1] (〽️)       part alternation mark
  [
    '\u3297',
  ], // E0.6   [1] (㊗️)       Japanese “congratulations” button
  [
    '\u3299',
  ], // E0.6   [1] (㊙️)       Japanese “secret” button
  [
    '\u{1f004}',
  ], // E0.6   [1] (🀄)       mahjong red dragon
  [
    '\u{1f0cf}',
  ], // E0.6   [1] (🃏)       joker
  [
    '\u{1f12f}',
  ], // E0.0   [1] (🄯)       COPYLEFT SYMBOL
  [
    '\u{1f18e}',
  ], // E0.6   [1] (🆎)       AB button (blood type)
  [
    '\u{1f21a}',
  ], // E0.6   [1] (🈚)       Japanese “free of charge” button
  [
    '\u{1f22f}',
  ], // E0.6   [1] (🈯)       Japanese “reserved” button
  [
    '\u{1f30f}',
  ], // E0.6   [1] (🌏)       globe showing Asia-Australia
  [
    '\u{1f310}',
  ], // E1.0   [1] (🌐)       globe with meridians
  [
    '\u{1f311}',
  ], // E0.6   [1] (🌑)       new moon
  [
    '\u{1f312}',
  ], // E1.0   [1] (🌒)       waxing crescent moon
  [
    '\u{1f319}',
  ], // E0.6   [1] (🌙)       crescent moon
  [
    '\u{1f31a}',
  ], // E1.0   [1] (🌚)       new moon face
  [
    '\u{1f31b}',
  ], // E0.6   [1] (🌛)       first quarter moon face
  [
    '\u{1f31c}',
  ], // E0.7   [1] (🌜)       last quarter moon face
  [
    '\u{1f321}',
  ], // E0.7   [1] (🌡️)       thermometer
  [
    '\u{1f336}',
  ], // E0.7   [1] (🌶️)       hot pepper
  [
    '\u{1f34b}',
  ], // E1.0   [1] (🍋)       lemon
  [
    '\u{1f350}',
  ], // E1.0   [1] (🍐)       pear
  [
    '\u{1f37c}',
  ], // E1.0   [1] (🍼)       baby bottle
  [
    '\u{1f37d}',
  ], // E0.7   [1] (🍽️)       fork and knife with plate
  [
    '\u{1f398}',
  ], // E0.0   [1] (🎘)       MUSICAL KEYBOARD WITH JACKS
  [
    '\u{1f3c5}',
  ], // E1.0   [1] (🏅)       sports medal
  [
    '\u{1f3c6}',
  ], // E0.6   [1] (🏆)       trophy
  [
    '\u{1f3c7}',
  ], // E1.0   [1] (🏇)       horse racing
  [
    '\u{1f3c8}',
  ], // E0.6   [1] (🏈)       american football
  [
    '\u{1f3c9}',
  ], // E1.0   [1] (🏉)       rugby football
  [
    '\u{1f3ca}',
  ], // E0.6   [1] (🏊)       person swimming
  [
    '\u{1f3e4}',
  ], // E1.0   [1] (🏤)       post office
  [
    '\u{1f3f3}',
  ], // E0.7   [1] (🏳️)       white flag
  [
    '\u{1f3f4}',
  ], // E1.0   [1] (🏴)       black flag
  [
    '\u{1f3f5}',
  ], // E0.7   [1] (🏵️)       rosette
  [
    '\u{1f3f6}',
  ], // E0.0   [1] (🏶)       BLACK ROSETTE
  [
    '\u{1f3f7}',
  ], // E0.7   [1] (🏷️)       label
  [
    '\u{1f408}',
  ], // E0.7   [1] (🐈)       cat
  [
    '\u{1f413}',
  ], // E1.0   [1] (🐓)       rooster
  [
    '\u{1f414}',
  ], // E0.6   [1] (🐔)       chicken
  [
    '\u{1f415}',
  ], // E0.7   [1] (🐕)       dog
  [
    '\u{1f416}',
  ], // E1.0   [1] (🐖)       pig
  [
    '\u{1f42a}',
  ], // E1.0   [1] (🐪)       camel
  [
    '\u{1f43f}',
  ], // E0.7   [1] (🐿️)       chipmunk
  [
    '\u{1f440}',
  ], // E0.6   [1] (👀)       eyes
  [
    '\u{1f441}',
  ], // E0.7   [1] (👁️)       eye
  [
    '\u{1f465}',
  ], // E1.0   [1] (👥)       busts in silhouette
  [
    '\u{1f4ad}',
  ], // E1.0   [1] (💭)       thought balloon
  [
    '\u{1f4ee}',
  ], // E0.6   [1] (📮)       postbox
  [
    '\u{1f4ef}',
  ], // E1.0   [1] (📯)       postal horn
  [
    '\u{1f4f5}',
  ], // E1.0   [1] (📵)       no mobile phones
  [
    '\u{1f4f8}',
  ], // E1.0   [1] (📸)       camera with flash
  [
    '\u{1f4fd}',
  ], // E0.7   [1] (📽️)       film projector
  [
    '\u{1f4fe}',
  ], // E0.0   [1] (📾)       PORTABLE STEREO
  [
    '\u{1f503}',
  ], // E0.6   [1] (🔃)       clockwise vertical arrows
  [
    '\u{1f508}',
  ], // E0.7   [1] (🔈)       speaker low volume
  [
    '\u{1f509}',
  ], // E1.0   [1] (🔉)       speaker medium volume
  [
    '\u{1f515}',
  ], // E1.0   [1] (🔕)       bell with slash
  [
    '\u{1f54f}',
  ], // E0.0   [1] (🕏)       BOWL OF HYGIEIA
  [
    '\u{1f57a}',
  ], // E3.0   [1] (🕺)       man dancing
  [
    '\u{1f587}',
  ], // E0.7   [1] (🖇️)       linked paperclips
  [
    '\u{1f590}',
  ], // E0.7   [1] (🖐️)       hand with fingers splayed
  [
    '\u{1f5a4}',
  ], // E3.0   [1] (🖤)       black heart
  [
    '\u{1f5a5}',
  ], // E0.7   [1] (🖥️)       desktop computer
  [
    '\u{1f5a8}',
  ], // E0.7   [1] (🖨️)       printer
  [
    '\u{1f5bc}',
  ], // E0.7   [1] (🖼️)       framed picture
  [
    '\u{1f5e1}',
  ], // E0.7   [1] (🗡️)       dagger
  [
    '\u{1f5e2}',
  ], // E0.0   [1] (🗢)       LIPS
  [
    '\u{1f5e3}',
  ], // E0.7   [1] (🗣️)       speaking head
  [
    '\u{1f5e8}',
  ], // E2.0   [1] (🗨️)       left speech bubble
  [
    '\u{1f5ef}',
  ], // E0.7   [1] (🗯️)       right anger bubble
  [
    '\u{1f5f3}',
  ], // E0.7   [1] (🗳️)       ballot box with ballot
  [
    '\u{1f5fa}',
  ], // E0.7   [1] (🗺️)       world map
  [
    '\u{1f600}',
  ], // E1.0   [1] (😀)       grinning face
  [
    '\u{1f60e}',
  ], // E1.0   [1] (😎)       smiling face with sunglasses
  [
    '\u{1f60f}',
  ], // E0.6   [1] (😏)       smirking face
  [
    '\u{1f610}',
  ], // E0.7   [1] (😐)       neutral face
  [
    '\u{1f611}',
  ], // E1.0   [1] (😑)       expressionless face
  [
    '\u{1f615}',
  ], // E1.0   [1] (😕)       confused face
  [
    '\u{1f616}',
  ], // E0.6   [1] (😖)       confounded face
  [
    '\u{1f617}',
  ], // E1.0   [1] (😗)       kissing face
  [
    '\u{1f618}',
  ], // E0.6   [1] (😘)       face blowing a kiss
  [
    '\u{1f619}',
  ], // E1.0   [1] (😙)       kissing face with smiling eyes
  [
    '\u{1f61a}',
  ], // E0.6   [1] (😚)       kissing face with closed eyes
  [
    '\u{1f61b}',
  ], // E1.0   [1] (😛)       face with tongue
  [
    '\u{1f61f}',
  ], // E1.0   [1] (😟)       worried face
  [
    '\u{1f62c}',
  ], // E1.0   [1] (😬)       grimacing face
  [
    '\u{1f62d}',
  ], // E0.6   [1] (😭)       loudly crying face
  [
    '\u{1f634}',
  ], // E1.0   [1] (😴)       sleeping face
  [
    '\u{1f635}',
  ], // E0.6   [1] (😵)       face with crossed-out eyes
  [
    '\u{1f636}',
  ], // E1.0   [1] (😶)       face without mouth
  [
    '\u{1f680}',
  ], // E0.6   [1] (🚀)       rocket
  [
    '\u{1f686}',
  ], // E1.0   [1] (🚆)       train
  [
    '\u{1f687}',
  ], // E0.6   [1] (🚇)       metro
  [
    '\u{1f688}',
  ], // E1.0   [1] (🚈)       light rail
  [
    '\u{1f689}',
  ], // E0.6   [1] (🚉)       station
  [
    '\u{1f68c}',
  ], // E0.6   [1] (🚌)       bus
  [
    '\u{1f68d}',
  ], // E0.7   [1] (🚍)       oncoming bus
  [
    '\u{1f68e}',
  ], // E1.0   [1] (🚎)       trolleybus
  [
    '\u{1f68f}',
  ], // E0.6   [1] (🚏)       bus stop
  [
    '\u{1f690}',
  ], // E1.0   [1] (🚐)       minibus
  [
    '\u{1f694}',
  ], // E0.7   [1] (🚔)       oncoming police car
  [
    '\u{1f695}',
  ], // E0.6   [1] (🚕)       taxi
  [
    '\u{1f696}',
  ], // E1.0   [1] (🚖)       oncoming taxi
  [
    '\u{1f697}',
  ], // E0.6   [1] (🚗)       automobile
  [
    '\u{1f698}',
  ], // E0.7   [1] (🚘)       oncoming automobile
  [
    '\u{1f6a2}',
  ], // E0.6   [1] (🚢)       ship
  [
    '\u{1f6a3}',
  ], // E1.0   [1] (🚣)       person rowing boat
  [
    '\u{1f6a6}',
  ], // E1.0   [1] (🚦)       vertical traffic light
  [
    '\u{1f6b2}',
  ], // E0.6   [1] (🚲)       bicycle
  [
    '\u{1f6b6}',
  ], // E0.6   [1] (🚶)       person walking
  [
    '\u{1f6bf}',
  ], // E1.0   [1] (🚿)       shower
  [
    '\u{1f6c0}',
  ], // E0.6   [1] (🛀)       person taking bath
  [
    '\u{1f6cb}',
  ], // E0.7   [1] (🛋️)       couch and lamp
  [
    '\u{1f6cc}',
  ], // E1.0   [1] (🛌)       person in bed
  [
    '\u{1f6d0}',
  ], // E1.0   [1] (🛐)       place of worship
  [
    '\u{1f6d5}',
  ], // E12.0  [1] (🛕)       hindu temple
  [
    '\u{1f6dc}',
  ], // E15.0  [1] (🛜)       wireless
  [
    '\u{1f6e9}',
  ], // E0.7   [1] (🛩️)       small airplane
  [
    '\u{1f6ea}',
  ], // E0.0   [1] (🛪)       NORTHEAST-POINTING AIRPLANE
  [
    '\u{1f6f0}',
  ], // E0.7   [1] (🛰️)       satellite
  [
    '\u{1f6f3}',
  ], // E0.7   [1] (🛳️)       passenger ship
  [
    '\u{1f6f9}',
  ], // E11.0  [1] (🛹)       skateboard
  [
    '\u{1f6fa}',
  ], // E12.0  [1] (🛺)       auto rickshaw
  [
    '\u{1f7f0}',
  ], // E14.0  [1] (🟰)       heavy equals sign
  [
    '\u{1f90c}',
  ], // E13.0  [1] (🤌)       pinched fingers
  [
    '\u{1f91f}',
  ], // E5.0   [1] (🤟)       love-you gesture
  [
    '\u{1f930}',
  ], // E3.0   [1] (🤰)       pregnant woman
  [
    '\u{1f93f}',
  ], // E12.0  [1] (🤿)       diving mask
  [
    '\u{1f94c}',
  ], // E5.0   [1] (🥌)       curling stone
  [
    '\u{1f971}',
  ], // E12.0  [1] (🥱)       yawning face
  [
    '\u{1f972}',
  ], // E13.0  [1] (🥲)       smiling face with tear
  [
    '\u{1f979}',
  ], // E14.0  [1] (🥹)       face holding back tears
  [
    '\u{1f97a}',
  ], // E11.0  [1] (🥺)       pleading face
  [
    '\u{1f97b}',
  ], // E12.0  [1] (🥻)       sari
  [
    '\u{1f9c0}',
  ], // E1.0   [1] (🧀)       cheese wedge
  [
    '\u{1f9cb}',
  ], // E13.0  [1] (🧋)       bubble tea
  [
    '\u{1f9cc}',
  ], // E14.0  [1] (🧌)       troll
  [
    '\u{1fa74}',
  ], // E13.0  [1] (🩴)       thong sandal
  [
    '\u{1fa89}',
  ], // E16.0  [1] (🪉)       harp
  [
    '\u{1fa8f}',
  ], // E16.0  [1] (🪏)       shovel
  [
    '\u{1fabe}',
  ], // E16.0  [1] (🪾)       leafless tree
  [
    '\u{1fabf}',
  ], // E15.0  [1] (🪿)       goose
  [
    '\u{1fac6}',
  ], // E16.0  [1] (🫆)       fingerprint
  [
    '\u{1fadc}',
  ], // E16.0  [1] (🫜)       root vegetable
  [
    '\u{1fadf}',
  ], // E16.0  [1] (🫟)       splatter
  [
    '\u{1fae8}',
  ], // E15.0  [1] (🫨)       shaking face
  [
    '\u{1fae9}',
  ], // E16.0  [1] (🫩)       face with bags under eyes
];
// dart format on
// BMP character in each category, if any, -1 if none.
const lowerChars = <int>[
  0xd,
  0x1,
  0x2a,
  0x200c,
  0x903,
  -0x1,
  0x3299,
  0xa,
  0x600,
  0x1100,
  0x1160,
  0x11a8,
  0xac00,
  0xac01,
  0x924,
  0x200d,
  0xfe0f,
  0x94d,
];
// Non-BMP character in each category, if any, -1 if none.
const upperChars = <int>[
  -0x1,
  0x13430,
  0x10000,
  -0x1,
  0x11000,
  0x1f1e9,
  0x1fae9,
  -0x1,
  0x110bd,
  -0x1,
  0x16d63,
  -0x1,
  -0x1,
  -0x1,
  -0x1,
  -0x1,
  0x1f3ff,
  -0x1,
];
