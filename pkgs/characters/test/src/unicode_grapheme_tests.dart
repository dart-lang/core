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
    '\u{1f600}',
  ], // 😀 E1.0 grinning face
  [
    '\u{1f603}',
  ], // 😃 E0.6 grinning face with big eyes
  [
    '\u{1f604}',
  ], // 😄 E0.6 grinning face with smiling eyes
  [
    '\u{1f601}',
  ], // 😁 E0.6 beaming face with smiling eyes
  [
    '\u{1f606}',
  ], // 😆 E0.6 grinning squinting face
  [
    '\u{1f605}',
  ], // 😅 E0.6 grinning face with sweat
  [
    '\u{1f923}',
  ], // 🤣 E3.0 rolling on the floor laughing
  [
    '\u{1f602}',
  ], // 😂 E0.6 face with tears of joy
  [
    '\u{1f642}',
  ], // 🙂 E1.0 slightly smiling face
  [
    '\u{1f643}',
  ], // 🙃 E1.0 upside-down face
  [
    '\u{1fae0}',
  ], // 🫠 E14.0 melting face
  [
    '\u{1f609}',
  ], // 😉 E0.6 winking face
  [
    '\u{1f60a}',
  ], // 😊 E0.6 smiling face with smiling eyes
  [
    '\u{1f607}',
  ], // 😇 E1.0 smiling face with halo
  [
    '\u{1f970}',
  ], // 🥰 E11.0 smiling face with hearts
  [
    '\u{1f60d}',
  ], // 😍 E0.6 smiling face with heart-eyes
  [
    '\u{1f929}',
  ], // 🤩 E5.0 star-struck
  [
    '\u{1f618}',
  ], // 😘 E0.6 face blowing a kiss
  [
    '\u{1f617}',
  ], // 😗 E1.0 kissing face
  [
    '\u263a\ufe0f',
  ], // ☺️ E0.6 smiling face
  [
    '\u263a',
  ], // ☺ E0.6 smiling face
  [
    '\u{1f61a}',
  ], // 😚 E0.6 kissing face with closed eyes
  [
    '\u{1f619}',
  ], // 😙 E1.0 kissing face with smiling eyes
  [
    '\u{1f972}',
  ], // 🥲 E13.0 smiling face with tear
  [
    '\u{1f60b}',
  ], // 😋 E0.6 face savoring food
  [
    '\u{1f61b}',
  ], // 😛 E1.0 face with tongue
  [
    '\u{1f61c}',
  ], // 😜 E0.6 winking face with tongue
  [
    '\u{1f92a}',
  ], // 🤪 E5.0 zany face
  [
    '\u{1f61d}',
  ], // 😝 E0.6 squinting face with tongue
  [
    '\u{1f911}',
  ], // 🤑 E1.0 money-mouth face
  [
    '\u{1f917}',
  ], // 🤗 E1.0 smiling face with open hands
  [
    '\u{1f92d}',
  ], // 🤭 E5.0 face with hand over mouth
  [
    '\u{1fae2}',
  ], // 🫢 E14.0 face with open eyes and hand over mouth
  [
    '\u{1fae3}',
  ], // 🫣 E14.0 face with peeking eye
  [
    '\u{1f92b}',
  ], // 🤫 E5.0 shushing face
  [
    '\u{1f914}',
  ], // 🤔 E1.0 thinking face
  [
    '\u{1fae1}',
  ], // 🫡 E14.0 saluting face
  [
    '\u{1f910}',
  ], // 🤐 E1.0 zipper-mouth face
  [
    '\u{1f928}',
  ], // 🤨 E5.0 face with raised eyebrow
  [
    '\u{1f610}',
  ], // 😐 E0.7 neutral face
  [
    '\u{1f611}',
  ], // 😑 E1.0 expressionless face
  [
    '\u{1f636}',
  ], // 😶 E1.0 face without mouth
  [
    '\u{1fae5}',
  ], // 🫥 E14.0 dotted line face
  [
    '\u{1f636}\u200d\u{1f32b}\ufe0f',
  ], // 😶‍🌫️ E13.1 face in clouds
  [
    '\u{1f636}\u200d\u{1f32b}',
  ], // 😶‍🌫 E13.1 face in clouds
  [
    '\u{1f60f}',
  ], // 😏 E0.6 smirking face
  [
    '\u{1f612}',
  ], // 😒 E0.6 unamused face
  [
    '\u{1f644}',
  ], // 🙄 E1.0 face with rolling eyes
  [
    '\u{1f62c}',
  ], // 😬 E1.0 grimacing face
  [
    '\u{1f62e}\u200d\u{1f4a8}',
  ], // 😮‍💨 E13.1 face exhaling
  [
    '\u{1f925}',
  ], // 🤥 E3.0 lying face
  [
    '\u{1fae8}',
  ], // 🫨 E15.0 shaking face
  [
    '\u{1f642}\u200d\u2194\ufe0f',
  ], // 🙂‍↔️ E15.1 head shaking horizontally
  [
    '\u{1f642}\u200d\u2194',
  ], // 🙂‍↔ E15.1 head shaking horizontally
  [
    '\u{1f642}\u200d\u2195\ufe0f',
  ], // 🙂‍↕️ E15.1 head shaking vertically
  [
    '\u{1f642}\u200d\u2195',
  ], // 🙂‍↕ E15.1 head shaking vertically
  [
    '\u{1f60c}',
  ], // 😌 E0.6 relieved face
  [
    '\u{1f614}',
  ], // 😔 E0.6 pensive face
  [
    '\u{1f62a}',
  ], // 😪 E0.6 sleepy face
  [
    '\u{1f924}',
  ], // 🤤 E3.0 drooling face
  [
    '\u{1f634}',
  ], // 😴 E1.0 sleeping face
  [
    '\u{1fae9}',
  ], // 🫩 E16.0 face with bags under eyes
  [
    '\u{1f637}',
  ], // 😷 E0.6 face with medical mask
  [
    '\u{1f912}',
  ], // 🤒 E1.0 face with thermometer
  [
    '\u{1f915}',
  ], // 🤕 E1.0 face with head-bandage
  [
    '\u{1f922}',
  ], // 🤢 E3.0 nauseated face
  [
    '\u{1f92e}',
  ], // 🤮 E5.0 face vomiting
  [
    '\u{1f927}',
  ], // 🤧 E3.0 sneezing face
  [
    '\u{1f975}',
  ], // 🥵 E11.0 hot face
  [
    '\u{1f976}',
  ], // 🥶 E11.0 cold face
  [
    '\u{1f974}',
  ], // 🥴 E11.0 woozy face
  [
    '\u{1f635}',
  ], // 😵 E0.6 face with crossed-out eyes
  [
    '\u{1f635}\u200d\u{1f4ab}',
  ], // 😵‍💫 E13.1 face with spiral eyes
  [
    '\u{1f92f}',
  ], // 🤯 E5.0 exploding head
  [
    '\u{1f920}',
  ], // 🤠 E3.0 cowboy hat face
  [
    '\u{1f973}',
  ], // 🥳 E11.0 partying face
  [
    '\u{1f978}',
  ], // 🥸 E13.0 disguised face
  [
    '\u{1f60e}',
  ], // 😎 E1.0 smiling face with sunglasses
  [
    '\u{1f913}',
  ], // 🤓 E1.0 nerd face
  [
    '\u{1f9d0}',
  ], // 🧐 E5.0 face with monocle
  [
    '\u{1f615}',
  ], // 😕 E1.0 confused face
  [
    '\u{1fae4}',
  ], // 🫤 E14.0 face with diagonal mouth
  [
    '\u{1f61f}',
  ], // 😟 E1.0 worried face
  [
    '\u{1f641}',
  ], // 🙁 E1.0 slightly frowning face
  [
    '\u2639\ufe0f',
  ], // ☹️ E0.7 frowning face
  [
    '\u2639',
  ], // ☹ E0.7 frowning face
  [
    '\u{1f62e}',
  ], // 😮 E1.0 face with open mouth
  [
    '\u{1f62f}',
  ], // 😯 E1.0 hushed face
  [
    '\u{1f632}',
  ], // 😲 E0.6 astonished face
  [
    '\u{1f633}',
  ], // 😳 E0.6 flushed face
  [
    '\u{1f97a}',
  ], // 🥺 E11.0 pleading face
  [
    '\u{1f979}',
  ], // 🥹 E14.0 face holding back tears
  [
    '\u{1f626}',
  ], // 😦 E1.0 frowning face with open mouth
  [
    '\u{1f627}',
  ], // 😧 E1.0 anguished face
  [
    '\u{1f628}',
  ], // 😨 E0.6 fearful face
  [
    '\u{1f630}',
  ], // 😰 E0.6 anxious face with sweat
  [
    '\u{1f625}',
  ], // 😥 E0.6 sad but relieved face
  [
    '\u{1f622}',
  ], // 😢 E0.6 crying face
  [
    '\u{1f62d}',
  ], // 😭 E0.6 loudly crying face
  [
    '\u{1f631}',
  ], // 😱 E0.6 face screaming in fear
  [
    '\u{1f616}',
  ], // 😖 E0.6 confounded face
  [
    '\u{1f623}',
  ], // 😣 E0.6 persevering face
  [
    '\u{1f61e}',
  ], // 😞 E0.6 disappointed face
  [
    '\u{1f613}',
  ], // 😓 E0.6 downcast face with sweat
  [
    '\u{1f629}',
  ], // 😩 E0.6 weary face
  [
    '\u{1f62b}',
  ], // 😫 E0.6 tired face
  [
    '\u{1f971}',
  ], // 🥱 E12.0 yawning face
  [
    '\u{1f624}',
  ], // 😤 E0.6 face with steam from nose
  [
    '\u{1f621}',
  ], // 😡 E0.6 enraged face
  [
    '\u{1f620}',
  ], // 😠 E0.6 angry face
  [
    '\u{1f92c}',
  ], // 🤬 E5.0 face with symbols on mouth
  [
    '\u{1f608}',
  ], // 😈 E1.0 smiling face with horns
  [
    '\u{1f47f}',
  ], // 👿 E0.6 angry face with horns
  [
    '\u{1f480}',
  ], // 💀 E0.6 skull
  [
    '\u2620\ufe0f',
  ], // ☠️ E1.0 skull and crossbones
  [
    '\u2620',
  ], // ☠ E1.0 skull and crossbones
  [
    '\u{1f4a9}',
  ], // 💩 E0.6 pile of poo
  [
    '\u{1f921}',
  ], // 🤡 E3.0 clown face
  [
    '\u{1f479}',
  ], // 👹 E0.6 ogre
  [
    '\u{1f47a}',
  ], // 👺 E0.6 goblin
  [
    '\u{1f47b}',
  ], // 👻 E0.6 ghost
  [
    '\u{1f47d}',
  ], // 👽 E0.6 alien
  [
    '\u{1f47e}',
  ], // 👾 E0.6 alien monster
  [
    '\u{1f916}',
  ], // 🤖 E1.0 robot
  [
    '\u{1f63a}',
  ], // 😺 E0.6 grinning cat
  [
    '\u{1f638}',
  ], // 😸 E0.6 grinning cat with smiling eyes
  [
    '\u{1f639}',
  ], // 😹 E0.6 cat with tears of joy
  [
    '\u{1f63b}',
  ], // 😻 E0.6 smiling cat with heart-eyes
  [
    '\u{1f63c}',
  ], // 😼 E0.6 cat with wry smile
  [
    '\u{1f63d}',
  ], // 😽 E0.6 kissing cat
  [
    '\u{1f640}',
  ], // 🙀 E0.6 weary cat
  [
    '\u{1f63f}',
  ], // 😿 E0.6 crying cat
  [
    '\u{1f63e}',
  ], // 😾 E0.6 pouting cat
  [
    '\u{1f648}',
  ], // 🙈 E0.6 see-no-evil monkey
  [
    '\u{1f649}',
  ], // 🙉 E0.6 hear-no-evil monkey
  [
    '\u{1f64a}',
  ], // 🙊 E0.6 speak-no-evil monkey
  [
    '\u{1f48c}',
  ], // 💌 E0.6 love letter
  [
    '\u{1f498}',
  ], // 💘 E0.6 heart with arrow
  [
    '\u{1f49d}',
  ], // 💝 E0.6 heart with ribbon
  [
    '\u{1f496}',
  ], // 💖 E0.6 sparkling heart
  [
    '\u{1f497}',
  ], // 💗 E0.6 growing heart
  [
    '\u{1f493}',
  ], // 💓 E0.6 beating heart
  [
    '\u{1f49e}',
  ], // 💞 E0.6 revolving hearts
  [
    '\u{1f495}',
  ], // 💕 E0.6 two hearts
  [
    '\u{1f49f}',
  ], // 💟 E0.6 heart decoration
  [
    '\u2763\ufe0f',
  ], // ❣️ E1.0 heart exclamation
  [
    '\u2763',
  ], // ❣ E1.0 heart exclamation
  [
    '\u{1f494}',
  ], // 💔 E0.6 broken heart
  [
    '\u2764\ufe0f\u200d\u{1f525}',
  ], // ❤️‍🔥 E13.1 heart on fire
  [
    '\u2764\u200d\u{1f525}',
  ], // ❤‍🔥 E13.1 heart on fire
  [
    '\u2764\ufe0f\u200d\u{1fa79}',
  ], // ❤️‍🩹 E13.1 mending heart
  [
    '\u2764\u200d\u{1fa79}',
  ], // ❤‍🩹 E13.1 mending heart
  [
    '\u2764\ufe0f',
  ], // ❤️ E0.6 red heart
  [
    '\u2764',
  ], // ❤ E0.6 red heart
  [
    '\u{1fa77}',
  ], // 🩷 E15.0 pink heart
  [
    '\u{1f9e1}',
  ], // 🧡 E5.0 orange heart
  [
    '\u{1f49b}',
  ], // 💛 E0.6 yellow heart
  [
    '\u{1f49a}',
  ], // 💚 E0.6 green heart
  [
    '\u{1f499}',
  ], // 💙 E0.6 blue heart
  [
    '\u{1fa75}',
  ], // 🩵 E15.0 light blue heart
  [
    '\u{1f49c}',
  ], // 💜 E0.6 purple heart
  [
    '\u{1f90e}',
  ], // 🤎 E12.0 brown heart
  [
    '\u{1f5a4}',
  ], // 🖤 E3.0 black heart
  [
    '\u{1fa76}',
  ], // 🩶 E15.0 grey heart
  [
    '\u{1f90d}',
  ], // 🤍 E12.0 white heart
  [
    '\u{1f48b}',
  ], // 💋 E0.6 kiss mark
  [
    '\u{1f4af}',
  ], // 💯 E0.6 hundred points
  [
    '\u{1f4a2}',
  ], // 💢 E0.6 anger symbol
  [
    '\u{1f4a5}',
  ], // 💥 E0.6 collision
  [
    '\u{1f4ab}',
  ], // 💫 E0.6 dizzy
  [
    '\u{1f4a6}',
  ], // 💦 E0.6 sweat droplets
  [
    '\u{1f4a8}',
  ], // 💨 E0.6 dashing away
  [
    '\u{1f573}\ufe0f',
  ], // 🕳️ E0.7 hole
  [
    '\u{1f573}',
  ], // 🕳 E0.7 hole
  [
    '\u{1f4ac}',
  ], // 💬 E0.6 speech balloon
  [
    '\u{1f441}\ufe0f\u200d\u{1f5e8}\ufe0f',
  ], // 👁️‍🗨️ E2.0 eye in speech bubble
  [
    '\u{1f441}\u200d\u{1f5e8}\ufe0f',
  ], // 👁‍🗨️ E2.0 eye in speech bubble
  [
    '\u{1f441}\ufe0f\u200d\u{1f5e8}',
  ], // 👁️‍🗨 E2.0 eye in speech bubble
  [
    '\u{1f441}\u200d\u{1f5e8}',
  ], // 👁‍🗨 E2.0 eye in speech bubble
  [
    '\u{1f5e8}\ufe0f',
  ], // 🗨️ E2.0 left speech bubble
  [
    '\u{1f5e8}',
  ], // 🗨 E2.0 left speech bubble
  [
    '\u{1f5ef}\ufe0f',
  ], // 🗯️ E0.7 right anger bubble
  [
    '\u{1f5ef}',
  ], // 🗯 E0.7 right anger bubble
  [
    '\u{1f4ad}',
  ], // 💭 E1.0 thought balloon
  [
    '\u{1f4a4}',
  ], // 💤 E0.6 ZZZ
  [
    '\u{1f44b}',
  ], // 👋 E0.6 waving hand
  [
    '\u{1f44b}\u{1f3fb}',
  ], // 👋🏻 E1.0 waving hand: light skin tone
  [
    '\u{1f44b}\u{1f3fc}',
  ], // 👋🏼 E1.0 waving hand: medium-light skin tone
  [
    '\u{1f44b}\u{1f3fd}',
  ], // 👋🏽 E1.0 waving hand: medium skin tone
  [
    '\u{1f44b}\u{1f3fe}',
  ], // 👋🏾 E1.0 waving hand: medium-dark skin tone
  [
    '\u{1f44b}\u{1f3ff}',
  ], // 👋🏿 E1.0 waving hand: dark skin tone
  [
    '\u{1f91a}',
  ], // 🤚 E3.0 raised back of hand
  [
    '\u{1f91a}\u{1f3fb}',
  ], // 🤚🏻 E3.0 raised back of hand: light skin tone
  [
    '\u{1f91a}\u{1f3fc}',
  ], // 🤚🏼 E3.0 raised back of hand: medium-light skin tone
  [
    '\u{1f91a}\u{1f3fd}',
  ], // 🤚🏽 E3.0 raised back of hand: medium skin tone
  [
    '\u{1f91a}\u{1f3fe}',
  ], // 🤚🏾 E3.0 raised back of hand: medium-dark skin tone
  [
    '\u{1f91a}\u{1f3ff}',
  ], // 🤚🏿 E3.0 raised back of hand: dark skin tone
  [
    '\u{1f590}\ufe0f',
  ], // 🖐️ E0.7 hand with fingers splayed
  [
    '\u{1f590}',
  ], // 🖐 E0.7 hand with fingers splayed
  [
    '\u{1f590}\u{1f3fb}',
  ], // 🖐🏻 E1.0 hand with fingers splayed: light skin tone
  [
    '\u{1f590}\u{1f3fc}',
  ], // 🖐🏼 E1.0 hand with fingers splayed: medium-light skin tone
  [
    '\u{1f590}\u{1f3fd}',
  ], // 🖐🏽 E1.0 hand with fingers splayed: medium skin tone
  [
    '\u{1f590}\u{1f3fe}',
  ], // 🖐🏾 E1.0 hand with fingers splayed: medium-dark skin tone
  [
    '\u{1f590}\u{1f3ff}',
  ], // 🖐🏿 E1.0 hand with fingers splayed: dark skin tone
  [
    '\u270b',
  ], // ✋ E0.6 raised hand
  [
    '\u270b\u{1f3fb}',
  ], // ✋🏻 E1.0 raised hand: light skin tone
  [
    '\u270b\u{1f3fc}',
  ], // ✋🏼 E1.0 raised hand: medium-light skin tone
  [
    '\u270b\u{1f3fd}',
  ], // ✋🏽 E1.0 raised hand: medium skin tone
  [
    '\u270b\u{1f3fe}',
  ], // ✋🏾 E1.0 raised hand: medium-dark skin tone
  [
    '\u270b\u{1f3ff}',
  ], // ✋🏿 E1.0 raised hand: dark skin tone
  [
    '\u{1f596}',
  ], // 🖖 E1.0 vulcan salute
  [
    '\u{1f596}\u{1f3fb}',
  ], // 🖖🏻 E1.0 vulcan salute: light skin tone
  [
    '\u{1f596}\u{1f3fc}',
  ], // 🖖🏼 E1.0 vulcan salute: medium-light skin tone
  [
    '\u{1f596}\u{1f3fd}',
  ], // 🖖🏽 E1.0 vulcan salute: medium skin tone
  [
    '\u{1f596}\u{1f3fe}',
  ], // 🖖🏾 E1.0 vulcan salute: medium-dark skin tone
  [
    '\u{1f596}\u{1f3ff}',
  ], // 🖖🏿 E1.0 vulcan salute: dark skin tone
  [
    '\u{1faf1}',
  ], // 🫱 E14.0 rightwards hand
  [
    '\u{1faf1}\u{1f3fb}',
  ], // 🫱🏻 E14.0 rightwards hand: light skin tone
  [
    '\u{1faf1}\u{1f3fc}',
  ], // 🫱🏼 E14.0 rightwards hand: medium-light skin tone
  [
    '\u{1faf1}\u{1f3fd}',
  ], // 🫱🏽 E14.0 rightwards hand: medium skin tone
  [
    '\u{1faf1}\u{1f3fe}',
  ], // 🫱🏾 E14.0 rightwards hand: medium-dark skin tone
  [
    '\u{1faf1}\u{1f3ff}',
  ], // 🫱🏿 E14.0 rightwards hand: dark skin tone
  [
    '\u{1faf2}',
  ], // 🫲 E14.0 leftwards hand
  [
    '\u{1faf2}\u{1f3fb}',
  ], // 🫲🏻 E14.0 leftwards hand: light skin tone
  [
    '\u{1faf2}\u{1f3fc}',
  ], // 🫲🏼 E14.0 leftwards hand: medium-light skin tone
  [
    '\u{1faf2}\u{1f3fd}',
  ], // 🫲🏽 E14.0 leftwards hand: medium skin tone
  [
    '\u{1faf2}\u{1f3fe}',
  ], // 🫲🏾 E14.0 leftwards hand: medium-dark skin tone
  [
    '\u{1faf2}\u{1f3ff}',
  ], // 🫲🏿 E14.0 leftwards hand: dark skin tone
  [
    '\u{1faf3}',
  ], // 🫳 E14.0 palm down hand
  [
    '\u{1faf3}\u{1f3fb}',
  ], // 🫳🏻 E14.0 palm down hand: light skin tone
  [
    '\u{1faf3}\u{1f3fc}',
  ], // 🫳🏼 E14.0 palm down hand: medium-light skin tone
  [
    '\u{1faf3}\u{1f3fd}',
  ], // 🫳🏽 E14.0 palm down hand: medium skin tone
  [
    '\u{1faf3}\u{1f3fe}',
  ], // 🫳🏾 E14.0 palm down hand: medium-dark skin tone
  [
    '\u{1faf3}\u{1f3ff}',
  ], // 🫳🏿 E14.0 palm down hand: dark skin tone
  [
    '\u{1faf4}',
  ], // 🫴 E14.0 palm up hand
  [
    '\u{1faf4}\u{1f3fb}',
  ], // 🫴🏻 E14.0 palm up hand: light skin tone
  [
    '\u{1faf4}\u{1f3fc}',
  ], // 🫴🏼 E14.0 palm up hand: medium-light skin tone
  [
    '\u{1faf4}\u{1f3fd}',
  ], // 🫴🏽 E14.0 palm up hand: medium skin tone
  [
    '\u{1faf4}\u{1f3fe}',
  ], // 🫴🏾 E14.0 palm up hand: medium-dark skin tone
  [
    '\u{1faf4}\u{1f3ff}',
  ], // 🫴🏿 E14.0 palm up hand: dark skin tone
  [
    '\u{1faf7}',
  ], // 🫷 E15.0 leftwards pushing hand
  [
    '\u{1faf7}\u{1f3fb}',
  ], // 🫷🏻 E15.0 leftwards pushing hand: light skin tone
  [
    '\u{1faf7}\u{1f3fc}',
  ], // 🫷🏼 E15.0 leftwards pushing hand: medium-light skin tone
  [
    '\u{1faf7}\u{1f3fd}',
  ], // 🫷🏽 E15.0 leftwards pushing hand: medium skin tone
  [
    '\u{1faf7}\u{1f3fe}',
  ], // 🫷🏾 E15.0 leftwards pushing hand: medium-dark skin tone
  [
    '\u{1faf7}\u{1f3ff}',
  ], // 🫷🏿 E15.0 leftwards pushing hand: dark skin tone
  [
    '\u{1faf8}',
  ], // 🫸 E15.0 rightwards pushing hand
  [
    '\u{1faf8}\u{1f3fb}',
  ], // 🫸🏻 E15.0 rightwards pushing hand: light skin tone
  [
    '\u{1faf8}\u{1f3fc}',
  ], // 🫸🏼 E15.0 rightwards pushing hand: medium-light skin tone
  [
    '\u{1faf8}\u{1f3fd}',
  ], // 🫸🏽 E15.0 rightwards pushing hand: medium skin tone
  [
    '\u{1faf8}\u{1f3fe}',
  ], // 🫸🏾 E15.0 rightwards pushing hand: medium-dark skin tone
  [
    '\u{1faf8}\u{1f3ff}',
  ], // 🫸🏿 E15.0 rightwards pushing hand: dark skin tone
  [
    '\u{1f44c}',
  ], // 👌 E0.6 OK hand
  [
    '\u{1f44c}\u{1f3fb}',
  ], // 👌🏻 E1.0 OK hand: light skin tone
  [
    '\u{1f44c}\u{1f3fc}',
  ], // 👌🏼 E1.0 OK hand: medium-light skin tone
  [
    '\u{1f44c}\u{1f3fd}',
  ], // 👌🏽 E1.0 OK hand: medium skin tone
  [
    '\u{1f44c}\u{1f3fe}',
  ], // 👌🏾 E1.0 OK hand: medium-dark skin tone
  [
    '\u{1f44c}\u{1f3ff}',
  ], // 👌🏿 E1.0 OK hand: dark skin tone
  [
    '\u{1f90c}',
  ], // 🤌 E13.0 pinched fingers
  [
    '\u{1f90c}\u{1f3fb}',
  ], // 🤌🏻 E13.0 pinched fingers: light skin tone
  [
    '\u{1f90c}\u{1f3fc}',
  ], // 🤌🏼 E13.0 pinched fingers: medium-light skin tone
  [
    '\u{1f90c}\u{1f3fd}',
  ], // 🤌🏽 E13.0 pinched fingers: medium skin tone
  [
    '\u{1f90c}\u{1f3fe}',
  ], // 🤌🏾 E13.0 pinched fingers: medium-dark skin tone
  [
    '\u{1f90c}\u{1f3ff}',
  ], // 🤌🏿 E13.0 pinched fingers: dark skin tone
  [
    '\u{1f90f}',
  ], // 🤏 E12.0 pinching hand
  [
    '\u{1f90f}\u{1f3fb}',
  ], // 🤏🏻 E12.0 pinching hand: light skin tone
  [
    '\u{1f90f}\u{1f3fc}',
  ], // 🤏🏼 E12.0 pinching hand: medium-light skin tone
  [
    '\u{1f90f}\u{1f3fd}',
  ], // 🤏🏽 E12.0 pinching hand: medium skin tone
  [
    '\u{1f90f}\u{1f3fe}',
  ], // 🤏🏾 E12.0 pinching hand: medium-dark skin tone
  [
    '\u{1f90f}\u{1f3ff}',
  ], // 🤏🏿 E12.0 pinching hand: dark skin tone
  [
    '\u270c\ufe0f',
  ], // ✌️ E0.6 victory hand
  [
    '\u270c',
  ], // ✌ E0.6 victory hand
  [
    '\u270c\u{1f3fb}',
  ], // ✌🏻 E1.0 victory hand: light skin tone
  [
    '\u270c\u{1f3fc}',
  ], // ✌🏼 E1.0 victory hand: medium-light skin tone
  [
    '\u270c\u{1f3fd}',
  ], // ✌🏽 E1.0 victory hand: medium skin tone
  [
    '\u270c\u{1f3fe}',
  ], // ✌🏾 E1.0 victory hand: medium-dark skin tone
  [
    '\u270c\u{1f3ff}',
  ], // ✌🏿 E1.0 victory hand: dark skin tone
  [
    '\u{1f91e}',
  ], // 🤞 E3.0 crossed fingers
  [
    '\u{1f91e}\u{1f3fb}',
  ], // 🤞🏻 E3.0 crossed fingers: light skin tone
  [
    '\u{1f91e}\u{1f3fc}',
  ], // 🤞🏼 E3.0 crossed fingers: medium-light skin tone
  [
    '\u{1f91e}\u{1f3fd}',
  ], // 🤞🏽 E3.0 crossed fingers: medium skin tone
  [
    '\u{1f91e}\u{1f3fe}',
  ], // 🤞🏾 E3.0 crossed fingers: medium-dark skin tone
  [
    '\u{1f91e}\u{1f3ff}',
  ], // 🤞🏿 E3.0 crossed fingers: dark skin tone
  [
    '\u{1faf0}',
  ], // 🫰 E14.0 hand with index finger and thumb crossed
  [
    '\u{1faf0}\u{1f3fb}',
  ], // 🫰🏻 E14.0 hand with index finger and thumb crossed: light skin tone
  [
    '\u{1faf0}\u{1f3fc}',
  ], // 🫰🏼 E14.0 hand with index finger and thumb crossed: medium-light skin tone
  [
    '\u{1faf0}\u{1f3fd}',
  ], // 🫰🏽 E14.0 hand with index finger and thumb crossed: medium skin tone
  [
    '\u{1faf0}\u{1f3fe}',
  ], // 🫰🏾 E14.0 hand with index finger and thumb crossed: medium-dark skin tone
  [
    '\u{1faf0}\u{1f3ff}',
  ], // 🫰🏿 E14.0 hand with index finger and thumb crossed: dark skin tone
  [
    '\u{1f91f}',
  ], // 🤟 E5.0 love-you gesture
  [
    '\u{1f91f}\u{1f3fb}',
  ], // 🤟🏻 E5.0 love-you gesture: light skin tone
  [
    '\u{1f91f}\u{1f3fc}',
  ], // 🤟🏼 E5.0 love-you gesture: medium-light skin tone
  [
    '\u{1f91f}\u{1f3fd}',
  ], // 🤟🏽 E5.0 love-you gesture: medium skin tone
  [
    '\u{1f91f}\u{1f3fe}',
  ], // 🤟🏾 E5.0 love-you gesture: medium-dark skin tone
  [
    '\u{1f91f}\u{1f3ff}',
  ], // 🤟🏿 E5.0 love-you gesture: dark skin tone
  [
    '\u{1f918}',
  ], // 🤘 E1.0 sign of the horns
  [
    '\u{1f918}\u{1f3fb}',
  ], // 🤘🏻 E1.0 sign of the horns: light skin tone
  [
    '\u{1f918}\u{1f3fc}',
  ], // 🤘🏼 E1.0 sign of the horns: medium-light skin tone
  [
    '\u{1f918}\u{1f3fd}',
  ], // 🤘🏽 E1.0 sign of the horns: medium skin tone
  [
    '\u{1f918}\u{1f3fe}',
  ], // 🤘🏾 E1.0 sign of the horns: medium-dark skin tone
  [
    '\u{1f918}\u{1f3ff}',
  ], // 🤘🏿 E1.0 sign of the horns: dark skin tone
  [
    '\u{1f919}',
  ], // 🤙 E3.0 call me hand
  [
    '\u{1f919}\u{1f3fb}',
  ], // 🤙🏻 E3.0 call me hand: light skin tone
  [
    '\u{1f919}\u{1f3fc}',
  ], // 🤙🏼 E3.0 call me hand: medium-light skin tone
  [
    '\u{1f919}\u{1f3fd}',
  ], // 🤙🏽 E3.0 call me hand: medium skin tone
  [
    '\u{1f919}\u{1f3fe}',
  ], // 🤙🏾 E3.0 call me hand: medium-dark skin tone
  [
    '\u{1f919}\u{1f3ff}',
  ], // 🤙🏿 E3.0 call me hand: dark skin tone
  [
    '\u{1f448}',
  ], // 👈 E0.6 backhand index pointing left
  [
    '\u{1f448}\u{1f3fb}',
  ], // 👈🏻 E1.0 backhand index pointing left: light skin tone
  [
    '\u{1f448}\u{1f3fc}',
  ], // 👈🏼 E1.0 backhand index pointing left: medium-light skin tone
  [
    '\u{1f448}\u{1f3fd}',
  ], // 👈🏽 E1.0 backhand index pointing left: medium skin tone
  [
    '\u{1f448}\u{1f3fe}',
  ], // 👈🏾 E1.0 backhand index pointing left: medium-dark skin tone
  [
    '\u{1f448}\u{1f3ff}',
  ], // 👈🏿 E1.0 backhand index pointing left: dark skin tone
  [
    '\u{1f449}',
  ], // 👉 E0.6 backhand index pointing right
  [
    '\u{1f449}\u{1f3fb}',
  ], // 👉🏻 E1.0 backhand index pointing right: light skin tone
  [
    '\u{1f449}\u{1f3fc}',
  ], // 👉🏼 E1.0 backhand index pointing right: medium-light skin tone
  [
    '\u{1f449}\u{1f3fd}',
  ], // 👉🏽 E1.0 backhand index pointing right: medium skin tone
  [
    '\u{1f449}\u{1f3fe}',
  ], // 👉🏾 E1.0 backhand index pointing right: medium-dark skin tone
  [
    '\u{1f449}\u{1f3ff}',
  ], // 👉🏿 E1.0 backhand index pointing right: dark skin tone
  [
    '\u{1f446}',
  ], // 👆 E0.6 backhand index pointing up
  [
    '\u{1f446}\u{1f3fb}',
  ], // 👆🏻 E1.0 backhand index pointing up: light skin tone
  [
    '\u{1f446}\u{1f3fc}',
  ], // 👆🏼 E1.0 backhand index pointing up: medium-light skin tone
  [
    '\u{1f446}\u{1f3fd}',
  ], // 👆🏽 E1.0 backhand index pointing up: medium skin tone
  [
    '\u{1f446}\u{1f3fe}',
  ], // 👆🏾 E1.0 backhand index pointing up: medium-dark skin tone
  [
    '\u{1f446}\u{1f3ff}',
  ], // 👆🏿 E1.0 backhand index pointing up: dark skin tone
  [
    '\u{1f595}',
  ], // 🖕 E1.0 middle finger
  [
    '\u{1f595}\u{1f3fb}',
  ], // 🖕🏻 E1.0 middle finger: light skin tone
  [
    '\u{1f595}\u{1f3fc}',
  ], // 🖕🏼 E1.0 middle finger: medium-light skin tone
  [
    '\u{1f595}\u{1f3fd}',
  ], // 🖕🏽 E1.0 middle finger: medium skin tone
  [
    '\u{1f595}\u{1f3fe}',
  ], // 🖕🏾 E1.0 middle finger: medium-dark skin tone
  [
    '\u{1f595}\u{1f3ff}',
  ], // 🖕🏿 E1.0 middle finger: dark skin tone
  [
    '\u{1f447}',
  ], // 👇 E0.6 backhand index pointing down
  [
    '\u{1f447}\u{1f3fb}',
  ], // 👇🏻 E1.0 backhand index pointing down: light skin tone
  [
    '\u{1f447}\u{1f3fc}',
  ], // 👇🏼 E1.0 backhand index pointing down: medium-light skin tone
  [
    '\u{1f447}\u{1f3fd}',
  ], // 👇🏽 E1.0 backhand index pointing down: medium skin tone
  [
    '\u{1f447}\u{1f3fe}',
  ], // 👇🏾 E1.0 backhand index pointing down: medium-dark skin tone
  [
    '\u{1f447}\u{1f3ff}',
  ], // 👇🏿 E1.0 backhand index pointing down: dark skin tone
  [
    '\u261d\ufe0f',
  ], // ☝️ E0.6 index pointing up
  [
    '\u261d',
  ], // ☝ E0.6 index pointing up
  [
    '\u261d\u{1f3fb}',
  ], // ☝🏻 E1.0 index pointing up: light skin tone
  [
    '\u261d\u{1f3fc}',
  ], // ☝🏼 E1.0 index pointing up: medium-light skin tone
  [
    '\u261d\u{1f3fd}',
  ], // ☝🏽 E1.0 index pointing up: medium skin tone
  [
    '\u261d\u{1f3fe}',
  ], // ☝🏾 E1.0 index pointing up: medium-dark skin tone
  [
    '\u261d\u{1f3ff}',
  ], // ☝🏿 E1.0 index pointing up: dark skin tone
  [
    '\u{1faf5}',
  ], // 🫵 E14.0 index pointing at the viewer
  [
    '\u{1faf5}\u{1f3fb}',
  ], // 🫵🏻 E14.0 index pointing at the viewer: light skin tone
  [
    '\u{1faf5}\u{1f3fc}',
  ], // 🫵🏼 E14.0 index pointing at the viewer: medium-light skin tone
  [
    '\u{1faf5}\u{1f3fd}',
  ], // 🫵🏽 E14.0 index pointing at the viewer: medium skin tone
  [
    '\u{1faf5}\u{1f3fe}',
  ], // 🫵🏾 E14.0 index pointing at the viewer: medium-dark skin tone
  [
    '\u{1faf5}\u{1f3ff}',
  ], // 🫵🏿 E14.0 index pointing at the viewer: dark skin tone
  [
    '\u{1f44d}',
  ], // 👍 E0.6 thumbs up
  [
    '\u{1f44d}\u{1f3fb}',
  ], // 👍🏻 E1.0 thumbs up: light skin tone
  [
    '\u{1f44d}\u{1f3fc}',
  ], // 👍🏼 E1.0 thumbs up: medium-light skin tone
  [
    '\u{1f44d}\u{1f3fd}',
  ], // 👍🏽 E1.0 thumbs up: medium skin tone
  [
    '\u{1f44d}\u{1f3fe}',
  ], // 👍🏾 E1.0 thumbs up: medium-dark skin tone
  [
    '\u{1f44d}\u{1f3ff}',
  ], // 👍🏿 E1.0 thumbs up: dark skin tone
  [
    '\u{1f44e}',
  ], // 👎 E0.6 thumbs down
  [
    '\u{1f44e}\u{1f3fb}',
  ], // 👎🏻 E1.0 thumbs down: light skin tone
  [
    '\u{1f44e}\u{1f3fc}',
  ], // 👎🏼 E1.0 thumbs down: medium-light skin tone
  [
    '\u{1f44e}\u{1f3fd}',
  ], // 👎🏽 E1.0 thumbs down: medium skin tone
  [
    '\u{1f44e}\u{1f3fe}',
  ], // 👎🏾 E1.0 thumbs down: medium-dark skin tone
  [
    '\u{1f44e}\u{1f3ff}',
  ], // 👎🏿 E1.0 thumbs down: dark skin tone
  [
    '\u270a',
  ], // ✊ E0.6 raised fist
  [
    '\u270a\u{1f3fb}',
  ], // ✊🏻 E1.0 raised fist: light skin tone
  [
    '\u270a\u{1f3fc}',
  ], // ✊🏼 E1.0 raised fist: medium-light skin tone
  [
    '\u270a\u{1f3fd}',
  ], // ✊🏽 E1.0 raised fist: medium skin tone
  [
    '\u270a\u{1f3fe}',
  ], // ✊🏾 E1.0 raised fist: medium-dark skin tone
  [
    '\u270a\u{1f3ff}',
  ], // ✊🏿 E1.0 raised fist: dark skin tone
  [
    '\u{1f44a}',
  ], // 👊 E0.6 oncoming fist
  [
    '\u{1f44a}\u{1f3fb}',
  ], // 👊🏻 E1.0 oncoming fist: light skin tone
  [
    '\u{1f44a}\u{1f3fc}',
  ], // 👊🏼 E1.0 oncoming fist: medium-light skin tone
  [
    '\u{1f44a}\u{1f3fd}',
  ], // 👊🏽 E1.0 oncoming fist: medium skin tone
  [
    '\u{1f44a}\u{1f3fe}',
  ], // 👊🏾 E1.0 oncoming fist: medium-dark skin tone
  [
    '\u{1f44a}\u{1f3ff}',
  ], // 👊🏿 E1.0 oncoming fist: dark skin tone
  [
    '\u{1f91b}',
  ], // 🤛 E3.0 left-facing fist
  [
    '\u{1f91b}\u{1f3fb}',
  ], // 🤛🏻 E3.0 left-facing fist: light skin tone
  [
    '\u{1f91b}\u{1f3fc}',
  ], // 🤛🏼 E3.0 left-facing fist: medium-light skin tone
  [
    '\u{1f91b}\u{1f3fd}',
  ], // 🤛🏽 E3.0 left-facing fist: medium skin tone
  [
    '\u{1f91b}\u{1f3fe}',
  ], // 🤛🏾 E3.0 left-facing fist: medium-dark skin tone
  [
    '\u{1f91b}\u{1f3ff}',
  ], // 🤛🏿 E3.0 left-facing fist: dark skin tone
  [
    '\u{1f91c}',
  ], // 🤜 E3.0 right-facing fist
  [
    '\u{1f91c}\u{1f3fb}',
  ], // 🤜🏻 E3.0 right-facing fist: light skin tone
  [
    '\u{1f91c}\u{1f3fc}',
  ], // 🤜🏼 E3.0 right-facing fist: medium-light skin tone
  [
    '\u{1f91c}\u{1f3fd}',
  ], // 🤜🏽 E3.0 right-facing fist: medium skin tone
  [
    '\u{1f91c}\u{1f3fe}',
  ], // 🤜🏾 E3.0 right-facing fist: medium-dark skin tone
  [
    '\u{1f91c}\u{1f3ff}',
  ], // 🤜🏿 E3.0 right-facing fist: dark skin tone
  [
    '\u{1f44f}',
  ], // 👏 E0.6 clapping hands
  [
    '\u{1f44f}\u{1f3fb}',
  ], // 👏🏻 E1.0 clapping hands: light skin tone
  [
    '\u{1f44f}\u{1f3fc}',
  ], // 👏🏼 E1.0 clapping hands: medium-light skin tone
  [
    '\u{1f44f}\u{1f3fd}',
  ], // 👏🏽 E1.0 clapping hands: medium skin tone
  [
    '\u{1f44f}\u{1f3fe}',
  ], // 👏🏾 E1.0 clapping hands: medium-dark skin tone
  [
    '\u{1f44f}\u{1f3ff}',
  ], // 👏🏿 E1.0 clapping hands: dark skin tone
  [
    '\u{1f64c}',
  ], // 🙌 E0.6 raising hands
  [
    '\u{1f64c}\u{1f3fb}',
  ], // 🙌🏻 E1.0 raising hands: light skin tone
  [
    '\u{1f64c}\u{1f3fc}',
  ], // 🙌🏼 E1.0 raising hands: medium-light skin tone
  [
    '\u{1f64c}\u{1f3fd}',
  ], // 🙌🏽 E1.0 raising hands: medium skin tone
  [
    '\u{1f64c}\u{1f3fe}',
  ], // 🙌🏾 E1.0 raising hands: medium-dark skin tone
  [
    '\u{1f64c}\u{1f3ff}',
  ], // 🙌🏿 E1.0 raising hands: dark skin tone
  [
    '\u{1faf6}',
  ], // 🫶 E14.0 heart hands
  [
    '\u{1faf6}\u{1f3fb}',
  ], // 🫶🏻 E14.0 heart hands: light skin tone
  [
    '\u{1faf6}\u{1f3fc}',
  ], // 🫶🏼 E14.0 heart hands: medium-light skin tone
  [
    '\u{1faf6}\u{1f3fd}',
  ], // 🫶🏽 E14.0 heart hands: medium skin tone
  [
    '\u{1faf6}\u{1f3fe}',
  ], // 🫶🏾 E14.0 heart hands: medium-dark skin tone
  [
    '\u{1faf6}\u{1f3ff}',
  ], // 🫶🏿 E14.0 heart hands: dark skin tone
  [
    '\u{1f450}',
  ], // 👐 E0.6 open hands
  [
    '\u{1f450}\u{1f3fb}',
  ], // 👐🏻 E1.0 open hands: light skin tone
  [
    '\u{1f450}\u{1f3fc}',
  ], // 👐🏼 E1.0 open hands: medium-light skin tone
  [
    '\u{1f450}\u{1f3fd}',
  ], // 👐🏽 E1.0 open hands: medium skin tone
  [
    '\u{1f450}\u{1f3fe}',
  ], // 👐🏾 E1.0 open hands: medium-dark skin tone
  [
    '\u{1f450}\u{1f3ff}',
  ], // 👐🏿 E1.0 open hands: dark skin tone
  [
    '\u{1f932}',
  ], // 🤲 E5.0 palms up together
  [
    '\u{1f932}\u{1f3fb}',
  ], // 🤲🏻 E5.0 palms up together: light skin tone
  [
    '\u{1f932}\u{1f3fc}',
  ], // 🤲🏼 E5.0 palms up together: medium-light skin tone
  [
    '\u{1f932}\u{1f3fd}',
  ], // 🤲🏽 E5.0 palms up together: medium skin tone
  [
    '\u{1f932}\u{1f3fe}',
  ], // 🤲🏾 E5.0 palms up together: medium-dark skin tone
  [
    '\u{1f932}\u{1f3ff}',
  ], // 🤲🏿 E5.0 palms up together: dark skin tone
  [
    '\u{1f91d}',
  ], // 🤝 E3.0 handshake
  [
    '\u{1f91d}\u{1f3fb}',
  ], // 🤝🏻 E14.0 handshake: light skin tone
  [
    '\u{1f91d}\u{1f3fc}',
  ], // 🤝🏼 E14.0 handshake: medium-light skin tone
  [
    '\u{1f91d}\u{1f3fd}',
  ], // 🤝🏽 E14.0 handshake: medium skin tone
  [
    '\u{1f91d}\u{1f3fe}',
  ], // 🤝🏾 E14.0 handshake: medium-dark skin tone
  [
    '\u{1f91d}\u{1f3ff}',
  ], // 🤝🏿 E14.0 handshake: dark skin tone
  [
    '\u{1faf1}\u{1f3fb}\u200d\u{1faf2}\u{1f3fc}',
  ], // 🫱🏻‍🫲🏼 E14.0 handshake: light skin tone, medium-light skin tone
  [
    '\u{1faf1}\u{1f3fb}\u200d\u{1faf2}\u{1f3fd}',
  ], // 🫱🏻‍🫲🏽 E14.0 handshake: light skin tone, medium skin tone
  [
    '\u{1faf1}\u{1f3fb}\u200d\u{1faf2}\u{1f3fe}',
  ], // 🫱🏻‍🫲🏾 E14.0 handshake: light skin tone, medium-dark skin tone
  [
    '\u{1faf1}\u{1f3fb}\u200d\u{1faf2}\u{1f3ff}',
  ], // 🫱🏻‍🫲🏿 E14.0 handshake: light skin tone, dark skin tone
  [
    '\u{1faf1}\u{1f3fc}\u200d\u{1faf2}\u{1f3fb}',
  ], // 🫱🏼‍🫲🏻 E14.0 handshake: medium-light skin tone, light skin tone
  [
    '\u{1faf1}\u{1f3fc}\u200d\u{1faf2}\u{1f3fd}',
  ], // 🫱🏼‍🫲🏽 E14.0 handshake: medium-light skin tone, medium skin tone
  [
    '\u{1faf1}\u{1f3fc}\u200d\u{1faf2}\u{1f3fe}',
  ], // 🫱🏼‍🫲🏾 E14.0 handshake: medium-light skin tone, medium-dark skin tone
  [
    '\u{1faf1}\u{1f3fc}\u200d\u{1faf2}\u{1f3ff}',
  ], // 🫱🏼‍🫲🏿 E14.0 handshake: medium-light skin tone, dark skin tone
  [
    '\u{1faf1}\u{1f3fd}\u200d\u{1faf2}\u{1f3fb}',
  ], // 🫱🏽‍🫲🏻 E14.0 handshake: medium skin tone, light skin tone
  [
    '\u{1faf1}\u{1f3fd}\u200d\u{1faf2}\u{1f3fc}',
  ], // 🫱🏽‍🫲🏼 E14.0 handshake: medium skin tone, medium-light skin tone
  [
    '\u{1faf1}\u{1f3fd}\u200d\u{1faf2}\u{1f3fe}',
  ], // 🫱🏽‍🫲🏾 E14.0 handshake: medium skin tone, medium-dark skin tone
  [
    '\u{1faf1}\u{1f3fd}\u200d\u{1faf2}\u{1f3ff}',
  ], // 🫱🏽‍🫲🏿 E14.0 handshake: medium skin tone, dark skin tone
  [
    '\u{1faf1}\u{1f3fe}\u200d\u{1faf2}\u{1f3fb}',
  ], // 🫱🏾‍🫲🏻 E14.0 handshake: medium-dark skin tone, light skin tone
  [
    '\u{1faf1}\u{1f3fe}\u200d\u{1faf2}\u{1f3fc}',
  ], // 🫱🏾‍🫲🏼 E14.0 handshake: medium-dark skin tone, medium-light skin tone
  [
    '\u{1faf1}\u{1f3fe}\u200d\u{1faf2}\u{1f3fd}',
  ], // 🫱🏾‍🫲🏽 E14.0 handshake: medium-dark skin tone, medium skin tone
  [
    '\u{1faf1}\u{1f3fe}\u200d\u{1faf2}\u{1f3ff}',
  ], // 🫱🏾‍🫲🏿 E14.0 handshake: medium-dark skin tone, dark skin tone
  [
    '\u{1faf1}\u{1f3ff}\u200d\u{1faf2}\u{1f3fb}',
  ], // 🫱🏿‍🫲🏻 E14.0 handshake: dark skin tone, light skin tone
  [
    '\u{1faf1}\u{1f3ff}\u200d\u{1faf2}\u{1f3fc}',
  ], // 🫱🏿‍🫲🏼 E14.0 handshake: dark skin tone, medium-light skin tone
  [
    '\u{1faf1}\u{1f3ff}\u200d\u{1faf2}\u{1f3fd}',
  ], // 🫱🏿‍🫲🏽 E14.0 handshake: dark skin tone, medium skin tone
  [
    '\u{1faf1}\u{1f3ff}\u200d\u{1faf2}\u{1f3fe}',
  ], // 🫱🏿‍🫲🏾 E14.0 handshake: dark skin tone, medium-dark skin tone
  [
    '\u{1f64f}',
  ], // 🙏 E0.6 folded hands
  [
    '\u{1f64f}\u{1f3fb}',
  ], // 🙏🏻 E1.0 folded hands: light skin tone
  [
    '\u{1f64f}\u{1f3fc}',
  ], // 🙏🏼 E1.0 folded hands: medium-light skin tone
  [
    '\u{1f64f}\u{1f3fd}',
  ], // 🙏🏽 E1.0 folded hands: medium skin tone
  [
    '\u{1f64f}\u{1f3fe}',
  ], // 🙏🏾 E1.0 folded hands: medium-dark skin tone
  [
    '\u{1f64f}\u{1f3ff}',
  ], // 🙏🏿 E1.0 folded hands: dark skin tone
  [
    '\u270d\ufe0f',
  ], // ✍️ E0.7 writing hand
  [
    '\u270d',
  ], // ✍ E0.7 writing hand
  [
    '\u270d\u{1f3fb}',
  ], // ✍🏻 E1.0 writing hand: light skin tone
  [
    '\u270d\u{1f3fc}',
  ], // ✍🏼 E1.0 writing hand: medium-light skin tone
  [
    '\u270d\u{1f3fd}',
  ], // ✍🏽 E1.0 writing hand: medium skin tone
  [
    '\u270d\u{1f3fe}',
  ], // ✍🏾 E1.0 writing hand: medium-dark skin tone
  [
    '\u270d\u{1f3ff}',
  ], // ✍🏿 E1.0 writing hand: dark skin tone
  [
    '\u{1f485}',
  ], // 💅 E0.6 nail polish
  [
    '\u{1f485}\u{1f3fb}',
  ], // 💅🏻 E1.0 nail polish: light skin tone
  [
    '\u{1f485}\u{1f3fc}',
  ], // 💅🏼 E1.0 nail polish: medium-light skin tone
  [
    '\u{1f485}\u{1f3fd}',
  ], // 💅🏽 E1.0 nail polish: medium skin tone
  [
    '\u{1f485}\u{1f3fe}',
  ], // 💅🏾 E1.0 nail polish: medium-dark skin tone
  [
    '\u{1f485}\u{1f3ff}',
  ], // 💅🏿 E1.0 nail polish: dark skin tone
  [
    '\u{1f933}',
  ], // 🤳 E3.0 selfie
  [
    '\u{1f933}\u{1f3fb}',
  ], // 🤳🏻 E3.0 selfie: light skin tone
  [
    '\u{1f933}\u{1f3fc}',
  ], // 🤳🏼 E3.0 selfie: medium-light skin tone
  [
    '\u{1f933}\u{1f3fd}',
  ], // 🤳🏽 E3.0 selfie: medium skin tone
  [
    '\u{1f933}\u{1f3fe}',
  ], // 🤳🏾 E3.0 selfie: medium-dark skin tone
  [
    '\u{1f933}\u{1f3ff}',
  ], // 🤳🏿 E3.0 selfie: dark skin tone
  [
    '\u{1f4aa}',
  ], // 💪 E0.6 flexed biceps
  [
    '\u{1f4aa}\u{1f3fb}',
  ], // 💪🏻 E1.0 flexed biceps: light skin tone
  [
    '\u{1f4aa}\u{1f3fc}',
  ], // 💪🏼 E1.0 flexed biceps: medium-light skin tone
  [
    '\u{1f4aa}\u{1f3fd}',
  ], // 💪🏽 E1.0 flexed biceps: medium skin tone
  [
    '\u{1f4aa}\u{1f3fe}',
  ], // 💪🏾 E1.0 flexed biceps: medium-dark skin tone
  [
    '\u{1f4aa}\u{1f3ff}',
  ], // 💪🏿 E1.0 flexed biceps: dark skin tone
  [
    '\u{1f9be}',
  ], // 🦾 E12.0 mechanical arm
  [
    '\u{1f9bf}',
  ], // 🦿 E12.0 mechanical leg
  [
    '\u{1f9b5}',
  ], // 🦵 E11.0 leg
  [
    '\u{1f9b5}\u{1f3fb}',
  ], // 🦵🏻 E11.0 leg: light skin tone
  [
    '\u{1f9b5}\u{1f3fc}',
  ], // 🦵🏼 E11.0 leg: medium-light skin tone
  [
    '\u{1f9b5}\u{1f3fd}',
  ], // 🦵🏽 E11.0 leg: medium skin tone
  [
    '\u{1f9b5}\u{1f3fe}',
  ], // 🦵🏾 E11.0 leg: medium-dark skin tone
  [
    '\u{1f9b5}\u{1f3ff}',
  ], // 🦵🏿 E11.0 leg: dark skin tone
  [
    '\u{1f9b6}',
  ], // 🦶 E11.0 foot
  [
    '\u{1f9b6}\u{1f3fb}',
  ], // 🦶🏻 E11.0 foot: light skin tone
  [
    '\u{1f9b6}\u{1f3fc}',
  ], // 🦶🏼 E11.0 foot: medium-light skin tone
  [
    '\u{1f9b6}\u{1f3fd}',
  ], // 🦶🏽 E11.0 foot: medium skin tone
  [
    '\u{1f9b6}\u{1f3fe}',
  ], // 🦶🏾 E11.0 foot: medium-dark skin tone
  [
    '\u{1f9b6}\u{1f3ff}',
  ], // 🦶🏿 E11.0 foot: dark skin tone
  [
    '\u{1f442}',
  ], // 👂 E0.6 ear
  [
    '\u{1f442}\u{1f3fb}',
  ], // 👂🏻 E1.0 ear: light skin tone
  [
    '\u{1f442}\u{1f3fc}',
  ], // 👂🏼 E1.0 ear: medium-light skin tone
  [
    '\u{1f442}\u{1f3fd}',
  ], // 👂🏽 E1.0 ear: medium skin tone
  [
    '\u{1f442}\u{1f3fe}',
  ], // 👂🏾 E1.0 ear: medium-dark skin tone
  [
    '\u{1f442}\u{1f3ff}',
  ], // 👂🏿 E1.0 ear: dark skin tone
  [
    '\u{1f9bb}',
  ], // 🦻 E12.0 ear with hearing aid
  [
    '\u{1f9bb}\u{1f3fb}',
  ], // 🦻🏻 E12.0 ear with hearing aid: light skin tone
  [
    '\u{1f9bb}\u{1f3fc}',
  ], // 🦻🏼 E12.0 ear with hearing aid: medium-light skin tone
  [
    '\u{1f9bb}\u{1f3fd}',
  ], // 🦻🏽 E12.0 ear with hearing aid: medium skin tone
  [
    '\u{1f9bb}\u{1f3fe}',
  ], // 🦻🏾 E12.0 ear with hearing aid: medium-dark skin tone
  [
    '\u{1f9bb}\u{1f3ff}',
  ], // 🦻🏿 E12.0 ear with hearing aid: dark skin tone
  [
    '\u{1f443}',
  ], // 👃 E0.6 nose
  [
    '\u{1f443}\u{1f3fb}',
  ], // 👃🏻 E1.0 nose: light skin tone
  [
    '\u{1f443}\u{1f3fc}',
  ], // 👃🏼 E1.0 nose: medium-light skin tone
  [
    '\u{1f443}\u{1f3fd}',
  ], // 👃🏽 E1.0 nose: medium skin tone
  [
    '\u{1f443}\u{1f3fe}',
  ], // 👃🏾 E1.0 nose: medium-dark skin tone
  [
    '\u{1f443}\u{1f3ff}',
  ], // 👃🏿 E1.0 nose: dark skin tone
  [
    '\u{1f9e0}',
  ], // 🧠 E5.0 brain
  [
    '\u{1fac0}',
  ], // 🫀 E13.0 anatomical heart
  [
    '\u{1fac1}',
  ], // 🫁 E13.0 lungs
  [
    '\u{1f9b7}',
  ], // 🦷 E11.0 tooth
  [
    '\u{1f9b4}',
  ], // 🦴 E11.0 bone
  [
    '\u{1f440}',
  ], // 👀 E0.6 eyes
  [
    '\u{1f441}\ufe0f',
  ], // 👁️ E0.7 eye
  [
    '\u{1f441}',
  ], // 👁 E0.7 eye
  [
    '\u{1f445}',
  ], // 👅 E0.6 tongue
  [
    '\u{1f444}',
  ], // 👄 E0.6 mouth
  [
    '\u{1fae6}',
  ], // 🫦 E14.0 biting lip
  [
    '\u{1f476}',
  ], // 👶 E0.6 baby
  [
    '\u{1f476}\u{1f3fb}',
  ], // 👶🏻 E1.0 baby: light skin tone
  [
    '\u{1f476}\u{1f3fc}',
  ], // 👶🏼 E1.0 baby: medium-light skin tone
  [
    '\u{1f476}\u{1f3fd}',
  ], // 👶🏽 E1.0 baby: medium skin tone
  [
    '\u{1f476}\u{1f3fe}',
  ], // 👶🏾 E1.0 baby: medium-dark skin tone
  [
    '\u{1f476}\u{1f3ff}',
  ], // 👶🏿 E1.0 baby: dark skin tone
  [
    '\u{1f9d2}',
  ], // 🧒 E5.0 child
  [
    '\u{1f9d2}\u{1f3fb}',
  ], // 🧒🏻 E5.0 child: light skin tone
  [
    '\u{1f9d2}\u{1f3fc}',
  ], // 🧒🏼 E5.0 child: medium-light skin tone
  [
    '\u{1f9d2}\u{1f3fd}',
  ], // 🧒🏽 E5.0 child: medium skin tone
  [
    '\u{1f9d2}\u{1f3fe}',
  ], // 🧒🏾 E5.0 child: medium-dark skin tone
  [
    '\u{1f9d2}\u{1f3ff}',
  ], // 🧒🏿 E5.0 child: dark skin tone
  [
    '\u{1f466}',
  ], // 👦 E0.6 boy
  [
    '\u{1f466}\u{1f3fb}',
  ], // 👦🏻 E1.0 boy: light skin tone
  [
    '\u{1f466}\u{1f3fc}',
  ], // 👦🏼 E1.0 boy: medium-light skin tone
  [
    '\u{1f466}\u{1f3fd}',
  ], // 👦🏽 E1.0 boy: medium skin tone
  [
    '\u{1f466}\u{1f3fe}',
  ], // 👦🏾 E1.0 boy: medium-dark skin tone
  [
    '\u{1f466}\u{1f3ff}',
  ], // 👦🏿 E1.0 boy: dark skin tone
  [
    '\u{1f467}',
  ], // 👧 E0.6 girl
  [
    '\u{1f467}\u{1f3fb}',
  ], // 👧🏻 E1.0 girl: light skin tone
  [
    '\u{1f467}\u{1f3fc}',
  ], // 👧🏼 E1.0 girl: medium-light skin tone
  [
    '\u{1f467}\u{1f3fd}',
  ], // 👧🏽 E1.0 girl: medium skin tone
  [
    '\u{1f467}\u{1f3fe}',
  ], // 👧🏾 E1.0 girl: medium-dark skin tone
  [
    '\u{1f467}\u{1f3ff}',
  ], // 👧🏿 E1.0 girl: dark skin tone
  [
    '\u{1f9d1}',
  ], // 🧑 E5.0 person
  [
    '\u{1f9d1}\u{1f3fb}',
  ], // 🧑🏻 E5.0 person: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}',
  ], // 🧑🏼 E5.0 person: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}',
  ], // 🧑🏽 E5.0 person: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}',
  ], // 🧑🏾 E5.0 person: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}',
  ], // 🧑🏿 E5.0 person: dark skin tone
  [
    '\u{1f471}',
  ], // 👱 E0.6 person: blond hair
  [
    '\u{1f471}\u{1f3fb}',
  ], // 👱🏻 E1.0 person: light skin tone, blond hair
  [
    '\u{1f471}\u{1f3fc}',
  ], // 👱🏼 E1.0 person: medium-light skin tone, blond hair
  [
    '\u{1f471}\u{1f3fd}',
  ], // 👱🏽 E1.0 person: medium skin tone, blond hair
  [
    '\u{1f471}\u{1f3fe}',
  ], // 👱🏾 E1.0 person: medium-dark skin tone, blond hair
  [
    '\u{1f471}\u{1f3ff}',
  ], // 👱🏿 E1.0 person: dark skin tone, blond hair
  [
    '\u{1f468}',
  ], // 👨 E0.6 man
  [
    '\u{1f468}\u{1f3fb}',
  ], // 👨🏻 E1.0 man: light skin tone
  [
    '\u{1f468}\u{1f3fc}',
  ], // 👨🏼 E1.0 man: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}',
  ], // 👨🏽 E1.0 man: medium skin tone
  [
    '\u{1f468}\u{1f3fe}',
  ], // 👨🏾 E1.0 man: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}',
  ], // 👨🏿 E1.0 man: dark skin tone
  [
    '\u{1f9d4}',
  ], // 🧔 E5.0 person: beard
  [
    '\u{1f9d4}\u{1f3fb}',
  ], // 🧔🏻 E5.0 person: light skin tone, beard
  [
    '\u{1f9d4}\u{1f3fc}',
  ], // 🧔🏼 E5.0 person: medium-light skin tone, beard
  [
    '\u{1f9d4}\u{1f3fd}',
  ], // 🧔🏽 E5.0 person: medium skin tone, beard
  [
    '\u{1f9d4}\u{1f3fe}',
  ], // 🧔🏾 E5.0 person: medium-dark skin tone, beard
  [
    '\u{1f9d4}\u{1f3ff}',
  ], // 🧔🏿 E5.0 person: dark skin tone, beard
  [
    '\u{1f9d4}\u200d\u2642\ufe0f',
  ], // 🧔‍♂️ E13.1 man: beard
  [
    '\u{1f9d4}\u200d\u2642',
  ], // 🧔‍♂ E13.1 man: beard
  [
    '\u{1f9d4}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🧔🏻‍♂️ E13.1 man: light skin tone, beard
  [
    '\u{1f9d4}\u{1f3fb}\u200d\u2642',
  ], // 🧔🏻‍♂ E13.1 man: light skin tone, beard
  [
    '\u{1f9d4}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🧔🏼‍♂️ E13.1 man: medium-light skin tone, beard
  [
    '\u{1f9d4}\u{1f3fc}\u200d\u2642',
  ], // 🧔🏼‍♂ E13.1 man: medium-light skin tone, beard
  [
    '\u{1f9d4}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🧔🏽‍♂️ E13.1 man: medium skin tone, beard
  [
    '\u{1f9d4}\u{1f3fd}\u200d\u2642',
  ], // 🧔🏽‍♂ E13.1 man: medium skin tone, beard
  [
    '\u{1f9d4}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🧔🏾‍♂️ E13.1 man: medium-dark skin tone, beard
  [
    '\u{1f9d4}\u{1f3fe}\u200d\u2642',
  ], // 🧔🏾‍♂ E13.1 man: medium-dark skin tone, beard
  [
    '\u{1f9d4}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🧔🏿‍♂️ E13.1 man: dark skin tone, beard
  [
    '\u{1f9d4}\u{1f3ff}\u200d\u2642',
  ], // 🧔🏿‍♂ E13.1 man: dark skin tone, beard
  [
    '\u{1f9d4}\u200d\u2640\ufe0f',
  ], // 🧔‍♀️ E13.1 woman: beard
  [
    '\u{1f9d4}\u200d\u2640',
  ], // 🧔‍♀ E13.1 woman: beard
  [
    '\u{1f9d4}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🧔🏻‍♀️ E13.1 woman: light skin tone, beard
  [
    '\u{1f9d4}\u{1f3fb}\u200d\u2640',
  ], // 🧔🏻‍♀ E13.1 woman: light skin tone, beard
  [
    '\u{1f9d4}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🧔🏼‍♀️ E13.1 woman: medium-light skin tone, beard
  [
    '\u{1f9d4}\u{1f3fc}\u200d\u2640',
  ], // 🧔🏼‍♀ E13.1 woman: medium-light skin tone, beard
  [
    '\u{1f9d4}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🧔🏽‍♀️ E13.1 woman: medium skin tone, beard
  [
    '\u{1f9d4}\u{1f3fd}\u200d\u2640',
  ], // 🧔🏽‍♀ E13.1 woman: medium skin tone, beard
  [
    '\u{1f9d4}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🧔🏾‍♀️ E13.1 woman: medium-dark skin tone, beard
  [
    '\u{1f9d4}\u{1f3fe}\u200d\u2640',
  ], // 🧔🏾‍♀ E13.1 woman: medium-dark skin tone, beard
  [
    '\u{1f9d4}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🧔🏿‍♀️ E13.1 woman: dark skin tone, beard
  [
    '\u{1f9d4}\u{1f3ff}\u200d\u2640',
  ], // 🧔🏿‍♀ E13.1 woman: dark skin tone, beard
  [
    '\u{1f468}\u200d\u{1f9b0}',
  ], // 👨‍🦰 E11.0 man: red hair
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f9b0}',
  ], // 👨🏻‍🦰 E11.0 man: light skin tone, red hair
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f9b0}',
  ], // 👨🏼‍🦰 E11.0 man: medium-light skin tone, red hair
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f9b0}',
  ], // 👨🏽‍🦰 E11.0 man: medium skin tone, red hair
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f9b0}',
  ], // 👨🏾‍🦰 E11.0 man: medium-dark skin tone, red hair
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f9b0}',
  ], // 👨🏿‍🦰 E11.0 man: dark skin tone, red hair
  [
    '\u{1f468}\u200d\u{1f9b1}',
  ], // 👨‍🦱 E11.0 man: curly hair
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f9b1}',
  ], // 👨🏻‍🦱 E11.0 man: light skin tone, curly hair
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f9b1}',
  ], // 👨🏼‍🦱 E11.0 man: medium-light skin tone, curly hair
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f9b1}',
  ], // 👨🏽‍🦱 E11.0 man: medium skin tone, curly hair
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f9b1}',
  ], // 👨🏾‍🦱 E11.0 man: medium-dark skin tone, curly hair
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f9b1}',
  ], // 👨🏿‍🦱 E11.0 man: dark skin tone, curly hair
  [
    '\u{1f468}\u200d\u{1f9b3}',
  ], // 👨‍🦳 E11.0 man: white hair
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f9b3}',
  ], // 👨🏻‍🦳 E11.0 man: light skin tone, white hair
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f9b3}',
  ], // 👨🏼‍🦳 E11.0 man: medium-light skin tone, white hair
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f9b3}',
  ], // 👨🏽‍🦳 E11.0 man: medium skin tone, white hair
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f9b3}',
  ], // 👨🏾‍🦳 E11.0 man: medium-dark skin tone, white hair
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f9b3}',
  ], // 👨🏿‍🦳 E11.0 man: dark skin tone, white hair
  [
    '\u{1f468}\u200d\u{1f9b2}',
  ], // 👨‍🦲 E11.0 man: bald
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f9b2}',
  ], // 👨🏻‍🦲 E11.0 man: light skin tone, bald
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f9b2}',
  ], // 👨🏼‍🦲 E11.0 man: medium-light skin tone, bald
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f9b2}',
  ], // 👨🏽‍🦲 E11.0 man: medium skin tone, bald
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f9b2}',
  ], // 👨🏾‍🦲 E11.0 man: medium-dark skin tone, bald
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f9b2}',
  ], // 👨🏿‍🦲 E11.0 man: dark skin tone, bald
  [
    '\u{1f469}',
  ], // 👩 E0.6 woman
  [
    '\u{1f469}\u{1f3fb}',
  ], // 👩🏻 E1.0 woman: light skin tone
  [
    '\u{1f469}\u{1f3fc}',
  ], // 👩🏼 E1.0 woman: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}',
  ], // 👩🏽 E1.0 woman: medium skin tone
  [
    '\u{1f469}\u{1f3fe}',
  ], // 👩🏾 E1.0 woman: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}',
  ], // 👩🏿 E1.0 woman: dark skin tone
  [
    '\u{1f469}\u200d\u{1f9b0}',
  ], // 👩‍🦰 E11.0 woman: red hair
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f9b0}',
  ], // 👩🏻‍🦰 E11.0 woman: light skin tone, red hair
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f9b0}',
  ], // 👩🏼‍🦰 E11.0 woman: medium-light skin tone, red hair
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f9b0}',
  ], // 👩🏽‍🦰 E11.0 woman: medium skin tone, red hair
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f9b0}',
  ], // 👩🏾‍🦰 E11.0 woman: medium-dark skin tone, red hair
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f9b0}',
  ], // 👩🏿‍🦰 E11.0 woman: dark skin tone, red hair
  [
    '\u{1f9d1}\u200d\u{1f9b0}',
  ], // 🧑‍🦰 E12.1 person: red hair
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f9b0}',
  ], // 🧑🏻‍🦰 E12.1 person: light skin tone, red hair
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f9b0}',
  ], // 🧑🏼‍🦰 E12.1 person: medium-light skin tone, red hair
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f9b0}',
  ], // 🧑🏽‍🦰 E12.1 person: medium skin tone, red hair
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f9b0}',
  ], // 🧑🏾‍🦰 E12.1 person: medium-dark skin tone, red hair
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f9b0}',
  ], // 🧑🏿‍🦰 E12.1 person: dark skin tone, red hair
  [
    '\u{1f469}\u200d\u{1f9b1}',
  ], // 👩‍🦱 E11.0 woman: curly hair
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f9b1}',
  ], // 👩🏻‍🦱 E11.0 woman: light skin tone, curly hair
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f9b1}',
  ], // 👩🏼‍🦱 E11.0 woman: medium-light skin tone, curly hair
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f9b1}',
  ], // 👩🏽‍🦱 E11.0 woman: medium skin tone, curly hair
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f9b1}',
  ], // 👩🏾‍🦱 E11.0 woman: medium-dark skin tone, curly hair
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f9b1}',
  ], // 👩🏿‍🦱 E11.0 woman: dark skin tone, curly hair
  [
    '\u{1f9d1}\u200d\u{1f9b1}',
  ], // 🧑‍🦱 E12.1 person: curly hair
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f9b1}',
  ], // 🧑🏻‍🦱 E12.1 person: light skin tone, curly hair
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f9b1}',
  ], // 🧑🏼‍🦱 E12.1 person: medium-light skin tone, curly hair
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f9b1}',
  ], // 🧑🏽‍🦱 E12.1 person: medium skin tone, curly hair
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f9b1}',
  ], // 🧑🏾‍🦱 E12.1 person: medium-dark skin tone, curly hair
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f9b1}',
  ], // 🧑🏿‍🦱 E12.1 person: dark skin tone, curly hair
  [
    '\u{1f469}\u200d\u{1f9b3}',
  ], // 👩‍🦳 E11.0 woman: white hair
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f9b3}',
  ], // 👩🏻‍🦳 E11.0 woman: light skin tone, white hair
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f9b3}',
  ], // 👩🏼‍🦳 E11.0 woman: medium-light skin tone, white hair
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f9b3}',
  ], // 👩🏽‍🦳 E11.0 woman: medium skin tone, white hair
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f9b3}',
  ], // 👩🏾‍🦳 E11.0 woman: medium-dark skin tone, white hair
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f9b3}',
  ], // 👩🏿‍🦳 E11.0 woman: dark skin tone, white hair
  [
    '\u{1f9d1}\u200d\u{1f9b3}',
  ], // 🧑‍🦳 E12.1 person: white hair
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f9b3}',
  ], // 🧑🏻‍🦳 E12.1 person: light skin tone, white hair
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f9b3}',
  ], // 🧑🏼‍🦳 E12.1 person: medium-light skin tone, white hair
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f9b3}',
  ], // 🧑🏽‍🦳 E12.1 person: medium skin tone, white hair
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f9b3}',
  ], // 🧑🏾‍🦳 E12.1 person: medium-dark skin tone, white hair
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f9b3}',
  ], // 🧑🏿‍🦳 E12.1 person: dark skin tone, white hair
  [
    '\u{1f469}\u200d\u{1f9b2}',
  ], // 👩‍🦲 E11.0 woman: bald
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f9b2}',
  ], // 👩🏻‍🦲 E11.0 woman: light skin tone, bald
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f9b2}',
  ], // 👩🏼‍🦲 E11.0 woman: medium-light skin tone, bald
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f9b2}',
  ], // 👩🏽‍🦲 E11.0 woman: medium skin tone, bald
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f9b2}',
  ], // 👩🏾‍🦲 E11.0 woman: medium-dark skin tone, bald
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f9b2}',
  ], // 👩🏿‍🦲 E11.0 woman: dark skin tone, bald
  [
    '\u{1f9d1}\u200d\u{1f9b2}',
  ], // 🧑‍🦲 E12.1 person: bald
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f9b2}',
  ], // 🧑🏻‍🦲 E12.1 person: light skin tone, bald
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f9b2}',
  ], // 🧑🏼‍🦲 E12.1 person: medium-light skin tone, bald
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f9b2}',
  ], // 🧑🏽‍🦲 E12.1 person: medium skin tone, bald
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f9b2}',
  ], // 🧑🏾‍🦲 E12.1 person: medium-dark skin tone, bald
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f9b2}',
  ], // 🧑🏿‍🦲 E12.1 person: dark skin tone, bald
  [
    '\u{1f471}\u200d\u2640\ufe0f',
  ], // 👱‍♀️ E4.0 woman: blond hair
  [
    '\u{1f471}\u200d\u2640',
  ], // 👱‍♀ E4.0 woman: blond hair
  [
    '\u{1f471}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 👱🏻‍♀️ E4.0 woman: light skin tone, blond hair
  [
    '\u{1f471}\u{1f3fb}\u200d\u2640',
  ], // 👱🏻‍♀ E4.0 woman: light skin tone, blond hair
  [
    '\u{1f471}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 👱🏼‍♀️ E4.0 woman: medium-light skin tone, blond hair
  [
    '\u{1f471}\u{1f3fc}\u200d\u2640',
  ], // 👱🏼‍♀ E4.0 woman: medium-light skin tone, blond hair
  [
    '\u{1f471}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 👱🏽‍♀️ E4.0 woman: medium skin tone, blond hair
  [
    '\u{1f471}\u{1f3fd}\u200d\u2640',
  ], // 👱🏽‍♀ E4.0 woman: medium skin tone, blond hair
  [
    '\u{1f471}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 👱🏾‍♀️ E4.0 woman: medium-dark skin tone, blond hair
  [
    '\u{1f471}\u{1f3fe}\u200d\u2640',
  ], // 👱🏾‍♀ E4.0 woman: medium-dark skin tone, blond hair
  [
    '\u{1f471}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 👱🏿‍♀️ E4.0 woman: dark skin tone, blond hair
  [
    '\u{1f471}\u{1f3ff}\u200d\u2640',
  ], // 👱🏿‍♀ E4.0 woman: dark skin tone, blond hair
  [
    '\u{1f471}\u200d\u2642\ufe0f',
  ], // 👱‍♂️ E4.0 man: blond hair
  [
    '\u{1f471}\u200d\u2642',
  ], // 👱‍♂ E4.0 man: blond hair
  [
    '\u{1f471}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 👱🏻‍♂️ E4.0 man: light skin tone, blond hair
  [
    '\u{1f471}\u{1f3fb}\u200d\u2642',
  ], // 👱🏻‍♂ E4.0 man: light skin tone, blond hair
  [
    '\u{1f471}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 👱🏼‍♂️ E4.0 man: medium-light skin tone, blond hair
  [
    '\u{1f471}\u{1f3fc}\u200d\u2642',
  ], // 👱🏼‍♂ E4.0 man: medium-light skin tone, blond hair
  [
    '\u{1f471}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 👱🏽‍♂️ E4.0 man: medium skin tone, blond hair
  [
    '\u{1f471}\u{1f3fd}\u200d\u2642',
  ], // 👱🏽‍♂ E4.0 man: medium skin tone, blond hair
  [
    '\u{1f471}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 👱🏾‍♂️ E4.0 man: medium-dark skin tone, blond hair
  [
    '\u{1f471}\u{1f3fe}\u200d\u2642',
  ], // 👱🏾‍♂ E4.0 man: medium-dark skin tone, blond hair
  [
    '\u{1f471}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 👱🏿‍♂️ E4.0 man: dark skin tone, blond hair
  [
    '\u{1f471}\u{1f3ff}\u200d\u2642',
  ], // 👱🏿‍♂ E4.0 man: dark skin tone, blond hair
  [
    '\u{1f9d3}',
  ], // 🧓 E5.0 older person
  [
    '\u{1f9d3}\u{1f3fb}',
  ], // 🧓🏻 E5.0 older person: light skin tone
  [
    '\u{1f9d3}\u{1f3fc}',
  ], // 🧓🏼 E5.0 older person: medium-light skin tone
  [
    '\u{1f9d3}\u{1f3fd}',
  ], // 🧓🏽 E5.0 older person: medium skin tone
  [
    '\u{1f9d3}\u{1f3fe}',
  ], // 🧓🏾 E5.0 older person: medium-dark skin tone
  [
    '\u{1f9d3}\u{1f3ff}',
  ], // 🧓🏿 E5.0 older person: dark skin tone
  [
    '\u{1f474}',
  ], // 👴 E0.6 old man
  [
    '\u{1f474}\u{1f3fb}',
  ], // 👴🏻 E1.0 old man: light skin tone
  [
    '\u{1f474}\u{1f3fc}',
  ], // 👴🏼 E1.0 old man: medium-light skin tone
  [
    '\u{1f474}\u{1f3fd}',
  ], // 👴🏽 E1.0 old man: medium skin tone
  [
    '\u{1f474}\u{1f3fe}',
  ], // 👴🏾 E1.0 old man: medium-dark skin tone
  [
    '\u{1f474}\u{1f3ff}',
  ], // 👴🏿 E1.0 old man: dark skin tone
  [
    '\u{1f475}',
  ], // 👵 E0.6 old woman
  [
    '\u{1f475}\u{1f3fb}',
  ], // 👵🏻 E1.0 old woman: light skin tone
  [
    '\u{1f475}\u{1f3fc}',
  ], // 👵🏼 E1.0 old woman: medium-light skin tone
  [
    '\u{1f475}\u{1f3fd}',
  ], // 👵🏽 E1.0 old woman: medium skin tone
  [
    '\u{1f475}\u{1f3fe}',
  ], // 👵🏾 E1.0 old woman: medium-dark skin tone
  [
    '\u{1f475}\u{1f3ff}',
  ], // 👵🏿 E1.0 old woman: dark skin tone
  [
    '\u{1f64d}',
  ], // 🙍 E0.6 person frowning
  [
    '\u{1f64d}\u{1f3fb}',
  ], // 🙍🏻 E1.0 person frowning: light skin tone
  [
    '\u{1f64d}\u{1f3fc}',
  ], // 🙍🏼 E1.0 person frowning: medium-light skin tone
  [
    '\u{1f64d}\u{1f3fd}',
  ], // 🙍🏽 E1.0 person frowning: medium skin tone
  [
    '\u{1f64d}\u{1f3fe}',
  ], // 🙍🏾 E1.0 person frowning: medium-dark skin tone
  [
    '\u{1f64d}\u{1f3ff}',
  ], // 🙍🏿 E1.0 person frowning: dark skin tone
  [
    '\u{1f64d}\u200d\u2642\ufe0f',
  ], // 🙍‍♂️ E4.0 man frowning
  [
    '\u{1f64d}\u200d\u2642',
  ], // 🙍‍♂ E4.0 man frowning
  [
    '\u{1f64d}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🙍🏻‍♂️ E4.0 man frowning: light skin tone
  [
    '\u{1f64d}\u{1f3fb}\u200d\u2642',
  ], // 🙍🏻‍♂ E4.0 man frowning: light skin tone
  [
    '\u{1f64d}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🙍🏼‍♂️ E4.0 man frowning: medium-light skin tone
  [
    '\u{1f64d}\u{1f3fc}\u200d\u2642',
  ], // 🙍🏼‍♂ E4.0 man frowning: medium-light skin tone
  [
    '\u{1f64d}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🙍🏽‍♂️ E4.0 man frowning: medium skin tone
  [
    '\u{1f64d}\u{1f3fd}\u200d\u2642',
  ], // 🙍🏽‍♂ E4.0 man frowning: medium skin tone
  [
    '\u{1f64d}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🙍🏾‍♂️ E4.0 man frowning: medium-dark skin tone
  [
    '\u{1f64d}\u{1f3fe}\u200d\u2642',
  ], // 🙍🏾‍♂ E4.0 man frowning: medium-dark skin tone
  [
    '\u{1f64d}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🙍🏿‍♂️ E4.0 man frowning: dark skin tone
  [
    '\u{1f64d}\u{1f3ff}\u200d\u2642',
  ], // 🙍🏿‍♂ E4.0 man frowning: dark skin tone
  [
    '\u{1f64d}\u200d\u2640\ufe0f',
  ], // 🙍‍♀️ E4.0 woman frowning
  [
    '\u{1f64d}\u200d\u2640',
  ], // 🙍‍♀ E4.0 woman frowning
  [
    '\u{1f64d}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🙍🏻‍♀️ E4.0 woman frowning: light skin tone
  [
    '\u{1f64d}\u{1f3fb}\u200d\u2640',
  ], // 🙍🏻‍♀ E4.0 woman frowning: light skin tone
  [
    '\u{1f64d}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🙍🏼‍♀️ E4.0 woman frowning: medium-light skin tone
  [
    '\u{1f64d}\u{1f3fc}\u200d\u2640',
  ], // 🙍🏼‍♀ E4.0 woman frowning: medium-light skin tone
  [
    '\u{1f64d}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🙍🏽‍♀️ E4.0 woman frowning: medium skin tone
  [
    '\u{1f64d}\u{1f3fd}\u200d\u2640',
  ], // 🙍🏽‍♀ E4.0 woman frowning: medium skin tone
  [
    '\u{1f64d}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🙍🏾‍♀️ E4.0 woman frowning: medium-dark skin tone
  [
    '\u{1f64d}\u{1f3fe}\u200d\u2640',
  ], // 🙍🏾‍♀ E4.0 woman frowning: medium-dark skin tone
  [
    '\u{1f64d}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🙍🏿‍♀️ E4.0 woman frowning: dark skin tone
  [
    '\u{1f64d}\u{1f3ff}\u200d\u2640',
  ], // 🙍🏿‍♀ E4.0 woman frowning: dark skin tone
  [
    '\u{1f64e}',
  ], // 🙎 E0.6 person pouting
  [
    '\u{1f64e}\u{1f3fb}',
  ], // 🙎🏻 E1.0 person pouting: light skin tone
  [
    '\u{1f64e}\u{1f3fc}',
  ], // 🙎🏼 E1.0 person pouting: medium-light skin tone
  [
    '\u{1f64e}\u{1f3fd}',
  ], // 🙎🏽 E1.0 person pouting: medium skin tone
  [
    '\u{1f64e}\u{1f3fe}',
  ], // 🙎🏾 E1.0 person pouting: medium-dark skin tone
  [
    '\u{1f64e}\u{1f3ff}',
  ], // 🙎🏿 E1.0 person pouting: dark skin tone
  [
    '\u{1f64e}\u200d\u2642\ufe0f',
  ], // 🙎‍♂️ E4.0 man pouting
  [
    '\u{1f64e}\u200d\u2642',
  ], // 🙎‍♂ E4.0 man pouting
  [
    '\u{1f64e}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🙎🏻‍♂️ E4.0 man pouting: light skin tone
  [
    '\u{1f64e}\u{1f3fb}\u200d\u2642',
  ], // 🙎🏻‍♂ E4.0 man pouting: light skin tone
  [
    '\u{1f64e}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🙎🏼‍♂️ E4.0 man pouting: medium-light skin tone
  [
    '\u{1f64e}\u{1f3fc}\u200d\u2642',
  ], // 🙎🏼‍♂ E4.0 man pouting: medium-light skin tone
  [
    '\u{1f64e}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🙎🏽‍♂️ E4.0 man pouting: medium skin tone
  [
    '\u{1f64e}\u{1f3fd}\u200d\u2642',
  ], // 🙎🏽‍♂ E4.0 man pouting: medium skin tone
  [
    '\u{1f64e}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🙎🏾‍♂️ E4.0 man pouting: medium-dark skin tone
  [
    '\u{1f64e}\u{1f3fe}\u200d\u2642',
  ], // 🙎🏾‍♂ E4.0 man pouting: medium-dark skin tone
  [
    '\u{1f64e}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🙎🏿‍♂️ E4.0 man pouting: dark skin tone
  [
    '\u{1f64e}\u{1f3ff}\u200d\u2642',
  ], // 🙎🏿‍♂ E4.0 man pouting: dark skin tone
  [
    '\u{1f64e}\u200d\u2640\ufe0f',
  ], // 🙎‍♀️ E4.0 woman pouting
  [
    '\u{1f64e}\u200d\u2640',
  ], // 🙎‍♀ E4.0 woman pouting
  [
    '\u{1f64e}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🙎🏻‍♀️ E4.0 woman pouting: light skin tone
  [
    '\u{1f64e}\u{1f3fb}\u200d\u2640',
  ], // 🙎🏻‍♀ E4.0 woman pouting: light skin tone
  [
    '\u{1f64e}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🙎🏼‍♀️ E4.0 woman pouting: medium-light skin tone
  [
    '\u{1f64e}\u{1f3fc}\u200d\u2640',
  ], // 🙎🏼‍♀ E4.0 woman pouting: medium-light skin tone
  [
    '\u{1f64e}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🙎🏽‍♀️ E4.0 woman pouting: medium skin tone
  [
    '\u{1f64e}\u{1f3fd}\u200d\u2640',
  ], // 🙎🏽‍♀ E4.0 woman pouting: medium skin tone
  [
    '\u{1f64e}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🙎🏾‍♀️ E4.0 woman pouting: medium-dark skin tone
  [
    '\u{1f64e}\u{1f3fe}\u200d\u2640',
  ], // 🙎🏾‍♀ E4.0 woman pouting: medium-dark skin tone
  [
    '\u{1f64e}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🙎🏿‍♀️ E4.0 woman pouting: dark skin tone
  [
    '\u{1f64e}\u{1f3ff}\u200d\u2640',
  ], // 🙎🏿‍♀ E4.0 woman pouting: dark skin tone
  [
    '\u{1f645}',
  ], // 🙅 E0.6 person gesturing NO
  [
    '\u{1f645}\u{1f3fb}',
  ], // 🙅🏻 E1.0 person gesturing NO: light skin tone
  [
    '\u{1f645}\u{1f3fc}',
  ], // 🙅🏼 E1.0 person gesturing NO: medium-light skin tone
  [
    '\u{1f645}\u{1f3fd}',
  ], // 🙅🏽 E1.0 person gesturing NO: medium skin tone
  [
    '\u{1f645}\u{1f3fe}',
  ], // 🙅🏾 E1.0 person gesturing NO: medium-dark skin tone
  [
    '\u{1f645}\u{1f3ff}',
  ], // 🙅🏿 E1.0 person gesturing NO: dark skin tone
  [
    '\u{1f645}\u200d\u2642\ufe0f',
  ], // 🙅‍♂️ E4.0 man gesturing NO
  [
    '\u{1f645}\u200d\u2642',
  ], // 🙅‍♂ E4.0 man gesturing NO
  [
    '\u{1f645}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🙅🏻‍♂️ E4.0 man gesturing NO: light skin tone
  [
    '\u{1f645}\u{1f3fb}\u200d\u2642',
  ], // 🙅🏻‍♂ E4.0 man gesturing NO: light skin tone
  [
    '\u{1f645}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🙅🏼‍♂️ E4.0 man gesturing NO: medium-light skin tone
  [
    '\u{1f645}\u{1f3fc}\u200d\u2642',
  ], // 🙅🏼‍♂ E4.0 man gesturing NO: medium-light skin tone
  [
    '\u{1f645}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🙅🏽‍♂️ E4.0 man gesturing NO: medium skin tone
  [
    '\u{1f645}\u{1f3fd}\u200d\u2642',
  ], // 🙅🏽‍♂ E4.0 man gesturing NO: medium skin tone
  [
    '\u{1f645}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🙅🏾‍♂️ E4.0 man gesturing NO: medium-dark skin tone
  [
    '\u{1f645}\u{1f3fe}\u200d\u2642',
  ], // 🙅🏾‍♂ E4.0 man gesturing NO: medium-dark skin tone
  [
    '\u{1f645}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🙅🏿‍♂️ E4.0 man gesturing NO: dark skin tone
  [
    '\u{1f645}\u{1f3ff}\u200d\u2642',
  ], // 🙅🏿‍♂ E4.0 man gesturing NO: dark skin tone
  [
    '\u{1f645}\u200d\u2640\ufe0f',
  ], // 🙅‍♀️ E4.0 woman gesturing NO
  [
    '\u{1f645}\u200d\u2640',
  ], // 🙅‍♀ E4.0 woman gesturing NO
  [
    '\u{1f645}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🙅🏻‍♀️ E4.0 woman gesturing NO: light skin tone
  [
    '\u{1f645}\u{1f3fb}\u200d\u2640',
  ], // 🙅🏻‍♀ E4.0 woman gesturing NO: light skin tone
  [
    '\u{1f645}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🙅🏼‍♀️ E4.0 woman gesturing NO: medium-light skin tone
  [
    '\u{1f645}\u{1f3fc}\u200d\u2640',
  ], // 🙅🏼‍♀ E4.0 woman gesturing NO: medium-light skin tone
  [
    '\u{1f645}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🙅🏽‍♀️ E4.0 woman gesturing NO: medium skin tone
  [
    '\u{1f645}\u{1f3fd}\u200d\u2640',
  ], // 🙅🏽‍♀ E4.0 woman gesturing NO: medium skin tone
  [
    '\u{1f645}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🙅🏾‍♀️ E4.0 woman gesturing NO: medium-dark skin tone
  [
    '\u{1f645}\u{1f3fe}\u200d\u2640',
  ], // 🙅🏾‍♀ E4.0 woman gesturing NO: medium-dark skin tone
  [
    '\u{1f645}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🙅🏿‍♀️ E4.0 woman gesturing NO: dark skin tone
  [
    '\u{1f645}\u{1f3ff}\u200d\u2640',
  ], // 🙅🏿‍♀ E4.0 woman gesturing NO: dark skin tone
  [
    '\u{1f646}',
  ], // 🙆 E0.6 person gesturing OK
  [
    '\u{1f646}\u{1f3fb}',
  ], // 🙆🏻 E1.0 person gesturing OK: light skin tone
  [
    '\u{1f646}\u{1f3fc}',
  ], // 🙆🏼 E1.0 person gesturing OK: medium-light skin tone
  [
    '\u{1f646}\u{1f3fd}',
  ], // 🙆🏽 E1.0 person gesturing OK: medium skin tone
  [
    '\u{1f646}\u{1f3fe}',
  ], // 🙆🏾 E1.0 person gesturing OK: medium-dark skin tone
  [
    '\u{1f646}\u{1f3ff}',
  ], // 🙆🏿 E1.0 person gesturing OK: dark skin tone
  [
    '\u{1f646}\u200d\u2642\ufe0f',
  ], // 🙆‍♂️ E4.0 man gesturing OK
  [
    '\u{1f646}\u200d\u2642',
  ], // 🙆‍♂ E4.0 man gesturing OK
  [
    '\u{1f646}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🙆🏻‍♂️ E4.0 man gesturing OK: light skin tone
  [
    '\u{1f646}\u{1f3fb}\u200d\u2642',
  ], // 🙆🏻‍♂ E4.0 man gesturing OK: light skin tone
  [
    '\u{1f646}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🙆🏼‍♂️ E4.0 man gesturing OK: medium-light skin tone
  [
    '\u{1f646}\u{1f3fc}\u200d\u2642',
  ], // 🙆🏼‍♂ E4.0 man gesturing OK: medium-light skin tone
  [
    '\u{1f646}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🙆🏽‍♂️ E4.0 man gesturing OK: medium skin tone
  [
    '\u{1f646}\u{1f3fd}\u200d\u2642',
  ], // 🙆🏽‍♂ E4.0 man gesturing OK: medium skin tone
  [
    '\u{1f646}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🙆🏾‍♂️ E4.0 man gesturing OK: medium-dark skin tone
  [
    '\u{1f646}\u{1f3fe}\u200d\u2642',
  ], // 🙆🏾‍♂ E4.0 man gesturing OK: medium-dark skin tone
  [
    '\u{1f646}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🙆🏿‍♂️ E4.0 man gesturing OK: dark skin tone
  [
    '\u{1f646}\u{1f3ff}\u200d\u2642',
  ], // 🙆🏿‍♂ E4.0 man gesturing OK: dark skin tone
  [
    '\u{1f646}\u200d\u2640\ufe0f',
  ], // 🙆‍♀️ E4.0 woman gesturing OK
  [
    '\u{1f646}\u200d\u2640',
  ], // 🙆‍♀ E4.0 woman gesturing OK
  [
    '\u{1f646}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🙆🏻‍♀️ E4.0 woman gesturing OK: light skin tone
  [
    '\u{1f646}\u{1f3fb}\u200d\u2640',
  ], // 🙆🏻‍♀ E4.0 woman gesturing OK: light skin tone
  [
    '\u{1f646}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🙆🏼‍♀️ E4.0 woman gesturing OK: medium-light skin tone
  [
    '\u{1f646}\u{1f3fc}\u200d\u2640',
  ], // 🙆🏼‍♀ E4.0 woman gesturing OK: medium-light skin tone
  [
    '\u{1f646}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🙆🏽‍♀️ E4.0 woman gesturing OK: medium skin tone
  [
    '\u{1f646}\u{1f3fd}\u200d\u2640',
  ], // 🙆🏽‍♀ E4.0 woman gesturing OK: medium skin tone
  [
    '\u{1f646}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🙆🏾‍♀️ E4.0 woman gesturing OK: medium-dark skin tone
  [
    '\u{1f646}\u{1f3fe}\u200d\u2640',
  ], // 🙆🏾‍♀ E4.0 woman gesturing OK: medium-dark skin tone
  [
    '\u{1f646}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🙆🏿‍♀️ E4.0 woman gesturing OK: dark skin tone
  [
    '\u{1f646}\u{1f3ff}\u200d\u2640',
  ], // 🙆🏿‍♀ E4.0 woman gesturing OK: dark skin tone
  [
    '\u{1f481}',
  ], // 💁 E0.6 person tipping hand
  [
    '\u{1f481}\u{1f3fb}',
  ], // 💁🏻 E1.0 person tipping hand: light skin tone
  [
    '\u{1f481}\u{1f3fc}',
  ], // 💁🏼 E1.0 person tipping hand: medium-light skin tone
  [
    '\u{1f481}\u{1f3fd}',
  ], // 💁🏽 E1.0 person tipping hand: medium skin tone
  [
    '\u{1f481}\u{1f3fe}',
  ], // 💁🏾 E1.0 person tipping hand: medium-dark skin tone
  [
    '\u{1f481}\u{1f3ff}',
  ], // 💁🏿 E1.0 person tipping hand: dark skin tone
  [
    '\u{1f481}\u200d\u2642\ufe0f',
  ], // 💁‍♂️ E4.0 man tipping hand
  [
    '\u{1f481}\u200d\u2642',
  ], // 💁‍♂ E4.0 man tipping hand
  [
    '\u{1f481}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 💁🏻‍♂️ E4.0 man tipping hand: light skin tone
  [
    '\u{1f481}\u{1f3fb}\u200d\u2642',
  ], // 💁🏻‍♂ E4.0 man tipping hand: light skin tone
  [
    '\u{1f481}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 💁🏼‍♂️ E4.0 man tipping hand: medium-light skin tone
  [
    '\u{1f481}\u{1f3fc}\u200d\u2642',
  ], // 💁🏼‍♂ E4.0 man tipping hand: medium-light skin tone
  [
    '\u{1f481}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 💁🏽‍♂️ E4.0 man tipping hand: medium skin tone
  [
    '\u{1f481}\u{1f3fd}\u200d\u2642',
  ], // 💁🏽‍♂ E4.0 man tipping hand: medium skin tone
  [
    '\u{1f481}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 💁🏾‍♂️ E4.0 man tipping hand: medium-dark skin tone
  [
    '\u{1f481}\u{1f3fe}\u200d\u2642',
  ], // 💁🏾‍♂ E4.0 man tipping hand: medium-dark skin tone
  [
    '\u{1f481}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 💁🏿‍♂️ E4.0 man tipping hand: dark skin tone
  [
    '\u{1f481}\u{1f3ff}\u200d\u2642',
  ], // 💁🏿‍♂ E4.0 man tipping hand: dark skin tone
  [
    '\u{1f481}\u200d\u2640\ufe0f',
  ], // 💁‍♀️ E4.0 woman tipping hand
  [
    '\u{1f481}\u200d\u2640',
  ], // 💁‍♀ E4.0 woman tipping hand
  [
    '\u{1f481}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 💁🏻‍♀️ E4.0 woman tipping hand: light skin tone
  [
    '\u{1f481}\u{1f3fb}\u200d\u2640',
  ], // 💁🏻‍♀ E4.0 woman tipping hand: light skin tone
  [
    '\u{1f481}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 💁🏼‍♀️ E4.0 woman tipping hand: medium-light skin tone
  [
    '\u{1f481}\u{1f3fc}\u200d\u2640',
  ], // 💁🏼‍♀ E4.0 woman tipping hand: medium-light skin tone
  [
    '\u{1f481}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 💁🏽‍♀️ E4.0 woman tipping hand: medium skin tone
  [
    '\u{1f481}\u{1f3fd}\u200d\u2640',
  ], // 💁🏽‍♀ E4.0 woman tipping hand: medium skin tone
  [
    '\u{1f481}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 💁🏾‍♀️ E4.0 woman tipping hand: medium-dark skin tone
  [
    '\u{1f481}\u{1f3fe}\u200d\u2640',
  ], // 💁🏾‍♀ E4.0 woman tipping hand: medium-dark skin tone
  [
    '\u{1f481}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 💁🏿‍♀️ E4.0 woman tipping hand: dark skin tone
  [
    '\u{1f481}\u{1f3ff}\u200d\u2640',
  ], // 💁🏿‍♀ E4.0 woman tipping hand: dark skin tone
  [
    '\u{1f64b}',
  ], // 🙋 E0.6 person raising hand
  [
    '\u{1f64b}\u{1f3fb}',
  ], // 🙋🏻 E1.0 person raising hand: light skin tone
  [
    '\u{1f64b}\u{1f3fc}',
  ], // 🙋🏼 E1.0 person raising hand: medium-light skin tone
  [
    '\u{1f64b}\u{1f3fd}',
  ], // 🙋🏽 E1.0 person raising hand: medium skin tone
  [
    '\u{1f64b}\u{1f3fe}',
  ], // 🙋🏾 E1.0 person raising hand: medium-dark skin tone
  [
    '\u{1f64b}\u{1f3ff}',
  ], // 🙋🏿 E1.0 person raising hand: dark skin tone
  [
    '\u{1f64b}\u200d\u2642\ufe0f',
  ], // 🙋‍♂️ E4.0 man raising hand
  [
    '\u{1f64b}\u200d\u2642',
  ], // 🙋‍♂ E4.0 man raising hand
  [
    '\u{1f64b}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🙋🏻‍♂️ E4.0 man raising hand: light skin tone
  [
    '\u{1f64b}\u{1f3fb}\u200d\u2642',
  ], // 🙋🏻‍♂ E4.0 man raising hand: light skin tone
  [
    '\u{1f64b}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🙋🏼‍♂️ E4.0 man raising hand: medium-light skin tone
  [
    '\u{1f64b}\u{1f3fc}\u200d\u2642',
  ], // 🙋🏼‍♂ E4.0 man raising hand: medium-light skin tone
  [
    '\u{1f64b}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🙋🏽‍♂️ E4.0 man raising hand: medium skin tone
  [
    '\u{1f64b}\u{1f3fd}\u200d\u2642',
  ], // 🙋🏽‍♂ E4.0 man raising hand: medium skin tone
  [
    '\u{1f64b}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🙋🏾‍♂️ E4.0 man raising hand: medium-dark skin tone
  [
    '\u{1f64b}\u{1f3fe}\u200d\u2642',
  ], // 🙋🏾‍♂ E4.0 man raising hand: medium-dark skin tone
  [
    '\u{1f64b}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🙋🏿‍♂️ E4.0 man raising hand: dark skin tone
  [
    '\u{1f64b}\u{1f3ff}\u200d\u2642',
  ], // 🙋🏿‍♂ E4.0 man raising hand: dark skin tone
  [
    '\u{1f64b}\u200d\u2640\ufe0f',
  ], // 🙋‍♀️ E4.0 woman raising hand
  [
    '\u{1f64b}\u200d\u2640',
  ], // 🙋‍♀ E4.0 woman raising hand
  [
    '\u{1f64b}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🙋🏻‍♀️ E4.0 woman raising hand: light skin tone
  [
    '\u{1f64b}\u{1f3fb}\u200d\u2640',
  ], // 🙋🏻‍♀ E4.0 woman raising hand: light skin tone
  [
    '\u{1f64b}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🙋🏼‍♀️ E4.0 woman raising hand: medium-light skin tone
  [
    '\u{1f64b}\u{1f3fc}\u200d\u2640',
  ], // 🙋🏼‍♀ E4.0 woman raising hand: medium-light skin tone
  [
    '\u{1f64b}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🙋🏽‍♀️ E4.0 woman raising hand: medium skin tone
  [
    '\u{1f64b}\u{1f3fd}\u200d\u2640',
  ], // 🙋🏽‍♀ E4.0 woman raising hand: medium skin tone
  [
    '\u{1f64b}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🙋🏾‍♀️ E4.0 woman raising hand: medium-dark skin tone
  [
    '\u{1f64b}\u{1f3fe}\u200d\u2640',
  ], // 🙋🏾‍♀ E4.0 woman raising hand: medium-dark skin tone
  [
    '\u{1f64b}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🙋🏿‍♀️ E4.0 woman raising hand: dark skin tone
  [
    '\u{1f64b}\u{1f3ff}\u200d\u2640',
  ], // 🙋🏿‍♀ E4.0 woman raising hand: dark skin tone
  [
    '\u{1f9cf}',
  ], // 🧏 E12.0 deaf person
  [
    '\u{1f9cf}\u{1f3fb}',
  ], // 🧏🏻 E12.0 deaf person: light skin tone
  [
    '\u{1f9cf}\u{1f3fc}',
  ], // 🧏🏼 E12.0 deaf person: medium-light skin tone
  [
    '\u{1f9cf}\u{1f3fd}',
  ], // 🧏🏽 E12.0 deaf person: medium skin tone
  [
    '\u{1f9cf}\u{1f3fe}',
  ], // 🧏🏾 E12.0 deaf person: medium-dark skin tone
  [
    '\u{1f9cf}\u{1f3ff}',
  ], // 🧏🏿 E12.0 deaf person: dark skin tone
  [
    '\u{1f9cf}\u200d\u2642\ufe0f',
  ], // 🧏‍♂️ E12.0 deaf man
  [
    '\u{1f9cf}\u200d\u2642',
  ], // 🧏‍♂ E12.0 deaf man
  [
    '\u{1f9cf}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🧏🏻‍♂️ E12.0 deaf man: light skin tone
  [
    '\u{1f9cf}\u{1f3fb}\u200d\u2642',
  ], // 🧏🏻‍♂ E12.0 deaf man: light skin tone
  [
    '\u{1f9cf}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🧏🏼‍♂️ E12.0 deaf man: medium-light skin tone
  [
    '\u{1f9cf}\u{1f3fc}\u200d\u2642',
  ], // 🧏🏼‍♂ E12.0 deaf man: medium-light skin tone
  [
    '\u{1f9cf}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🧏🏽‍♂️ E12.0 deaf man: medium skin tone
  [
    '\u{1f9cf}\u{1f3fd}\u200d\u2642',
  ], // 🧏🏽‍♂ E12.0 deaf man: medium skin tone
  [
    '\u{1f9cf}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🧏🏾‍♂️ E12.0 deaf man: medium-dark skin tone
  [
    '\u{1f9cf}\u{1f3fe}\u200d\u2642',
  ], // 🧏🏾‍♂ E12.0 deaf man: medium-dark skin tone
  [
    '\u{1f9cf}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🧏🏿‍♂️ E12.0 deaf man: dark skin tone
  [
    '\u{1f9cf}\u{1f3ff}\u200d\u2642',
  ], // 🧏🏿‍♂ E12.0 deaf man: dark skin tone
  [
    '\u{1f9cf}\u200d\u2640\ufe0f',
  ], // 🧏‍♀️ E12.0 deaf woman
  [
    '\u{1f9cf}\u200d\u2640',
  ], // 🧏‍♀ E12.0 deaf woman
  [
    '\u{1f9cf}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🧏🏻‍♀️ E12.0 deaf woman: light skin tone
  [
    '\u{1f9cf}\u{1f3fb}\u200d\u2640',
  ], // 🧏🏻‍♀ E12.0 deaf woman: light skin tone
  [
    '\u{1f9cf}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🧏🏼‍♀️ E12.0 deaf woman: medium-light skin tone
  [
    '\u{1f9cf}\u{1f3fc}\u200d\u2640',
  ], // 🧏🏼‍♀ E12.0 deaf woman: medium-light skin tone
  [
    '\u{1f9cf}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🧏🏽‍♀️ E12.0 deaf woman: medium skin tone
  [
    '\u{1f9cf}\u{1f3fd}\u200d\u2640',
  ], // 🧏🏽‍♀ E12.0 deaf woman: medium skin tone
  [
    '\u{1f9cf}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🧏🏾‍♀️ E12.0 deaf woman: medium-dark skin tone
  [
    '\u{1f9cf}\u{1f3fe}\u200d\u2640',
  ], // 🧏🏾‍♀ E12.0 deaf woman: medium-dark skin tone
  [
    '\u{1f9cf}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🧏🏿‍♀️ E12.0 deaf woman: dark skin tone
  [
    '\u{1f9cf}\u{1f3ff}\u200d\u2640',
  ], // 🧏🏿‍♀ E12.0 deaf woman: dark skin tone
  [
    '\u{1f647}',
  ], // 🙇 E0.6 person bowing
  [
    '\u{1f647}\u{1f3fb}',
  ], // 🙇🏻 E1.0 person bowing: light skin tone
  [
    '\u{1f647}\u{1f3fc}',
  ], // 🙇🏼 E1.0 person bowing: medium-light skin tone
  [
    '\u{1f647}\u{1f3fd}',
  ], // 🙇🏽 E1.0 person bowing: medium skin tone
  [
    '\u{1f647}\u{1f3fe}',
  ], // 🙇🏾 E1.0 person bowing: medium-dark skin tone
  [
    '\u{1f647}\u{1f3ff}',
  ], // 🙇🏿 E1.0 person bowing: dark skin tone
  [
    '\u{1f647}\u200d\u2642\ufe0f',
  ], // 🙇‍♂️ E4.0 man bowing
  [
    '\u{1f647}\u200d\u2642',
  ], // 🙇‍♂ E4.0 man bowing
  [
    '\u{1f647}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🙇🏻‍♂️ E4.0 man bowing: light skin tone
  [
    '\u{1f647}\u{1f3fb}\u200d\u2642',
  ], // 🙇🏻‍♂ E4.0 man bowing: light skin tone
  [
    '\u{1f647}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🙇🏼‍♂️ E4.0 man bowing: medium-light skin tone
  [
    '\u{1f647}\u{1f3fc}\u200d\u2642',
  ], // 🙇🏼‍♂ E4.0 man bowing: medium-light skin tone
  [
    '\u{1f647}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🙇🏽‍♂️ E4.0 man bowing: medium skin tone
  [
    '\u{1f647}\u{1f3fd}\u200d\u2642',
  ], // 🙇🏽‍♂ E4.0 man bowing: medium skin tone
  [
    '\u{1f647}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🙇🏾‍♂️ E4.0 man bowing: medium-dark skin tone
  [
    '\u{1f647}\u{1f3fe}\u200d\u2642',
  ], // 🙇🏾‍♂ E4.0 man bowing: medium-dark skin tone
  [
    '\u{1f647}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🙇🏿‍♂️ E4.0 man bowing: dark skin tone
  [
    '\u{1f647}\u{1f3ff}\u200d\u2642',
  ], // 🙇🏿‍♂ E4.0 man bowing: dark skin tone
  [
    '\u{1f647}\u200d\u2640\ufe0f',
  ], // 🙇‍♀️ E4.0 woman bowing
  [
    '\u{1f647}\u200d\u2640',
  ], // 🙇‍♀ E4.0 woman bowing
  [
    '\u{1f647}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🙇🏻‍♀️ E4.0 woman bowing: light skin tone
  [
    '\u{1f647}\u{1f3fb}\u200d\u2640',
  ], // 🙇🏻‍♀ E4.0 woman bowing: light skin tone
  [
    '\u{1f647}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🙇🏼‍♀️ E4.0 woman bowing: medium-light skin tone
  [
    '\u{1f647}\u{1f3fc}\u200d\u2640',
  ], // 🙇🏼‍♀ E4.0 woman bowing: medium-light skin tone
  [
    '\u{1f647}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🙇🏽‍♀️ E4.0 woman bowing: medium skin tone
  [
    '\u{1f647}\u{1f3fd}\u200d\u2640',
  ], // 🙇🏽‍♀ E4.0 woman bowing: medium skin tone
  [
    '\u{1f647}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🙇🏾‍♀️ E4.0 woman bowing: medium-dark skin tone
  [
    '\u{1f647}\u{1f3fe}\u200d\u2640',
  ], // 🙇🏾‍♀ E4.0 woman bowing: medium-dark skin tone
  [
    '\u{1f647}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🙇🏿‍♀️ E4.0 woman bowing: dark skin tone
  [
    '\u{1f647}\u{1f3ff}\u200d\u2640',
  ], // 🙇🏿‍♀ E4.0 woman bowing: dark skin tone
  [
    '\u{1f926}',
  ], // 🤦 E3.0 person facepalming
  [
    '\u{1f926}\u{1f3fb}',
  ], // 🤦🏻 E3.0 person facepalming: light skin tone
  [
    '\u{1f926}\u{1f3fc}',
  ], // 🤦🏼 E3.0 person facepalming: medium-light skin tone
  [
    '\u{1f926}\u{1f3fd}',
  ], // 🤦🏽 E3.0 person facepalming: medium skin tone
  [
    '\u{1f926}\u{1f3fe}',
  ], // 🤦🏾 E3.0 person facepalming: medium-dark skin tone
  [
    '\u{1f926}\u{1f3ff}',
  ], // 🤦🏿 E3.0 person facepalming: dark skin tone
  [
    '\u{1f926}\u200d\u2642\ufe0f',
  ], // 🤦‍♂️ E4.0 man facepalming
  [
    '\u{1f926}\u200d\u2642',
  ], // 🤦‍♂ E4.0 man facepalming
  [
    '\u{1f926}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🤦🏻‍♂️ E4.0 man facepalming: light skin tone
  [
    '\u{1f926}\u{1f3fb}\u200d\u2642',
  ], // 🤦🏻‍♂ E4.0 man facepalming: light skin tone
  [
    '\u{1f926}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🤦🏼‍♂️ E4.0 man facepalming: medium-light skin tone
  [
    '\u{1f926}\u{1f3fc}\u200d\u2642',
  ], // 🤦🏼‍♂ E4.0 man facepalming: medium-light skin tone
  [
    '\u{1f926}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🤦🏽‍♂️ E4.0 man facepalming: medium skin tone
  [
    '\u{1f926}\u{1f3fd}\u200d\u2642',
  ], // 🤦🏽‍♂ E4.0 man facepalming: medium skin tone
  [
    '\u{1f926}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🤦🏾‍♂️ E4.0 man facepalming: medium-dark skin tone
  [
    '\u{1f926}\u{1f3fe}\u200d\u2642',
  ], // 🤦🏾‍♂ E4.0 man facepalming: medium-dark skin tone
  [
    '\u{1f926}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🤦🏿‍♂️ E4.0 man facepalming: dark skin tone
  [
    '\u{1f926}\u{1f3ff}\u200d\u2642',
  ], // 🤦🏿‍♂ E4.0 man facepalming: dark skin tone
  [
    '\u{1f926}\u200d\u2640\ufe0f',
  ], // 🤦‍♀️ E4.0 woman facepalming
  [
    '\u{1f926}\u200d\u2640',
  ], // 🤦‍♀ E4.0 woman facepalming
  [
    '\u{1f926}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🤦🏻‍♀️ E4.0 woman facepalming: light skin tone
  [
    '\u{1f926}\u{1f3fb}\u200d\u2640',
  ], // 🤦🏻‍♀ E4.0 woman facepalming: light skin tone
  [
    '\u{1f926}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🤦🏼‍♀️ E4.0 woman facepalming: medium-light skin tone
  [
    '\u{1f926}\u{1f3fc}\u200d\u2640',
  ], // 🤦🏼‍♀ E4.0 woman facepalming: medium-light skin tone
  [
    '\u{1f926}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🤦🏽‍♀️ E4.0 woman facepalming: medium skin tone
  [
    '\u{1f926}\u{1f3fd}\u200d\u2640',
  ], // 🤦🏽‍♀ E4.0 woman facepalming: medium skin tone
  [
    '\u{1f926}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🤦🏾‍♀️ E4.0 woman facepalming: medium-dark skin tone
  [
    '\u{1f926}\u{1f3fe}\u200d\u2640',
  ], // 🤦🏾‍♀ E4.0 woman facepalming: medium-dark skin tone
  [
    '\u{1f926}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🤦🏿‍♀️ E4.0 woman facepalming: dark skin tone
  [
    '\u{1f926}\u{1f3ff}\u200d\u2640',
  ], // 🤦🏿‍♀ E4.0 woman facepalming: dark skin tone
  [
    '\u{1f937}',
  ], // 🤷 E3.0 person shrugging
  [
    '\u{1f937}\u{1f3fb}',
  ], // 🤷🏻 E3.0 person shrugging: light skin tone
  [
    '\u{1f937}\u{1f3fc}',
  ], // 🤷🏼 E3.0 person shrugging: medium-light skin tone
  [
    '\u{1f937}\u{1f3fd}',
  ], // 🤷🏽 E3.0 person shrugging: medium skin tone
  [
    '\u{1f937}\u{1f3fe}',
  ], // 🤷🏾 E3.0 person shrugging: medium-dark skin tone
  [
    '\u{1f937}\u{1f3ff}',
  ], // 🤷🏿 E3.0 person shrugging: dark skin tone
  [
    '\u{1f937}\u200d\u2642\ufe0f',
  ], // 🤷‍♂️ E4.0 man shrugging
  [
    '\u{1f937}\u200d\u2642',
  ], // 🤷‍♂ E4.0 man shrugging
  [
    '\u{1f937}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🤷🏻‍♂️ E4.0 man shrugging: light skin tone
  [
    '\u{1f937}\u{1f3fb}\u200d\u2642',
  ], // 🤷🏻‍♂ E4.0 man shrugging: light skin tone
  [
    '\u{1f937}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🤷🏼‍♂️ E4.0 man shrugging: medium-light skin tone
  [
    '\u{1f937}\u{1f3fc}\u200d\u2642',
  ], // 🤷🏼‍♂ E4.0 man shrugging: medium-light skin tone
  [
    '\u{1f937}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🤷🏽‍♂️ E4.0 man shrugging: medium skin tone
  [
    '\u{1f937}\u{1f3fd}\u200d\u2642',
  ], // 🤷🏽‍♂ E4.0 man shrugging: medium skin tone
  [
    '\u{1f937}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🤷🏾‍♂️ E4.0 man shrugging: medium-dark skin tone
  [
    '\u{1f937}\u{1f3fe}\u200d\u2642',
  ], // 🤷🏾‍♂ E4.0 man shrugging: medium-dark skin tone
  [
    '\u{1f937}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🤷🏿‍♂️ E4.0 man shrugging: dark skin tone
  [
    '\u{1f937}\u{1f3ff}\u200d\u2642',
  ], // 🤷🏿‍♂ E4.0 man shrugging: dark skin tone
  [
    '\u{1f937}\u200d\u2640\ufe0f',
  ], // 🤷‍♀️ E4.0 woman shrugging
  [
    '\u{1f937}\u200d\u2640',
  ], // 🤷‍♀ E4.0 woman shrugging
  [
    '\u{1f937}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🤷🏻‍♀️ E4.0 woman shrugging: light skin tone
  [
    '\u{1f937}\u{1f3fb}\u200d\u2640',
  ], // 🤷🏻‍♀ E4.0 woman shrugging: light skin tone
  [
    '\u{1f937}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🤷🏼‍♀️ E4.0 woman shrugging: medium-light skin tone
  [
    '\u{1f937}\u{1f3fc}\u200d\u2640',
  ], // 🤷🏼‍♀ E4.0 woman shrugging: medium-light skin tone
  [
    '\u{1f937}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🤷🏽‍♀️ E4.0 woman shrugging: medium skin tone
  [
    '\u{1f937}\u{1f3fd}\u200d\u2640',
  ], // 🤷🏽‍♀ E4.0 woman shrugging: medium skin tone
  [
    '\u{1f937}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🤷🏾‍♀️ E4.0 woman shrugging: medium-dark skin tone
  [
    '\u{1f937}\u{1f3fe}\u200d\u2640',
  ], // 🤷🏾‍♀ E4.0 woman shrugging: medium-dark skin tone
  [
    '\u{1f937}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🤷🏿‍♀️ E4.0 woman shrugging: dark skin tone
  [
    '\u{1f937}\u{1f3ff}\u200d\u2640',
  ], // 🤷🏿‍♀ E4.0 woman shrugging: dark skin tone
  [
    '\u{1f9d1}\u200d\u2695\ufe0f',
  ], // 🧑‍⚕️ E12.1 health worker
  [
    '\u{1f9d1}\u200d\u2695',
  ], // 🧑‍⚕ E12.1 health worker
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u2695\ufe0f',
  ], // 🧑🏻‍⚕️ E12.1 health worker: light skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u2695',
  ], // 🧑🏻‍⚕ E12.1 health worker: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u2695\ufe0f',
  ], // 🧑🏼‍⚕️ E12.1 health worker: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u2695',
  ], // 🧑🏼‍⚕ E12.1 health worker: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u2695\ufe0f',
  ], // 🧑🏽‍⚕️ E12.1 health worker: medium skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u2695',
  ], // 🧑🏽‍⚕ E12.1 health worker: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u2695\ufe0f',
  ], // 🧑🏾‍⚕️ E12.1 health worker: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u2695',
  ], // 🧑🏾‍⚕ E12.1 health worker: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u2695\ufe0f',
  ], // 🧑🏿‍⚕️ E12.1 health worker: dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u2695',
  ], // 🧑🏿‍⚕ E12.1 health worker: dark skin tone
  [
    '\u{1f468}\u200d\u2695\ufe0f',
  ], // 👨‍⚕️ E4.0 man health worker
  [
    '\u{1f468}\u200d\u2695',
  ], // 👨‍⚕ E4.0 man health worker
  [
    '\u{1f468}\u{1f3fb}\u200d\u2695\ufe0f',
  ], // 👨🏻‍⚕️ E4.0 man health worker: light skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u2695',
  ], // 👨🏻‍⚕ E4.0 man health worker: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2695\ufe0f',
  ], // 👨🏼‍⚕️ E4.0 man health worker: medium-light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2695',
  ], // 👨🏼‍⚕ E4.0 man health worker: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2695\ufe0f',
  ], // 👨🏽‍⚕️ E4.0 man health worker: medium skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2695',
  ], // 👨🏽‍⚕ E4.0 man health worker: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2695\ufe0f',
  ], // 👨🏾‍⚕️ E4.0 man health worker: medium-dark skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2695',
  ], // 👨🏾‍⚕ E4.0 man health worker: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2695\ufe0f',
  ], // 👨🏿‍⚕️ E4.0 man health worker: dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2695',
  ], // 👨🏿‍⚕ E4.0 man health worker: dark skin tone
  [
    '\u{1f469}\u200d\u2695\ufe0f',
  ], // 👩‍⚕️ E4.0 woman health worker
  [
    '\u{1f469}\u200d\u2695',
  ], // 👩‍⚕ E4.0 woman health worker
  [
    '\u{1f469}\u{1f3fb}\u200d\u2695\ufe0f',
  ], // 👩🏻‍⚕️ E4.0 woman health worker: light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2695',
  ], // 👩🏻‍⚕ E4.0 woman health worker: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2695\ufe0f',
  ], // 👩🏼‍⚕️ E4.0 woman health worker: medium-light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2695',
  ], // 👩🏼‍⚕ E4.0 woman health worker: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2695\ufe0f',
  ], // 👩🏽‍⚕️ E4.0 woman health worker: medium skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2695',
  ], // 👩🏽‍⚕ E4.0 woman health worker: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2695\ufe0f',
  ], // 👩🏾‍⚕️ E4.0 woman health worker: medium-dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2695',
  ], // 👩🏾‍⚕ E4.0 woman health worker: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2695\ufe0f',
  ], // 👩🏿‍⚕️ E4.0 woman health worker: dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2695',
  ], // 👩🏿‍⚕ E4.0 woman health worker: dark skin tone
  [
    '\u{1f9d1}\u200d\u{1f393}',
  ], // 🧑‍🎓 E12.1 student
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f393}',
  ], // 🧑🏻‍🎓 E12.1 student: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f393}',
  ], // 🧑🏼‍🎓 E12.1 student: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f393}',
  ], // 🧑🏽‍🎓 E12.1 student: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f393}',
  ], // 🧑🏾‍🎓 E12.1 student: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f393}',
  ], // 🧑🏿‍🎓 E12.1 student: dark skin tone
  [
    '\u{1f468}\u200d\u{1f393}',
  ], // 👨‍🎓 E4.0 man student
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f393}',
  ], // 👨🏻‍🎓 E4.0 man student: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f393}',
  ], // 👨🏼‍🎓 E4.0 man student: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f393}',
  ], // 👨🏽‍🎓 E4.0 man student: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f393}',
  ], // 👨🏾‍🎓 E4.0 man student: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f393}',
  ], // 👨🏿‍🎓 E4.0 man student: dark skin tone
  [
    '\u{1f469}\u200d\u{1f393}',
  ], // 👩‍🎓 E4.0 woman student
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f393}',
  ], // 👩🏻‍🎓 E4.0 woman student: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f393}',
  ], // 👩🏼‍🎓 E4.0 woman student: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f393}',
  ], // 👩🏽‍🎓 E4.0 woman student: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f393}',
  ], // 👩🏾‍🎓 E4.0 woman student: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f393}',
  ], // 👩🏿‍🎓 E4.0 woman student: dark skin tone
  [
    '\u{1f9d1}\u200d\u{1f3eb}',
  ], // 🧑‍🏫 E12.1 teacher
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f3eb}',
  ], // 🧑🏻‍🏫 E12.1 teacher: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f3eb}',
  ], // 🧑🏼‍🏫 E12.1 teacher: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f3eb}',
  ], // 🧑🏽‍🏫 E12.1 teacher: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f3eb}',
  ], // 🧑🏾‍🏫 E12.1 teacher: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f3eb}',
  ], // 🧑🏿‍🏫 E12.1 teacher: dark skin tone
  [
    '\u{1f468}\u200d\u{1f3eb}',
  ], // 👨‍🏫 E4.0 man teacher
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f3eb}',
  ], // 👨🏻‍🏫 E4.0 man teacher: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f3eb}',
  ], // 👨🏼‍🏫 E4.0 man teacher: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f3eb}',
  ], // 👨🏽‍🏫 E4.0 man teacher: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f3eb}',
  ], // 👨🏾‍🏫 E4.0 man teacher: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f3eb}',
  ], // 👨🏿‍🏫 E4.0 man teacher: dark skin tone
  [
    '\u{1f469}\u200d\u{1f3eb}',
  ], // 👩‍🏫 E4.0 woman teacher
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f3eb}',
  ], // 👩🏻‍🏫 E4.0 woman teacher: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f3eb}',
  ], // 👩🏼‍🏫 E4.0 woman teacher: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f3eb}',
  ], // 👩🏽‍🏫 E4.0 woman teacher: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f3eb}',
  ], // 👩🏾‍🏫 E4.0 woman teacher: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f3eb}',
  ], // 👩🏿‍🏫 E4.0 woman teacher: dark skin tone
  [
    '\u{1f9d1}\u200d\u2696\ufe0f',
  ], // 🧑‍⚖️ E12.1 judge
  [
    '\u{1f9d1}\u200d\u2696',
  ], // 🧑‍⚖ E12.1 judge
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u2696\ufe0f',
  ], // 🧑🏻‍⚖️ E12.1 judge: light skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u2696',
  ], // 🧑🏻‍⚖ E12.1 judge: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u2696\ufe0f',
  ], // 🧑🏼‍⚖️ E12.1 judge: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u2696',
  ], // 🧑🏼‍⚖ E12.1 judge: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u2696\ufe0f',
  ], // 🧑🏽‍⚖️ E12.1 judge: medium skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u2696',
  ], // 🧑🏽‍⚖ E12.1 judge: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u2696\ufe0f',
  ], // 🧑🏾‍⚖️ E12.1 judge: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u2696',
  ], // 🧑🏾‍⚖ E12.1 judge: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u2696\ufe0f',
  ], // 🧑🏿‍⚖️ E12.1 judge: dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u2696',
  ], // 🧑🏿‍⚖ E12.1 judge: dark skin tone
  [
    '\u{1f468}\u200d\u2696\ufe0f',
  ], // 👨‍⚖️ E4.0 man judge
  [
    '\u{1f468}\u200d\u2696',
  ], // 👨‍⚖ E4.0 man judge
  [
    '\u{1f468}\u{1f3fb}\u200d\u2696\ufe0f',
  ], // 👨🏻‍⚖️ E4.0 man judge: light skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u2696',
  ], // 👨🏻‍⚖ E4.0 man judge: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2696\ufe0f',
  ], // 👨🏼‍⚖️ E4.0 man judge: medium-light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2696',
  ], // 👨🏼‍⚖ E4.0 man judge: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2696\ufe0f',
  ], // 👨🏽‍⚖️ E4.0 man judge: medium skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2696',
  ], // 👨🏽‍⚖ E4.0 man judge: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2696\ufe0f',
  ], // 👨🏾‍⚖️ E4.0 man judge: medium-dark skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2696',
  ], // 👨🏾‍⚖ E4.0 man judge: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2696\ufe0f',
  ], // 👨🏿‍⚖️ E4.0 man judge: dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2696',
  ], // 👨🏿‍⚖ E4.0 man judge: dark skin tone
  [
    '\u{1f469}\u200d\u2696\ufe0f',
  ], // 👩‍⚖️ E4.0 woman judge
  [
    '\u{1f469}\u200d\u2696',
  ], // 👩‍⚖ E4.0 woman judge
  [
    '\u{1f469}\u{1f3fb}\u200d\u2696\ufe0f',
  ], // 👩🏻‍⚖️ E4.0 woman judge: light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2696',
  ], // 👩🏻‍⚖ E4.0 woman judge: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2696\ufe0f',
  ], // 👩🏼‍⚖️ E4.0 woman judge: medium-light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2696',
  ], // 👩🏼‍⚖ E4.0 woman judge: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2696\ufe0f',
  ], // 👩🏽‍⚖️ E4.0 woman judge: medium skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2696',
  ], // 👩🏽‍⚖ E4.0 woman judge: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2696\ufe0f',
  ], // 👩🏾‍⚖️ E4.0 woman judge: medium-dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2696',
  ], // 👩🏾‍⚖ E4.0 woman judge: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2696\ufe0f',
  ], // 👩🏿‍⚖️ E4.0 woman judge: dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2696',
  ], // 👩🏿‍⚖ E4.0 woman judge: dark skin tone
  [
    '\u{1f9d1}\u200d\u{1f33e}',
  ], // 🧑‍🌾 E12.1 farmer
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f33e}',
  ], // 🧑🏻‍🌾 E12.1 farmer: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f33e}',
  ], // 🧑🏼‍🌾 E12.1 farmer: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f33e}',
  ], // 🧑🏽‍🌾 E12.1 farmer: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f33e}',
  ], // 🧑🏾‍🌾 E12.1 farmer: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f33e}',
  ], // 🧑🏿‍🌾 E12.1 farmer: dark skin tone
  [
    '\u{1f468}\u200d\u{1f33e}',
  ], // 👨‍🌾 E4.0 man farmer
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f33e}',
  ], // 👨🏻‍🌾 E4.0 man farmer: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f33e}',
  ], // 👨🏼‍🌾 E4.0 man farmer: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f33e}',
  ], // 👨🏽‍🌾 E4.0 man farmer: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f33e}',
  ], // 👨🏾‍🌾 E4.0 man farmer: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f33e}',
  ], // 👨🏿‍🌾 E4.0 man farmer: dark skin tone
  [
    '\u{1f469}\u200d\u{1f33e}',
  ], // 👩‍🌾 E4.0 woman farmer
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f33e}',
  ], // 👩🏻‍🌾 E4.0 woman farmer: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f33e}',
  ], // 👩🏼‍🌾 E4.0 woman farmer: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f33e}',
  ], // 👩🏽‍🌾 E4.0 woman farmer: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f33e}',
  ], // 👩🏾‍🌾 E4.0 woman farmer: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f33e}',
  ], // 👩🏿‍🌾 E4.0 woman farmer: dark skin tone
  [
    '\u{1f9d1}\u200d\u{1f373}',
  ], // 🧑‍🍳 E12.1 cook
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f373}',
  ], // 🧑🏻‍🍳 E12.1 cook: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f373}',
  ], // 🧑🏼‍🍳 E12.1 cook: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f373}',
  ], // 🧑🏽‍🍳 E12.1 cook: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f373}',
  ], // 🧑🏾‍🍳 E12.1 cook: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f373}',
  ], // 🧑🏿‍🍳 E12.1 cook: dark skin tone
  [
    '\u{1f468}\u200d\u{1f373}',
  ], // 👨‍🍳 E4.0 man cook
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f373}',
  ], // 👨🏻‍🍳 E4.0 man cook: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f373}',
  ], // 👨🏼‍🍳 E4.0 man cook: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f373}',
  ], // 👨🏽‍🍳 E4.0 man cook: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f373}',
  ], // 👨🏾‍🍳 E4.0 man cook: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f373}',
  ], // 👨🏿‍🍳 E4.0 man cook: dark skin tone
  [
    '\u{1f469}\u200d\u{1f373}',
  ], // 👩‍🍳 E4.0 woman cook
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f373}',
  ], // 👩🏻‍🍳 E4.0 woman cook: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f373}',
  ], // 👩🏼‍🍳 E4.0 woman cook: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f373}',
  ], // 👩🏽‍🍳 E4.0 woman cook: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f373}',
  ], // 👩🏾‍🍳 E4.0 woman cook: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f373}',
  ], // 👩🏿‍🍳 E4.0 woman cook: dark skin tone
  [
    '\u{1f9d1}\u200d\u{1f527}',
  ], // 🧑‍🔧 E12.1 mechanic
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f527}',
  ], // 🧑🏻‍🔧 E12.1 mechanic: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f527}',
  ], // 🧑🏼‍🔧 E12.1 mechanic: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f527}',
  ], // 🧑🏽‍🔧 E12.1 mechanic: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f527}',
  ], // 🧑🏾‍🔧 E12.1 mechanic: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f527}',
  ], // 🧑🏿‍🔧 E12.1 mechanic: dark skin tone
  [
    '\u{1f468}\u200d\u{1f527}',
  ], // 👨‍🔧 E4.0 man mechanic
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f527}',
  ], // 👨🏻‍🔧 E4.0 man mechanic: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f527}',
  ], // 👨🏼‍🔧 E4.0 man mechanic: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f527}',
  ], // 👨🏽‍🔧 E4.0 man mechanic: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f527}',
  ], // 👨🏾‍🔧 E4.0 man mechanic: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f527}',
  ], // 👨🏿‍🔧 E4.0 man mechanic: dark skin tone
  [
    '\u{1f469}\u200d\u{1f527}',
  ], // 👩‍🔧 E4.0 woman mechanic
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f527}',
  ], // 👩🏻‍🔧 E4.0 woman mechanic: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f527}',
  ], // 👩🏼‍🔧 E4.0 woman mechanic: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f527}',
  ], // 👩🏽‍🔧 E4.0 woman mechanic: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f527}',
  ], // 👩🏾‍🔧 E4.0 woman mechanic: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f527}',
  ], // 👩🏿‍🔧 E4.0 woman mechanic: dark skin tone
  [
    '\u{1f9d1}\u200d\u{1f3ed}',
  ], // 🧑‍🏭 E12.1 factory worker
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f3ed}',
  ], // 🧑🏻‍🏭 E12.1 factory worker: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f3ed}',
  ], // 🧑🏼‍🏭 E12.1 factory worker: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f3ed}',
  ], // 🧑🏽‍🏭 E12.1 factory worker: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f3ed}',
  ], // 🧑🏾‍🏭 E12.1 factory worker: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f3ed}',
  ], // 🧑🏿‍🏭 E12.1 factory worker: dark skin tone
  [
    '\u{1f468}\u200d\u{1f3ed}',
  ], // 👨‍🏭 E4.0 man factory worker
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f3ed}',
  ], // 👨🏻‍🏭 E4.0 man factory worker: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f3ed}',
  ], // 👨🏼‍🏭 E4.0 man factory worker: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f3ed}',
  ], // 👨🏽‍🏭 E4.0 man factory worker: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f3ed}',
  ], // 👨🏾‍🏭 E4.0 man factory worker: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f3ed}',
  ], // 👨🏿‍🏭 E4.0 man factory worker: dark skin tone
  [
    '\u{1f469}\u200d\u{1f3ed}',
  ], // 👩‍🏭 E4.0 woman factory worker
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f3ed}',
  ], // 👩🏻‍🏭 E4.0 woman factory worker: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f3ed}',
  ], // 👩🏼‍🏭 E4.0 woman factory worker: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f3ed}',
  ], // 👩🏽‍🏭 E4.0 woman factory worker: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f3ed}',
  ], // 👩🏾‍🏭 E4.0 woman factory worker: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f3ed}',
  ], // 👩🏿‍🏭 E4.0 woman factory worker: dark skin tone
  [
    '\u{1f9d1}\u200d\u{1f4bc}',
  ], // 🧑‍💼 E12.1 office worker
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f4bc}',
  ], // 🧑🏻‍💼 E12.1 office worker: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f4bc}',
  ], // 🧑🏼‍💼 E12.1 office worker: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f4bc}',
  ], // 🧑🏽‍💼 E12.1 office worker: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f4bc}',
  ], // 🧑🏾‍💼 E12.1 office worker: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f4bc}',
  ], // 🧑🏿‍💼 E12.1 office worker: dark skin tone
  [
    '\u{1f468}\u200d\u{1f4bc}',
  ], // 👨‍💼 E4.0 man office worker
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f4bc}',
  ], // 👨🏻‍💼 E4.0 man office worker: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f4bc}',
  ], // 👨🏼‍💼 E4.0 man office worker: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f4bc}',
  ], // 👨🏽‍💼 E4.0 man office worker: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f4bc}',
  ], // 👨🏾‍💼 E4.0 man office worker: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f4bc}',
  ], // 👨🏿‍💼 E4.0 man office worker: dark skin tone
  [
    '\u{1f469}\u200d\u{1f4bc}',
  ], // 👩‍💼 E4.0 woman office worker
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f4bc}',
  ], // 👩🏻‍💼 E4.0 woman office worker: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f4bc}',
  ], // 👩🏼‍💼 E4.0 woman office worker: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f4bc}',
  ], // 👩🏽‍💼 E4.0 woman office worker: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f4bc}',
  ], // 👩🏾‍💼 E4.0 woman office worker: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f4bc}',
  ], // 👩🏿‍💼 E4.0 woman office worker: dark skin tone
  [
    '\u{1f9d1}\u200d\u{1f52c}',
  ], // 🧑‍🔬 E12.1 scientist
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f52c}',
  ], // 🧑🏻‍🔬 E12.1 scientist: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f52c}',
  ], // 🧑🏼‍🔬 E12.1 scientist: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f52c}',
  ], // 🧑🏽‍🔬 E12.1 scientist: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f52c}',
  ], // 🧑🏾‍🔬 E12.1 scientist: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f52c}',
  ], // 🧑🏿‍🔬 E12.1 scientist: dark skin tone
  [
    '\u{1f468}\u200d\u{1f52c}',
  ], // 👨‍🔬 E4.0 man scientist
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f52c}',
  ], // 👨🏻‍🔬 E4.0 man scientist: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f52c}',
  ], // 👨🏼‍🔬 E4.0 man scientist: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f52c}',
  ], // 👨🏽‍🔬 E4.0 man scientist: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f52c}',
  ], // 👨🏾‍🔬 E4.0 man scientist: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f52c}',
  ], // 👨🏿‍🔬 E4.0 man scientist: dark skin tone
  [
    '\u{1f469}\u200d\u{1f52c}',
  ], // 👩‍🔬 E4.0 woman scientist
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f52c}',
  ], // 👩🏻‍🔬 E4.0 woman scientist: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f52c}',
  ], // 👩🏼‍🔬 E4.0 woman scientist: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f52c}',
  ], // 👩🏽‍🔬 E4.0 woman scientist: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f52c}',
  ], // 👩🏾‍🔬 E4.0 woman scientist: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f52c}',
  ], // 👩🏿‍🔬 E4.0 woman scientist: dark skin tone
  [
    '\u{1f9d1}\u200d\u{1f4bb}',
  ], // 🧑‍💻 E12.1 technologist
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f4bb}',
  ], // 🧑🏻‍💻 E12.1 technologist: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f4bb}',
  ], // 🧑🏼‍💻 E12.1 technologist: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f4bb}',
  ], // 🧑🏽‍💻 E12.1 technologist: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f4bb}',
  ], // 🧑🏾‍💻 E12.1 technologist: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f4bb}',
  ], // 🧑🏿‍💻 E12.1 technologist: dark skin tone
  [
    '\u{1f468}\u200d\u{1f4bb}',
  ], // 👨‍💻 E4.0 man technologist
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f4bb}',
  ], // 👨🏻‍💻 E4.0 man technologist: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f4bb}',
  ], // 👨🏼‍💻 E4.0 man technologist: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f4bb}',
  ], // 👨🏽‍💻 E4.0 man technologist: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f4bb}',
  ], // 👨🏾‍💻 E4.0 man technologist: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f4bb}',
  ], // 👨🏿‍💻 E4.0 man technologist: dark skin tone
  [
    '\u{1f469}\u200d\u{1f4bb}',
  ], // 👩‍💻 E4.0 woman technologist
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f4bb}',
  ], // 👩🏻‍💻 E4.0 woman technologist: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f4bb}',
  ], // 👩🏼‍💻 E4.0 woman technologist: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f4bb}',
  ], // 👩🏽‍💻 E4.0 woman technologist: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f4bb}',
  ], // 👩🏾‍💻 E4.0 woman technologist: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f4bb}',
  ], // 👩🏿‍💻 E4.0 woman technologist: dark skin tone
  [
    '\u{1f9d1}\u200d\u{1f3a4}',
  ], // 🧑‍🎤 E12.1 singer
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f3a4}',
  ], // 🧑🏻‍🎤 E12.1 singer: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f3a4}',
  ], // 🧑🏼‍🎤 E12.1 singer: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f3a4}',
  ], // 🧑🏽‍🎤 E12.1 singer: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f3a4}',
  ], // 🧑🏾‍🎤 E12.1 singer: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f3a4}',
  ], // 🧑🏿‍🎤 E12.1 singer: dark skin tone
  [
    '\u{1f468}\u200d\u{1f3a4}',
  ], // 👨‍🎤 E4.0 man singer
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f3a4}',
  ], // 👨🏻‍🎤 E4.0 man singer: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f3a4}',
  ], // 👨🏼‍🎤 E4.0 man singer: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f3a4}',
  ], // 👨🏽‍🎤 E4.0 man singer: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f3a4}',
  ], // 👨🏾‍🎤 E4.0 man singer: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f3a4}',
  ], // 👨🏿‍🎤 E4.0 man singer: dark skin tone
  [
    '\u{1f469}\u200d\u{1f3a4}',
  ], // 👩‍🎤 E4.0 woman singer
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f3a4}',
  ], // 👩🏻‍🎤 E4.0 woman singer: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f3a4}',
  ], // 👩🏼‍🎤 E4.0 woman singer: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f3a4}',
  ], // 👩🏽‍🎤 E4.0 woman singer: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f3a4}',
  ], // 👩🏾‍🎤 E4.0 woman singer: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f3a4}',
  ], // 👩🏿‍🎤 E4.0 woman singer: dark skin tone
  [
    '\u{1f9d1}\u200d\u{1f3a8}',
  ], // 🧑‍🎨 E12.1 artist
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f3a8}',
  ], // 🧑🏻‍🎨 E12.1 artist: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f3a8}',
  ], // 🧑🏼‍🎨 E12.1 artist: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f3a8}',
  ], // 🧑🏽‍🎨 E12.1 artist: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f3a8}',
  ], // 🧑🏾‍🎨 E12.1 artist: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f3a8}',
  ], // 🧑🏿‍🎨 E12.1 artist: dark skin tone
  [
    '\u{1f468}\u200d\u{1f3a8}',
  ], // 👨‍🎨 E4.0 man artist
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f3a8}',
  ], // 👨🏻‍🎨 E4.0 man artist: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f3a8}',
  ], // 👨🏼‍🎨 E4.0 man artist: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f3a8}',
  ], // 👨🏽‍🎨 E4.0 man artist: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f3a8}',
  ], // 👨🏾‍🎨 E4.0 man artist: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f3a8}',
  ], // 👨🏿‍🎨 E4.0 man artist: dark skin tone
  [
    '\u{1f469}\u200d\u{1f3a8}',
  ], // 👩‍🎨 E4.0 woman artist
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f3a8}',
  ], // 👩🏻‍🎨 E4.0 woman artist: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f3a8}',
  ], // 👩🏼‍🎨 E4.0 woman artist: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f3a8}',
  ], // 👩🏽‍🎨 E4.0 woman artist: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f3a8}',
  ], // 👩🏾‍🎨 E4.0 woman artist: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f3a8}',
  ], // 👩🏿‍🎨 E4.0 woman artist: dark skin tone
  [
    '\u{1f9d1}\u200d\u2708\ufe0f',
  ], // 🧑‍✈️ E12.1 pilot
  [
    '\u{1f9d1}\u200d\u2708',
  ], // 🧑‍✈ E12.1 pilot
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u2708\ufe0f',
  ], // 🧑🏻‍✈️ E12.1 pilot: light skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u2708',
  ], // 🧑🏻‍✈ E12.1 pilot: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u2708\ufe0f',
  ], // 🧑🏼‍✈️ E12.1 pilot: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u2708',
  ], // 🧑🏼‍✈ E12.1 pilot: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u2708\ufe0f',
  ], // 🧑🏽‍✈️ E12.1 pilot: medium skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u2708',
  ], // 🧑🏽‍✈ E12.1 pilot: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u2708\ufe0f',
  ], // 🧑🏾‍✈️ E12.1 pilot: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u2708',
  ], // 🧑🏾‍✈ E12.1 pilot: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u2708\ufe0f',
  ], // 🧑🏿‍✈️ E12.1 pilot: dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u2708',
  ], // 🧑🏿‍✈ E12.1 pilot: dark skin tone
  [
    '\u{1f468}\u200d\u2708\ufe0f',
  ], // 👨‍✈️ E4.0 man pilot
  [
    '\u{1f468}\u200d\u2708',
  ], // 👨‍✈ E4.0 man pilot
  [
    '\u{1f468}\u{1f3fb}\u200d\u2708\ufe0f',
  ], // 👨🏻‍✈️ E4.0 man pilot: light skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u2708',
  ], // 👨🏻‍✈ E4.0 man pilot: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2708\ufe0f',
  ], // 👨🏼‍✈️ E4.0 man pilot: medium-light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2708',
  ], // 👨🏼‍✈ E4.0 man pilot: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2708\ufe0f',
  ], // 👨🏽‍✈️ E4.0 man pilot: medium skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2708',
  ], // 👨🏽‍✈ E4.0 man pilot: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2708\ufe0f',
  ], // 👨🏾‍✈️ E4.0 man pilot: medium-dark skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2708',
  ], // 👨🏾‍✈ E4.0 man pilot: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2708\ufe0f',
  ], // 👨🏿‍✈️ E4.0 man pilot: dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2708',
  ], // 👨🏿‍✈ E4.0 man pilot: dark skin tone
  [
    '\u{1f469}\u200d\u2708\ufe0f',
  ], // 👩‍✈️ E4.0 woman pilot
  [
    '\u{1f469}\u200d\u2708',
  ], // 👩‍✈ E4.0 woman pilot
  [
    '\u{1f469}\u{1f3fb}\u200d\u2708\ufe0f',
  ], // 👩🏻‍✈️ E4.0 woman pilot: light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2708',
  ], // 👩🏻‍✈ E4.0 woman pilot: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2708\ufe0f',
  ], // 👩🏼‍✈️ E4.0 woman pilot: medium-light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2708',
  ], // 👩🏼‍✈ E4.0 woman pilot: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2708\ufe0f',
  ], // 👩🏽‍✈️ E4.0 woman pilot: medium skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2708',
  ], // 👩🏽‍✈ E4.0 woman pilot: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2708\ufe0f',
  ], // 👩🏾‍✈️ E4.0 woman pilot: medium-dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2708',
  ], // 👩🏾‍✈ E4.0 woman pilot: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2708\ufe0f',
  ], // 👩🏿‍✈️ E4.0 woman pilot: dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2708',
  ], // 👩🏿‍✈ E4.0 woman pilot: dark skin tone
  [
    '\u{1f9d1}\u200d\u{1f680}',
  ], // 🧑‍🚀 E12.1 astronaut
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f680}',
  ], // 🧑🏻‍🚀 E12.1 astronaut: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f680}',
  ], // 🧑🏼‍🚀 E12.1 astronaut: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f680}',
  ], // 🧑🏽‍🚀 E12.1 astronaut: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f680}',
  ], // 🧑🏾‍🚀 E12.1 astronaut: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f680}',
  ], // 🧑🏿‍🚀 E12.1 astronaut: dark skin tone
  [
    '\u{1f468}\u200d\u{1f680}',
  ], // 👨‍🚀 E4.0 man astronaut
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f680}',
  ], // 👨🏻‍🚀 E4.0 man astronaut: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f680}',
  ], // 👨🏼‍🚀 E4.0 man astronaut: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f680}',
  ], // 👨🏽‍🚀 E4.0 man astronaut: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f680}',
  ], // 👨🏾‍🚀 E4.0 man astronaut: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f680}',
  ], // 👨🏿‍🚀 E4.0 man astronaut: dark skin tone
  [
    '\u{1f469}\u200d\u{1f680}',
  ], // 👩‍🚀 E4.0 woman astronaut
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f680}',
  ], // 👩🏻‍🚀 E4.0 woman astronaut: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f680}',
  ], // 👩🏼‍🚀 E4.0 woman astronaut: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f680}',
  ], // 👩🏽‍🚀 E4.0 woman astronaut: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f680}',
  ], // 👩🏾‍🚀 E4.0 woman astronaut: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f680}',
  ], // 👩🏿‍🚀 E4.0 woman astronaut: dark skin tone
  [
    '\u{1f9d1}\u200d\u{1f692}',
  ], // 🧑‍🚒 E12.1 firefighter
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f692}',
  ], // 🧑🏻‍🚒 E12.1 firefighter: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f692}',
  ], // 🧑🏼‍🚒 E12.1 firefighter: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f692}',
  ], // 🧑🏽‍🚒 E12.1 firefighter: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f692}',
  ], // 🧑🏾‍🚒 E12.1 firefighter: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f692}',
  ], // 🧑🏿‍🚒 E12.1 firefighter: dark skin tone
  [
    '\u{1f468}\u200d\u{1f692}',
  ], // 👨‍🚒 E4.0 man firefighter
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f692}',
  ], // 👨🏻‍🚒 E4.0 man firefighter: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f692}',
  ], // 👨🏼‍🚒 E4.0 man firefighter: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f692}',
  ], // 👨🏽‍🚒 E4.0 man firefighter: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f692}',
  ], // 👨🏾‍🚒 E4.0 man firefighter: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f692}',
  ], // 👨🏿‍🚒 E4.0 man firefighter: dark skin tone
  [
    '\u{1f469}\u200d\u{1f692}',
  ], // 👩‍🚒 E4.0 woman firefighter
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f692}',
  ], // 👩🏻‍🚒 E4.0 woman firefighter: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f692}',
  ], // 👩🏼‍🚒 E4.0 woman firefighter: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f692}',
  ], // 👩🏽‍🚒 E4.0 woman firefighter: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f692}',
  ], // 👩🏾‍🚒 E4.0 woman firefighter: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f692}',
  ], // 👩🏿‍🚒 E4.0 woman firefighter: dark skin tone
  [
    '\u{1f46e}',
  ], // 👮 E0.6 police officer
  [
    '\u{1f46e}\u{1f3fb}',
  ], // 👮🏻 E1.0 police officer: light skin tone
  [
    '\u{1f46e}\u{1f3fc}',
  ], // 👮🏼 E1.0 police officer: medium-light skin tone
  [
    '\u{1f46e}\u{1f3fd}',
  ], // 👮🏽 E1.0 police officer: medium skin tone
  [
    '\u{1f46e}\u{1f3fe}',
  ], // 👮🏾 E1.0 police officer: medium-dark skin tone
  [
    '\u{1f46e}\u{1f3ff}',
  ], // 👮🏿 E1.0 police officer: dark skin tone
  [
    '\u{1f46e}\u200d\u2642\ufe0f',
  ], // 👮‍♂️ E4.0 man police officer
  [
    '\u{1f46e}\u200d\u2642',
  ], // 👮‍♂ E4.0 man police officer
  [
    '\u{1f46e}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 👮🏻‍♂️ E4.0 man police officer: light skin tone
  [
    '\u{1f46e}\u{1f3fb}\u200d\u2642',
  ], // 👮🏻‍♂ E4.0 man police officer: light skin tone
  [
    '\u{1f46e}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 👮🏼‍♂️ E4.0 man police officer: medium-light skin tone
  [
    '\u{1f46e}\u{1f3fc}\u200d\u2642',
  ], // 👮🏼‍♂ E4.0 man police officer: medium-light skin tone
  [
    '\u{1f46e}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 👮🏽‍♂️ E4.0 man police officer: medium skin tone
  [
    '\u{1f46e}\u{1f3fd}\u200d\u2642',
  ], // 👮🏽‍♂ E4.0 man police officer: medium skin tone
  [
    '\u{1f46e}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 👮🏾‍♂️ E4.0 man police officer: medium-dark skin tone
  [
    '\u{1f46e}\u{1f3fe}\u200d\u2642',
  ], // 👮🏾‍♂ E4.0 man police officer: medium-dark skin tone
  [
    '\u{1f46e}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 👮🏿‍♂️ E4.0 man police officer: dark skin tone
  [
    '\u{1f46e}\u{1f3ff}\u200d\u2642',
  ], // 👮🏿‍♂ E4.0 man police officer: dark skin tone
  [
    '\u{1f46e}\u200d\u2640\ufe0f',
  ], // 👮‍♀️ E4.0 woman police officer
  [
    '\u{1f46e}\u200d\u2640',
  ], // 👮‍♀ E4.0 woman police officer
  [
    '\u{1f46e}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 👮🏻‍♀️ E4.0 woman police officer: light skin tone
  [
    '\u{1f46e}\u{1f3fb}\u200d\u2640',
  ], // 👮🏻‍♀ E4.0 woman police officer: light skin tone
  [
    '\u{1f46e}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 👮🏼‍♀️ E4.0 woman police officer: medium-light skin tone
  [
    '\u{1f46e}\u{1f3fc}\u200d\u2640',
  ], // 👮🏼‍♀ E4.0 woman police officer: medium-light skin tone
  [
    '\u{1f46e}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 👮🏽‍♀️ E4.0 woman police officer: medium skin tone
  [
    '\u{1f46e}\u{1f3fd}\u200d\u2640',
  ], // 👮🏽‍♀ E4.0 woman police officer: medium skin tone
  [
    '\u{1f46e}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 👮🏾‍♀️ E4.0 woman police officer: medium-dark skin tone
  [
    '\u{1f46e}\u{1f3fe}\u200d\u2640',
  ], // 👮🏾‍♀ E4.0 woman police officer: medium-dark skin tone
  [
    '\u{1f46e}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 👮🏿‍♀️ E4.0 woman police officer: dark skin tone
  [
    '\u{1f46e}\u{1f3ff}\u200d\u2640',
  ], // 👮🏿‍♀ E4.0 woman police officer: dark skin tone
  [
    '\u{1f575}\ufe0f',
  ], // 🕵️ E0.7 detective
  [
    '\u{1f575}',
  ], // 🕵 E0.7 detective
  [
    '\u{1f575}\u{1f3fb}',
  ], // 🕵🏻 E2.0 detective: light skin tone
  [
    '\u{1f575}\u{1f3fc}',
  ], // 🕵🏼 E2.0 detective: medium-light skin tone
  [
    '\u{1f575}\u{1f3fd}',
  ], // 🕵🏽 E2.0 detective: medium skin tone
  [
    '\u{1f575}\u{1f3fe}',
  ], // 🕵🏾 E2.0 detective: medium-dark skin tone
  [
    '\u{1f575}\u{1f3ff}',
  ], // 🕵🏿 E2.0 detective: dark skin tone
  [
    '\u{1f575}\ufe0f\u200d\u2642\ufe0f',
  ], // 🕵️‍♂️ E4.0 man detective
  [
    '\u{1f575}\u200d\u2642\ufe0f',
  ], // 🕵‍♂️ E4.0 man detective
  [
    '\u{1f575}\ufe0f\u200d\u2642',
  ], // 🕵️‍♂ E4.0 man detective
  [
    '\u{1f575}\u200d\u2642',
  ], // 🕵‍♂ E4.0 man detective
  [
    '\u{1f575}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🕵🏻‍♂️ E4.0 man detective: light skin tone
  [
    '\u{1f575}\u{1f3fb}\u200d\u2642',
  ], // 🕵🏻‍♂ E4.0 man detective: light skin tone
  [
    '\u{1f575}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🕵🏼‍♂️ E4.0 man detective: medium-light skin tone
  [
    '\u{1f575}\u{1f3fc}\u200d\u2642',
  ], // 🕵🏼‍♂ E4.0 man detective: medium-light skin tone
  [
    '\u{1f575}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🕵🏽‍♂️ E4.0 man detective: medium skin tone
  [
    '\u{1f575}\u{1f3fd}\u200d\u2642',
  ], // 🕵🏽‍♂ E4.0 man detective: medium skin tone
  [
    '\u{1f575}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🕵🏾‍♂️ E4.0 man detective: medium-dark skin tone
  [
    '\u{1f575}\u{1f3fe}\u200d\u2642',
  ], // 🕵🏾‍♂ E4.0 man detective: medium-dark skin tone
  [
    '\u{1f575}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🕵🏿‍♂️ E4.0 man detective: dark skin tone
  [
    '\u{1f575}\u{1f3ff}\u200d\u2642',
  ], // 🕵🏿‍♂ E4.0 man detective: dark skin tone
  [
    '\u{1f575}\ufe0f\u200d\u2640\ufe0f',
  ], // 🕵️‍♀️ E4.0 woman detective
  [
    '\u{1f575}\u200d\u2640\ufe0f',
  ], // 🕵‍♀️ E4.0 woman detective
  [
    '\u{1f575}\ufe0f\u200d\u2640',
  ], // 🕵️‍♀ E4.0 woman detective
  [
    '\u{1f575}\u200d\u2640',
  ], // 🕵‍♀ E4.0 woman detective
  [
    '\u{1f575}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🕵🏻‍♀️ E4.0 woman detective: light skin tone
  [
    '\u{1f575}\u{1f3fb}\u200d\u2640',
  ], // 🕵🏻‍♀ E4.0 woman detective: light skin tone
  [
    '\u{1f575}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🕵🏼‍♀️ E4.0 woman detective: medium-light skin tone
  [
    '\u{1f575}\u{1f3fc}\u200d\u2640',
  ], // 🕵🏼‍♀ E4.0 woman detective: medium-light skin tone
  [
    '\u{1f575}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🕵🏽‍♀️ E4.0 woman detective: medium skin tone
  [
    '\u{1f575}\u{1f3fd}\u200d\u2640',
  ], // 🕵🏽‍♀ E4.0 woman detective: medium skin tone
  [
    '\u{1f575}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🕵🏾‍♀️ E4.0 woman detective: medium-dark skin tone
  [
    '\u{1f575}\u{1f3fe}\u200d\u2640',
  ], // 🕵🏾‍♀ E4.0 woman detective: medium-dark skin tone
  [
    '\u{1f575}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🕵🏿‍♀️ E4.0 woman detective: dark skin tone
  [
    '\u{1f575}\u{1f3ff}\u200d\u2640',
  ], // 🕵🏿‍♀ E4.0 woman detective: dark skin tone
  [
    '\u{1f482}',
  ], // 💂 E0.6 guard
  [
    '\u{1f482}\u{1f3fb}',
  ], // 💂🏻 E1.0 guard: light skin tone
  [
    '\u{1f482}\u{1f3fc}',
  ], // 💂🏼 E1.0 guard: medium-light skin tone
  [
    '\u{1f482}\u{1f3fd}',
  ], // 💂🏽 E1.0 guard: medium skin tone
  [
    '\u{1f482}\u{1f3fe}',
  ], // 💂🏾 E1.0 guard: medium-dark skin tone
  [
    '\u{1f482}\u{1f3ff}',
  ], // 💂🏿 E1.0 guard: dark skin tone
  [
    '\u{1f482}\u200d\u2642\ufe0f',
  ], // 💂‍♂️ E4.0 man guard
  [
    '\u{1f482}\u200d\u2642',
  ], // 💂‍♂ E4.0 man guard
  [
    '\u{1f482}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 💂🏻‍♂️ E4.0 man guard: light skin tone
  [
    '\u{1f482}\u{1f3fb}\u200d\u2642',
  ], // 💂🏻‍♂ E4.0 man guard: light skin tone
  [
    '\u{1f482}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 💂🏼‍♂️ E4.0 man guard: medium-light skin tone
  [
    '\u{1f482}\u{1f3fc}\u200d\u2642',
  ], // 💂🏼‍♂ E4.0 man guard: medium-light skin tone
  [
    '\u{1f482}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 💂🏽‍♂️ E4.0 man guard: medium skin tone
  [
    '\u{1f482}\u{1f3fd}\u200d\u2642',
  ], // 💂🏽‍♂ E4.0 man guard: medium skin tone
  [
    '\u{1f482}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 💂🏾‍♂️ E4.0 man guard: medium-dark skin tone
  [
    '\u{1f482}\u{1f3fe}\u200d\u2642',
  ], // 💂🏾‍♂ E4.0 man guard: medium-dark skin tone
  [
    '\u{1f482}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 💂🏿‍♂️ E4.0 man guard: dark skin tone
  [
    '\u{1f482}\u{1f3ff}\u200d\u2642',
  ], // 💂🏿‍♂ E4.0 man guard: dark skin tone
  [
    '\u{1f482}\u200d\u2640\ufe0f',
  ], // 💂‍♀️ E4.0 woman guard
  [
    '\u{1f482}\u200d\u2640',
  ], // 💂‍♀ E4.0 woman guard
  [
    '\u{1f482}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 💂🏻‍♀️ E4.0 woman guard: light skin tone
  [
    '\u{1f482}\u{1f3fb}\u200d\u2640',
  ], // 💂🏻‍♀ E4.0 woman guard: light skin tone
  [
    '\u{1f482}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 💂🏼‍♀️ E4.0 woman guard: medium-light skin tone
  [
    '\u{1f482}\u{1f3fc}\u200d\u2640',
  ], // 💂🏼‍♀ E4.0 woman guard: medium-light skin tone
  [
    '\u{1f482}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 💂🏽‍♀️ E4.0 woman guard: medium skin tone
  [
    '\u{1f482}\u{1f3fd}\u200d\u2640',
  ], // 💂🏽‍♀ E4.0 woman guard: medium skin tone
  [
    '\u{1f482}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 💂🏾‍♀️ E4.0 woman guard: medium-dark skin tone
  [
    '\u{1f482}\u{1f3fe}\u200d\u2640',
  ], // 💂🏾‍♀ E4.0 woman guard: medium-dark skin tone
  [
    '\u{1f482}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 💂🏿‍♀️ E4.0 woman guard: dark skin tone
  [
    '\u{1f482}\u{1f3ff}\u200d\u2640',
  ], // 💂🏿‍♀ E4.0 woman guard: dark skin tone
  [
    '\u{1f977}',
  ], // 🥷 E13.0 ninja
  [
    '\u{1f977}\u{1f3fb}',
  ], // 🥷🏻 E13.0 ninja: light skin tone
  [
    '\u{1f977}\u{1f3fc}',
  ], // 🥷🏼 E13.0 ninja: medium-light skin tone
  [
    '\u{1f977}\u{1f3fd}',
  ], // 🥷🏽 E13.0 ninja: medium skin tone
  [
    '\u{1f977}\u{1f3fe}',
  ], // 🥷🏾 E13.0 ninja: medium-dark skin tone
  [
    '\u{1f977}\u{1f3ff}',
  ], // 🥷🏿 E13.0 ninja: dark skin tone
  [
    '\u{1f477}',
  ], // 👷 E0.6 construction worker
  [
    '\u{1f477}\u{1f3fb}',
  ], // 👷🏻 E1.0 construction worker: light skin tone
  [
    '\u{1f477}\u{1f3fc}',
  ], // 👷🏼 E1.0 construction worker: medium-light skin tone
  [
    '\u{1f477}\u{1f3fd}',
  ], // 👷🏽 E1.0 construction worker: medium skin tone
  [
    '\u{1f477}\u{1f3fe}',
  ], // 👷🏾 E1.0 construction worker: medium-dark skin tone
  [
    '\u{1f477}\u{1f3ff}',
  ], // 👷🏿 E1.0 construction worker: dark skin tone
  [
    '\u{1f477}\u200d\u2642\ufe0f',
  ], // 👷‍♂️ E4.0 man construction worker
  [
    '\u{1f477}\u200d\u2642',
  ], // 👷‍♂ E4.0 man construction worker
  [
    '\u{1f477}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 👷🏻‍♂️ E4.0 man construction worker: light skin tone
  [
    '\u{1f477}\u{1f3fb}\u200d\u2642',
  ], // 👷🏻‍♂ E4.0 man construction worker: light skin tone
  [
    '\u{1f477}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 👷🏼‍♂️ E4.0 man construction worker: medium-light skin tone
  [
    '\u{1f477}\u{1f3fc}\u200d\u2642',
  ], // 👷🏼‍♂ E4.0 man construction worker: medium-light skin tone
  [
    '\u{1f477}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 👷🏽‍♂️ E4.0 man construction worker: medium skin tone
  [
    '\u{1f477}\u{1f3fd}\u200d\u2642',
  ], // 👷🏽‍♂ E4.0 man construction worker: medium skin tone
  [
    '\u{1f477}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 👷🏾‍♂️ E4.0 man construction worker: medium-dark skin tone
  [
    '\u{1f477}\u{1f3fe}\u200d\u2642',
  ], // 👷🏾‍♂ E4.0 man construction worker: medium-dark skin tone
  [
    '\u{1f477}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 👷🏿‍♂️ E4.0 man construction worker: dark skin tone
  [
    '\u{1f477}\u{1f3ff}\u200d\u2642',
  ], // 👷🏿‍♂ E4.0 man construction worker: dark skin tone
  [
    '\u{1f477}\u200d\u2640\ufe0f',
  ], // 👷‍♀️ E4.0 woman construction worker
  [
    '\u{1f477}\u200d\u2640',
  ], // 👷‍♀ E4.0 woman construction worker
  [
    '\u{1f477}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 👷🏻‍♀️ E4.0 woman construction worker: light skin tone
  [
    '\u{1f477}\u{1f3fb}\u200d\u2640',
  ], // 👷🏻‍♀ E4.0 woman construction worker: light skin tone
  [
    '\u{1f477}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 👷🏼‍♀️ E4.0 woman construction worker: medium-light skin tone
  [
    '\u{1f477}\u{1f3fc}\u200d\u2640',
  ], // 👷🏼‍♀ E4.0 woman construction worker: medium-light skin tone
  [
    '\u{1f477}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 👷🏽‍♀️ E4.0 woman construction worker: medium skin tone
  [
    '\u{1f477}\u{1f3fd}\u200d\u2640',
  ], // 👷🏽‍♀ E4.0 woman construction worker: medium skin tone
  [
    '\u{1f477}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 👷🏾‍♀️ E4.0 woman construction worker: medium-dark skin tone
  [
    '\u{1f477}\u{1f3fe}\u200d\u2640',
  ], // 👷🏾‍♀ E4.0 woman construction worker: medium-dark skin tone
  [
    '\u{1f477}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 👷🏿‍♀️ E4.0 woman construction worker: dark skin tone
  [
    '\u{1f477}\u{1f3ff}\u200d\u2640',
  ], // 👷🏿‍♀ E4.0 woman construction worker: dark skin tone
  [
    '\u{1fac5}',
  ], // 🫅 E14.0 person with crown
  [
    '\u{1fac5}\u{1f3fb}',
  ], // 🫅🏻 E14.0 person with crown: light skin tone
  [
    '\u{1fac5}\u{1f3fc}',
  ], // 🫅🏼 E14.0 person with crown: medium-light skin tone
  [
    '\u{1fac5}\u{1f3fd}',
  ], // 🫅🏽 E14.0 person with crown: medium skin tone
  [
    '\u{1fac5}\u{1f3fe}',
  ], // 🫅🏾 E14.0 person with crown: medium-dark skin tone
  [
    '\u{1fac5}\u{1f3ff}',
  ], // 🫅🏿 E14.0 person with crown: dark skin tone
  [
    '\u{1f934}',
  ], // 🤴 E3.0 prince
  [
    '\u{1f934}\u{1f3fb}',
  ], // 🤴🏻 E3.0 prince: light skin tone
  [
    '\u{1f934}\u{1f3fc}',
  ], // 🤴🏼 E3.0 prince: medium-light skin tone
  [
    '\u{1f934}\u{1f3fd}',
  ], // 🤴🏽 E3.0 prince: medium skin tone
  [
    '\u{1f934}\u{1f3fe}',
  ], // 🤴🏾 E3.0 prince: medium-dark skin tone
  [
    '\u{1f934}\u{1f3ff}',
  ], // 🤴🏿 E3.0 prince: dark skin tone
  [
    '\u{1f478}',
  ], // 👸 E0.6 princess
  [
    '\u{1f478}\u{1f3fb}',
  ], // 👸🏻 E1.0 princess: light skin tone
  [
    '\u{1f478}\u{1f3fc}',
  ], // 👸🏼 E1.0 princess: medium-light skin tone
  [
    '\u{1f478}\u{1f3fd}',
  ], // 👸🏽 E1.0 princess: medium skin tone
  [
    '\u{1f478}\u{1f3fe}',
  ], // 👸🏾 E1.0 princess: medium-dark skin tone
  [
    '\u{1f478}\u{1f3ff}',
  ], // 👸🏿 E1.0 princess: dark skin tone
  [
    '\u{1f473}',
  ], // 👳 E0.6 person wearing turban
  [
    '\u{1f473}\u{1f3fb}',
  ], // 👳🏻 E1.0 person wearing turban: light skin tone
  [
    '\u{1f473}\u{1f3fc}',
  ], // 👳🏼 E1.0 person wearing turban: medium-light skin tone
  [
    '\u{1f473}\u{1f3fd}',
  ], // 👳🏽 E1.0 person wearing turban: medium skin tone
  [
    '\u{1f473}\u{1f3fe}',
  ], // 👳🏾 E1.0 person wearing turban: medium-dark skin tone
  [
    '\u{1f473}\u{1f3ff}',
  ], // 👳🏿 E1.0 person wearing turban: dark skin tone
  [
    '\u{1f473}\u200d\u2642\ufe0f',
  ], // 👳‍♂️ E4.0 man wearing turban
  [
    '\u{1f473}\u200d\u2642',
  ], // 👳‍♂ E4.0 man wearing turban
  [
    '\u{1f473}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 👳🏻‍♂️ E4.0 man wearing turban: light skin tone
  [
    '\u{1f473}\u{1f3fb}\u200d\u2642',
  ], // 👳🏻‍♂ E4.0 man wearing turban: light skin tone
  [
    '\u{1f473}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 👳🏼‍♂️ E4.0 man wearing turban: medium-light skin tone
  [
    '\u{1f473}\u{1f3fc}\u200d\u2642',
  ], // 👳🏼‍♂ E4.0 man wearing turban: medium-light skin tone
  [
    '\u{1f473}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 👳🏽‍♂️ E4.0 man wearing turban: medium skin tone
  [
    '\u{1f473}\u{1f3fd}\u200d\u2642',
  ], // 👳🏽‍♂ E4.0 man wearing turban: medium skin tone
  [
    '\u{1f473}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 👳🏾‍♂️ E4.0 man wearing turban: medium-dark skin tone
  [
    '\u{1f473}\u{1f3fe}\u200d\u2642',
  ], // 👳🏾‍♂ E4.0 man wearing turban: medium-dark skin tone
  [
    '\u{1f473}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 👳🏿‍♂️ E4.0 man wearing turban: dark skin tone
  [
    '\u{1f473}\u{1f3ff}\u200d\u2642',
  ], // 👳🏿‍♂ E4.0 man wearing turban: dark skin tone
  [
    '\u{1f473}\u200d\u2640\ufe0f',
  ], // 👳‍♀️ E4.0 woman wearing turban
  [
    '\u{1f473}\u200d\u2640',
  ], // 👳‍♀ E4.0 woman wearing turban
  [
    '\u{1f473}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 👳🏻‍♀️ E4.0 woman wearing turban: light skin tone
  [
    '\u{1f473}\u{1f3fb}\u200d\u2640',
  ], // 👳🏻‍♀ E4.0 woman wearing turban: light skin tone
  [
    '\u{1f473}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 👳🏼‍♀️ E4.0 woman wearing turban: medium-light skin tone
  [
    '\u{1f473}\u{1f3fc}\u200d\u2640',
  ], // 👳🏼‍♀ E4.0 woman wearing turban: medium-light skin tone
  [
    '\u{1f473}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 👳🏽‍♀️ E4.0 woman wearing turban: medium skin tone
  [
    '\u{1f473}\u{1f3fd}\u200d\u2640',
  ], // 👳🏽‍♀ E4.0 woman wearing turban: medium skin tone
  [
    '\u{1f473}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 👳🏾‍♀️ E4.0 woman wearing turban: medium-dark skin tone
  [
    '\u{1f473}\u{1f3fe}\u200d\u2640',
  ], // 👳🏾‍♀ E4.0 woman wearing turban: medium-dark skin tone
  [
    '\u{1f473}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 👳🏿‍♀️ E4.0 woman wearing turban: dark skin tone
  [
    '\u{1f473}\u{1f3ff}\u200d\u2640',
  ], // 👳🏿‍♀ E4.0 woman wearing turban: dark skin tone
  [
    '\u{1f472}',
  ], // 👲 E0.6 person with skullcap
  [
    '\u{1f472}\u{1f3fb}',
  ], // 👲🏻 E1.0 person with skullcap: light skin tone
  [
    '\u{1f472}\u{1f3fc}',
  ], // 👲🏼 E1.0 person with skullcap: medium-light skin tone
  [
    '\u{1f472}\u{1f3fd}',
  ], // 👲🏽 E1.0 person with skullcap: medium skin tone
  [
    '\u{1f472}\u{1f3fe}',
  ], // 👲🏾 E1.0 person with skullcap: medium-dark skin tone
  [
    '\u{1f472}\u{1f3ff}',
  ], // 👲🏿 E1.0 person with skullcap: dark skin tone
  [
    '\u{1f9d5}',
  ], // 🧕 E5.0 woman with headscarf
  [
    '\u{1f9d5}\u{1f3fb}',
  ], // 🧕🏻 E5.0 woman with headscarf: light skin tone
  [
    '\u{1f9d5}\u{1f3fc}',
  ], // 🧕🏼 E5.0 woman with headscarf: medium-light skin tone
  [
    '\u{1f9d5}\u{1f3fd}',
  ], // 🧕🏽 E5.0 woman with headscarf: medium skin tone
  [
    '\u{1f9d5}\u{1f3fe}',
  ], // 🧕🏾 E5.0 woman with headscarf: medium-dark skin tone
  [
    '\u{1f9d5}\u{1f3ff}',
  ], // 🧕🏿 E5.0 woman with headscarf: dark skin tone
  [
    '\u{1f935}',
  ], // 🤵 E3.0 person in tuxedo
  [
    '\u{1f935}\u{1f3fb}',
  ], // 🤵🏻 E3.0 person in tuxedo: light skin tone
  [
    '\u{1f935}\u{1f3fc}',
  ], // 🤵🏼 E3.0 person in tuxedo: medium-light skin tone
  [
    '\u{1f935}\u{1f3fd}',
  ], // 🤵🏽 E3.0 person in tuxedo: medium skin tone
  [
    '\u{1f935}\u{1f3fe}',
  ], // 🤵🏾 E3.0 person in tuxedo: medium-dark skin tone
  [
    '\u{1f935}\u{1f3ff}',
  ], // 🤵🏿 E3.0 person in tuxedo: dark skin tone
  [
    '\u{1f935}\u200d\u2642\ufe0f',
  ], // 🤵‍♂️ E13.0 man in tuxedo
  [
    '\u{1f935}\u200d\u2642',
  ], // 🤵‍♂ E13.0 man in tuxedo
  [
    '\u{1f935}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🤵🏻‍♂️ E13.0 man in tuxedo: light skin tone
  [
    '\u{1f935}\u{1f3fb}\u200d\u2642',
  ], // 🤵🏻‍♂ E13.0 man in tuxedo: light skin tone
  [
    '\u{1f935}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🤵🏼‍♂️ E13.0 man in tuxedo: medium-light skin tone
  [
    '\u{1f935}\u{1f3fc}\u200d\u2642',
  ], // 🤵🏼‍♂ E13.0 man in tuxedo: medium-light skin tone
  [
    '\u{1f935}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🤵🏽‍♂️ E13.0 man in tuxedo: medium skin tone
  [
    '\u{1f935}\u{1f3fd}\u200d\u2642',
  ], // 🤵🏽‍♂ E13.0 man in tuxedo: medium skin tone
  [
    '\u{1f935}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🤵🏾‍♂️ E13.0 man in tuxedo: medium-dark skin tone
  [
    '\u{1f935}\u{1f3fe}\u200d\u2642',
  ], // 🤵🏾‍♂ E13.0 man in tuxedo: medium-dark skin tone
  [
    '\u{1f935}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🤵🏿‍♂️ E13.0 man in tuxedo: dark skin tone
  [
    '\u{1f935}\u{1f3ff}\u200d\u2642',
  ], // 🤵🏿‍♂ E13.0 man in tuxedo: dark skin tone
  [
    '\u{1f935}\u200d\u2640\ufe0f',
  ], // 🤵‍♀️ E13.0 woman in tuxedo
  [
    '\u{1f935}\u200d\u2640',
  ], // 🤵‍♀ E13.0 woman in tuxedo
  [
    '\u{1f935}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🤵🏻‍♀️ E13.0 woman in tuxedo: light skin tone
  [
    '\u{1f935}\u{1f3fb}\u200d\u2640',
  ], // 🤵🏻‍♀ E13.0 woman in tuxedo: light skin tone
  [
    '\u{1f935}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🤵🏼‍♀️ E13.0 woman in tuxedo: medium-light skin tone
  [
    '\u{1f935}\u{1f3fc}\u200d\u2640',
  ], // 🤵🏼‍♀ E13.0 woman in tuxedo: medium-light skin tone
  [
    '\u{1f935}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🤵🏽‍♀️ E13.0 woman in tuxedo: medium skin tone
  [
    '\u{1f935}\u{1f3fd}\u200d\u2640',
  ], // 🤵🏽‍♀ E13.0 woman in tuxedo: medium skin tone
  [
    '\u{1f935}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🤵🏾‍♀️ E13.0 woman in tuxedo: medium-dark skin tone
  [
    '\u{1f935}\u{1f3fe}\u200d\u2640',
  ], // 🤵🏾‍♀ E13.0 woman in tuxedo: medium-dark skin tone
  [
    '\u{1f935}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🤵🏿‍♀️ E13.0 woman in tuxedo: dark skin tone
  [
    '\u{1f935}\u{1f3ff}\u200d\u2640',
  ], // 🤵🏿‍♀ E13.0 woman in tuxedo: dark skin tone
  [
    '\u{1f470}',
  ], // 👰 E0.6 person with veil
  [
    '\u{1f470}\u{1f3fb}',
  ], // 👰🏻 E1.0 person with veil: light skin tone
  [
    '\u{1f470}\u{1f3fc}',
  ], // 👰🏼 E1.0 person with veil: medium-light skin tone
  [
    '\u{1f470}\u{1f3fd}',
  ], // 👰🏽 E1.0 person with veil: medium skin tone
  [
    '\u{1f470}\u{1f3fe}',
  ], // 👰🏾 E1.0 person with veil: medium-dark skin tone
  [
    '\u{1f470}\u{1f3ff}',
  ], // 👰🏿 E1.0 person with veil: dark skin tone
  [
    '\u{1f470}\u200d\u2642\ufe0f',
  ], // 👰‍♂️ E13.0 man with veil
  [
    '\u{1f470}\u200d\u2642',
  ], // 👰‍♂ E13.0 man with veil
  [
    '\u{1f470}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 👰🏻‍♂️ E13.0 man with veil: light skin tone
  [
    '\u{1f470}\u{1f3fb}\u200d\u2642',
  ], // 👰🏻‍♂ E13.0 man with veil: light skin tone
  [
    '\u{1f470}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 👰🏼‍♂️ E13.0 man with veil: medium-light skin tone
  [
    '\u{1f470}\u{1f3fc}\u200d\u2642',
  ], // 👰🏼‍♂ E13.0 man with veil: medium-light skin tone
  [
    '\u{1f470}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 👰🏽‍♂️ E13.0 man with veil: medium skin tone
  [
    '\u{1f470}\u{1f3fd}\u200d\u2642',
  ], // 👰🏽‍♂ E13.0 man with veil: medium skin tone
  [
    '\u{1f470}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 👰🏾‍♂️ E13.0 man with veil: medium-dark skin tone
  [
    '\u{1f470}\u{1f3fe}\u200d\u2642',
  ], // 👰🏾‍♂ E13.0 man with veil: medium-dark skin tone
  [
    '\u{1f470}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 👰🏿‍♂️ E13.0 man with veil: dark skin tone
  [
    '\u{1f470}\u{1f3ff}\u200d\u2642',
  ], // 👰🏿‍♂ E13.0 man with veil: dark skin tone
  [
    '\u{1f470}\u200d\u2640\ufe0f',
  ], // 👰‍♀️ E13.0 woman with veil
  [
    '\u{1f470}\u200d\u2640',
  ], // 👰‍♀ E13.0 woman with veil
  [
    '\u{1f470}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 👰🏻‍♀️ E13.0 woman with veil: light skin tone
  [
    '\u{1f470}\u{1f3fb}\u200d\u2640',
  ], // 👰🏻‍♀ E13.0 woman with veil: light skin tone
  [
    '\u{1f470}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 👰🏼‍♀️ E13.0 woman with veil: medium-light skin tone
  [
    '\u{1f470}\u{1f3fc}\u200d\u2640',
  ], // 👰🏼‍♀ E13.0 woman with veil: medium-light skin tone
  [
    '\u{1f470}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 👰🏽‍♀️ E13.0 woman with veil: medium skin tone
  [
    '\u{1f470}\u{1f3fd}\u200d\u2640',
  ], // 👰🏽‍♀ E13.0 woman with veil: medium skin tone
  [
    '\u{1f470}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 👰🏾‍♀️ E13.0 woman with veil: medium-dark skin tone
  [
    '\u{1f470}\u{1f3fe}\u200d\u2640',
  ], // 👰🏾‍♀ E13.0 woman with veil: medium-dark skin tone
  [
    '\u{1f470}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 👰🏿‍♀️ E13.0 woman with veil: dark skin tone
  [
    '\u{1f470}\u{1f3ff}\u200d\u2640',
  ], // 👰🏿‍♀ E13.0 woman with veil: dark skin tone
  [
    '\u{1f930}',
  ], // 🤰 E3.0 pregnant woman
  [
    '\u{1f930}\u{1f3fb}',
  ], // 🤰🏻 E3.0 pregnant woman: light skin tone
  [
    '\u{1f930}\u{1f3fc}',
  ], // 🤰🏼 E3.0 pregnant woman: medium-light skin tone
  [
    '\u{1f930}\u{1f3fd}',
  ], // 🤰🏽 E3.0 pregnant woman: medium skin tone
  [
    '\u{1f930}\u{1f3fe}',
  ], // 🤰🏾 E3.0 pregnant woman: medium-dark skin tone
  [
    '\u{1f930}\u{1f3ff}',
  ], // 🤰🏿 E3.0 pregnant woman: dark skin tone
  [
    '\u{1fac3}',
  ], // 🫃 E14.0 pregnant man
  [
    '\u{1fac3}\u{1f3fb}',
  ], // 🫃🏻 E14.0 pregnant man: light skin tone
  [
    '\u{1fac3}\u{1f3fc}',
  ], // 🫃🏼 E14.0 pregnant man: medium-light skin tone
  [
    '\u{1fac3}\u{1f3fd}',
  ], // 🫃🏽 E14.0 pregnant man: medium skin tone
  [
    '\u{1fac3}\u{1f3fe}',
  ], // 🫃🏾 E14.0 pregnant man: medium-dark skin tone
  [
    '\u{1fac3}\u{1f3ff}',
  ], // 🫃🏿 E14.0 pregnant man: dark skin tone
  [
    '\u{1fac4}',
  ], // 🫄 E14.0 pregnant person
  [
    '\u{1fac4}\u{1f3fb}',
  ], // 🫄🏻 E14.0 pregnant person: light skin tone
  [
    '\u{1fac4}\u{1f3fc}',
  ], // 🫄🏼 E14.0 pregnant person: medium-light skin tone
  [
    '\u{1fac4}\u{1f3fd}',
  ], // 🫄🏽 E14.0 pregnant person: medium skin tone
  [
    '\u{1fac4}\u{1f3fe}',
  ], // 🫄🏾 E14.0 pregnant person: medium-dark skin tone
  [
    '\u{1fac4}\u{1f3ff}',
  ], // 🫄🏿 E14.0 pregnant person: dark skin tone
  [
    '\u{1f931}',
  ], // 🤱 E5.0 breast-feeding
  [
    '\u{1f931}\u{1f3fb}',
  ], // 🤱🏻 E5.0 breast-feeding: light skin tone
  [
    '\u{1f931}\u{1f3fc}',
  ], // 🤱🏼 E5.0 breast-feeding: medium-light skin tone
  [
    '\u{1f931}\u{1f3fd}',
  ], // 🤱🏽 E5.0 breast-feeding: medium skin tone
  [
    '\u{1f931}\u{1f3fe}',
  ], // 🤱🏾 E5.0 breast-feeding: medium-dark skin tone
  [
    '\u{1f931}\u{1f3ff}',
  ], // 🤱🏿 E5.0 breast-feeding: dark skin tone
  [
    '\u{1f469}\u200d\u{1f37c}',
  ], // 👩‍🍼 E13.0 woman feeding baby
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f37c}',
  ], // 👩🏻‍🍼 E13.0 woman feeding baby: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f37c}',
  ], // 👩🏼‍🍼 E13.0 woman feeding baby: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f37c}',
  ], // 👩🏽‍🍼 E13.0 woman feeding baby: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f37c}',
  ], // 👩🏾‍🍼 E13.0 woman feeding baby: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f37c}',
  ], // 👩🏿‍🍼 E13.0 woman feeding baby: dark skin tone
  [
    '\u{1f468}\u200d\u{1f37c}',
  ], // 👨‍🍼 E13.0 man feeding baby
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f37c}',
  ], // 👨🏻‍🍼 E13.0 man feeding baby: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f37c}',
  ], // 👨🏼‍🍼 E13.0 man feeding baby: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f37c}',
  ], // 👨🏽‍🍼 E13.0 man feeding baby: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f37c}',
  ], // 👨🏾‍🍼 E13.0 man feeding baby: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f37c}',
  ], // 👨🏿‍🍼 E13.0 man feeding baby: dark skin tone
  [
    '\u{1f9d1}\u200d\u{1f37c}',
  ], // 🧑‍🍼 E13.0 person feeding baby
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f37c}',
  ], // 🧑🏻‍🍼 E13.0 person feeding baby: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f37c}',
  ], // 🧑🏼‍🍼 E13.0 person feeding baby: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f37c}',
  ], // 🧑🏽‍🍼 E13.0 person feeding baby: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f37c}',
  ], // 🧑🏾‍🍼 E13.0 person feeding baby: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f37c}',
  ], // 🧑🏿‍🍼 E13.0 person feeding baby: dark skin tone
  [
    '\u{1f47c}',
  ], // 👼 E0.6 baby angel
  [
    '\u{1f47c}\u{1f3fb}',
  ], // 👼🏻 E1.0 baby angel: light skin tone
  [
    '\u{1f47c}\u{1f3fc}',
  ], // 👼🏼 E1.0 baby angel: medium-light skin tone
  [
    '\u{1f47c}\u{1f3fd}',
  ], // 👼🏽 E1.0 baby angel: medium skin tone
  [
    '\u{1f47c}\u{1f3fe}',
  ], // 👼🏾 E1.0 baby angel: medium-dark skin tone
  [
    '\u{1f47c}\u{1f3ff}',
  ], // 👼🏿 E1.0 baby angel: dark skin tone
  [
    '\u{1f385}',
  ], // 🎅 E0.6 Santa Claus
  [
    '\u{1f385}\u{1f3fb}',
  ], // 🎅🏻 E1.0 Santa Claus: light skin tone
  [
    '\u{1f385}\u{1f3fc}',
  ], // 🎅🏼 E1.0 Santa Claus: medium-light skin tone
  [
    '\u{1f385}\u{1f3fd}',
  ], // 🎅🏽 E1.0 Santa Claus: medium skin tone
  [
    '\u{1f385}\u{1f3fe}',
  ], // 🎅🏾 E1.0 Santa Claus: medium-dark skin tone
  [
    '\u{1f385}\u{1f3ff}',
  ], // 🎅🏿 E1.0 Santa Claus: dark skin tone
  [
    '\u{1f936}',
  ], // 🤶 E3.0 Mrs. Claus
  [
    '\u{1f936}\u{1f3fb}',
  ], // 🤶🏻 E3.0 Mrs. Claus: light skin tone
  [
    '\u{1f936}\u{1f3fc}',
  ], // 🤶🏼 E3.0 Mrs. Claus: medium-light skin tone
  [
    '\u{1f936}\u{1f3fd}',
  ], // 🤶🏽 E3.0 Mrs. Claus: medium skin tone
  [
    '\u{1f936}\u{1f3fe}',
  ], // 🤶🏾 E3.0 Mrs. Claus: medium-dark skin tone
  [
    '\u{1f936}\u{1f3ff}',
  ], // 🤶🏿 E3.0 Mrs. Claus: dark skin tone
  [
    '\u{1f9d1}\u200d\u{1f384}',
  ], // 🧑‍🎄 E13.0 Mx Claus
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f384}',
  ], // 🧑🏻‍🎄 E13.0 Mx Claus: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f384}',
  ], // 🧑🏼‍🎄 E13.0 Mx Claus: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f384}',
  ], // 🧑🏽‍🎄 E13.0 Mx Claus: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f384}',
  ], // 🧑🏾‍🎄 E13.0 Mx Claus: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f384}',
  ], // 🧑🏿‍🎄 E13.0 Mx Claus: dark skin tone
  [
    '\u{1f9b8}',
  ], // 🦸 E11.0 superhero
  [
    '\u{1f9b8}\u{1f3fb}',
  ], // 🦸🏻 E11.0 superhero: light skin tone
  [
    '\u{1f9b8}\u{1f3fc}',
  ], // 🦸🏼 E11.0 superhero: medium-light skin tone
  [
    '\u{1f9b8}\u{1f3fd}',
  ], // 🦸🏽 E11.0 superhero: medium skin tone
  [
    '\u{1f9b8}\u{1f3fe}',
  ], // 🦸🏾 E11.0 superhero: medium-dark skin tone
  [
    '\u{1f9b8}\u{1f3ff}',
  ], // 🦸🏿 E11.0 superhero: dark skin tone
  [
    '\u{1f9b8}\u200d\u2642\ufe0f',
  ], // 🦸‍♂️ E11.0 man superhero
  [
    '\u{1f9b8}\u200d\u2642',
  ], // 🦸‍♂ E11.0 man superhero
  [
    '\u{1f9b8}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🦸🏻‍♂️ E11.0 man superhero: light skin tone
  [
    '\u{1f9b8}\u{1f3fb}\u200d\u2642',
  ], // 🦸🏻‍♂ E11.0 man superhero: light skin tone
  [
    '\u{1f9b8}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🦸🏼‍♂️ E11.0 man superhero: medium-light skin tone
  [
    '\u{1f9b8}\u{1f3fc}\u200d\u2642',
  ], // 🦸🏼‍♂ E11.0 man superhero: medium-light skin tone
  [
    '\u{1f9b8}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🦸🏽‍♂️ E11.0 man superhero: medium skin tone
  [
    '\u{1f9b8}\u{1f3fd}\u200d\u2642',
  ], // 🦸🏽‍♂ E11.0 man superhero: medium skin tone
  [
    '\u{1f9b8}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🦸🏾‍♂️ E11.0 man superhero: medium-dark skin tone
  [
    '\u{1f9b8}\u{1f3fe}\u200d\u2642',
  ], // 🦸🏾‍♂ E11.0 man superhero: medium-dark skin tone
  [
    '\u{1f9b8}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🦸🏿‍♂️ E11.0 man superhero: dark skin tone
  [
    '\u{1f9b8}\u{1f3ff}\u200d\u2642',
  ], // 🦸🏿‍♂ E11.0 man superhero: dark skin tone
  [
    '\u{1f9b8}\u200d\u2640\ufe0f',
  ], // 🦸‍♀️ E11.0 woman superhero
  [
    '\u{1f9b8}\u200d\u2640',
  ], // 🦸‍♀ E11.0 woman superhero
  [
    '\u{1f9b8}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🦸🏻‍♀️ E11.0 woman superhero: light skin tone
  [
    '\u{1f9b8}\u{1f3fb}\u200d\u2640',
  ], // 🦸🏻‍♀ E11.0 woman superhero: light skin tone
  [
    '\u{1f9b8}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🦸🏼‍♀️ E11.0 woman superhero: medium-light skin tone
  [
    '\u{1f9b8}\u{1f3fc}\u200d\u2640',
  ], // 🦸🏼‍♀ E11.0 woman superhero: medium-light skin tone
  [
    '\u{1f9b8}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🦸🏽‍♀️ E11.0 woman superhero: medium skin tone
  [
    '\u{1f9b8}\u{1f3fd}\u200d\u2640',
  ], // 🦸🏽‍♀ E11.0 woman superhero: medium skin tone
  [
    '\u{1f9b8}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🦸🏾‍♀️ E11.0 woman superhero: medium-dark skin tone
  [
    '\u{1f9b8}\u{1f3fe}\u200d\u2640',
  ], // 🦸🏾‍♀ E11.0 woman superhero: medium-dark skin tone
  [
    '\u{1f9b8}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🦸🏿‍♀️ E11.0 woman superhero: dark skin tone
  [
    '\u{1f9b8}\u{1f3ff}\u200d\u2640',
  ], // 🦸🏿‍♀ E11.0 woman superhero: dark skin tone
  [
    '\u{1f9b9}',
  ], // 🦹 E11.0 supervillain
  [
    '\u{1f9b9}\u{1f3fb}',
  ], // 🦹🏻 E11.0 supervillain: light skin tone
  [
    '\u{1f9b9}\u{1f3fc}',
  ], // 🦹🏼 E11.0 supervillain: medium-light skin tone
  [
    '\u{1f9b9}\u{1f3fd}',
  ], // 🦹🏽 E11.0 supervillain: medium skin tone
  [
    '\u{1f9b9}\u{1f3fe}',
  ], // 🦹🏾 E11.0 supervillain: medium-dark skin tone
  [
    '\u{1f9b9}\u{1f3ff}',
  ], // 🦹🏿 E11.0 supervillain: dark skin tone
  [
    '\u{1f9b9}\u200d\u2642\ufe0f',
  ], // 🦹‍♂️ E11.0 man supervillain
  [
    '\u{1f9b9}\u200d\u2642',
  ], // 🦹‍♂ E11.0 man supervillain
  [
    '\u{1f9b9}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🦹🏻‍♂️ E11.0 man supervillain: light skin tone
  [
    '\u{1f9b9}\u{1f3fb}\u200d\u2642',
  ], // 🦹🏻‍♂ E11.0 man supervillain: light skin tone
  [
    '\u{1f9b9}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🦹🏼‍♂️ E11.0 man supervillain: medium-light skin tone
  [
    '\u{1f9b9}\u{1f3fc}\u200d\u2642',
  ], // 🦹🏼‍♂ E11.0 man supervillain: medium-light skin tone
  [
    '\u{1f9b9}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🦹🏽‍♂️ E11.0 man supervillain: medium skin tone
  [
    '\u{1f9b9}\u{1f3fd}\u200d\u2642',
  ], // 🦹🏽‍♂ E11.0 man supervillain: medium skin tone
  [
    '\u{1f9b9}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🦹🏾‍♂️ E11.0 man supervillain: medium-dark skin tone
  [
    '\u{1f9b9}\u{1f3fe}\u200d\u2642',
  ], // 🦹🏾‍♂ E11.0 man supervillain: medium-dark skin tone
  [
    '\u{1f9b9}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🦹🏿‍♂️ E11.0 man supervillain: dark skin tone
  [
    '\u{1f9b9}\u{1f3ff}\u200d\u2642',
  ], // 🦹🏿‍♂ E11.0 man supervillain: dark skin tone
  [
    '\u{1f9b9}\u200d\u2640\ufe0f',
  ], // 🦹‍♀️ E11.0 woman supervillain
  [
    '\u{1f9b9}\u200d\u2640',
  ], // 🦹‍♀ E11.0 woman supervillain
  [
    '\u{1f9b9}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🦹🏻‍♀️ E11.0 woman supervillain: light skin tone
  [
    '\u{1f9b9}\u{1f3fb}\u200d\u2640',
  ], // 🦹🏻‍♀ E11.0 woman supervillain: light skin tone
  [
    '\u{1f9b9}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🦹🏼‍♀️ E11.0 woman supervillain: medium-light skin tone
  [
    '\u{1f9b9}\u{1f3fc}\u200d\u2640',
  ], // 🦹🏼‍♀ E11.0 woman supervillain: medium-light skin tone
  [
    '\u{1f9b9}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🦹🏽‍♀️ E11.0 woman supervillain: medium skin tone
  [
    '\u{1f9b9}\u{1f3fd}\u200d\u2640',
  ], // 🦹🏽‍♀ E11.0 woman supervillain: medium skin tone
  [
    '\u{1f9b9}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🦹🏾‍♀️ E11.0 woman supervillain: medium-dark skin tone
  [
    '\u{1f9b9}\u{1f3fe}\u200d\u2640',
  ], // 🦹🏾‍♀ E11.0 woman supervillain: medium-dark skin tone
  [
    '\u{1f9b9}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🦹🏿‍♀️ E11.0 woman supervillain: dark skin tone
  [
    '\u{1f9b9}\u{1f3ff}\u200d\u2640',
  ], // 🦹🏿‍♀ E11.0 woman supervillain: dark skin tone
  [
    '\u{1f9d9}',
  ], // 🧙 E5.0 mage
  [
    '\u{1f9d9}\u{1f3fb}',
  ], // 🧙🏻 E5.0 mage: light skin tone
  [
    '\u{1f9d9}\u{1f3fc}',
  ], // 🧙🏼 E5.0 mage: medium-light skin tone
  [
    '\u{1f9d9}\u{1f3fd}',
  ], // 🧙🏽 E5.0 mage: medium skin tone
  [
    '\u{1f9d9}\u{1f3fe}',
  ], // 🧙🏾 E5.0 mage: medium-dark skin tone
  [
    '\u{1f9d9}\u{1f3ff}',
  ], // 🧙🏿 E5.0 mage: dark skin tone
  [
    '\u{1f9d9}\u200d\u2642\ufe0f',
  ], // 🧙‍♂️ E5.0 man mage
  [
    '\u{1f9d9}\u200d\u2642',
  ], // 🧙‍♂ E5.0 man mage
  [
    '\u{1f9d9}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🧙🏻‍♂️ E5.0 man mage: light skin tone
  [
    '\u{1f9d9}\u{1f3fb}\u200d\u2642',
  ], // 🧙🏻‍♂ E5.0 man mage: light skin tone
  [
    '\u{1f9d9}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🧙🏼‍♂️ E5.0 man mage: medium-light skin tone
  [
    '\u{1f9d9}\u{1f3fc}\u200d\u2642',
  ], // 🧙🏼‍♂ E5.0 man mage: medium-light skin tone
  [
    '\u{1f9d9}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🧙🏽‍♂️ E5.0 man mage: medium skin tone
  [
    '\u{1f9d9}\u{1f3fd}\u200d\u2642',
  ], // 🧙🏽‍♂ E5.0 man mage: medium skin tone
  [
    '\u{1f9d9}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🧙🏾‍♂️ E5.0 man mage: medium-dark skin tone
  [
    '\u{1f9d9}\u{1f3fe}\u200d\u2642',
  ], // 🧙🏾‍♂ E5.0 man mage: medium-dark skin tone
  [
    '\u{1f9d9}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🧙🏿‍♂️ E5.0 man mage: dark skin tone
  [
    '\u{1f9d9}\u{1f3ff}\u200d\u2642',
  ], // 🧙🏿‍♂ E5.0 man mage: dark skin tone
  [
    '\u{1f9d9}\u200d\u2640\ufe0f',
  ], // 🧙‍♀️ E5.0 woman mage
  [
    '\u{1f9d9}\u200d\u2640',
  ], // 🧙‍♀ E5.0 woman mage
  [
    '\u{1f9d9}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🧙🏻‍♀️ E5.0 woman mage: light skin tone
  [
    '\u{1f9d9}\u{1f3fb}\u200d\u2640',
  ], // 🧙🏻‍♀ E5.0 woman mage: light skin tone
  [
    '\u{1f9d9}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🧙🏼‍♀️ E5.0 woman mage: medium-light skin tone
  [
    '\u{1f9d9}\u{1f3fc}\u200d\u2640',
  ], // 🧙🏼‍♀ E5.0 woman mage: medium-light skin tone
  [
    '\u{1f9d9}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🧙🏽‍♀️ E5.0 woman mage: medium skin tone
  [
    '\u{1f9d9}\u{1f3fd}\u200d\u2640',
  ], // 🧙🏽‍♀ E5.0 woman mage: medium skin tone
  [
    '\u{1f9d9}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🧙🏾‍♀️ E5.0 woman mage: medium-dark skin tone
  [
    '\u{1f9d9}\u{1f3fe}\u200d\u2640',
  ], // 🧙🏾‍♀ E5.0 woman mage: medium-dark skin tone
  [
    '\u{1f9d9}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🧙🏿‍♀️ E5.0 woman mage: dark skin tone
  [
    '\u{1f9d9}\u{1f3ff}\u200d\u2640',
  ], // 🧙🏿‍♀ E5.0 woman mage: dark skin tone
  [
    '\u{1f9da}',
  ], // 🧚 E5.0 fairy
  [
    '\u{1f9da}\u{1f3fb}',
  ], // 🧚🏻 E5.0 fairy: light skin tone
  [
    '\u{1f9da}\u{1f3fc}',
  ], // 🧚🏼 E5.0 fairy: medium-light skin tone
  [
    '\u{1f9da}\u{1f3fd}',
  ], // 🧚🏽 E5.0 fairy: medium skin tone
  [
    '\u{1f9da}\u{1f3fe}',
  ], // 🧚🏾 E5.0 fairy: medium-dark skin tone
  [
    '\u{1f9da}\u{1f3ff}',
  ], // 🧚🏿 E5.0 fairy: dark skin tone
  [
    '\u{1f9da}\u200d\u2642\ufe0f',
  ], // 🧚‍♂️ E5.0 man fairy
  [
    '\u{1f9da}\u200d\u2642',
  ], // 🧚‍♂ E5.0 man fairy
  [
    '\u{1f9da}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🧚🏻‍♂️ E5.0 man fairy: light skin tone
  [
    '\u{1f9da}\u{1f3fb}\u200d\u2642',
  ], // 🧚🏻‍♂ E5.0 man fairy: light skin tone
  [
    '\u{1f9da}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🧚🏼‍♂️ E5.0 man fairy: medium-light skin tone
  [
    '\u{1f9da}\u{1f3fc}\u200d\u2642',
  ], // 🧚🏼‍♂ E5.0 man fairy: medium-light skin tone
  [
    '\u{1f9da}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🧚🏽‍♂️ E5.0 man fairy: medium skin tone
  [
    '\u{1f9da}\u{1f3fd}\u200d\u2642',
  ], // 🧚🏽‍♂ E5.0 man fairy: medium skin tone
  [
    '\u{1f9da}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🧚🏾‍♂️ E5.0 man fairy: medium-dark skin tone
  [
    '\u{1f9da}\u{1f3fe}\u200d\u2642',
  ], // 🧚🏾‍♂ E5.0 man fairy: medium-dark skin tone
  [
    '\u{1f9da}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🧚🏿‍♂️ E5.0 man fairy: dark skin tone
  [
    '\u{1f9da}\u{1f3ff}\u200d\u2642',
  ], // 🧚🏿‍♂ E5.0 man fairy: dark skin tone
  [
    '\u{1f9da}\u200d\u2640\ufe0f',
  ], // 🧚‍♀️ E5.0 woman fairy
  [
    '\u{1f9da}\u200d\u2640',
  ], // 🧚‍♀ E5.0 woman fairy
  [
    '\u{1f9da}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🧚🏻‍♀️ E5.0 woman fairy: light skin tone
  [
    '\u{1f9da}\u{1f3fb}\u200d\u2640',
  ], // 🧚🏻‍♀ E5.0 woman fairy: light skin tone
  [
    '\u{1f9da}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🧚🏼‍♀️ E5.0 woman fairy: medium-light skin tone
  [
    '\u{1f9da}\u{1f3fc}\u200d\u2640',
  ], // 🧚🏼‍♀ E5.0 woman fairy: medium-light skin tone
  [
    '\u{1f9da}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🧚🏽‍♀️ E5.0 woman fairy: medium skin tone
  [
    '\u{1f9da}\u{1f3fd}\u200d\u2640',
  ], // 🧚🏽‍♀ E5.0 woman fairy: medium skin tone
  [
    '\u{1f9da}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🧚🏾‍♀️ E5.0 woman fairy: medium-dark skin tone
  [
    '\u{1f9da}\u{1f3fe}\u200d\u2640',
  ], // 🧚🏾‍♀ E5.0 woman fairy: medium-dark skin tone
  [
    '\u{1f9da}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🧚🏿‍♀️ E5.0 woman fairy: dark skin tone
  [
    '\u{1f9da}\u{1f3ff}\u200d\u2640',
  ], // 🧚🏿‍♀ E5.0 woman fairy: dark skin tone
  [
    '\u{1f9db}',
  ], // 🧛 E5.0 vampire
  [
    '\u{1f9db}\u{1f3fb}',
  ], // 🧛🏻 E5.0 vampire: light skin tone
  [
    '\u{1f9db}\u{1f3fc}',
  ], // 🧛🏼 E5.0 vampire: medium-light skin tone
  [
    '\u{1f9db}\u{1f3fd}',
  ], // 🧛🏽 E5.0 vampire: medium skin tone
  [
    '\u{1f9db}\u{1f3fe}',
  ], // 🧛🏾 E5.0 vampire: medium-dark skin tone
  [
    '\u{1f9db}\u{1f3ff}',
  ], // 🧛🏿 E5.0 vampire: dark skin tone
  [
    '\u{1f9db}\u200d\u2642\ufe0f',
  ], // 🧛‍♂️ E5.0 man vampire
  [
    '\u{1f9db}\u200d\u2642',
  ], // 🧛‍♂ E5.0 man vampire
  [
    '\u{1f9db}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🧛🏻‍♂️ E5.0 man vampire: light skin tone
  [
    '\u{1f9db}\u{1f3fb}\u200d\u2642',
  ], // 🧛🏻‍♂ E5.0 man vampire: light skin tone
  [
    '\u{1f9db}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🧛🏼‍♂️ E5.0 man vampire: medium-light skin tone
  [
    '\u{1f9db}\u{1f3fc}\u200d\u2642',
  ], // 🧛🏼‍♂ E5.0 man vampire: medium-light skin tone
  [
    '\u{1f9db}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🧛🏽‍♂️ E5.0 man vampire: medium skin tone
  [
    '\u{1f9db}\u{1f3fd}\u200d\u2642',
  ], // 🧛🏽‍♂ E5.0 man vampire: medium skin tone
  [
    '\u{1f9db}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🧛🏾‍♂️ E5.0 man vampire: medium-dark skin tone
  [
    '\u{1f9db}\u{1f3fe}\u200d\u2642',
  ], // 🧛🏾‍♂ E5.0 man vampire: medium-dark skin tone
  [
    '\u{1f9db}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🧛🏿‍♂️ E5.0 man vampire: dark skin tone
  [
    '\u{1f9db}\u{1f3ff}\u200d\u2642',
  ], // 🧛🏿‍♂ E5.0 man vampire: dark skin tone
  [
    '\u{1f9db}\u200d\u2640\ufe0f',
  ], // 🧛‍♀️ E5.0 woman vampire
  [
    '\u{1f9db}\u200d\u2640',
  ], // 🧛‍♀ E5.0 woman vampire
  [
    '\u{1f9db}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🧛🏻‍♀️ E5.0 woman vampire: light skin tone
  [
    '\u{1f9db}\u{1f3fb}\u200d\u2640',
  ], // 🧛🏻‍♀ E5.0 woman vampire: light skin tone
  [
    '\u{1f9db}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🧛🏼‍♀️ E5.0 woman vampire: medium-light skin tone
  [
    '\u{1f9db}\u{1f3fc}\u200d\u2640',
  ], // 🧛🏼‍♀ E5.0 woman vampire: medium-light skin tone
  [
    '\u{1f9db}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🧛🏽‍♀️ E5.0 woman vampire: medium skin tone
  [
    '\u{1f9db}\u{1f3fd}\u200d\u2640',
  ], // 🧛🏽‍♀ E5.0 woman vampire: medium skin tone
  [
    '\u{1f9db}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🧛🏾‍♀️ E5.0 woman vampire: medium-dark skin tone
  [
    '\u{1f9db}\u{1f3fe}\u200d\u2640',
  ], // 🧛🏾‍♀ E5.0 woman vampire: medium-dark skin tone
  [
    '\u{1f9db}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🧛🏿‍♀️ E5.0 woman vampire: dark skin tone
  [
    '\u{1f9db}\u{1f3ff}\u200d\u2640',
  ], // 🧛🏿‍♀ E5.0 woman vampire: dark skin tone
  [
    '\u{1f9dc}',
  ], // 🧜 E5.0 merperson
  [
    '\u{1f9dc}\u{1f3fb}',
  ], // 🧜🏻 E5.0 merperson: light skin tone
  [
    '\u{1f9dc}\u{1f3fc}',
  ], // 🧜🏼 E5.0 merperson: medium-light skin tone
  [
    '\u{1f9dc}\u{1f3fd}',
  ], // 🧜🏽 E5.0 merperson: medium skin tone
  [
    '\u{1f9dc}\u{1f3fe}',
  ], // 🧜🏾 E5.0 merperson: medium-dark skin tone
  [
    '\u{1f9dc}\u{1f3ff}',
  ], // 🧜🏿 E5.0 merperson: dark skin tone
  [
    '\u{1f9dc}\u200d\u2642\ufe0f',
  ], // 🧜‍♂️ E5.0 merman
  [
    '\u{1f9dc}\u200d\u2642',
  ], // 🧜‍♂ E5.0 merman
  [
    '\u{1f9dc}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🧜🏻‍♂️ E5.0 merman: light skin tone
  [
    '\u{1f9dc}\u{1f3fb}\u200d\u2642',
  ], // 🧜🏻‍♂ E5.0 merman: light skin tone
  [
    '\u{1f9dc}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🧜🏼‍♂️ E5.0 merman: medium-light skin tone
  [
    '\u{1f9dc}\u{1f3fc}\u200d\u2642',
  ], // 🧜🏼‍♂ E5.0 merman: medium-light skin tone
  [
    '\u{1f9dc}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🧜🏽‍♂️ E5.0 merman: medium skin tone
  [
    '\u{1f9dc}\u{1f3fd}\u200d\u2642',
  ], // 🧜🏽‍♂ E5.0 merman: medium skin tone
  [
    '\u{1f9dc}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🧜🏾‍♂️ E5.0 merman: medium-dark skin tone
  [
    '\u{1f9dc}\u{1f3fe}\u200d\u2642',
  ], // 🧜🏾‍♂ E5.0 merman: medium-dark skin tone
  [
    '\u{1f9dc}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🧜🏿‍♂️ E5.0 merman: dark skin tone
  [
    '\u{1f9dc}\u{1f3ff}\u200d\u2642',
  ], // 🧜🏿‍♂ E5.0 merman: dark skin tone
  [
    '\u{1f9dc}\u200d\u2640\ufe0f',
  ], // 🧜‍♀️ E5.0 mermaid
  [
    '\u{1f9dc}\u200d\u2640',
  ], // 🧜‍♀ E5.0 mermaid
  [
    '\u{1f9dc}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🧜🏻‍♀️ E5.0 mermaid: light skin tone
  [
    '\u{1f9dc}\u{1f3fb}\u200d\u2640',
  ], // 🧜🏻‍♀ E5.0 mermaid: light skin tone
  [
    '\u{1f9dc}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🧜🏼‍♀️ E5.0 mermaid: medium-light skin tone
  [
    '\u{1f9dc}\u{1f3fc}\u200d\u2640',
  ], // 🧜🏼‍♀ E5.0 mermaid: medium-light skin tone
  [
    '\u{1f9dc}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🧜🏽‍♀️ E5.0 mermaid: medium skin tone
  [
    '\u{1f9dc}\u{1f3fd}\u200d\u2640',
  ], // 🧜🏽‍♀ E5.0 mermaid: medium skin tone
  [
    '\u{1f9dc}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🧜🏾‍♀️ E5.0 mermaid: medium-dark skin tone
  [
    '\u{1f9dc}\u{1f3fe}\u200d\u2640',
  ], // 🧜🏾‍♀ E5.0 mermaid: medium-dark skin tone
  [
    '\u{1f9dc}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🧜🏿‍♀️ E5.0 mermaid: dark skin tone
  [
    '\u{1f9dc}\u{1f3ff}\u200d\u2640',
  ], // 🧜🏿‍♀ E5.0 mermaid: dark skin tone
  [
    '\u{1f9dd}',
  ], // 🧝 E5.0 elf
  [
    '\u{1f9dd}\u{1f3fb}',
  ], // 🧝🏻 E5.0 elf: light skin tone
  [
    '\u{1f9dd}\u{1f3fc}',
  ], // 🧝🏼 E5.0 elf: medium-light skin tone
  [
    '\u{1f9dd}\u{1f3fd}',
  ], // 🧝🏽 E5.0 elf: medium skin tone
  [
    '\u{1f9dd}\u{1f3fe}',
  ], // 🧝🏾 E5.0 elf: medium-dark skin tone
  [
    '\u{1f9dd}\u{1f3ff}',
  ], // 🧝🏿 E5.0 elf: dark skin tone
  [
    '\u{1f9dd}\u200d\u2642\ufe0f',
  ], // 🧝‍♂️ E5.0 man elf
  [
    '\u{1f9dd}\u200d\u2642',
  ], // 🧝‍♂ E5.0 man elf
  [
    '\u{1f9dd}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🧝🏻‍♂️ E5.0 man elf: light skin tone
  [
    '\u{1f9dd}\u{1f3fb}\u200d\u2642',
  ], // 🧝🏻‍♂ E5.0 man elf: light skin tone
  [
    '\u{1f9dd}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🧝🏼‍♂️ E5.0 man elf: medium-light skin tone
  [
    '\u{1f9dd}\u{1f3fc}\u200d\u2642',
  ], // 🧝🏼‍♂ E5.0 man elf: medium-light skin tone
  [
    '\u{1f9dd}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🧝🏽‍♂️ E5.0 man elf: medium skin tone
  [
    '\u{1f9dd}\u{1f3fd}\u200d\u2642',
  ], // 🧝🏽‍♂ E5.0 man elf: medium skin tone
  [
    '\u{1f9dd}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🧝🏾‍♂️ E5.0 man elf: medium-dark skin tone
  [
    '\u{1f9dd}\u{1f3fe}\u200d\u2642',
  ], // 🧝🏾‍♂ E5.0 man elf: medium-dark skin tone
  [
    '\u{1f9dd}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🧝🏿‍♂️ E5.0 man elf: dark skin tone
  [
    '\u{1f9dd}\u{1f3ff}\u200d\u2642',
  ], // 🧝🏿‍♂ E5.0 man elf: dark skin tone
  [
    '\u{1f9dd}\u200d\u2640\ufe0f',
  ], // 🧝‍♀️ E5.0 woman elf
  [
    '\u{1f9dd}\u200d\u2640',
  ], // 🧝‍♀ E5.0 woman elf
  [
    '\u{1f9dd}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🧝🏻‍♀️ E5.0 woman elf: light skin tone
  [
    '\u{1f9dd}\u{1f3fb}\u200d\u2640',
  ], // 🧝🏻‍♀ E5.0 woman elf: light skin tone
  [
    '\u{1f9dd}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🧝🏼‍♀️ E5.0 woman elf: medium-light skin tone
  [
    '\u{1f9dd}\u{1f3fc}\u200d\u2640',
  ], // 🧝🏼‍♀ E5.0 woman elf: medium-light skin tone
  [
    '\u{1f9dd}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🧝🏽‍♀️ E5.0 woman elf: medium skin tone
  [
    '\u{1f9dd}\u{1f3fd}\u200d\u2640',
  ], // 🧝🏽‍♀ E5.0 woman elf: medium skin tone
  [
    '\u{1f9dd}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🧝🏾‍♀️ E5.0 woman elf: medium-dark skin tone
  [
    '\u{1f9dd}\u{1f3fe}\u200d\u2640',
  ], // 🧝🏾‍♀ E5.0 woman elf: medium-dark skin tone
  [
    '\u{1f9dd}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🧝🏿‍♀️ E5.0 woman elf: dark skin tone
  [
    '\u{1f9dd}\u{1f3ff}\u200d\u2640',
  ], // 🧝🏿‍♀ E5.0 woman elf: dark skin tone
  [
    '\u{1f9de}',
  ], // 🧞 E5.0 genie
  [
    '\u{1f9de}\u200d\u2642\ufe0f',
  ], // 🧞‍♂️ E5.0 man genie
  [
    '\u{1f9de}\u200d\u2642',
  ], // 🧞‍♂ E5.0 man genie
  [
    '\u{1f9de}\u200d\u2640\ufe0f',
  ], // 🧞‍♀️ E5.0 woman genie
  [
    '\u{1f9de}\u200d\u2640',
  ], // 🧞‍♀ E5.0 woman genie
  [
    '\u{1f9df}',
  ], // 🧟 E5.0 zombie
  [
    '\u{1f9df}\u200d\u2642\ufe0f',
  ], // 🧟‍♂️ E5.0 man zombie
  [
    '\u{1f9df}\u200d\u2642',
  ], // 🧟‍♂ E5.0 man zombie
  [
    '\u{1f9df}\u200d\u2640\ufe0f',
  ], // 🧟‍♀️ E5.0 woman zombie
  [
    '\u{1f9df}\u200d\u2640',
  ], // 🧟‍♀ E5.0 woman zombie
  [
    '\u{1f9cc}',
  ], // 🧌 E14.0 troll
  [
    '\u{1f486}',
  ], // 💆 E0.6 person getting massage
  [
    '\u{1f486}\u{1f3fb}',
  ], // 💆🏻 E1.0 person getting massage: light skin tone
  [
    '\u{1f486}\u{1f3fc}',
  ], // 💆🏼 E1.0 person getting massage: medium-light skin tone
  [
    '\u{1f486}\u{1f3fd}',
  ], // 💆🏽 E1.0 person getting massage: medium skin tone
  [
    '\u{1f486}\u{1f3fe}',
  ], // 💆🏾 E1.0 person getting massage: medium-dark skin tone
  [
    '\u{1f486}\u{1f3ff}',
  ], // 💆🏿 E1.0 person getting massage: dark skin tone
  [
    '\u{1f486}\u200d\u2642\ufe0f',
  ], // 💆‍♂️ E4.0 man getting massage
  [
    '\u{1f486}\u200d\u2642',
  ], // 💆‍♂ E4.0 man getting massage
  [
    '\u{1f486}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 💆🏻‍♂️ E4.0 man getting massage: light skin tone
  [
    '\u{1f486}\u{1f3fb}\u200d\u2642',
  ], // 💆🏻‍♂ E4.0 man getting massage: light skin tone
  [
    '\u{1f486}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 💆🏼‍♂️ E4.0 man getting massage: medium-light skin tone
  [
    '\u{1f486}\u{1f3fc}\u200d\u2642',
  ], // 💆🏼‍♂ E4.0 man getting massage: medium-light skin tone
  [
    '\u{1f486}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 💆🏽‍♂️ E4.0 man getting massage: medium skin tone
  [
    '\u{1f486}\u{1f3fd}\u200d\u2642',
  ], // 💆🏽‍♂ E4.0 man getting massage: medium skin tone
  [
    '\u{1f486}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 💆🏾‍♂️ E4.0 man getting massage: medium-dark skin tone
  [
    '\u{1f486}\u{1f3fe}\u200d\u2642',
  ], // 💆🏾‍♂ E4.0 man getting massage: medium-dark skin tone
  [
    '\u{1f486}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 💆🏿‍♂️ E4.0 man getting massage: dark skin tone
  [
    '\u{1f486}\u{1f3ff}\u200d\u2642',
  ], // 💆🏿‍♂ E4.0 man getting massage: dark skin tone
  [
    '\u{1f486}\u200d\u2640\ufe0f',
  ], // 💆‍♀️ E4.0 woman getting massage
  [
    '\u{1f486}\u200d\u2640',
  ], // 💆‍♀ E4.0 woman getting massage
  [
    '\u{1f486}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 💆🏻‍♀️ E4.0 woman getting massage: light skin tone
  [
    '\u{1f486}\u{1f3fb}\u200d\u2640',
  ], // 💆🏻‍♀ E4.0 woman getting massage: light skin tone
  [
    '\u{1f486}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 💆🏼‍♀️ E4.0 woman getting massage: medium-light skin tone
  [
    '\u{1f486}\u{1f3fc}\u200d\u2640',
  ], // 💆🏼‍♀ E4.0 woman getting massage: medium-light skin tone
  [
    '\u{1f486}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 💆🏽‍♀️ E4.0 woman getting massage: medium skin tone
  [
    '\u{1f486}\u{1f3fd}\u200d\u2640',
  ], // 💆🏽‍♀ E4.0 woman getting massage: medium skin tone
  [
    '\u{1f486}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 💆🏾‍♀️ E4.0 woman getting massage: medium-dark skin tone
  [
    '\u{1f486}\u{1f3fe}\u200d\u2640',
  ], // 💆🏾‍♀ E4.0 woman getting massage: medium-dark skin tone
  [
    '\u{1f486}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 💆🏿‍♀️ E4.0 woman getting massage: dark skin tone
  [
    '\u{1f486}\u{1f3ff}\u200d\u2640',
  ], // 💆🏿‍♀ E4.0 woman getting massage: dark skin tone
  [
    '\u{1f487}',
  ], // 💇 E0.6 person getting haircut
  [
    '\u{1f487}\u{1f3fb}',
  ], // 💇🏻 E1.0 person getting haircut: light skin tone
  [
    '\u{1f487}\u{1f3fc}',
  ], // 💇🏼 E1.0 person getting haircut: medium-light skin tone
  [
    '\u{1f487}\u{1f3fd}',
  ], // 💇🏽 E1.0 person getting haircut: medium skin tone
  [
    '\u{1f487}\u{1f3fe}',
  ], // 💇🏾 E1.0 person getting haircut: medium-dark skin tone
  [
    '\u{1f487}\u{1f3ff}',
  ], // 💇🏿 E1.0 person getting haircut: dark skin tone
  [
    '\u{1f487}\u200d\u2642\ufe0f',
  ], // 💇‍♂️ E4.0 man getting haircut
  [
    '\u{1f487}\u200d\u2642',
  ], // 💇‍♂ E4.0 man getting haircut
  [
    '\u{1f487}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 💇🏻‍♂️ E4.0 man getting haircut: light skin tone
  [
    '\u{1f487}\u{1f3fb}\u200d\u2642',
  ], // 💇🏻‍♂ E4.0 man getting haircut: light skin tone
  [
    '\u{1f487}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 💇🏼‍♂️ E4.0 man getting haircut: medium-light skin tone
  [
    '\u{1f487}\u{1f3fc}\u200d\u2642',
  ], // 💇🏼‍♂ E4.0 man getting haircut: medium-light skin tone
  [
    '\u{1f487}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 💇🏽‍♂️ E4.0 man getting haircut: medium skin tone
  [
    '\u{1f487}\u{1f3fd}\u200d\u2642',
  ], // 💇🏽‍♂ E4.0 man getting haircut: medium skin tone
  [
    '\u{1f487}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 💇🏾‍♂️ E4.0 man getting haircut: medium-dark skin tone
  [
    '\u{1f487}\u{1f3fe}\u200d\u2642',
  ], // 💇🏾‍♂ E4.0 man getting haircut: medium-dark skin tone
  [
    '\u{1f487}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 💇🏿‍♂️ E4.0 man getting haircut: dark skin tone
  [
    '\u{1f487}\u{1f3ff}\u200d\u2642',
  ], // 💇🏿‍♂ E4.0 man getting haircut: dark skin tone
  [
    '\u{1f487}\u200d\u2640\ufe0f',
  ], // 💇‍♀️ E4.0 woman getting haircut
  [
    '\u{1f487}\u200d\u2640',
  ], // 💇‍♀ E4.0 woman getting haircut
  [
    '\u{1f487}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 💇🏻‍♀️ E4.0 woman getting haircut: light skin tone
  [
    '\u{1f487}\u{1f3fb}\u200d\u2640',
  ], // 💇🏻‍♀ E4.0 woman getting haircut: light skin tone
  [
    '\u{1f487}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 💇🏼‍♀️ E4.0 woman getting haircut: medium-light skin tone
  [
    '\u{1f487}\u{1f3fc}\u200d\u2640',
  ], // 💇🏼‍♀ E4.0 woman getting haircut: medium-light skin tone
  [
    '\u{1f487}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 💇🏽‍♀️ E4.0 woman getting haircut: medium skin tone
  [
    '\u{1f487}\u{1f3fd}\u200d\u2640',
  ], // 💇🏽‍♀ E4.0 woman getting haircut: medium skin tone
  [
    '\u{1f487}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 💇🏾‍♀️ E4.0 woman getting haircut: medium-dark skin tone
  [
    '\u{1f487}\u{1f3fe}\u200d\u2640',
  ], // 💇🏾‍♀ E4.0 woman getting haircut: medium-dark skin tone
  [
    '\u{1f487}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 💇🏿‍♀️ E4.0 woman getting haircut: dark skin tone
  [
    '\u{1f487}\u{1f3ff}\u200d\u2640',
  ], // 💇🏿‍♀ E4.0 woman getting haircut: dark skin tone
  [
    '\u{1f6b6}',
  ], // 🚶 E0.6 person walking
  [
    '\u{1f6b6}\u{1f3fb}',
  ], // 🚶🏻 E1.0 person walking: light skin tone
  [
    '\u{1f6b6}\u{1f3fc}',
  ], // 🚶🏼 E1.0 person walking: medium-light skin tone
  [
    '\u{1f6b6}\u{1f3fd}',
  ], // 🚶🏽 E1.0 person walking: medium skin tone
  [
    '\u{1f6b6}\u{1f3fe}',
  ], // 🚶🏾 E1.0 person walking: medium-dark skin tone
  [
    '\u{1f6b6}\u{1f3ff}',
  ], // 🚶🏿 E1.0 person walking: dark skin tone
  [
    '\u{1f6b6}\u200d\u2642\ufe0f',
  ], // 🚶‍♂️ E4.0 man walking
  [
    '\u{1f6b6}\u200d\u2642',
  ], // 🚶‍♂ E4.0 man walking
  [
    '\u{1f6b6}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🚶🏻‍♂️ E4.0 man walking: light skin tone
  [
    '\u{1f6b6}\u{1f3fb}\u200d\u2642',
  ], // 🚶🏻‍♂ E4.0 man walking: light skin tone
  [
    '\u{1f6b6}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🚶🏼‍♂️ E4.0 man walking: medium-light skin tone
  [
    '\u{1f6b6}\u{1f3fc}\u200d\u2642',
  ], // 🚶🏼‍♂ E4.0 man walking: medium-light skin tone
  [
    '\u{1f6b6}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🚶🏽‍♂️ E4.0 man walking: medium skin tone
  [
    '\u{1f6b6}\u{1f3fd}\u200d\u2642',
  ], // 🚶🏽‍♂ E4.0 man walking: medium skin tone
  [
    '\u{1f6b6}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🚶🏾‍♂️ E4.0 man walking: medium-dark skin tone
  [
    '\u{1f6b6}\u{1f3fe}\u200d\u2642',
  ], // 🚶🏾‍♂ E4.0 man walking: medium-dark skin tone
  [
    '\u{1f6b6}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🚶🏿‍♂️ E4.0 man walking: dark skin tone
  [
    '\u{1f6b6}\u{1f3ff}\u200d\u2642',
  ], // 🚶🏿‍♂ E4.0 man walking: dark skin tone
  [
    '\u{1f6b6}\u200d\u2640\ufe0f',
  ], // 🚶‍♀️ E4.0 woman walking
  [
    '\u{1f6b6}\u200d\u2640',
  ], // 🚶‍♀ E4.0 woman walking
  [
    '\u{1f6b6}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🚶🏻‍♀️ E4.0 woman walking: light skin tone
  [
    '\u{1f6b6}\u{1f3fb}\u200d\u2640',
  ], // 🚶🏻‍♀ E4.0 woman walking: light skin tone
  [
    '\u{1f6b6}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🚶🏼‍♀️ E4.0 woman walking: medium-light skin tone
  [
    '\u{1f6b6}\u{1f3fc}\u200d\u2640',
  ], // 🚶🏼‍♀ E4.0 woman walking: medium-light skin tone
  [
    '\u{1f6b6}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🚶🏽‍♀️ E4.0 woman walking: medium skin tone
  [
    '\u{1f6b6}\u{1f3fd}\u200d\u2640',
  ], // 🚶🏽‍♀ E4.0 woman walking: medium skin tone
  [
    '\u{1f6b6}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🚶🏾‍♀️ E4.0 woman walking: medium-dark skin tone
  [
    '\u{1f6b6}\u{1f3fe}\u200d\u2640',
  ], // 🚶🏾‍♀ E4.0 woman walking: medium-dark skin tone
  [
    '\u{1f6b6}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🚶🏿‍♀️ E4.0 woman walking: dark skin tone
  [
    '\u{1f6b6}\u{1f3ff}\u200d\u2640',
  ], // 🚶🏿‍♀ E4.0 woman walking: dark skin tone
  [
    '\u{1f6b6}\u200d\u27a1\ufe0f',
  ], // 🚶‍➡️ E15.1 person walking facing right
  [
    '\u{1f6b6}\u200d\u27a1',
  ], // 🚶‍➡ E15.1 person walking facing right
  [
    '\u{1f6b6}\u{1f3fb}\u200d\u27a1\ufe0f',
  ], // 🚶🏻‍➡️ E15.1 person walking facing right: light skin tone
  [
    '\u{1f6b6}\u{1f3fb}\u200d\u27a1',
  ], // 🚶🏻‍➡ E15.1 person walking facing right: light skin tone
  [
    '\u{1f6b6}\u{1f3fc}\u200d\u27a1\ufe0f',
  ], // 🚶🏼‍➡️ E15.1 person walking facing right: medium-light skin tone
  [
    '\u{1f6b6}\u{1f3fc}\u200d\u27a1',
  ], // 🚶🏼‍➡ E15.1 person walking facing right: medium-light skin tone
  [
    '\u{1f6b6}\u{1f3fd}\u200d\u27a1\ufe0f',
  ], // 🚶🏽‍➡️ E15.1 person walking facing right: medium skin tone
  [
    '\u{1f6b6}\u{1f3fd}\u200d\u27a1',
  ], // 🚶🏽‍➡ E15.1 person walking facing right: medium skin tone
  [
    '\u{1f6b6}\u{1f3fe}\u200d\u27a1\ufe0f',
  ], // 🚶🏾‍➡️ E15.1 person walking facing right: medium-dark skin tone
  [
    '\u{1f6b6}\u{1f3fe}\u200d\u27a1',
  ], // 🚶🏾‍➡ E15.1 person walking facing right: medium-dark skin tone
  [
    '\u{1f6b6}\u{1f3ff}\u200d\u27a1\ufe0f',
  ], // 🚶🏿‍➡️ E15.1 person walking facing right: dark skin tone
  [
    '\u{1f6b6}\u{1f3ff}\u200d\u27a1',
  ], // 🚶🏿‍➡ E15.1 person walking facing right: dark skin tone
  [
    '\u{1f6b6}\u200d\u2640\ufe0f\u200d\u27a1\ufe0f',
  ], // 🚶‍♀️‍➡️ E15.1 woman walking facing right
  [
    '\u{1f6b6}\u200d\u2640\u200d\u27a1\ufe0f',
  ], // 🚶‍♀‍➡️ E15.1 woman walking facing right
  [
    '\u{1f6b6}\u200d\u2640\ufe0f\u200d\u27a1',
  ], // 🚶‍♀️‍➡ E15.1 woman walking facing right
  [
    '\u{1f6b6}\u200d\u2640\u200d\u27a1',
  ], // 🚶‍♀‍➡ E15.1 woman walking facing right
  [
    '\u{1f6b6}\u{1f3fb}\u200d\u2640\ufe0f\u200d\u27a1\ufe0f',
  ], // 🚶🏻‍♀️‍➡️ E15.1 woman walking facing right: light skin tone
  [
    '\u{1f6b6}\u{1f3fb}\u200d\u2640\u200d\u27a1\ufe0f',
  ], // 🚶🏻‍♀‍➡️ E15.1 woman walking facing right: light skin tone
  [
    '\u{1f6b6}\u{1f3fb}\u200d\u2640\ufe0f\u200d\u27a1',
  ], // 🚶🏻‍♀️‍➡ E15.1 woman walking facing right: light skin tone
  [
    '\u{1f6b6}\u{1f3fb}\u200d\u2640\u200d\u27a1',
  ], // 🚶🏻‍♀‍➡ E15.1 woman walking facing right: light skin tone
  [
    '\u{1f6b6}\u{1f3fc}\u200d\u2640\ufe0f\u200d\u27a1\ufe0f',
  ], // 🚶🏼‍♀️‍➡️ E15.1 woman walking facing right: medium-light skin tone
  [
    '\u{1f6b6}\u{1f3fc}\u200d\u2640\u200d\u27a1\ufe0f',
  ], // 🚶🏼‍♀‍➡️ E15.1 woman walking facing right: medium-light skin tone
  [
    '\u{1f6b6}\u{1f3fc}\u200d\u2640\ufe0f\u200d\u27a1',
  ], // 🚶🏼‍♀️‍➡ E15.1 woman walking facing right: medium-light skin tone
  [
    '\u{1f6b6}\u{1f3fc}\u200d\u2640\u200d\u27a1',
  ], // 🚶🏼‍♀‍➡ E15.1 woman walking facing right: medium-light skin tone
  [
    '\u{1f6b6}\u{1f3fd}\u200d\u2640\ufe0f\u200d\u27a1\ufe0f',
  ], // 🚶🏽‍♀️‍➡️ E15.1 woman walking facing right: medium skin tone
  [
    '\u{1f6b6}\u{1f3fd}\u200d\u2640\u200d\u27a1\ufe0f',
  ], // 🚶🏽‍♀‍➡️ E15.1 woman walking facing right: medium skin tone
  [
    '\u{1f6b6}\u{1f3fd}\u200d\u2640\ufe0f\u200d\u27a1',
  ], // 🚶🏽‍♀️‍➡ E15.1 woman walking facing right: medium skin tone
  [
    '\u{1f6b6}\u{1f3fd}\u200d\u2640\u200d\u27a1',
  ], // 🚶🏽‍♀‍➡ E15.1 woman walking facing right: medium skin tone
  [
    '\u{1f6b6}\u{1f3fe}\u200d\u2640\ufe0f\u200d\u27a1\ufe0f',
  ], // 🚶🏾‍♀️‍➡️ E15.1 woman walking facing right: medium-dark skin tone
  [
    '\u{1f6b6}\u{1f3fe}\u200d\u2640\u200d\u27a1\ufe0f',
  ], // 🚶🏾‍♀‍➡️ E15.1 woman walking facing right: medium-dark skin tone
  [
    '\u{1f6b6}\u{1f3fe}\u200d\u2640\ufe0f\u200d\u27a1',
  ], // 🚶🏾‍♀️‍➡ E15.1 woman walking facing right: medium-dark skin tone
  [
    '\u{1f6b6}\u{1f3fe}\u200d\u2640\u200d\u27a1',
  ], // 🚶🏾‍♀‍➡ E15.1 woman walking facing right: medium-dark skin tone
  [
    '\u{1f6b6}\u{1f3ff}\u200d\u2640\ufe0f\u200d\u27a1\ufe0f',
  ], // 🚶🏿‍♀️‍➡️ E15.1 woman walking facing right: dark skin tone
  [
    '\u{1f6b6}\u{1f3ff}\u200d\u2640\u200d\u27a1\ufe0f',
  ], // 🚶🏿‍♀‍➡️ E15.1 woman walking facing right: dark skin tone
  [
    '\u{1f6b6}\u{1f3ff}\u200d\u2640\ufe0f\u200d\u27a1',
  ], // 🚶🏿‍♀️‍➡ E15.1 woman walking facing right: dark skin tone
  [
    '\u{1f6b6}\u{1f3ff}\u200d\u2640\u200d\u27a1',
  ], // 🚶🏿‍♀‍➡ E15.1 woman walking facing right: dark skin tone
  [
    '\u{1f6b6}\u200d\u2642\ufe0f\u200d\u27a1\ufe0f',
  ], // 🚶‍♂️‍➡️ E15.1 man walking facing right
  [
    '\u{1f6b6}\u200d\u2642\u200d\u27a1\ufe0f',
  ], // 🚶‍♂‍➡️ E15.1 man walking facing right
  [
    '\u{1f6b6}\u200d\u2642\ufe0f\u200d\u27a1',
  ], // 🚶‍♂️‍➡ E15.1 man walking facing right
  [
    '\u{1f6b6}\u200d\u2642\u200d\u27a1',
  ], // 🚶‍♂‍➡ E15.1 man walking facing right
  [
    '\u{1f6b6}\u{1f3fb}\u200d\u2642\ufe0f\u200d\u27a1\ufe0f',
  ], // 🚶🏻‍♂️‍➡️ E15.1 man walking facing right: light skin tone
  [
    '\u{1f6b6}\u{1f3fb}\u200d\u2642\u200d\u27a1\ufe0f',
  ], // 🚶🏻‍♂‍➡️ E15.1 man walking facing right: light skin tone
  [
    '\u{1f6b6}\u{1f3fb}\u200d\u2642\ufe0f\u200d\u27a1',
  ], // 🚶🏻‍♂️‍➡ E15.1 man walking facing right: light skin tone
  [
    '\u{1f6b6}\u{1f3fb}\u200d\u2642\u200d\u27a1',
  ], // 🚶🏻‍♂‍➡ E15.1 man walking facing right: light skin tone
  [
    '\u{1f6b6}\u{1f3fc}\u200d\u2642\ufe0f\u200d\u27a1\ufe0f',
  ], // 🚶🏼‍♂️‍➡️ E15.1 man walking facing right: medium-light skin tone
  [
    '\u{1f6b6}\u{1f3fc}\u200d\u2642\u200d\u27a1\ufe0f',
  ], // 🚶🏼‍♂‍➡️ E15.1 man walking facing right: medium-light skin tone
  [
    '\u{1f6b6}\u{1f3fc}\u200d\u2642\ufe0f\u200d\u27a1',
  ], // 🚶🏼‍♂️‍➡ E15.1 man walking facing right: medium-light skin tone
  [
    '\u{1f6b6}\u{1f3fc}\u200d\u2642\u200d\u27a1',
  ], // 🚶🏼‍♂‍➡ E15.1 man walking facing right: medium-light skin tone
  [
    '\u{1f6b6}\u{1f3fd}\u200d\u2642\ufe0f\u200d\u27a1\ufe0f',
  ], // 🚶🏽‍♂️‍➡️ E15.1 man walking facing right: medium skin tone
  [
    '\u{1f6b6}\u{1f3fd}\u200d\u2642\u200d\u27a1\ufe0f',
  ], // 🚶🏽‍♂‍➡️ E15.1 man walking facing right: medium skin tone
  [
    '\u{1f6b6}\u{1f3fd}\u200d\u2642\ufe0f\u200d\u27a1',
  ], // 🚶🏽‍♂️‍➡ E15.1 man walking facing right: medium skin tone
  [
    '\u{1f6b6}\u{1f3fd}\u200d\u2642\u200d\u27a1',
  ], // 🚶🏽‍♂‍➡ E15.1 man walking facing right: medium skin tone
  [
    '\u{1f6b6}\u{1f3fe}\u200d\u2642\ufe0f\u200d\u27a1\ufe0f',
  ], // 🚶🏾‍♂️‍➡️ E15.1 man walking facing right: medium-dark skin tone
  [
    '\u{1f6b6}\u{1f3fe}\u200d\u2642\u200d\u27a1\ufe0f',
  ], // 🚶🏾‍♂‍➡️ E15.1 man walking facing right: medium-dark skin tone
  [
    '\u{1f6b6}\u{1f3fe}\u200d\u2642\ufe0f\u200d\u27a1',
  ], // 🚶🏾‍♂️‍➡ E15.1 man walking facing right: medium-dark skin tone
  [
    '\u{1f6b6}\u{1f3fe}\u200d\u2642\u200d\u27a1',
  ], // 🚶🏾‍♂‍➡ E15.1 man walking facing right: medium-dark skin tone
  [
    '\u{1f6b6}\u{1f3ff}\u200d\u2642\ufe0f\u200d\u27a1\ufe0f',
  ], // 🚶🏿‍♂️‍➡️ E15.1 man walking facing right: dark skin tone
  [
    '\u{1f6b6}\u{1f3ff}\u200d\u2642\u200d\u27a1\ufe0f',
  ], // 🚶🏿‍♂‍➡️ E15.1 man walking facing right: dark skin tone
  [
    '\u{1f6b6}\u{1f3ff}\u200d\u2642\ufe0f\u200d\u27a1',
  ], // 🚶🏿‍♂️‍➡ E15.1 man walking facing right: dark skin tone
  [
    '\u{1f6b6}\u{1f3ff}\u200d\u2642\u200d\u27a1',
  ], // 🚶🏿‍♂‍➡ E15.1 man walking facing right: dark skin tone
  [
    '\u{1f9cd}',
  ], // 🧍 E12.0 person standing
  [
    '\u{1f9cd}\u{1f3fb}',
  ], // 🧍🏻 E12.0 person standing: light skin tone
  [
    '\u{1f9cd}\u{1f3fc}',
  ], // 🧍🏼 E12.0 person standing: medium-light skin tone
  [
    '\u{1f9cd}\u{1f3fd}',
  ], // 🧍🏽 E12.0 person standing: medium skin tone
  [
    '\u{1f9cd}\u{1f3fe}',
  ], // 🧍🏾 E12.0 person standing: medium-dark skin tone
  [
    '\u{1f9cd}\u{1f3ff}',
  ], // 🧍🏿 E12.0 person standing: dark skin tone
  [
    '\u{1f9cd}\u200d\u2642\ufe0f',
  ], // 🧍‍♂️ E12.0 man standing
  [
    '\u{1f9cd}\u200d\u2642',
  ], // 🧍‍♂ E12.0 man standing
  [
    '\u{1f9cd}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🧍🏻‍♂️ E12.0 man standing: light skin tone
  [
    '\u{1f9cd}\u{1f3fb}\u200d\u2642',
  ], // 🧍🏻‍♂ E12.0 man standing: light skin tone
  [
    '\u{1f9cd}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🧍🏼‍♂️ E12.0 man standing: medium-light skin tone
  [
    '\u{1f9cd}\u{1f3fc}\u200d\u2642',
  ], // 🧍🏼‍♂ E12.0 man standing: medium-light skin tone
  [
    '\u{1f9cd}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🧍🏽‍♂️ E12.0 man standing: medium skin tone
  [
    '\u{1f9cd}\u{1f3fd}\u200d\u2642',
  ], // 🧍🏽‍♂ E12.0 man standing: medium skin tone
  [
    '\u{1f9cd}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🧍🏾‍♂️ E12.0 man standing: medium-dark skin tone
  [
    '\u{1f9cd}\u{1f3fe}\u200d\u2642',
  ], // 🧍🏾‍♂ E12.0 man standing: medium-dark skin tone
  [
    '\u{1f9cd}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🧍🏿‍♂️ E12.0 man standing: dark skin tone
  [
    '\u{1f9cd}\u{1f3ff}\u200d\u2642',
  ], // 🧍🏿‍♂ E12.0 man standing: dark skin tone
  [
    '\u{1f9cd}\u200d\u2640\ufe0f',
  ], // 🧍‍♀️ E12.0 woman standing
  [
    '\u{1f9cd}\u200d\u2640',
  ], // 🧍‍♀ E12.0 woman standing
  [
    '\u{1f9cd}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🧍🏻‍♀️ E12.0 woman standing: light skin tone
  [
    '\u{1f9cd}\u{1f3fb}\u200d\u2640',
  ], // 🧍🏻‍♀ E12.0 woman standing: light skin tone
  [
    '\u{1f9cd}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🧍🏼‍♀️ E12.0 woman standing: medium-light skin tone
  [
    '\u{1f9cd}\u{1f3fc}\u200d\u2640',
  ], // 🧍🏼‍♀ E12.0 woman standing: medium-light skin tone
  [
    '\u{1f9cd}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🧍🏽‍♀️ E12.0 woman standing: medium skin tone
  [
    '\u{1f9cd}\u{1f3fd}\u200d\u2640',
  ], // 🧍🏽‍♀ E12.0 woman standing: medium skin tone
  [
    '\u{1f9cd}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🧍🏾‍♀️ E12.0 woman standing: medium-dark skin tone
  [
    '\u{1f9cd}\u{1f3fe}\u200d\u2640',
  ], // 🧍🏾‍♀ E12.0 woman standing: medium-dark skin tone
  [
    '\u{1f9cd}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🧍🏿‍♀️ E12.0 woman standing: dark skin tone
  [
    '\u{1f9cd}\u{1f3ff}\u200d\u2640',
  ], // 🧍🏿‍♀ E12.0 woman standing: dark skin tone
  [
    '\u{1f9ce}',
  ], // 🧎 E12.0 person kneeling
  [
    '\u{1f9ce}\u{1f3fb}',
  ], // 🧎🏻 E12.0 person kneeling: light skin tone
  [
    '\u{1f9ce}\u{1f3fc}',
  ], // 🧎🏼 E12.0 person kneeling: medium-light skin tone
  [
    '\u{1f9ce}\u{1f3fd}',
  ], // 🧎🏽 E12.0 person kneeling: medium skin tone
  [
    '\u{1f9ce}\u{1f3fe}',
  ], // 🧎🏾 E12.0 person kneeling: medium-dark skin tone
  [
    '\u{1f9ce}\u{1f3ff}',
  ], // 🧎🏿 E12.0 person kneeling: dark skin tone
  [
    '\u{1f9ce}\u200d\u2642\ufe0f',
  ], // 🧎‍♂️ E12.0 man kneeling
  [
    '\u{1f9ce}\u200d\u2642',
  ], // 🧎‍♂ E12.0 man kneeling
  [
    '\u{1f9ce}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🧎🏻‍♂️ E12.0 man kneeling: light skin tone
  [
    '\u{1f9ce}\u{1f3fb}\u200d\u2642',
  ], // 🧎🏻‍♂ E12.0 man kneeling: light skin tone
  [
    '\u{1f9ce}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🧎🏼‍♂️ E12.0 man kneeling: medium-light skin tone
  [
    '\u{1f9ce}\u{1f3fc}\u200d\u2642',
  ], // 🧎🏼‍♂ E12.0 man kneeling: medium-light skin tone
  [
    '\u{1f9ce}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🧎🏽‍♂️ E12.0 man kneeling: medium skin tone
  [
    '\u{1f9ce}\u{1f3fd}\u200d\u2642',
  ], // 🧎🏽‍♂ E12.0 man kneeling: medium skin tone
  [
    '\u{1f9ce}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🧎🏾‍♂️ E12.0 man kneeling: medium-dark skin tone
  [
    '\u{1f9ce}\u{1f3fe}\u200d\u2642',
  ], // 🧎🏾‍♂ E12.0 man kneeling: medium-dark skin tone
  [
    '\u{1f9ce}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🧎🏿‍♂️ E12.0 man kneeling: dark skin tone
  [
    '\u{1f9ce}\u{1f3ff}\u200d\u2642',
  ], // 🧎🏿‍♂ E12.0 man kneeling: dark skin tone
  [
    '\u{1f9ce}\u200d\u2640\ufe0f',
  ], // 🧎‍♀️ E12.0 woman kneeling
  [
    '\u{1f9ce}\u200d\u2640',
  ], // 🧎‍♀ E12.0 woman kneeling
  [
    '\u{1f9ce}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🧎🏻‍♀️ E12.0 woman kneeling: light skin tone
  [
    '\u{1f9ce}\u{1f3fb}\u200d\u2640',
  ], // 🧎🏻‍♀ E12.0 woman kneeling: light skin tone
  [
    '\u{1f9ce}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🧎🏼‍♀️ E12.0 woman kneeling: medium-light skin tone
  [
    '\u{1f9ce}\u{1f3fc}\u200d\u2640',
  ], // 🧎🏼‍♀ E12.0 woman kneeling: medium-light skin tone
  [
    '\u{1f9ce}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🧎🏽‍♀️ E12.0 woman kneeling: medium skin tone
  [
    '\u{1f9ce}\u{1f3fd}\u200d\u2640',
  ], // 🧎🏽‍♀ E12.0 woman kneeling: medium skin tone
  [
    '\u{1f9ce}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🧎🏾‍♀️ E12.0 woman kneeling: medium-dark skin tone
  [
    '\u{1f9ce}\u{1f3fe}\u200d\u2640',
  ], // 🧎🏾‍♀ E12.0 woman kneeling: medium-dark skin tone
  [
    '\u{1f9ce}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🧎🏿‍♀️ E12.0 woman kneeling: dark skin tone
  [
    '\u{1f9ce}\u{1f3ff}\u200d\u2640',
  ], // 🧎🏿‍♀ E12.0 woman kneeling: dark skin tone
  [
    '\u{1f9ce}\u200d\u27a1\ufe0f',
  ], // 🧎‍➡️ E15.1 person kneeling facing right
  [
    '\u{1f9ce}\u200d\u27a1',
  ], // 🧎‍➡ E15.1 person kneeling facing right
  [
    '\u{1f9ce}\u{1f3fb}\u200d\u27a1\ufe0f',
  ], // 🧎🏻‍➡️ E15.1 person kneeling facing right: light skin tone
  [
    '\u{1f9ce}\u{1f3fb}\u200d\u27a1',
  ], // 🧎🏻‍➡ E15.1 person kneeling facing right: light skin tone
  [
    '\u{1f9ce}\u{1f3fc}\u200d\u27a1\ufe0f',
  ], // 🧎🏼‍➡️ E15.1 person kneeling facing right: medium-light skin tone
  [
    '\u{1f9ce}\u{1f3fc}\u200d\u27a1',
  ], // 🧎🏼‍➡ E15.1 person kneeling facing right: medium-light skin tone
  [
    '\u{1f9ce}\u{1f3fd}\u200d\u27a1\ufe0f',
  ], // 🧎🏽‍➡️ E15.1 person kneeling facing right: medium skin tone
  [
    '\u{1f9ce}\u{1f3fd}\u200d\u27a1',
  ], // 🧎🏽‍➡ E15.1 person kneeling facing right: medium skin tone
  [
    '\u{1f9ce}\u{1f3fe}\u200d\u27a1\ufe0f',
  ], // 🧎🏾‍➡️ E15.1 person kneeling facing right: medium-dark skin tone
  [
    '\u{1f9ce}\u{1f3fe}\u200d\u27a1',
  ], // 🧎🏾‍➡ E15.1 person kneeling facing right: medium-dark skin tone
  [
    '\u{1f9ce}\u{1f3ff}\u200d\u27a1\ufe0f',
  ], // 🧎🏿‍➡️ E15.1 person kneeling facing right: dark skin tone
  [
    '\u{1f9ce}\u{1f3ff}\u200d\u27a1',
  ], // 🧎🏿‍➡ E15.1 person kneeling facing right: dark skin tone
  [
    '\u{1f9ce}\u200d\u2640\ufe0f\u200d\u27a1\ufe0f',
  ], // 🧎‍♀️‍➡️ E15.1 woman kneeling facing right
  [
    '\u{1f9ce}\u200d\u2640\u200d\u27a1\ufe0f',
  ], // 🧎‍♀‍➡️ E15.1 woman kneeling facing right
  [
    '\u{1f9ce}\u200d\u2640\ufe0f\u200d\u27a1',
  ], // 🧎‍♀️‍➡ E15.1 woman kneeling facing right
  [
    '\u{1f9ce}\u200d\u2640\u200d\u27a1',
  ], // 🧎‍♀‍➡ E15.1 woman kneeling facing right
  [
    '\u{1f9ce}\u{1f3fb}\u200d\u2640\ufe0f\u200d\u27a1\ufe0f',
  ], // 🧎🏻‍♀️‍➡️ E15.1 woman kneeling facing right: light skin tone
  [
    '\u{1f9ce}\u{1f3fb}\u200d\u2640\u200d\u27a1\ufe0f',
  ], // 🧎🏻‍♀‍➡️ E15.1 woman kneeling facing right: light skin tone
  [
    '\u{1f9ce}\u{1f3fb}\u200d\u2640\ufe0f\u200d\u27a1',
  ], // 🧎🏻‍♀️‍➡ E15.1 woman kneeling facing right: light skin tone
  [
    '\u{1f9ce}\u{1f3fb}\u200d\u2640\u200d\u27a1',
  ], // 🧎🏻‍♀‍➡ E15.1 woman kneeling facing right: light skin tone
  [
    '\u{1f9ce}\u{1f3fc}\u200d\u2640\ufe0f\u200d\u27a1\ufe0f',
  ], // 🧎🏼‍♀️‍➡️ E15.1 woman kneeling facing right: medium-light skin tone
  [
    '\u{1f9ce}\u{1f3fc}\u200d\u2640\u200d\u27a1\ufe0f',
  ], // 🧎🏼‍♀‍➡️ E15.1 woman kneeling facing right: medium-light skin tone
  [
    '\u{1f9ce}\u{1f3fc}\u200d\u2640\ufe0f\u200d\u27a1',
  ], // 🧎🏼‍♀️‍➡ E15.1 woman kneeling facing right: medium-light skin tone
  [
    '\u{1f9ce}\u{1f3fc}\u200d\u2640\u200d\u27a1',
  ], // 🧎🏼‍♀‍➡ E15.1 woman kneeling facing right: medium-light skin tone
  [
    '\u{1f9ce}\u{1f3fd}\u200d\u2640\ufe0f\u200d\u27a1\ufe0f',
  ], // 🧎🏽‍♀️‍➡️ E15.1 woman kneeling facing right: medium skin tone
  [
    '\u{1f9ce}\u{1f3fd}\u200d\u2640\u200d\u27a1\ufe0f',
  ], // 🧎🏽‍♀‍➡️ E15.1 woman kneeling facing right: medium skin tone
  [
    '\u{1f9ce}\u{1f3fd}\u200d\u2640\ufe0f\u200d\u27a1',
  ], // 🧎🏽‍♀️‍➡ E15.1 woman kneeling facing right: medium skin tone
  [
    '\u{1f9ce}\u{1f3fd}\u200d\u2640\u200d\u27a1',
  ], // 🧎🏽‍♀‍➡ E15.1 woman kneeling facing right: medium skin tone
  [
    '\u{1f9ce}\u{1f3fe}\u200d\u2640\ufe0f\u200d\u27a1\ufe0f',
  ], // 🧎🏾‍♀️‍➡️ E15.1 woman kneeling facing right: medium-dark skin tone
  [
    '\u{1f9ce}\u{1f3fe}\u200d\u2640\u200d\u27a1\ufe0f',
  ], // 🧎🏾‍♀‍➡️ E15.1 woman kneeling facing right: medium-dark skin tone
  [
    '\u{1f9ce}\u{1f3fe}\u200d\u2640\ufe0f\u200d\u27a1',
  ], // 🧎🏾‍♀️‍➡ E15.1 woman kneeling facing right: medium-dark skin tone
  [
    '\u{1f9ce}\u{1f3fe}\u200d\u2640\u200d\u27a1',
  ], // 🧎🏾‍♀‍➡ E15.1 woman kneeling facing right: medium-dark skin tone
  [
    '\u{1f9ce}\u{1f3ff}\u200d\u2640\ufe0f\u200d\u27a1\ufe0f',
  ], // 🧎🏿‍♀️‍➡️ E15.1 woman kneeling facing right: dark skin tone
  [
    '\u{1f9ce}\u{1f3ff}\u200d\u2640\u200d\u27a1\ufe0f',
  ], // 🧎🏿‍♀‍➡️ E15.1 woman kneeling facing right: dark skin tone
  [
    '\u{1f9ce}\u{1f3ff}\u200d\u2640\ufe0f\u200d\u27a1',
  ], // 🧎🏿‍♀️‍➡ E15.1 woman kneeling facing right: dark skin tone
  [
    '\u{1f9ce}\u{1f3ff}\u200d\u2640\u200d\u27a1',
  ], // 🧎🏿‍♀‍➡ E15.1 woman kneeling facing right: dark skin tone
  [
    '\u{1f9ce}\u200d\u2642\ufe0f\u200d\u27a1\ufe0f',
  ], // 🧎‍♂️‍➡️ E15.1 man kneeling facing right
  [
    '\u{1f9ce}\u200d\u2642\u200d\u27a1\ufe0f',
  ], // 🧎‍♂‍➡️ E15.1 man kneeling facing right
  [
    '\u{1f9ce}\u200d\u2642\ufe0f\u200d\u27a1',
  ], // 🧎‍♂️‍➡ E15.1 man kneeling facing right
  [
    '\u{1f9ce}\u200d\u2642\u200d\u27a1',
  ], // 🧎‍♂‍➡ E15.1 man kneeling facing right
  [
    '\u{1f9ce}\u{1f3fb}\u200d\u2642\ufe0f\u200d\u27a1\ufe0f',
  ], // 🧎🏻‍♂️‍➡️ E15.1 man kneeling facing right: light skin tone
  [
    '\u{1f9ce}\u{1f3fb}\u200d\u2642\u200d\u27a1\ufe0f',
  ], // 🧎🏻‍♂‍➡️ E15.1 man kneeling facing right: light skin tone
  [
    '\u{1f9ce}\u{1f3fb}\u200d\u2642\ufe0f\u200d\u27a1',
  ], // 🧎🏻‍♂️‍➡ E15.1 man kneeling facing right: light skin tone
  [
    '\u{1f9ce}\u{1f3fb}\u200d\u2642\u200d\u27a1',
  ], // 🧎🏻‍♂‍➡ E15.1 man kneeling facing right: light skin tone
  [
    '\u{1f9ce}\u{1f3fc}\u200d\u2642\ufe0f\u200d\u27a1\ufe0f',
  ], // 🧎🏼‍♂️‍➡️ E15.1 man kneeling facing right: medium-light skin tone
  [
    '\u{1f9ce}\u{1f3fc}\u200d\u2642\u200d\u27a1\ufe0f',
  ], // 🧎🏼‍♂‍➡️ E15.1 man kneeling facing right: medium-light skin tone
  [
    '\u{1f9ce}\u{1f3fc}\u200d\u2642\ufe0f\u200d\u27a1',
  ], // 🧎🏼‍♂️‍➡ E15.1 man kneeling facing right: medium-light skin tone
  [
    '\u{1f9ce}\u{1f3fc}\u200d\u2642\u200d\u27a1',
  ], // 🧎🏼‍♂‍➡ E15.1 man kneeling facing right: medium-light skin tone
  [
    '\u{1f9ce}\u{1f3fd}\u200d\u2642\ufe0f\u200d\u27a1\ufe0f',
  ], // 🧎🏽‍♂️‍➡️ E15.1 man kneeling facing right: medium skin tone
  [
    '\u{1f9ce}\u{1f3fd}\u200d\u2642\u200d\u27a1\ufe0f',
  ], // 🧎🏽‍♂‍➡️ E15.1 man kneeling facing right: medium skin tone
  [
    '\u{1f9ce}\u{1f3fd}\u200d\u2642\ufe0f\u200d\u27a1',
  ], // 🧎🏽‍♂️‍➡ E15.1 man kneeling facing right: medium skin tone
  [
    '\u{1f9ce}\u{1f3fd}\u200d\u2642\u200d\u27a1',
  ], // 🧎🏽‍♂‍➡ E15.1 man kneeling facing right: medium skin tone
  [
    '\u{1f9ce}\u{1f3fe}\u200d\u2642\ufe0f\u200d\u27a1\ufe0f',
  ], // 🧎🏾‍♂️‍➡️ E15.1 man kneeling facing right: medium-dark skin tone
  [
    '\u{1f9ce}\u{1f3fe}\u200d\u2642\u200d\u27a1\ufe0f',
  ], // 🧎🏾‍♂‍➡️ E15.1 man kneeling facing right: medium-dark skin tone
  [
    '\u{1f9ce}\u{1f3fe}\u200d\u2642\ufe0f\u200d\u27a1',
  ], // 🧎🏾‍♂️‍➡ E15.1 man kneeling facing right: medium-dark skin tone
  [
    '\u{1f9ce}\u{1f3fe}\u200d\u2642\u200d\u27a1',
  ], // 🧎🏾‍♂‍➡ E15.1 man kneeling facing right: medium-dark skin tone
  [
    '\u{1f9ce}\u{1f3ff}\u200d\u2642\ufe0f\u200d\u27a1\ufe0f',
  ], // 🧎🏿‍♂️‍➡️ E15.1 man kneeling facing right: dark skin tone
  [
    '\u{1f9ce}\u{1f3ff}\u200d\u2642\u200d\u27a1\ufe0f',
  ], // 🧎🏿‍♂‍➡️ E15.1 man kneeling facing right: dark skin tone
  [
    '\u{1f9ce}\u{1f3ff}\u200d\u2642\ufe0f\u200d\u27a1',
  ], // 🧎🏿‍♂️‍➡ E15.1 man kneeling facing right: dark skin tone
  [
    '\u{1f9ce}\u{1f3ff}\u200d\u2642\u200d\u27a1',
  ], // 🧎🏿‍♂‍➡ E15.1 man kneeling facing right: dark skin tone
  [
    '\u{1f9d1}\u200d\u{1f9af}',
  ], // 🧑‍🦯 E12.1 person with white cane
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f9af}',
  ], // 🧑🏻‍🦯 E12.1 person with white cane: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f9af}',
  ], // 🧑🏼‍🦯 E12.1 person with white cane: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f9af}',
  ], // 🧑🏽‍🦯 E12.1 person with white cane: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f9af}',
  ], // 🧑🏾‍🦯 E12.1 person with white cane: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f9af}',
  ], // 🧑🏿‍🦯 E12.1 person with white cane: dark skin tone
  [
    '\u{1f9d1}\u200d\u{1f9af}\u200d\u27a1\ufe0f',
  ], // 🧑‍🦯‍➡️ E15.1 person with white cane facing right
  [
    '\u{1f9d1}\u200d\u{1f9af}\u200d\u27a1',
  ], // 🧑‍🦯‍➡ E15.1 person with white cane facing right
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f9af}\u200d\u27a1\ufe0f',
  ], // 🧑🏻‍🦯‍➡️ E15.1 person with white cane facing right: light skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f9af}\u200d\u27a1',
  ], // 🧑🏻‍🦯‍➡ E15.1 person with white cane facing right: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f9af}\u200d\u27a1\ufe0f',
  ], // 🧑🏼‍🦯‍➡️ E15.1 person with white cane facing right: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f9af}\u200d\u27a1',
  ], // 🧑🏼‍🦯‍➡ E15.1 person with white cane facing right: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f9af}\u200d\u27a1\ufe0f',
  ], // 🧑🏽‍🦯‍➡️ E15.1 person with white cane facing right: medium skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f9af}\u200d\u27a1',
  ], // 🧑🏽‍🦯‍➡ E15.1 person with white cane facing right: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f9af}\u200d\u27a1\ufe0f',
  ], // 🧑🏾‍🦯‍➡️ E15.1 person with white cane facing right: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f9af}\u200d\u27a1',
  ], // 🧑🏾‍🦯‍➡ E15.1 person with white cane facing right: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f9af}\u200d\u27a1\ufe0f',
  ], // 🧑🏿‍🦯‍➡️ E15.1 person with white cane facing right: dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f9af}\u200d\u27a1',
  ], // 🧑🏿‍🦯‍➡ E15.1 person with white cane facing right: dark skin tone
  [
    '\u{1f468}\u200d\u{1f9af}',
  ], // 👨‍🦯 E12.0 man with white cane
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f9af}',
  ], // 👨🏻‍🦯 E12.0 man with white cane: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f9af}',
  ], // 👨🏼‍🦯 E12.0 man with white cane: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f9af}',
  ], // 👨🏽‍🦯 E12.0 man with white cane: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f9af}',
  ], // 👨🏾‍🦯 E12.0 man with white cane: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f9af}',
  ], // 👨🏿‍🦯 E12.0 man with white cane: dark skin tone
  [
    '\u{1f468}\u200d\u{1f9af}\u200d\u27a1\ufe0f',
  ], // 👨‍🦯‍➡️ E15.1 man with white cane facing right
  [
    '\u{1f468}\u200d\u{1f9af}\u200d\u27a1',
  ], // 👨‍🦯‍➡ E15.1 man with white cane facing right
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f9af}\u200d\u27a1\ufe0f',
  ], // 👨🏻‍🦯‍➡️ E15.1 man with white cane facing right: light skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f9af}\u200d\u27a1',
  ], // 👨🏻‍🦯‍➡ E15.1 man with white cane facing right: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f9af}\u200d\u27a1\ufe0f',
  ], // 👨🏼‍🦯‍➡️ E15.1 man with white cane facing right: medium-light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f9af}\u200d\u27a1',
  ], // 👨🏼‍🦯‍➡ E15.1 man with white cane facing right: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f9af}\u200d\u27a1\ufe0f',
  ], // 👨🏽‍🦯‍➡️ E15.1 man with white cane facing right: medium skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f9af}\u200d\u27a1',
  ], // 👨🏽‍🦯‍➡ E15.1 man with white cane facing right: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f9af}\u200d\u27a1\ufe0f',
  ], // 👨🏾‍🦯‍➡️ E15.1 man with white cane facing right: medium-dark skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f9af}\u200d\u27a1',
  ], // 👨🏾‍🦯‍➡ E15.1 man with white cane facing right: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f9af}\u200d\u27a1\ufe0f',
  ], // 👨🏿‍🦯‍➡️ E15.1 man with white cane facing right: dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f9af}\u200d\u27a1',
  ], // 👨🏿‍🦯‍➡ E15.1 man with white cane facing right: dark skin tone
  [
    '\u{1f469}\u200d\u{1f9af}',
  ], // 👩‍🦯 E12.0 woman with white cane
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f9af}',
  ], // 👩🏻‍🦯 E12.0 woman with white cane: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f9af}',
  ], // 👩🏼‍🦯 E12.0 woman with white cane: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f9af}',
  ], // 👩🏽‍🦯 E12.0 woman with white cane: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f9af}',
  ], // 👩🏾‍🦯 E12.0 woman with white cane: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f9af}',
  ], // 👩🏿‍🦯 E12.0 woman with white cane: dark skin tone
  [
    '\u{1f469}\u200d\u{1f9af}\u200d\u27a1\ufe0f',
  ], // 👩‍🦯‍➡️ E15.1 woman with white cane facing right
  [
    '\u{1f469}\u200d\u{1f9af}\u200d\u27a1',
  ], // 👩‍🦯‍➡ E15.1 woman with white cane facing right
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f9af}\u200d\u27a1\ufe0f',
  ], // 👩🏻‍🦯‍➡️ E15.1 woman with white cane facing right: light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f9af}\u200d\u27a1',
  ], // 👩🏻‍🦯‍➡ E15.1 woman with white cane facing right: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f9af}\u200d\u27a1\ufe0f',
  ], // 👩🏼‍🦯‍➡️ E15.1 woman with white cane facing right: medium-light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f9af}\u200d\u27a1',
  ], // 👩🏼‍🦯‍➡ E15.1 woman with white cane facing right: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f9af}\u200d\u27a1\ufe0f',
  ], // 👩🏽‍🦯‍➡️ E15.1 woman with white cane facing right: medium skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f9af}\u200d\u27a1',
  ], // 👩🏽‍🦯‍➡ E15.1 woman with white cane facing right: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f9af}\u200d\u27a1\ufe0f',
  ], // 👩🏾‍🦯‍➡️ E15.1 woman with white cane facing right: medium-dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f9af}\u200d\u27a1',
  ], // 👩🏾‍🦯‍➡ E15.1 woman with white cane facing right: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f9af}\u200d\u27a1\ufe0f',
  ], // 👩🏿‍🦯‍➡️ E15.1 woman with white cane facing right: dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f9af}\u200d\u27a1',
  ], // 👩🏿‍🦯‍➡ E15.1 woman with white cane facing right: dark skin tone
  [
    '\u{1f9d1}\u200d\u{1f9bc}',
  ], // 🧑‍🦼 E12.1 person in motorized wheelchair
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f9bc}',
  ], // 🧑🏻‍🦼 E12.1 person in motorized wheelchair: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f9bc}',
  ], // 🧑🏼‍🦼 E12.1 person in motorized wheelchair: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f9bc}',
  ], // 🧑🏽‍🦼 E12.1 person in motorized wheelchair: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f9bc}',
  ], // 🧑🏾‍🦼 E12.1 person in motorized wheelchair: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f9bc}',
  ], // 🧑🏿‍🦼 E12.1 person in motorized wheelchair: dark skin tone
  [
    '\u{1f9d1}\u200d\u{1f9bc}\u200d\u27a1\ufe0f',
  ], // 🧑‍🦼‍➡️ E15.1 person in motorized wheelchair facing right
  [
    '\u{1f9d1}\u200d\u{1f9bc}\u200d\u27a1',
  ], // 🧑‍🦼‍➡ E15.1 person in motorized wheelchair facing right
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f9bc}\u200d\u27a1\ufe0f',
  ], // 🧑🏻‍🦼‍➡️ E15.1 person in motorized wheelchair facing right: light skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f9bc}\u200d\u27a1',
  ], // 🧑🏻‍🦼‍➡ E15.1 person in motorized wheelchair facing right: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f9bc}\u200d\u27a1\ufe0f',
  ], // 🧑🏼‍🦼‍➡️ E15.1 person in motorized wheelchair facing right: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f9bc}\u200d\u27a1',
  ], // 🧑🏼‍🦼‍➡ E15.1 person in motorized wheelchair facing right: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f9bc}\u200d\u27a1\ufe0f',
  ], // 🧑🏽‍🦼‍➡️ E15.1 person in motorized wheelchair facing right: medium skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f9bc}\u200d\u27a1',
  ], // 🧑🏽‍🦼‍➡ E15.1 person in motorized wheelchair facing right: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f9bc}\u200d\u27a1\ufe0f',
  ], // 🧑🏾‍🦼‍➡️ E15.1 person in motorized wheelchair facing right: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f9bc}\u200d\u27a1',
  ], // 🧑🏾‍🦼‍➡ E15.1 person in motorized wheelchair facing right: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f9bc}\u200d\u27a1\ufe0f',
  ], // 🧑🏿‍🦼‍➡️ E15.1 person in motorized wheelchair facing right: dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f9bc}\u200d\u27a1',
  ], // 🧑🏿‍🦼‍➡ E15.1 person in motorized wheelchair facing right: dark skin tone
  [
    '\u{1f468}\u200d\u{1f9bc}',
  ], // 👨‍🦼 E12.0 man in motorized wheelchair
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f9bc}',
  ], // 👨🏻‍🦼 E12.0 man in motorized wheelchair: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f9bc}',
  ], // 👨🏼‍🦼 E12.0 man in motorized wheelchair: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f9bc}',
  ], // 👨🏽‍🦼 E12.0 man in motorized wheelchair: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f9bc}',
  ], // 👨🏾‍🦼 E12.0 man in motorized wheelchair: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f9bc}',
  ], // 👨🏿‍🦼 E12.0 man in motorized wheelchair: dark skin tone
  [
    '\u{1f468}\u200d\u{1f9bc}\u200d\u27a1\ufe0f',
  ], // 👨‍🦼‍➡️ E15.1 man in motorized wheelchair facing right
  [
    '\u{1f468}\u200d\u{1f9bc}\u200d\u27a1',
  ], // 👨‍🦼‍➡ E15.1 man in motorized wheelchair facing right
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f9bc}\u200d\u27a1\ufe0f',
  ], // 👨🏻‍🦼‍➡️ E15.1 man in motorized wheelchair facing right: light skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f9bc}\u200d\u27a1',
  ], // 👨🏻‍🦼‍➡ E15.1 man in motorized wheelchair facing right: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f9bc}\u200d\u27a1\ufe0f',
  ], // 👨🏼‍🦼‍➡️ E15.1 man in motorized wheelchair facing right: medium-light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f9bc}\u200d\u27a1',
  ], // 👨🏼‍🦼‍➡ E15.1 man in motorized wheelchair facing right: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f9bc}\u200d\u27a1\ufe0f',
  ], // 👨🏽‍🦼‍➡️ E15.1 man in motorized wheelchair facing right: medium skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f9bc}\u200d\u27a1',
  ], // 👨🏽‍🦼‍➡ E15.1 man in motorized wheelchair facing right: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f9bc}\u200d\u27a1\ufe0f',
  ], // 👨🏾‍🦼‍➡️ E15.1 man in motorized wheelchair facing right: medium-dark skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f9bc}\u200d\u27a1',
  ], // 👨🏾‍🦼‍➡ E15.1 man in motorized wheelchair facing right: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f9bc}\u200d\u27a1\ufe0f',
  ], // 👨🏿‍🦼‍➡️ E15.1 man in motorized wheelchair facing right: dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f9bc}\u200d\u27a1',
  ], // 👨🏿‍🦼‍➡ E15.1 man in motorized wheelchair facing right: dark skin tone
  [
    '\u{1f469}\u200d\u{1f9bc}',
  ], // 👩‍🦼 E12.0 woman in motorized wheelchair
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f9bc}',
  ], // 👩🏻‍🦼 E12.0 woman in motorized wheelchair: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f9bc}',
  ], // 👩🏼‍🦼 E12.0 woman in motorized wheelchair: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f9bc}',
  ], // 👩🏽‍🦼 E12.0 woman in motorized wheelchair: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f9bc}',
  ], // 👩🏾‍🦼 E12.0 woman in motorized wheelchair: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f9bc}',
  ], // 👩🏿‍🦼 E12.0 woman in motorized wheelchair: dark skin tone
  [
    '\u{1f469}\u200d\u{1f9bc}\u200d\u27a1\ufe0f',
  ], // 👩‍🦼‍➡️ E15.1 woman in motorized wheelchair facing right
  [
    '\u{1f469}\u200d\u{1f9bc}\u200d\u27a1',
  ], // 👩‍🦼‍➡ E15.1 woman in motorized wheelchair facing right
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f9bc}\u200d\u27a1\ufe0f',
  ], // 👩🏻‍🦼‍➡️ E15.1 woman in motorized wheelchair facing right: light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f9bc}\u200d\u27a1',
  ], // 👩🏻‍🦼‍➡ E15.1 woman in motorized wheelchair facing right: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f9bc}\u200d\u27a1\ufe0f',
  ], // 👩🏼‍🦼‍➡️ E15.1 woman in motorized wheelchair facing right: medium-light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f9bc}\u200d\u27a1',
  ], // 👩🏼‍🦼‍➡ E15.1 woman in motorized wheelchair facing right: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f9bc}\u200d\u27a1\ufe0f',
  ], // 👩🏽‍🦼‍➡️ E15.1 woman in motorized wheelchair facing right: medium skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f9bc}\u200d\u27a1',
  ], // 👩🏽‍🦼‍➡ E15.1 woman in motorized wheelchair facing right: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f9bc}\u200d\u27a1\ufe0f',
  ], // 👩🏾‍🦼‍➡️ E15.1 woman in motorized wheelchair facing right: medium-dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f9bc}\u200d\u27a1',
  ], // 👩🏾‍🦼‍➡ E15.1 woman in motorized wheelchair facing right: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f9bc}\u200d\u27a1\ufe0f',
  ], // 👩🏿‍🦼‍➡️ E15.1 woman in motorized wheelchair facing right: dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f9bc}\u200d\u27a1',
  ], // 👩🏿‍🦼‍➡ E15.1 woman in motorized wheelchair facing right: dark skin tone
  [
    '\u{1f9d1}\u200d\u{1f9bd}',
  ], // 🧑‍🦽 E12.1 person in manual wheelchair
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f9bd}',
  ], // 🧑🏻‍🦽 E12.1 person in manual wheelchair: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f9bd}',
  ], // 🧑🏼‍🦽 E12.1 person in manual wheelchair: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f9bd}',
  ], // 🧑🏽‍🦽 E12.1 person in manual wheelchair: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f9bd}',
  ], // 🧑🏾‍🦽 E12.1 person in manual wheelchair: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f9bd}',
  ], // 🧑🏿‍🦽 E12.1 person in manual wheelchair: dark skin tone
  [
    '\u{1f9d1}\u200d\u{1f9bd}\u200d\u27a1\ufe0f',
  ], // 🧑‍🦽‍➡️ E15.1 person in manual wheelchair facing right
  [
    '\u{1f9d1}\u200d\u{1f9bd}\u200d\u27a1',
  ], // 🧑‍🦽‍➡ E15.1 person in manual wheelchair facing right
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f9bd}\u200d\u27a1\ufe0f',
  ], // 🧑🏻‍🦽‍➡️ E15.1 person in manual wheelchair facing right: light skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f9bd}\u200d\u27a1',
  ], // 🧑🏻‍🦽‍➡ E15.1 person in manual wheelchair facing right: light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f9bd}\u200d\u27a1\ufe0f',
  ], // 🧑🏼‍🦽‍➡️ E15.1 person in manual wheelchair facing right: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f9bd}\u200d\u27a1',
  ], // 🧑🏼‍🦽‍➡ E15.1 person in manual wheelchair facing right: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f9bd}\u200d\u27a1\ufe0f',
  ], // 🧑🏽‍🦽‍➡️ E15.1 person in manual wheelchair facing right: medium skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f9bd}\u200d\u27a1',
  ], // 🧑🏽‍🦽‍➡ E15.1 person in manual wheelchair facing right: medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f9bd}\u200d\u27a1\ufe0f',
  ], // 🧑🏾‍🦽‍➡️ E15.1 person in manual wheelchair facing right: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f9bd}\u200d\u27a1',
  ], // 🧑🏾‍🦽‍➡ E15.1 person in manual wheelchair facing right: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f9bd}\u200d\u27a1\ufe0f',
  ], // 🧑🏿‍🦽‍➡️ E15.1 person in manual wheelchair facing right: dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f9bd}\u200d\u27a1',
  ], // 🧑🏿‍🦽‍➡ E15.1 person in manual wheelchair facing right: dark skin tone
  [
    '\u{1f468}\u200d\u{1f9bd}',
  ], // 👨‍🦽 E12.0 man in manual wheelchair
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f9bd}',
  ], // 👨🏻‍🦽 E12.0 man in manual wheelchair: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f9bd}',
  ], // 👨🏼‍🦽 E12.0 man in manual wheelchair: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f9bd}',
  ], // 👨🏽‍🦽 E12.0 man in manual wheelchair: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f9bd}',
  ], // 👨🏾‍🦽 E12.0 man in manual wheelchair: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f9bd}',
  ], // 👨🏿‍🦽 E12.0 man in manual wheelchair: dark skin tone
  [
    '\u{1f468}\u200d\u{1f9bd}\u200d\u27a1\ufe0f',
  ], // 👨‍🦽‍➡️ E15.1 man in manual wheelchair facing right
  [
    '\u{1f468}\u200d\u{1f9bd}\u200d\u27a1',
  ], // 👨‍🦽‍➡ E15.1 man in manual wheelchair facing right
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f9bd}\u200d\u27a1\ufe0f',
  ], // 👨🏻‍🦽‍➡️ E15.1 man in manual wheelchair facing right: light skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f9bd}\u200d\u27a1',
  ], // 👨🏻‍🦽‍➡ E15.1 man in manual wheelchair facing right: light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f9bd}\u200d\u27a1\ufe0f',
  ], // 👨🏼‍🦽‍➡️ E15.1 man in manual wheelchair facing right: medium-light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f9bd}\u200d\u27a1',
  ], // 👨🏼‍🦽‍➡ E15.1 man in manual wheelchair facing right: medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f9bd}\u200d\u27a1\ufe0f',
  ], // 👨🏽‍🦽‍➡️ E15.1 man in manual wheelchair facing right: medium skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f9bd}\u200d\u27a1',
  ], // 👨🏽‍🦽‍➡ E15.1 man in manual wheelchair facing right: medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f9bd}\u200d\u27a1\ufe0f',
  ], // 👨🏾‍🦽‍➡️ E15.1 man in manual wheelchair facing right: medium-dark skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f9bd}\u200d\u27a1',
  ], // 👨🏾‍🦽‍➡ E15.1 man in manual wheelchair facing right: medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f9bd}\u200d\u27a1\ufe0f',
  ], // 👨🏿‍🦽‍➡️ E15.1 man in manual wheelchair facing right: dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f9bd}\u200d\u27a1',
  ], // 👨🏿‍🦽‍➡ E15.1 man in manual wheelchair facing right: dark skin tone
  [
    '\u{1f469}\u200d\u{1f9bd}',
  ], // 👩‍🦽 E12.0 woman in manual wheelchair
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f9bd}',
  ], // 👩🏻‍🦽 E12.0 woman in manual wheelchair: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f9bd}',
  ], // 👩🏼‍🦽 E12.0 woman in manual wheelchair: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f9bd}',
  ], // 👩🏽‍🦽 E12.0 woman in manual wheelchair: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f9bd}',
  ], // 👩🏾‍🦽 E12.0 woman in manual wheelchair: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f9bd}',
  ], // 👩🏿‍🦽 E12.0 woman in manual wheelchair: dark skin tone
  [
    '\u{1f469}\u200d\u{1f9bd}\u200d\u27a1\ufe0f',
  ], // 👩‍🦽‍➡️ E15.1 woman in manual wheelchair facing right
  [
    '\u{1f469}\u200d\u{1f9bd}\u200d\u27a1',
  ], // 👩‍🦽‍➡ E15.1 woman in manual wheelchair facing right
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f9bd}\u200d\u27a1\ufe0f',
  ], // 👩🏻‍🦽‍➡️ E15.1 woman in manual wheelchair facing right: light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f9bd}\u200d\u27a1',
  ], // 👩🏻‍🦽‍➡ E15.1 woman in manual wheelchair facing right: light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f9bd}\u200d\u27a1\ufe0f',
  ], // 👩🏼‍🦽‍➡️ E15.1 woman in manual wheelchair facing right: medium-light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f9bd}\u200d\u27a1',
  ], // 👩🏼‍🦽‍➡ E15.1 woman in manual wheelchair facing right: medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f9bd}\u200d\u27a1\ufe0f',
  ], // 👩🏽‍🦽‍➡️ E15.1 woman in manual wheelchair facing right: medium skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f9bd}\u200d\u27a1',
  ], // 👩🏽‍🦽‍➡ E15.1 woman in manual wheelchair facing right: medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f9bd}\u200d\u27a1\ufe0f',
  ], // 👩🏾‍🦽‍➡️ E15.1 woman in manual wheelchair facing right: medium-dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f9bd}\u200d\u27a1',
  ], // 👩🏾‍🦽‍➡ E15.1 woman in manual wheelchair facing right: medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f9bd}\u200d\u27a1\ufe0f',
  ], // 👩🏿‍🦽‍➡️ E15.1 woman in manual wheelchair facing right: dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f9bd}\u200d\u27a1',
  ], // 👩🏿‍🦽‍➡ E15.1 woman in manual wheelchair facing right: dark skin tone
  [
    '\u{1f3c3}',
  ], // 🏃 E0.6 person running
  [
    '\u{1f3c3}\u{1f3fb}',
  ], // 🏃🏻 E1.0 person running: light skin tone
  [
    '\u{1f3c3}\u{1f3fc}',
  ], // 🏃🏼 E1.0 person running: medium-light skin tone
  [
    '\u{1f3c3}\u{1f3fd}',
  ], // 🏃🏽 E1.0 person running: medium skin tone
  [
    '\u{1f3c3}\u{1f3fe}',
  ], // 🏃🏾 E1.0 person running: medium-dark skin tone
  [
    '\u{1f3c3}\u{1f3ff}',
  ], // 🏃🏿 E1.0 person running: dark skin tone
  [
    '\u{1f3c3}\u200d\u2642\ufe0f',
  ], // 🏃‍♂️ E4.0 man running
  [
    '\u{1f3c3}\u200d\u2642',
  ], // 🏃‍♂ E4.0 man running
  [
    '\u{1f3c3}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🏃🏻‍♂️ E4.0 man running: light skin tone
  [
    '\u{1f3c3}\u{1f3fb}\u200d\u2642',
  ], // 🏃🏻‍♂ E4.0 man running: light skin tone
  [
    '\u{1f3c3}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🏃🏼‍♂️ E4.0 man running: medium-light skin tone
  [
    '\u{1f3c3}\u{1f3fc}\u200d\u2642',
  ], // 🏃🏼‍♂ E4.0 man running: medium-light skin tone
  [
    '\u{1f3c3}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🏃🏽‍♂️ E4.0 man running: medium skin tone
  [
    '\u{1f3c3}\u{1f3fd}\u200d\u2642',
  ], // 🏃🏽‍♂ E4.0 man running: medium skin tone
  [
    '\u{1f3c3}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🏃🏾‍♂️ E4.0 man running: medium-dark skin tone
  [
    '\u{1f3c3}\u{1f3fe}\u200d\u2642',
  ], // 🏃🏾‍♂ E4.0 man running: medium-dark skin tone
  [
    '\u{1f3c3}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🏃🏿‍♂️ E4.0 man running: dark skin tone
  [
    '\u{1f3c3}\u{1f3ff}\u200d\u2642',
  ], // 🏃🏿‍♂ E4.0 man running: dark skin tone
  [
    '\u{1f3c3}\u200d\u2640\ufe0f',
  ], // 🏃‍♀️ E4.0 woman running
  [
    '\u{1f3c3}\u200d\u2640',
  ], // 🏃‍♀ E4.0 woman running
  [
    '\u{1f3c3}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🏃🏻‍♀️ E4.0 woman running: light skin tone
  [
    '\u{1f3c3}\u{1f3fb}\u200d\u2640',
  ], // 🏃🏻‍♀ E4.0 woman running: light skin tone
  [
    '\u{1f3c3}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🏃🏼‍♀️ E4.0 woman running: medium-light skin tone
  [
    '\u{1f3c3}\u{1f3fc}\u200d\u2640',
  ], // 🏃🏼‍♀ E4.0 woman running: medium-light skin tone
  [
    '\u{1f3c3}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🏃🏽‍♀️ E4.0 woman running: medium skin tone
  [
    '\u{1f3c3}\u{1f3fd}\u200d\u2640',
  ], // 🏃🏽‍♀ E4.0 woman running: medium skin tone
  [
    '\u{1f3c3}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🏃🏾‍♀️ E4.0 woman running: medium-dark skin tone
  [
    '\u{1f3c3}\u{1f3fe}\u200d\u2640',
  ], // 🏃🏾‍♀ E4.0 woman running: medium-dark skin tone
  [
    '\u{1f3c3}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🏃🏿‍♀️ E4.0 woman running: dark skin tone
  [
    '\u{1f3c3}\u{1f3ff}\u200d\u2640',
  ], // 🏃🏿‍♀ E4.0 woman running: dark skin tone
  [
    '\u{1f3c3}\u200d\u27a1\ufe0f',
  ], // 🏃‍➡️ E15.1 person running facing right
  [
    '\u{1f3c3}\u200d\u27a1',
  ], // 🏃‍➡ E15.1 person running facing right
  [
    '\u{1f3c3}\u{1f3fb}\u200d\u27a1\ufe0f',
  ], // 🏃🏻‍➡️ E15.1 person running facing right: light skin tone
  [
    '\u{1f3c3}\u{1f3fb}\u200d\u27a1',
  ], // 🏃🏻‍➡ E15.1 person running facing right: light skin tone
  [
    '\u{1f3c3}\u{1f3fc}\u200d\u27a1\ufe0f',
  ], // 🏃🏼‍➡️ E15.1 person running facing right: medium-light skin tone
  [
    '\u{1f3c3}\u{1f3fc}\u200d\u27a1',
  ], // 🏃🏼‍➡ E15.1 person running facing right: medium-light skin tone
  [
    '\u{1f3c3}\u{1f3fd}\u200d\u27a1\ufe0f',
  ], // 🏃🏽‍➡️ E15.1 person running facing right: medium skin tone
  [
    '\u{1f3c3}\u{1f3fd}\u200d\u27a1',
  ], // 🏃🏽‍➡ E15.1 person running facing right: medium skin tone
  [
    '\u{1f3c3}\u{1f3fe}\u200d\u27a1\ufe0f',
  ], // 🏃🏾‍➡️ E15.1 person running facing right: medium-dark skin tone
  [
    '\u{1f3c3}\u{1f3fe}\u200d\u27a1',
  ], // 🏃🏾‍➡ E15.1 person running facing right: medium-dark skin tone
  [
    '\u{1f3c3}\u{1f3ff}\u200d\u27a1\ufe0f',
  ], // 🏃🏿‍➡️ E15.1 person running facing right: dark skin tone
  [
    '\u{1f3c3}\u{1f3ff}\u200d\u27a1',
  ], // 🏃🏿‍➡ E15.1 person running facing right: dark skin tone
  [
    '\u{1f3c3}\u200d\u2640\ufe0f\u200d\u27a1\ufe0f',
  ], // 🏃‍♀️‍➡️ E15.1 woman running facing right
  [
    '\u{1f3c3}\u200d\u2640\u200d\u27a1\ufe0f',
  ], // 🏃‍♀‍➡️ E15.1 woman running facing right
  [
    '\u{1f3c3}\u200d\u2640\ufe0f\u200d\u27a1',
  ], // 🏃‍♀️‍➡ E15.1 woman running facing right
  [
    '\u{1f3c3}\u200d\u2640\u200d\u27a1',
  ], // 🏃‍♀‍➡ E15.1 woman running facing right
  [
    '\u{1f3c3}\u{1f3fb}\u200d\u2640\ufe0f\u200d\u27a1\ufe0f',
  ], // 🏃🏻‍♀️‍➡️ E15.1 woman running facing right: light skin tone
  [
    '\u{1f3c3}\u{1f3fb}\u200d\u2640\u200d\u27a1\ufe0f',
  ], // 🏃🏻‍♀‍➡️ E15.1 woman running facing right: light skin tone
  [
    '\u{1f3c3}\u{1f3fb}\u200d\u2640\ufe0f\u200d\u27a1',
  ], // 🏃🏻‍♀️‍➡ E15.1 woman running facing right: light skin tone
  [
    '\u{1f3c3}\u{1f3fb}\u200d\u2640\u200d\u27a1',
  ], // 🏃🏻‍♀‍➡ E15.1 woman running facing right: light skin tone
  [
    '\u{1f3c3}\u{1f3fc}\u200d\u2640\ufe0f\u200d\u27a1\ufe0f',
  ], // 🏃🏼‍♀️‍➡️ E15.1 woman running facing right: medium-light skin tone
  [
    '\u{1f3c3}\u{1f3fc}\u200d\u2640\u200d\u27a1\ufe0f',
  ], // 🏃🏼‍♀‍➡️ E15.1 woman running facing right: medium-light skin tone
  [
    '\u{1f3c3}\u{1f3fc}\u200d\u2640\ufe0f\u200d\u27a1',
  ], // 🏃🏼‍♀️‍➡ E15.1 woman running facing right: medium-light skin tone
  [
    '\u{1f3c3}\u{1f3fc}\u200d\u2640\u200d\u27a1',
  ], // 🏃🏼‍♀‍➡ E15.1 woman running facing right: medium-light skin tone
  [
    '\u{1f3c3}\u{1f3fd}\u200d\u2640\ufe0f\u200d\u27a1\ufe0f',
  ], // 🏃🏽‍♀️‍➡️ E15.1 woman running facing right: medium skin tone
  [
    '\u{1f3c3}\u{1f3fd}\u200d\u2640\u200d\u27a1\ufe0f',
  ], // 🏃🏽‍♀‍➡️ E15.1 woman running facing right: medium skin tone
  [
    '\u{1f3c3}\u{1f3fd}\u200d\u2640\ufe0f\u200d\u27a1',
  ], // 🏃🏽‍♀️‍➡ E15.1 woman running facing right: medium skin tone
  [
    '\u{1f3c3}\u{1f3fd}\u200d\u2640\u200d\u27a1',
  ], // 🏃🏽‍♀‍➡ E15.1 woman running facing right: medium skin tone
  [
    '\u{1f3c3}\u{1f3fe}\u200d\u2640\ufe0f\u200d\u27a1\ufe0f',
  ], // 🏃🏾‍♀️‍➡️ E15.1 woman running facing right: medium-dark skin tone
  [
    '\u{1f3c3}\u{1f3fe}\u200d\u2640\u200d\u27a1\ufe0f',
  ], // 🏃🏾‍♀‍➡️ E15.1 woman running facing right: medium-dark skin tone
  [
    '\u{1f3c3}\u{1f3fe}\u200d\u2640\ufe0f\u200d\u27a1',
  ], // 🏃🏾‍♀️‍➡ E15.1 woman running facing right: medium-dark skin tone
  [
    '\u{1f3c3}\u{1f3fe}\u200d\u2640\u200d\u27a1',
  ], // 🏃🏾‍♀‍➡ E15.1 woman running facing right: medium-dark skin tone
  [
    '\u{1f3c3}\u{1f3ff}\u200d\u2640\ufe0f\u200d\u27a1\ufe0f',
  ], // 🏃🏿‍♀️‍➡️ E15.1 woman running facing right: dark skin tone
  [
    '\u{1f3c3}\u{1f3ff}\u200d\u2640\u200d\u27a1\ufe0f',
  ], // 🏃🏿‍♀‍➡️ E15.1 woman running facing right: dark skin tone
  [
    '\u{1f3c3}\u{1f3ff}\u200d\u2640\ufe0f\u200d\u27a1',
  ], // 🏃🏿‍♀️‍➡ E15.1 woman running facing right: dark skin tone
  [
    '\u{1f3c3}\u{1f3ff}\u200d\u2640\u200d\u27a1',
  ], // 🏃🏿‍♀‍➡ E15.1 woman running facing right: dark skin tone
  [
    '\u{1f3c3}\u200d\u2642\ufe0f\u200d\u27a1\ufe0f',
  ], // 🏃‍♂️‍➡️ E15.1 man running facing right
  [
    '\u{1f3c3}\u200d\u2642\u200d\u27a1\ufe0f',
  ], // 🏃‍♂‍➡️ E15.1 man running facing right
  [
    '\u{1f3c3}\u200d\u2642\ufe0f\u200d\u27a1',
  ], // 🏃‍♂️‍➡ E15.1 man running facing right
  [
    '\u{1f3c3}\u200d\u2642\u200d\u27a1',
  ], // 🏃‍♂‍➡ E15.1 man running facing right
  [
    '\u{1f3c3}\u{1f3fb}\u200d\u2642\ufe0f\u200d\u27a1\ufe0f',
  ], // 🏃🏻‍♂️‍➡️ E15.1 man running facing right: light skin tone
  [
    '\u{1f3c3}\u{1f3fb}\u200d\u2642\u200d\u27a1\ufe0f',
  ], // 🏃🏻‍♂‍➡️ E15.1 man running facing right: light skin tone
  [
    '\u{1f3c3}\u{1f3fb}\u200d\u2642\ufe0f\u200d\u27a1',
  ], // 🏃🏻‍♂️‍➡ E15.1 man running facing right: light skin tone
  [
    '\u{1f3c3}\u{1f3fb}\u200d\u2642\u200d\u27a1',
  ], // 🏃🏻‍♂‍➡ E15.1 man running facing right: light skin tone
  [
    '\u{1f3c3}\u{1f3fc}\u200d\u2642\ufe0f\u200d\u27a1\ufe0f',
  ], // 🏃🏼‍♂️‍➡️ E15.1 man running facing right: medium-light skin tone
  [
    '\u{1f3c3}\u{1f3fc}\u200d\u2642\u200d\u27a1\ufe0f',
  ], // 🏃🏼‍♂‍➡️ E15.1 man running facing right: medium-light skin tone
  [
    '\u{1f3c3}\u{1f3fc}\u200d\u2642\ufe0f\u200d\u27a1',
  ], // 🏃🏼‍♂️‍➡ E15.1 man running facing right: medium-light skin tone
  [
    '\u{1f3c3}\u{1f3fc}\u200d\u2642\u200d\u27a1',
  ], // 🏃🏼‍♂‍➡ E15.1 man running facing right: medium-light skin tone
  [
    '\u{1f3c3}\u{1f3fd}\u200d\u2642\ufe0f\u200d\u27a1\ufe0f',
  ], // 🏃🏽‍♂️‍➡️ E15.1 man running facing right: medium skin tone
  [
    '\u{1f3c3}\u{1f3fd}\u200d\u2642\u200d\u27a1\ufe0f',
  ], // 🏃🏽‍♂‍➡️ E15.1 man running facing right: medium skin tone
  [
    '\u{1f3c3}\u{1f3fd}\u200d\u2642\ufe0f\u200d\u27a1',
  ], // 🏃🏽‍♂️‍➡ E15.1 man running facing right: medium skin tone
  [
    '\u{1f3c3}\u{1f3fd}\u200d\u2642\u200d\u27a1',
  ], // 🏃🏽‍♂‍➡ E15.1 man running facing right: medium skin tone
  [
    '\u{1f3c3}\u{1f3fe}\u200d\u2642\ufe0f\u200d\u27a1\ufe0f',
  ], // 🏃🏾‍♂️‍➡️ E15.1 man running facing right: medium-dark skin tone
  [
    '\u{1f3c3}\u{1f3fe}\u200d\u2642\u200d\u27a1\ufe0f',
  ], // 🏃🏾‍♂‍➡️ E15.1 man running facing right: medium-dark skin tone
  [
    '\u{1f3c3}\u{1f3fe}\u200d\u2642\ufe0f\u200d\u27a1',
  ], // 🏃🏾‍♂️‍➡ E15.1 man running facing right: medium-dark skin tone
  [
    '\u{1f3c3}\u{1f3fe}\u200d\u2642\u200d\u27a1',
  ], // 🏃🏾‍♂‍➡ E15.1 man running facing right: medium-dark skin tone
  [
    '\u{1f3c3}\u{1f3ff}\u200d\u2642\ufe0f\u200d\u27a1\ufe0f',
  ], // 🏃🏿‍♂️‍➡️ E15.1 man running facing right: dark skin tone
  [
    '\u{1f3c3}\u{1f3ff}\u200d\u2642\u200d\u27a1\ufe0f',
  ], // 🏃🏿‍♂‍➡️ E15.1 man running facing right: dark skin tone
  [
    '\u{1f3c3}\u{1f3ff}\u200d\u2642\ufe0f\u200d\u27a1',
  ], // 🏃🏿‍♂️‍➡ E15.1 man running facing right: dark skin tone
  [
    '\u{1f3c3}\u{1f3ff}\u200d\u2642\u200d\u27a1',
  ], // 🏃🏿‍♂‍➡ E15.1 man running facing right: dark skin tone
  [
    '\u{1f483}',
  ], // 💃 E0.6 woman dancing
  [
    '\u{1f483}\u{1f3fb}',
  ], // 💃🏻 E1.0 woman dancing: light skin tone
  [
    '\u{1f483}\u{1f3fc}',
  ], // 💃🏼 E1.0 woman dancing: medium-light skin tone
  [
    '\u{1f483}\u{1f3fd}',
  ], // 💃🏽 E1.0 woman dancing: medium skin tone
  [
    '\u{1f483}\u{1f3fe}',
  ], // 💃🏾 E1.0 woman dancing: medium-dark skin tone
  [
    '\u{1f483}\u{1f3ff}',
  ], // 💃🏿 E1.0 woman dancing: dark skin tone
  [
    '\u{1f57a}',
  ], // 🕺 E3.0 man dancing
  [
    '\u{1f57a}\u{1f3fb}',
  ], // 🕺🏻 E3.0 man dancing: light skin tone
  [
    '\u{1f57a}\u{1f3fc}',
  ], // 🕺🏼 E3.0 man dancing: medium-light skin tone
  [
    '\u{1f57a}\u{1f3fd}',
  ], // 🕺🏽 E3.0 man dancing: medium skin tone
  [
    '\u{1f57a}\u{1f3fe}',
  ], // 🕺🏾 E3.0 man dancing: medium-dark skin tone
  [
    '\u{1f57a}\u{1f3ff}',
  ], // 🕺🏿 E3.0 man dancing: dark skin tone
  [
    '\u{1f574}\ufe0f',
  ], // 🕴️ E0.7 person in suit levitating
  [
    '\u{1f574}',
  ], // 🕴 E0.7 person in suit levitating
  [
    '\u{1f574}\u{1f3fb}',
  ], // 🕴🏻 E4.0 person in suit levitating: light skin tone
  [
    '\u{1f574}\u{1f3fc}',
  ], // 🕴🏼 E4.0 person in suit levitating: medium-light skin tone
  [
    '\u{1f574}\u{1f3fd}',
  ], // 🕴🏽 E4.0 person in suit levitating: medium skin tone
  [
    '\u{1f574}\u{1f3fe}',
  ], // 🕴🏾 E4.0 person in suit levitating: medium-dark skin tone
  [
    '\u{1f574}\u{1f3ff}',
  ], // 🕴🏿 E4.0 person in suit levitating: dark skin tone
  [
    '\u{1f46f}',
  ], // 👯 E0.6 people with bunny ears
  [
    '\u{1f46f}\u200d\u2642\ufe0f',
  ], // 👯‍♂️ E4.0 men with bunny ears
  [
    '\u{1f46f}\u200d\u2642',
  ], // 👯‍♂ E4.0 men with bunny ears
  [
    '\u{1f46f}\u200d\u2640\ufe0f',
  ], // 👯‍♀️ E4.0 women with bunny ears
  [
    '\u{1f46f}\u200d\u2640',
  ], // 👯‍♀ E4.0 women with bunny ears
  [
    '\u{1f9d6}',
  ], // 🧖 E5.0 person in steamy room
  [
    '\u{1f9d6}\u{1f3fb}',
  ], // 🧖🏻 E5.0 person in steamy room: light skin tone
  [
    '\u{1f9d6}\u{1f3fc}',
  ], // 🧖🏼 E5.0 person in steamy room: medium-light skin tone
  [
    '\u{1f9d6}\u{1f3fd}',
  ], // 🧖🏽 E5.0 person in steamy room: medium skin tone
  [
    '\u{1f9d6}\u{1f3fe}',
  ], // 🧖🏾 E5.0 person in steamy room: medium-dark skin tone
  [
    '\u{1f9d6}\u{1f3ff}',
  ], // 🧖🏿 E5.0 person in steamy room: dark skin tone
  [
    '\u{1f9d6}\u200d\u2642\ufe0f',
  ], // 🧖‍♂️ E5.0 man in steamy room
  [
    '\u{1f9d6}\u200d\u2642',
  ], // 🧖‍♂ E5.0 man in steamy room
  [
    '\u{1f9d6}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🧖🏻‍♂️ E5.0 man in steamy room: light skin tone
  [
    '\u{1f9d6}\u{1f3fb}\u200d\u2642',
  ], // 🧖🏻‍♂ E5.0 man in steamy room: light skin tone
  [
    '\u{1f9d6}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🧖🏼‍♂️ E5.0 man in steamy room: medium-light skin tone
  [
    '\u{1f9d6}\u{1f3fc}\u200d\u2642',
  ], // 🧖🏼‍♂ E5.0 man in steamy room: medium-light skin tone
  [
    '\u{1f9d6}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🧖🏽‍♂️ E5.0 man in steamy room: medium skin tone
  [
    '\u{1f9d6}\u{1f3fd}\u200d\u2642',
  ], // 🧖🏽‍♂ E5.0 man in steamy room: medium skin tone
  [
    '\u{1f9d6}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🧖🏾‍♂️ E5.0 man in steamy room: medium-dark skin tone
  [
    '\u{1f9d6}\u{1f3fe}\u200d\u2642',
  ], // 🧖🏾‍♂ E5.0 man in steamy room: medium-dark skin tone
  [
    '\u{1f9d6}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🧖🏿‍♂️ E5.0 man in steamy room: dark skin tone
  [
    '\u{1f9d6}\u{1f3ff}\u200d\u2642',
  ], // 🧖🏿‍♂ E5.0 man in steamy room: dark skin tone
  [
    '\u{1f9d6}\u200d\u2640\ufe0f',
  ], // 🧖‍♀️ E5.0 woman in steamy room
  [
    '\u{1f9d6}\u200d\u2640',
  ], // 🧖‍♀ E5.0 woman in steamy room
  [
    '\u{1f9d6}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🧖🏻‍♀️ E5.0 woman in steamy room: light skin tone
  [
    '\u{1f9d6}\u{1f3fb}\u200d\u2640',
  ], // 🧖🏻‍♀ E5.0 woman in steamy room: light skin tone
  [
    '\u{1f9d6}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🧖🏼‍♀️ E5.0 woman in steamy room: medium-light skin tone
  [
    '\u{1f9d6}\u{1f3fc}\u200d\u2640',
  ], // 🧖🏼‍♀ E5.0 woman in steamy room: medium-light skin tone
  [
    '\u{1f9d6}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🧖🏽‍♀️ E5.0 woman in steamy room: medium skin tone
  [
    '\u{1f9d6}\u{1f3fd}\u200d\u2640',
  ], // 🧖🏽‍♀ E5.0 woman in steamy room: medium skin tone
  [
    '\u{1f9d6}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🧖🏾‍♀️ E5.0 woman in steamy room: medium-dark skin tone
  [
    '\u{1f9d6}\u{1f3fe}\u200d\u2640',
  ], // 🧖🏾‍♀ E5.0 woman in steamy room: medium-dark skin tone
  [
    '\u{1f9d6}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🧖🏿‍♀️ E5.0 woman in steamy room: dark skin tone
  [
    '\u{1f9d6}\u{1f3ff}\u200d\u2640',
  ], // 🧖🏿‍♀ E5.0 woman in steamy room: dark skin tone
  [
    '\u{1f9d7}',
  ], // 🧗 E5.0 person climbing
  [
    '\u{1f9d7}\u{1f3fb}',
  ], // 🧗🏻 E5.0 person climbing: light skin tone
  [
    '\u{1f9d7}\u{1f3fc}',
  ], // 🧗🏼 E5.0 person climbing: medium-light skin tone
  [
    '\u{1f9d7}\u{1f3fd}',
  ], // 🧗🏽 E5.0 person climbing: medium skin tone
  [
    '\u{1f9d7}\u{1f3fe}',
  ], // 🧗🏾 E5.0 person climbing: medium-dark skin tone
  [
    '\u{1f9d7}\u{1f3ff}',
  ], // 🧗🏿 E5.0 person climbing: dark skin tone
  [
    '\u{1f9d7}\u200d\u2642\ufe0f',
  ], // 🧗‍♂️ E5.0 man climbing
  [
    '\u{1f9d7}\u200d\u2642',
  ], // 🧗‍♂ E5.0 man climbing
  [
    '\u{1f9d7}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🧗🏻‍♂️ E5.0 man climbing: light skin tone
  [
    '\u{1f9d7}\u{1f3fb}\u200d\u2642',
  ], // 🧗🏻‍♂ E5.0 man climbing: light skin tone
  [
    '\u{1f9d7}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🧗🏼‍♂️ E5.0 man climbing: medium-light skin tone
  [
    '\u{1f9d7}\u{1f3fc}\u200d\u2642',
  ], // 🧗🏼‍♂ E5.0 man climbing: medium-light skin tone
  [
    '\u{1f9d7}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🧗🏽‍♂️ E5.0 man climbing: medium skin tone
  [
    '\u{1f9d7}\u{1f3fd}\u200d\u2642',
  ], // 🧗🏽‍♂ E5.0 man climbing: medium skin tone
  [
    '\u{1f9d7}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🧗🏾‍♂️ E5.0 man climbing: medium-dark skin tone
  [
    '\u{1f9d7}\u{1f3fe}\u200d\u2642',
  ], // 🧗🏾‍♂ E5.0 man climbing: medium-dark skin tone
  [
    '\u{1f9d7}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🧗🏿‍♂️ E5.0 man climbing: dark skin tone
  [
    '\u{1f9d7}\u{1f3ff}\u200d\u2642',
  ], // 🧗🏿‍♂ E5.0 man climbing: dark skin tone
  [
    '\u{1f9d7}\u200d\u2640\ufe0f',
  ], // 🧗‍♀️ E5.0 woman climbing
  [
    '\u{1f9d7}\u200d\u2640',
  ], // 🧗‍♀ E5.0 woman climbing
  [
    '\u{1f9d7}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🧗🏻‍♀️ E5.0 woman climbing: light skin tone
  [
    '\u{1f9d7}\u{1f3fb}\u200d\u2640',
  ], // 🧗🏻‍♀ E5.0 woman climbing: light skin tone
  [
    '\u{1f9d7}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🧗🏼‍♀️ E5.0 woman climbing: medium-light skin tone
  [
    '\u{1f9d7}\u{1f3fc}\u200d\u2640',
  ], // 🧗🏼‍♀ E5.0 woman climbing: medium-light skin tone
  [
    '\u{1f9d7}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🧗🏽‍♀️ E5.0 woman climbing: medium skin tone
  [
    '\u{1f9d7}\u{1f3fd}\u200d\u2640',
  ], // 🧗🏽‍♀ E5.0 woman climbing: medium skin tone
  [
    '\u{1f9d7}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🧗🏾‍♀️ E5.0 woman climbing: medium-dark skin tone
  [
    '\u{1f9d7}\u{1f3fe}\u200d\u2640',
  ], // 🧗🏾‍♀ E5.0 woman climbing: medium-dark skin tone
  [
    '\u{1f9d7}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🧗🏿‍♀️ E5.0 woman climbing: dark skin tone
  [
    '\u{1f9d7}\u{1f3ff}\u200d\u2640',
  ], // 🧗🏿‍♀ E5.0 woman climbing: dark skin tone
  [
    '\u{1f93a}',
  ], // 🤺 E3.0 person fencing
  [
    '\u{1f3c7}',
  ], // 🏇 E1.0 horse racing
  [
    '\u{1f3c7}\u{1f3fb}',
  ], // 🏇🏻 E1.0 horse racing: light skin tone
  [
    '\u{1f3c7}\u{1f3fc}',
  ], // 🏇🏼 E1.0 horse racing: medium-light skin tone
  [
    '\u{1f3c7}\u{1f3fd}',
  ], // 🏇🏽 E1.0 horse racing: medium skin tone
  [
    '\u{1f3c7}\u{1f3fe}',
  ], // 🏇🏾 E1.0 horse racing: medium-dark skin tone
  [
    '\u{1f3c7}\u{1f3ff}',
  ], // 🏇🏿 E1.0 horse racing: dark skin tone
  [
    '\u26f7\ufe0f',
  ], // ⛷️ E0.7 skier
  [
    '\u26f7',
  ], // ⛷ E0.7 skier
  [
    '\u{1f3c2}',
  ], // 🏂 E0.6 snowboarder
  [
    '\u{1f3c2}\u{1f3fb}',
  ], // 🏂🏻 E1.0 snowboarder: light skin tone
  [
    '\u{1f3c2}\u{1f3fc}',
  ], // 🏂🏼 E1.0 snowboarder: medium-light skin tone
  [
    '\u{1f3c2}\u{1f3fd}',
  ], // 🏂🏽 E1.0 snowboarder: medium skin tone
  [
    '\u{1f3c2}\u{1f3fe}',
  ], // 🏂🏾 E1.0 snowboarder: medium-dark skin tone
  [
    '\u{1f3c2}\u{1f3ff}',
  ], // 🏂🏿 E1.0 snowboarder: dark skin tone
  [
    '\u{1f3cc}\ufe0f',
  ], // 🏌️ E0.7 person golfing
  [
    '\u{1f3cc}',
  ], // 🏌 E0.7 person golfing
  [
    '\u{1f3cc}\u{1f3fb}',
  ], // 🏌🏻 E4.0 person golfing: light skin tone
  [
    '\u{1f3cc}\u{1f3fc}',
  ], // 🏌🏼 E4.0 person golfing: medium-light skin tone
  [
    '\u{1f3cc}\u{1f3fd}',
  ], // 🏌🏽 E4.0 person golfing: medium skin tone
  [
    '\u{1f3cc}\u{1f3fe}',
  ], // 🏌🏾 E4.0 person golfing: medium-dark skin tone
  [
    '\u{1f3cc}\u{1f3ff}',
  ], // 🏌🏿 E4.0 person golfing: dark skin tone
  [
    '\u{1f3cc}\ufe0f\u200d\u2642\ufe0f',
  ], // 🏌️‍♂️ E4.0 man golfing
  [
    '\u{1f3cc}\u200d\u2642\ufe0f',
  ], // 🏌‍♂️ E4.0 man golfing
  [
    '\u{1f3cc}\ufe0f\u200d\u2642',
  ], // 🏌️‍♂ E4.0 man golfing
  [
    '\u{1f3cc}\u200d\u2642',
  ], // 🏌‍♂ E4.0 man golfing
  [
    '\u{1f3cc}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🏌🏻‍♂️ E4.0 man golfing: light skin tone
  [
    '\u{1f3cc}\u{1f3fb}\u200d\u2642',
  ], // 🏌🏻‍♂ E4.0 man golfing: light skin tone
  [
    '\u{1f3cc}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🏌🏼‍♂️ E4.0 man golfing: medium-light skin tone
  [
    '\u{1f3cc}\u{1f3fc}\u200d\u2642',
  ], // 🏌🏼‍♂ E4.0 man golfing: medium-light skin tone
  [
    '\u{1f3cc}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🏌🏽‍♂️ E4.0 man golfing: medium skin tone
  [
    '\u{1f3cc}\u{1f3fd}\u200d\u2642',
  ], // 🏌🏽‍♂ E4.0 man golfing: medium skin tone
  [
    '\u{1f3cc}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🏌🏾‍♂️ E4.0 man golfing: medium-dark skin tone
  [
    '\u{1f3cc}\u{1f3fe}\u200d\u2642',
  ], // 🏌🏾‍♂ E4.0 man golfing: medium-dark skin tone
  [
    '\u{1f3cc}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🏌🏿‍♂️ E4.0 man golfing: dark skin tone
  [
    '\u{1f3cc}\u{1f3ff}\u200d\u2642',
  ], // 🏌🏿‍♂ E4.0 man golfing: dark skin tone
  [
    '\u{1f3cc}\ufe0f\u200d\u2640\ufe0f',
  ], // 🏌️‍♀️ E4.0 woman golfing
  [
    '\u{1f3cc}\u200d\u2640\ufe0f',
  ], // 🏌‍♀️ E4.0 woman golfing
  [
    '\u{1f3cc}\ufe0f\u200d\u2640',
  ], // 🏌️‍♀ E4.0 woman golfing
  [
    '\u{1f3cc}\u200d\u2640',
  ], // 🏌‍♀ E4.0 woman golfing
  [
    '\u{1f3cc}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🏌🏻‍♀️ E4.0 woman golfing: light skin tone
  [
    '\u{1f3cc}\u{1f3fb}\u200d\u2640',
  ], // 🏌🏻‍♀ E4.0 woman golfing: light skin tone
  [
    '\u{1f3cc}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🏌🏼‍♀️ E4.0 woman golfing: medium-light skin tone
  [
    '\u{1f3cc}\u{1f3fc}\u200d\u2640',
  ], // 🏌🏼‍♀ E4.0 woman golfing: medium-light skin tone
  [
    '\u{1f3cc}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🏌🏽‍♀️ E4.0 woman golfing: medium skin tone
  [
    '\u{1f3cc}\u{1f3fd}\u200d\u2640',
  ], // 🏌🏽‍♀ E4.0 woman golfing: medium skin tone
  [
    '\u{1f3cc}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🏌🏾‍♀️ E4.0 woman golfing: medium-dark skin tone
  [
    '\u{1f3cc}\u{1f3fe}\u200d\u2640',
  ], // 🏌🏾‍♀ E4.0 woman golfing: medium-dark skin tone
  [
    '\u{1f3cc}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🏌🏿‍♀️ E4.0 woman golfing: dark skin tone
  [
    '\u{1f3cc}\u{1f3ff}\u200d\u2640',
  ], // 🏌🏿‍♀ E4.0 woman golfing: dark skin tone
  [
    '\u{1f3c4}',
  ], // 🏄 E0.6 person surfing
  [
    '\u{1f3c4}\u{1f3fb}',
  ], // 🏄🏻 E1.0 person surfing: light skin tone
  [
    '\u{1f3c4}\u{1f3fc}',
  ], // 🏄🏼 E1.0 person surfing: medium-light skin tone
  [
    '\u{1f3c4}\u{1f3fd}',
  ], // 🏄🏽 E1.0 person surfing: medium skin tone
  [
    '\u{1f3c4}\u{1f3fe}',
  ], // 🏄🏾 E1.0 person surfing: medium-dark skin tone
  [
    '\u{1f3c4}\u{1f3ff}',
  ], // 🏄🏿 E1.0 person surfing: dark skin tone
  [
    '\u{1f3c4}\u200d\u2642\ufe0f',
  ], // 🏄‍♂️ E4.0 man surfing
  [
    '\u{1f3c4}\u200d\u2642',
  ], // 🏄‍♂ E4.0 man surfing
  [
    '\u{1f3c4}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🏄🏻‍♂️ E4.0 man surfing: light skin tone
  [
    '\u{1f3c4}\u{1f3fb}\u200d\u2642',
  ], // 🏄🏻‍♂ E4.0 man surfing: light skin tone
  [
    '\u{1f3c4}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🏄🏼‍♂️ E4.0 man surfing: medium-light skin tone
  [
    '\u{1f3c4}\u{1f3fc}\u200d\u2642',
  ], // 🏄🏼‍♂ E4.0 man surfing: medium-light skin tone
  [
    '\u{1f3c4}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🏄🏽‍♂️ E4.0 man surfing: medium skin tone
  [
    '\u{1f3c4}\u{1f3fd}\u200d\u2642',
  ], // 🏄🏽‍♂ E4.0 man surfing: medium skin tone
  [
    '\u{1f3c4}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🏄🏾‍♂️ E4.0 man surfing: medium-dark skin tone
  [
    '\u{1f3c4}\u{1f3fe}\u200d\u2642',
  ], // 🏄🏾‍♂ E4.0 man surfing: medium-dark skin tone
  [
    '\u{1f3c4}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🏄🏿‍♂️ E4.0 man surfing: dark skin tone
  [
    '\u{1f3c4}\u{1f3ff}\u200d\u2642',
  ], // 🏄🏿‍♂ E4.0 man surfing: dark skin tone
  [
    '\u{1f3c4}\u200d\u2640\ufe0f',
  ], // 🏄‍♀️ E4.0 woman surfing
  [
    '\u{1f3c4}\u200d\u2640',
  ], // 🏄‍♀ E4.0 woman surfing
  [
    '\u{1f3c4}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🏄🏻‍♀️ E4.0 woman surfing: light skin tone
  [
    '\u{1f3c4}\u{1f3fb}\u200d\u2640',
  ], // 🏄🏻‍♀ E4.0 woman surfing: light skin tone
  [
    '\u{1f3c4}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🏄🏼‍♀️ E4.0 woman surfing: medium-light skin tone
  [
    '\u{1f3c4}\u{1f3fc}\u200d\u2640',
  ], // 🏄🏼‍♀ E4.0 woman surfing: medium-light skin tone
  [
    '\u{1f3c4}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🏄🏽‍♀️ E4.0 woman surfing: medium skin tone
  [
    '\u{1f3c4}\u{1f3fd}\u200d\u2640',
  ], // 🏄🏽‍♀ E4.0 woman surfing: medium skin tone
  [
    '\u{1f3c4}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🏄🏾‍♀️ E4.0 woman surfing: medium-dark skin tone
  [
    '\u{1f3c4}\u{1f3fe}\u200d\u2640',
  ], // 🏄🏾‍♀ E4.0 woman surfing: medium-dark skin tone
  [
    '\u{1f3c4}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🏄🏿‍♀️ E4.0 woman surfing: dark skin tone
  [
    '\u{1f3c4}\u{1f3ff}\u200d\u2640',
  ], // 🏄🏿‍♀ E4.0 woman surfing: dark skin tone
  [
    '\u{1f6a3}',
  ], // 🚣 E1.0 person rowing boat
  [
    '\u{1f6a3}\u{1f3fb}',
  ], // 🚣🏻 E1.0 person rowing boat: light skin tone
  [
    '\u{1f6a3}\u{1f3fc}',
  ], // 🚣🏼 E1.0 person rowing boat: medium-light skin tone
  [
    '\u{1f6a3}\u{1f3fd}',
  ], // 🚣🏽 E1.0 person rowing boat: medium skin tone
  [
    '\u{1f6a3}\u{1f3fe}',
  ], // 🚣🏾 E1.0 person rowing boat: medium-dark skin tone
  [
    '\u{1f6a3}\u{1f3ff}',
  ], // 🚣🏿 E1.0 person rowing boat: dark skin tone
  [
    '\u{1f6a3}\u200d\u2642\ufe0f',
  ], // 🚣‍♂️ E4.0 man rowing boat
  [
    '\u{1f6a3}\u200d\u2642',
  ], // 🚣‍♂ E4.0 man rowing boat
  [
    '\u{1f6a3}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🚣🏻‍♂️ E4.0 man rowing boat: light skin tone
  [
    '\u{1f6a3}\u{1f3fb}\u200d\u2642',
  ], // 🚣🏻‍♂ E4.0 man rowing boat: light skin tone
  [
    '\u{1f6a3}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🚣🏼‍♂️ E4.0 man rowing boat: medium-light skin tone
  [
    '\u{1f6a3}\u{1f3fc}\u200d\u2642',
  ], // 🚣🏼‍♂ E4.0 man rowing boat: medium-light skin tone
  [
    '\u{1f6a3}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🚣🏽‍♂️ E4.0 man rowing boat: medium skin tone
  [
    '\u{1f6a3}\u{1f3fd}\u200d\u2642',
  ], // 🚣🏽‍♂ E4.0 man rowing boat: medium skin tone
  [
    '\u{1f6a3}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🚣🏾‍♂️ E4.0 man rowing boat: medium-dark skin tone
  [
    '\u{1f6a3}\u{1f3fe}\u200d\u2642',
  ], // 🚣🏾‍♂ E4.0 man rowing boat: medium-dark skin tone
  [
    '\u{1f6a3}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🚣🏿‍♂️ E4.0 man rowing boat: dark skin tone
  [
    '\u{1f6a3}\u{1f3ff}\u200d\u2642',
  ], // 🚣🏿‍♂ E4.0 man rowing boat: dark skin tone
  [
    '\u{1f6a3}\u200d\u2640\ufe0f',
  ], // 🚣‍♀️ E4.0 woman rowing boat
  [
    '\u{1f6a3}\u200d\u2640',
  ], // 🚣‍♀ E4.0 woman rowing boat
  [
    '\u{1f6a3}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🚣🏻‍♀️ E4.0 woman rowing boat: light skin tone
  [
    '\u{1f6a3}\u{1f3fb}\u200d\u2640',
  ], // 🚣🏻‍♀ E4.0 woman rowing boat: light skin tone
  [
    '\u{1f6a3}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🚣🏼‍♀️ E4.0 woman rowing boat: medium-light skin tone
  [
    '\u{1f6a3}\u{1f3fc}\u200d\u2640',
  ], // 🚣🏼‍♀ E4.0 woman rowing boat: medium-light skin tone
  [
    '\u{1f6a3}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🚣🏽‍♀️ E4.0 woman rowing boat: medium skin tone
  [
    '\u{1f6a3}\u{1f3fd}\u200d\u2640',
  ], // 🚣🏽‍♀ E4.0 woman rowing boat: medium skin tone
  [
    '\u{1f6a3}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🚣🏾‍♀️ E4.0 woman rowing boat: medium-dark skin tone
  [
    '\u{1f6a3}\u{1f3fe}\u200d\u2640',
  ], // 🚣🏾‍♀ E4.0 woman rowing boat: medium-dark skin tone
  [
    '\u{1f6a3}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🚣🏿‍♀️ E4.0 woman rowing boat: dark skin tone
  [
    '\u{1f6a3}\u{1f3ff}\u200d\u2640',
  ], // 🚣🏿‍♀ E4.0 woman rowing boat: dark skin tone
  [
    '\u{1f3ca}',
  ], // 🏊 E0.6 person swimming
  [
    '\u{1f3ca}\u{1f3fb}',
  ], // 🏊🏻 E1.0 person swimming: light skin tone
  [
    '\u{1f3ca}\u{1f3fc}',
  ], // 🏊🏼 E1.0 person swimming: medium-light skin tone
  [
    '\u{1f3ca}\u{1f3fd}',
  ], // 🏊🏽 E1.0 person swimming: medium skin tone
  [
    '\u{1f3ca}\u{1f3fe}',
  ], // 🏊🏾 E1.0 person swimming: medium-dark skin tone
  [
    '\u{1f3ca}\u{1f3ff}',
  ], // 🏊🏿 E1.0 person swimming: dark skin tone
  [
    '\u{1f3ca}\u200d\u2642\ufe0f',
  ], // 🏊‍♂️ E4.0 man swimming
  [
    '\u{1f3ca}\u200d\u2642',
  ], // 🏊‍♂ E4.0 man swimming
  [
    '\u{1f3ca}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🏊🏻‍♂️ E4.0 man swimming: light skin tone
  [
    '\u{1f3ca}\u{1f3fb}\u200d\u2642',
  ], // 🏊🏻‍♂ E4.0 man swimming: light skin tone
  [
    '\u{1f3ca}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🏊🏼‍♂️ E4.0 man swimming: medium-light skin tone
  [
    '\u{1f3ca}\u{1f3fc}\u200d\u2642',
  ], // 🏊🏼‍♂ E4.0 man swimming: medium-light skin tone
  [
    '\u{1f3ca}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🏊🏽‍♂️ E4.0 man swimming: medium skin tone
  [
    '\u{1f3ca}\u{1f3fd}\u200d\u2642',
  ], // 🏊🏽‍♂ E4.0 man swimming: medium skin tone
  [
    '\u{1f3ca}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🏊🏾‍♂️ E4.0 man swimming: medium-dark skin tone
  [
    '\u{1f3ca}\u{1f3fe}\u200d\u2642',
  ], // 🏊🏾‍♂ E4.0 man swimming: medium-dark skin tone
  [
    '\u{1f3ca}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🏊🏿‍♂️ E4.0 man swimming: dark skin tone
  [
    '\u{1f3ca}\u{1f3ff}\u200d\u2642',
  ], // 🏊🏿‍♂ E4.0 man swimming: dark skin tone
  [
    '\u{1f3ca}\u200d\u2640\ufe0f',
  ], // 🏊‍♀️ E4.0 woman swimming
  [
    '\u{1f3ca}\u200d\u2640',
  ], // 🏊‍♀ E4.0 woman swimming
  [
    '\u{1f3ca}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🏊🏻‍♀️ E4.0 woman swimming: light skin tone
  [
    '\u{1f3ca}\u{1f3fb}\u200d\u2640',
  ], // 🏊🏻‍♀ E4.0 woman swimming: light skin tone
  [
    '\u{1f3ca}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🏊🏼‍♀️ E4.0 woman swimming: medium-light skin tone
  [
    '\u{1f3ca}\u{1f3fc}\u200d\u2640',
  ], // 🏊🏼‍♀ E4.0 woman swimming: medium-light skin tone
  [
    '\u{1f3ca}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🏊🏽‍♀️ E4.0 woman swimming: medium skin tone
  [
    '\u{1f3ca}\u{1f3fd}\u200d\u2640',
  ], // 🏊🏽‍♀ E4.0 woman swimming: medium skin tone
  [
    '\u{1f3ca}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🏊🏾‍♀️ E4.0 woman swimming: medium-dark skin tone
  [
    '\u{1f3ca}\u{1f3fe}\u200d\u2640',
  ], // 🏊🏾‍♀ E4.0 woman swimming: medium-dark skin tone
  [
    '\u{1f3ca}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🏊🏿‍♀️ E4.0 woman swimming: dark skin tone
  [
    '\u{1f3ca}\u{1f3ff}\u200d\u2640',
  ], // 🏊🏿‍♀ E4.0 woman swimming: dark skin tone
  [
    '\u26f9\ufe0f',
  ], // ⛹️ E0.7 person bouncing ball
  [
    '\u26f9',
  ], // ⛹ E0.7 person bouncing ball
  [
    '\u26f9\u{1f3fb}',
  ], // ⛹🏻 E2.0 person bouncing ball: light skin tone
  [
    '\u26f9\u{1f3fc}',
  ], // ⛹🏼 E2.0 person bouncing ball: medium-light skin tone
  [
    '\u26f9\u{1f3fd}',
  ], // ⛹🏽 E2.0 person bouncing ball: medium skin tone
  [
    '\u26f9\u{1f3fe}',
  ], // ⛹🏾 E2.0 person bouncing ball: medium-dark skin tone
  [
    '\u26f9\u{1f3ff}',
  ], // ⛹🏿 E2.0 person bouncing ball: dark skin tone
  [
    '\u26f9\ufe0f\u200d\u2642\ufe0f',
  ], // ⛹️‍♂️ E4.0 man bouncing ball
  [
    '\u26f9\u200d\u2642\ufe0f',
  ], // ⛹‍♂️ E4.0 man bouncing ball
  [
    '\u26f9\ufe0f\u200d\u2642',
  ], // ⛹️‍♂ E4.0 man bouncing ball
  [
    '\u26f9\u200d\u2642',
  ], // ⛹‍♂ E4.0 man bouncing ball
  [
    '\u26f9\u{1f3fb}\u200d\u2642\ufe0f',
  ], // ⛹🏻‍♂️ E4.0 man bouncing ball: light skin tone
  [
    '\u26f9\u{1f3fb}\u200d\u2642',
  ], // ⛹🏻‍♂ E4.0 man bouncing ball: light skin tone
  [
    '\u26f9\u{1f3fc}\u200d\u2642\ufe0f',
  ], // ⛹🏼‍♂️ E4.0 man bouncing ball: medium-light skin tone
  [
    '\u26f9\u{1f3fc}\u200d\u2642',
  ], // ⛹🏼‍♂ E4.0 man bouncing ball: medium-light skin tone
  [
    '\u26f9\u{1f3fd}\u200d\u2642\ufe0f',
  ], // ⛹🏽‍♂️ E4.0 man bouncing ball: medium skin tone
  [
    '\u26f9\u{1f3fd}\u200d\u2642',
  ], // ⛹🏽‍♂ E4.0 man bouncing ball: medium skin tone
  [
    '\u26f9\u{1f3fe}\u200d\u2642\ufe0f',
  ], // ⛹🏾‍♂️ E4.0 man bouncing ball: medium-dark skin tone
  [
    '\u26f9\u{1f3fe}\u200d\u2642',
  ], // ⛹🏾‍♂ E4.0 man bouncing ball: medium-dark skin tone
  [
    '\u26f9\u{1f3ff}\u200d\u2642\ufe0f',
  ], // ⛹🏿‍♂️ E4.0 man bouncing ball: dark skin tone
  [
    '\u26f9\u{1f3ff}\u200d\u2642',
  ], // ⛹🏿‍♂ E4.0 man bouncing ball: dark skin tone
  [
    '\u26f9\ufe0f\u200d\u2640\ufe0f',
  ], // ⛹️‍♀️ E4.0 woman bouncing ball
  [
    '\u26f9\u200d\u2640\ufe0f',
  ], // ⛹‍♀️ E4.0 woman bouncing ball
  [
    '\u26f9\ufe0f\u200d\u2640',
  ], // ⛹️‍♀ E4.0 woman bouncing ball
  [
    '\u26f9\u200d\u2640',
  ], // ⛹‍♀ E4.0 woman bouncing ball
  [
    '\u26f9\u{1f3fb}\u200d\u2640\ufe0f',
  ], // ⛹🏻‍♀️ E4.0 woman bouncing ball: light skin tone
  [
    '\u26f9\u{1f3fb}\u200d\u2640',
  ], // ⛹🏻‍♀ E4.0 woman bouncing ball: light skin tone
  [
    '\u26f9\u{1f3fc}\u200d\u2640\ufe0f',
  ], // ⛹🏼‍♀️ E4.0 woman bouncing ball: medium-light skin tone
  [
    '\u26f9\u{1f3fc}\u200d\u2640',
  ], // ⛹🏼‍♀ E4.0 woman bouncing ball: medium-light skin tone
  [
    '\u26f9\u{1f3fd}\u200d\u2640\ufe0f',
  ], // ⛹🏽‍♀️ E4.0 woman bouncing ball: medium skin tone
  [
    '\u26f9\u{1f3fd}\u200d\u2640',
  ], // ⛹🏽‍♀ E4.0 woman bouncing ball: medium skin tone
  [
    '\u26f9\u{1f3fe}\u200d\u2640\ufe0f',
  ], // ⛹🏾‍♀️ E4.0 woman bouncing ball: medium-dark skin tone
  [
    '\u26f9\u{1f3fe}\u200d\u2640',
  ], // ⛹🏾‍♀ E4.0 woman bouncing ball: medium-dark skin tone
  [
    '\u26f9\u{1f3ff}\u200d\u2640\ufe0f',
  ], // ⛹🏿‍♀️ E4.0 woman bouncing ball: dark skin tone
  [
    '\u26f9\u{1f3ff}\u200d\u2640',
  ], // ⛹🏿‍♀ E4.0 woman bouncing ball: dark skin tone
  [
    '\u{1f3cb}\ufe0f',
  ], // 🏋️ E0.7 person lifting weights
  [
    '\u{1f3cb}',
  ], // 🏋 E0.7 person lifting weights
  [
    '\u{1f3cb}\u{1f3fb}',
  ], // 🏋🏻 E2.0 person lifting weights: light skin tone
  [
    '\u{1f3cb}\u{1f3fc}',
  ], // 🏋🏼 E2.0 person lifting weights: medium-light skin tone
  [
    '\u{1f3cb}\u{1f3fd}',
  ], // 🏋🏽 E2.0 person lifting weights: medium skin tone
  [
    '\u{1f3cb}\u{1f3fe}',
  ], // 🏋🏾 E2.0 person lifting weights: medium-dark skin tone
  [
    '\u{1f3cb}\u{1f3ff}',
  ], // 🏋🏿 E2.0 person lifting weights: dark skin tone
  [
    '\u{1f3cb}\ufe0f\u200d\u2642\ufe0f',
  ], // 🏋️‍♂️ E4.0 man lifting weights
  [
    '\u{1f3cb}\u200d\u2642\ufe0f',
  ], // 🏋‍♂️ E4.0 man lifting weights
  [
    '\u{1f3cb}\ufe0f\u200d\u2642',
  ], // 🏋️‍♂ E4.0 man lifting weights
  [
    '\u{1f3cb}\u200d\u2642',
  ], // 🏋‍♂ E4.0 man lifting weights
  [
    '\u{1f3cb}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🏋🏻‍♂️ E4.0 man lifting weights: light skin tone
  [
    '\u{1f3cb}\u{1f3fb}\u200d\u2642',
  ], // 🏋🏻‍♂ E4.0 man lifting weights: light skin tone
  [
    '\u{1f3cb}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🏋🏼‍♂️ E4.0 man lifting weights: medium-light skin tone
  [
    '\u{1f3cb}\u{1f3fc}\u200d\u2642',
  ], // 🏋🏼‍♂ E4.0 man lifting weights: medium-light skin tone
  [
    '\u{1f3cb}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🏋🏽‍♂️ E4.0 man lifting weights: medium skin tone
  [
    '\u{1f3cb}\u{1f3fd}\u200d\u2642',
  ], // 🏋🏽‍♂ E4.0 man lifting weights: medium skin tone
  [
    '\u{1f3cb}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🏋🏾‍♂️ E4.0 man lifting weights: medium-dark skin tone
  [
    '\u{1f3cb}\u{1f3fe}\u200d\u2642',
  ], // 🏋🏾‍♂ E4.0 man lifting weights: medium-dark skin tone
  [
    '\u{1f3cb}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🏋🏿‍♂️ E4.0 man lifting weights: dark skin tone
  [
    '\u{1f3cb}\u{1f3ff}\u200d\u2642',
  ], // 🏋🏿‍♂ E4.0 man lifting weights: dark skin tone
  [
    '\u{1f3cb}\ufe0f\u200d\u2640\ufe0f',
  ], // 🏋️‍♀️ E4.0 woman lifting weights
  [
    '\u{1f3cb}\u200d\u2640\ufe0f',
  ], // 🏋‍♀️ E4.0 woman lifting weights
  [
    '\u{1f3cb}\ufe0f\u200d\u2640',
  ], // 🏋️‍♀ E4.0 woman lifting weights
  [
    '\u{1f3cb}\u200d\u2640',
  ], // 🏋‍♀ E4.0 woman lifting weights
  [
    '\u{1f3cb}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🏋🏻‍♀️ E4.0 woman lifting weights: light skin tone
  [
    '\u{1f3cb}\u{1f3fb}\u200d\u2640',
  ], // 🏋🏻‍♀ E4.0 woman lifting weights: light skin tone
  [
    '\u{1f3cb}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🏋🏼‍♀️ E4.0 woman lifting weights: medium-light skin tone
  [
    '\u{1f3cb}\u{1f3fc}\u200d\u2640',
  ], // 🏋🏼‍♀ E4.0 woman lifting weights: medium-light skin tone
  [
    '\u{1f3cb}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🏋🏽‍♀️ E4.0 woman lifting weights: medium skin tone
  [
    '\u{1f3cb}\u{1f3fd}\u200d\u2640',
  ], // 🏋🏽‍♀ E4.0 woman lifting weights: medium skin tone
  [
    '\u{1f3cb}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🏋🏾‍♀️ E4.0 woman lifting weights: medium-dark skin tone
  [
    '\u{1f3cb}\u{1f3fe}\u200d\u2640',
  ], // 🏋🏾‍♀ E4.0 woman lifting weights: medium-dark skin tone
  [
    '\u{1f3cb}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🏋🏿‍♀️ E4.0 woman lifting weights: dark skin tone
  [
    '\u{1f3cb}\u{1f3ff}\u200d\u2640',
  ], // 🏋🏿‍♀ E4.0 woman lifting weights: dark skin tone
  [
    '\u{1f6b4}',
  ], // 🚴 E1.0 person biking
  [
    '\u{1f6b4}\u{1f3fb}',
  ], // 🚴🏻 E1.0 person biking: light skin tone
  [
    '\u{1f6b4}\u{1f3fc}',
  ], // 🚴🏼 E1.0 person biking: medium-light skin tone
  [
    '\u{1f6b4}\u{1f3fd}',
  ], // 🚴🏽 E1.0 person biking: medium skin tone
  [
    '\u{1f6b4}\u{1f3fe}',
  ], // 🚴🏾 E1.0 person biking: medium-dark skin tone
  [
    '\u{1f6b4}\u{1f3ff}',
  ], // 🚴🏿 E1.0 person biking: dark skin tone
  [
    '\u{1f6b4}\u200d\u2642\ufe0f',
  ], // 🚴‍♂️ E4.0 man biking
  [
    '\u{1f6b4}\u200d\u2642',
  ], // 🚴‍♂ E4.0 man biking
  [
    '\u{1f6b4}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🚴🏻‍♂️ E4.0 man biking: light skin tone
  [
    '\u{1f6b4}\u{1f3fb}\u200d\u2642',
  ], // 🚴🏻‍♂ E4.0 man biking: light skin tone
  [
    '\u{1f6b4}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🚴🏼‍♂️ E4.0 man biking: medium-light skin tone
  [
    '\u{1f6b4}\u{1f3fc}\u200d\u2642',
  ], // 🚴🏼‍♂ E4.0 man biking: medium-light skin tone
  [
    '\u{1f6b4}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🚴🏽‍♂️ E4.0 man biking: medium skin tone
  [
    '\u{1f6b4}\u{1f3fd}\u200d\u2642',
  ], // 🚴🏽‍♂ E4.0 man biking: medium skin tone
  [
    '\u{1f6b4}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🚴🏾‍♂️ E4.0 man biking: medium-dark skin tone
  [
    '\u{1f6b4}\u{1f3fe}\u200d\u2642',
  ], // 🚴🏾‍♂ E4.0 man biking: medium-dark skin tone
  [
    '\u{1f6b4}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🚴🏿‍♂️ E4.0 man biking: dark skin tone
  [
    '\u{1f6b4}\u{1f3ff}\u200d\u2642',
  ], // 🚴🏿‍♂ E4.0 man biking: dark skin tone
  [
    '\u{1f6b4}\u200d\u2640\ufe0f',
  ], // 🚴‍♀️ E4.0 woman biking
  [
    '\u{1f6b4}\u200d\u2640',
  ], // 🚴‍♀ E4.0 woman biking
  [
    '\u{1f6b4}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🚴🏻‍♀️ E4.0 woman biking: light skin tone
  [
    '\u{1f6b4}\u{1f3fb}\u200d\u2640',
  ], // 🚴🏻‍♀ E4.0 woman biking: light skin tone
  [
    '\u{1f6b4}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🚴🏼‍♀️ E4.0 woman biking: medium-light skin tone
  [
    '\u{1f6b4}\u{1f3fc}\u200d\u2640',
  ], // 🚴🏼‍♀ E4.0 woman biking: medium-light skin tone
  [
    '\u{1f6b4}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🚴🏽‍♀️ E4.0 woman biking: medium skin tone
  [
    '\u{1f6b4}\u{1f3fd}\u200d\u2640',
  ], // 🚴🏽‍♀ E4.0 woman biking: medium skin tone
  [
    '\u{1f6b4}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🚴🏾‍♀️ E4.0 woman biking: medium-dark skin tone
  [
    '\u{1f6b4}\u{1f3fe}\u200d\u2640',
  ], // 🚴🏾‍♀ E4.0 woman biking: medium-dark skin tone
  [
    '\u{1f6b4}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🚴🏿‍♀️ E4.0 woman biking: dark skin tone
  [
    '\u{1f6b4}\u{1f3ff}\u200d\u2640',
  ], // 🚴🏿‍♀ E4.0 woman biking: dark skin tone
  [
    '\u{1f6b5}',
  ], // 🚵 E1.0 person mountain biking
  [
    '\u{1f6b5}\u{1f3fb}',
  ], // 🚵🏻 E1.0 person mountain biking: light skin tone
  [
    '\u{1f6b5}\u{1f3fc}',
  ], // 🚵🏼 E1.0 person mountain biking: medium-light skin tone
  [
    '\u{1f6b5}\u{1f3fd}',
  ], // 🚵🏽 E1.0 person mountain biking: medium skin tone
  [
    '\u{1f6b5}\u{1f3fe}',
  ], // 🚵🏾 E1.0 person mountain biking: medium-dark skin tone
  [
    '\u{1f6b5}\u{1f3ff}',
  ], // 🚵🏿 E1.0 person mountain biking: dark skin tone
  [
    '\u{1f6b5}\u200d\u2642\ufe0f',
  ], // 🚵‍♂️ E4.0 man mountain biking
  [
    '\u{1f6b5}\u200d\u2642',
  ], // 🚵‍♂ E4.0 man mountain biking
  [
    '\u{1f6b5}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🚵🏻‍♂️ E4.0 man mountain biking: light skin tone
  [
    '\u{1f6b5}\u{1f3fb}\u200d\u2642',
  ], // 🚵🏻‍♂ E4.0 man mountain biking: light skin tone
  [
    '\u{1f6b5}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🚵🏼‍♂️ E4.0 man mountain biking: medium-light skin tone
  [
    '\u{1f6b5}\u{1f3fc}\u200d\u2642',
  ], // 🚵🏼‍♂ E4.0 man mountain biking: medium-light skin tone
  [
    '\u{1f6b5}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🚵🏽‍♂️ E4.0 man mountain biking: medium skin tone
  [
    '\u{1f6b5}\u{1f3fd}\u200d\u2642',
  ], // 🚵🏽‍♂ E4.0 man mountain biking: medium skin tone
  [
    '\u{1f6b5}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🚵🏾‍♂️ E4.0 man mountain biking: medium-dark skin tone
  [
    '\u{1f6b5}\u{1f3fe}\u200d\u2642',
  ], // 🚵🏾‍♂ E4.0 man mountain biking: medium-dark skin tone
  [
    '\u{1f6b5}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🚵🏿‍♂️ E4.0 man mountain biking: dark skin tone
  [
    '\u{1f6b5}\u{1f3ff}\u200d\u2642',
  ], // 🚵🏿‍♂ E4.0 man mountain biking: dark skin tone
  [
    '\u{1f6b5}\u200d\u2640\ufe0f',
  ], // 🚵‍♀️ E4.0 woman mountain biking
  [
    '\u{1f6b5}\u200d\u2640',
  ], // 🚵‍♀ E4.0 woman mountain biking
  [
    '\u{1f6b5}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🚵🏻‍♀️ E4.0 woman mountain biking: light skin tone
  [
    '\u{1f6b5}\u{1f3fb}\u200d\u2640',
  ], // 🚵🏻‍♀ E4.0 woman mountain biking: light skin tone
  [
    '\u{1f6b5}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🚵🏼‍♀️ E4.0 woman mountain biking: medium-light skin tone
  [
    '\u{1f6b5}\u{1f3fc}\u200d\u2640',
  ], // 🚵🏼‍♀ E4.0 woman mountain biking: medium-light skin tone
  [
    '\u{1f6b5}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🚵🏽‍♀️ E4.0 woman mountain biking: medium skin tone
  [
    '\u{1f6b5}\u{1f3fd}\u200d\u2640',
  ], // 🚵🏽‍♀ E4.0 woman mountain biking: medium skin tone
  [
    '\u{1f6b5}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🚵🏾‍♀️ E4.0 woman mountain biking: medium-dark skin tone
  [
    '\u{1f6b5}\u{1f3fe}\u200d\u2640',
  ], // 🚵🏾‍♀ E4.0 woman mountain biking: medium-dark skin tone
  [
    '\u{1f6b5}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🚵🏿‍♀️ E4.0 woman mountain biking: dark skin tone
  [
    '\u{1f6b5}\u{1f3ff}\u200d\u2640',
  ], // 🚵🏿‍♀ E4.0 woman mountain biking: dark skin tone
  [
    '\u{1f938}',
  ], // 🤸 E3.0 person cartwheeling
  [
    '\u{1f938}\u{1f3fb}',
  ], // 🤸🏻 E3.0 person cartwheeling: light skin tone
  [
    '\u{1f938}\u{1f3fc}',
  ], // 🤸🏼 E3.0 person cartwheeling: medium-light skin tone
  [
    '\u{1f938}\u{1f3fd}',
  ], // 🤸🏽 E3.0 person cartwheeling: medium skin tone
  [
    '\u{1f938}\u{1f3fe}',
  ], // 🤸🏾 E3.0 person cartwheeling: medium-dark skin tone
  [
    '\u{1f938}\u{1f3ff}',
  ], // 🤸🏿 E3.0 person cartwheeling: dark skin tone
  [
    '\u{1f938}\u200d\u2642\ufe0f',
  ], // 🤸‍♂️ E4.0 man cartwheeling
  [
    '\u{1f938}\u200d\u2642',
  ], // 🤸‍♂ E4.0 man cartwheeling
  [
    '\u{1f938}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🤸🏻‍♂️ E4.0 man cartwheeling: light skin tone
  [
    '\u{1f938}\u{1f3fb}\u200d\u2642',
  ], // 🤸🏻‍♂ E4.0 man cartwheeling: light skin tone
  [
    '\u{1f938}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🤸🏼‍♂️ E4.0 man cartwheeling: medium-light skin tone
  [
    '\u{1f938}\u{1f3fc}\u200d\u2642',
  ], // 🤸🏼‍♂ E4.0 man cartwheeling: medium-light skin tone
  [
    '\u{1f938}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🤸🏽‍♂️ E4.0 man cartwheeling: medium skin tone
  [
    '\u{1f938}\u{1f3fd}\u200d\u2642',
  ], // 🤸🏽‍♂ E4.0 man cartwheeling: medium skin tone
  [
    '\u{1f938}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🤸🏾‍♂️ E4.0 man cartwheeling: medium-dark skin tone
  [
    '\u{1f938}\u{1f3fe}\u200d\u2642',
  ], // 🤸🏾‍♂ E4.0 man cartwheeling: medium-dark skin tone
  [
    '\u{1f938}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🤸🏿‍♂️ E4.0 man cartwheeling: dark skin tone
  [
    '\u{1f938}\u{1f3ff}\u200d\u2642',
  ], // 🤸🏿‍♂ E4.0 man cartwheeling: dark skin tone
  [
    '\u{1f938}\u200d\u2640\ufe0f',
  ], // 🤸‍♀️ E4.0 woman cartwheeling
  [
    '\u{1f938}\u200d\u2640',
  ], // 🤸‍♀ E4.0 woman cartwheeling
  [
    '\u{1f938}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🤸🏻‍♀️ E4.0 woman cartwheeling: light skin tone
  [
    '\u{1f938}\u{1f3fb}\u200d\u2640',
  ], // 🤸🏻‍♀ E4.0 woman cartwheeling: light skin tone
  [
    '\u{1f938}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🤸🏼‍♀️ E4.0 woman cartwheeling: medium-light skin tone
  [
    '\u{1f938}\u{1f3fc}\u200d\u2640',
  ], // 🤸🏼‍♀ E4.0 woman cartwheeling: medium-light skin tone
  [
    '\u{1f938}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🤸🏽‍♀️ E4.0 woman cartwheeling: medium skin tone
  [
    '\u{1f938}\u{1f3fd}\u200d\u2640',
  ], // 🤸🏽‍♀ E4.0 woman cartwheeling: medium skin tone
  [
    '\u{1f938}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🤸🏾‍♀️ E4.0 woman cartwheeling: medium-dark skin tone
  [
    '\u{1f938}\u{1f3fe}\u200d\u2640',
  ], // 🤸🏾‍♀ E4.0 woman cartwheeling: medium-dark skin tone
  [
    '\u{1f938}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🤸🏿‍♀️ E4.0 woman cartwheeling: dark skin tone
  [
    '\u{1f938}\u{1f3ff}\u200d\u2640',
  ], // 🤸🏿‍♀ E4.0 woman cartwheeling: dark skin tone
  [
    '\u{1f93c}',
  ], // 🤼 E3.0 people wrestling
  [
    '\u{1f93c}\u200d\u2642\ufe0f',
  ], // 🤼‍♂️ E4.0 men wrestling
  [
    '\u{1f93c}\u200d\u2642',
  ], // 🤼‍♂ E4.0 men wrestling
  [
    '\u{1f93c}\u200d\u2640\ufe0f',
  ], // 🤼‍♀️ E4.0 women wrestling
  [
    '\u{1f93c}\u200d\u2640',
  ], // 🤼‍♀ E4.0 women wrestling
  [
    '\u{1f93d}',
  ], // 🤽 E3.0 person playing water polo
  [
    '\u{1f93d}\u{1f3fb}',
  ], // 🤽🏻 E3.0 person playing water polo: light skin tone
  [
    '\u{1f93d}\u{1f3fc}',
  ], // 🤽🏼 E3.0 person playing water polo: medium-light skin tone
  [
    '\u{1f93d}\u{1f3fd}',
  ], // 🤽🏽 E3.0 person playing water polo: medium skin tone
  [
    '\u{1f93d}\u{1f3fe}',
  ], // 🤽🏾 E3.0 person playing water polo: medium-dark skin tone
  [
    '\u{1f93d}\u{1f3ff}',
  ], // 🤽🏿 E3.0 person playing water polo: dark skin tone
  [
    '\u{1f93d}\u200d\u2642\ufe0f',
  ], // 🤽‍♂️ E4.0 man playing water polo
  [
    '\u{1f93d}\u200d\u2642',
  ], // 🤽‍♂ E4.0 man playing water polo
  [
    '\u{1f93d}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🤽🏻‍♂️ E4.0 man playing water polo: light skin tone
  [
    '\u{1f93d}\u{1f3fb}\u200d\u2642',
  ], // 🤽🏻‍♂ E4.0 man playing water polo: light skin tone
  [
    '\u{1f93d}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🤽🏼‍♂️ E4.0 man playing water polo: medium-light skin tone
  [
    '\u{1f93d}\u{1f3fc}\u200d\u2642',
  ], // 🤽🏼‍♂ E4.0 man playing water polo: medium-light skin tone
  [
    '\u{1f93d}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🤽🏽‍♂️ E4.0 man playing water polo: medium skin tone
  [
    '\u{1f93d}\u{1f3fd}\u200d\u2642',
  ], // 🤽🏽‍♂ E4.0 man playing water polo: medium skin tone
  [
    '\u{1f93d}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🤽🏾‍♂️ E4.0 man playing water polo: medium-dark skin tone
  [
    '\u{1f93d}\u{1f3fe}\u200d\u2642',
  ], // 🤽🏾‍♂ E4.0 man playing water polo: medium-dark skin tone
  [
    '\u{1f93d}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🤽🏿‍♂️ E4.0 man playing water polo: dark skin tone
  [
    '\u{1f93d}\u{1f3ff}\u200d\u2642',
  ], // 🤽🏿‍♂ E4.0 man playing water polo: dark skin tone
  [
    '\u{1f93d}\u200d\u2640\ufe0f',
  ], // 🤽‍♀️ E4.0 woman playing water polo
  [
    '\u{1f93d}\u200d\u2640',
  ], // 🤽‍♀ E4.0 woman playing water polo
  [
    '\u{1f93d}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🤽🏻‍♀️ E4.0 woman playing water polo: light skin tone
  [
    '\u{1f93d}\u{1f3fb}\u200d\u2640',
  ], // 🤽🏻‍♀ E4.0 woman playing water polo: light skin tone
  [
    '\u{1f93d}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🤽🏼‍♀️ E4.0 woman playing water polo: medium-light skin tone
  [
    '\u{1f93d}\u{1f3fc}\u200d\u2640',
  ], // 🤽🏼‍♀ E4.0 woman playing water polo: medium-light skin tone
  [
    '\u{1f93d}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🤽🏽‍♀️ E4.0 woman playing water polo: medium skin tone
  [
    '\u{1f93d}\u{1f3fd}\u200d\u2640',
  ], // 🤽🏽‍♀ E4.0 woman playing water polo: medium skin tone
  [
    '\u{1f93d}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🤽🏾‍♀️ E4.0 woman playing water polo: medium-dark skin tone
  [
    '\u{1f93d}\u{1f3fe}\u200d\u2640',
  ], // 🤽🏾‍♀ E4.0 woman playing water polo: medium-dark skin tone
  [
    '\u{1f93d}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🤽🏿‍♀️ E4.0 woman playing water polo: dark skin tone
  [
    '\u{1f93d}\u{1f3ff}\u200d\u2640',
  ], // 🤽🏿‍♀ E4.0 woman playing water polo: dark skin tone
  [
    '\u{1f93e}',
  ], // 🤾 E3.0 person playing handball
  [
    '\u{1f93e}\u{1f3fb}',
  ], // 🤾🏻 E3.0 person playing handball: light skin tone
  [
    '\u{1f93e}\u{1f3fc}',
  ], // 🤾🏼 E3.0 person playing handball: medium-light skin tone
  [
    '\u{1f93e}\u{1f3fd}',
  ], // 🤾🏽 E3.0 person playing handball: medium skin tone
  [
    '\u{1f93e}\u{1f3fe}',
  ], // 🤾🏾 E3.0 person playing handball: medium-dark skin tone
  [
    '\u{1f93e}\u{1f3ff}',
  ], // 🤾🏿 E3.0 person playing handball: dark skin tone
  [
    '\u{1f93e}\u200d\u2642\ufe0f',
  ], // 🤾‍♂️ E4.0 man playing handball
  [
    '\u{1f93e}\u200d\u2642',
  ], // 🤾‍♂ E4.0 man playing handball
  [
    '\u{1f93e}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🤾🏻‍♂️ E4.0 man playing handball: light skin tone
  [
    '\u{1f93e}\u{1f3fb}\u200d\u2642',
  ], // 🤾🏻‍♂ E4.0 man playing handball: light skin tone
  [
    '\u{1f93e}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🤾🏼‍♂️ E4.0 man playing handball: medium-light skin tone
  [
    '\u{1f93e}\u{1f3fc}\u200d\u2642',
  ], // 🤾🏼‍♂ E4.0 man playing handball: medium-light skin tone
  [
    '\u{1f93e}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🤾🏽‍♂️ E4.0 man playing handball: medium skin tone
  [
    '\u{1f93e}\u{1f3fd}\u200d\u2642',
  ], // 🤾🏽‍♂ E4.0 man playing handball: medium skin tone
  [
    '\u{1f93e}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🤾🏾‍♂️ E4.0 man playing handball: medium-dark skin tone
  [
    '\u{1f93e}\u{1f3fe}\u200d\u2642',
  ], // 🤾🏾‍♂ E4.0 man playing handball: medium-dark skin tone
  [
    '\u{1f93e}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🤾🏿‍♂️ E4.0 man playing handball: dark skin tone
  [
    '\u{1f93e}\u{1f3ff}\u200d\u2642',
  ], // 🤾🏿‍♂ E4.0 man playing handball: dark skin tone
  [
    '\u{1f93e}\u200d\u2640\ufe0f',
  ], // 🤾‍♀️ E4.0 woman playing handball
  [
    '\u{1f93e}\u200d\u2640',
  ], // 🤾‍♀ E4.0 woman playing handball
  [
    '\u{1f93e}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🤾🏻‍♀️ E4.0 woman playing handball: light skin tone
  [
    '\u{1f93e}\u{1f3fb}\u200d\u2640',
  ], // 🤾🏻‍♀ E4.0 woman playing handball: light skin tone
  [
    '\u{1f93e}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🤾🏼‍♀️ E4.0 woman playing handball: medium-light skin tone
  [
    '\u{1f93e}\u{1f3fc}\u200d\u2640',
  ], // 🤾🏼‍♀ E4.0 woman playing handball: medium-light skin tone
  [
    '\u{1f93e}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🤾🏽‍♀️ E4.0 woman playing handball: medium skin tone
  [
    '\u{1f93e}\u{1f3fd}\u200d\u2640',
  ], // 🤾🏽‍♀ E4.0 woman playing handball: medium skin tone
  [
    '\u{1f93e}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🤾🏾‍♀️ E4.0 woman playing handball: medium-dark skin tone
  [
    '\u{1f93e}\u{1f3fe}\u200d\u2640',
  ], // 🤾🏾‍♀ E4.0 woman playing handball: medium-dark skin tone
  [
    '\u{1f93e}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🤾🏿‍♀️ E4.0 woman playing handball: dark skin tone
  [
    '\u{1f93e}\u{1f3ff}\u200d\u2640',
  ], // 🤾🏿‍♀ E4.0 woman playing handball: dark skin tone
  [
    '\u{1f939}',
  ], // 🤹 E3.0 person juggling
  [
    '\u{1f939}\u{1f3fb}',
  ], // 🤹🏻 E3.0 person juggling: light skin tone
  [
    '\u{1f939}\u{1f3fc}',
  ], // 🤹🏼 E3.0 person juggling: medium-light skin tone
  [
    '\u{1f939}\u{1f3fd}',
  ], // 🤹🏽 E3.0 person juggling: medium skin tone
  [
    '\u{1f939}\u{1f3fe}',
  ], // 🤹🏾 E3.0 person juggling: medium-dark skin tone
  [
    '\u{1f939}\u{1f3ff}',
  ], // 🤹🏿 E3.0 person juggling: dark skin tone
  [
    '\u{1f939}\u200d\u2642\ufe0f',
  ], // 🤹‍♂️ E4.0 man juggling
  [
    '\u{1f939}\u200d\u2642',
  ], // 🤹‍♂ E4.0 man juggling
  [
    '\u{1f939}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🤹🏻‍♂️ E4.0 man juggling: light skin tone
  [
    '\u{1f939}\u{1f3fb}\u200d\u2642',
  ], // 🤹🏻‍♂ E4.0 man juggling: light skin tone
  [
    '\u{1f939}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🤹🏼‍♂️ E4.0 man juggling: medium-light skin tone
  [
    '\u{1f939}\u{1f3fc}\u200d\u2642',
  ], // 🤹🏼‍♂ E4.0 man juggling: medium-light skin tone
  [
    '\u{1f939}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🤹🏽‍♂️ E4.0 man juggling: medium skin tone
  [
    '\u{1f939}\u{1f3fd}\u200d\u2642',
  ], // 🤹🏽‍♂ E4.0 man juggling: medium skin tone
  [
    '\u{1f939}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🤹🏾‍♂️ E4.0 man juggling: medium-dark skin tone
  [
    '\u{1f939}\u{1f3fe}\u200d\u2642',
  ], // 🤹🏾‍♂ E4.0 man juggling: medium-dark skin tone
  [
    '\u{1f939}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🤹🏿‍♂️ E4.0 man juggling: dark skin tone
  [
    '\u{1f939}\u{1f3ff}\u200d\u2642',
  ], // 🤹🏿‍♂ E4.0 man juggling: dark skin tone
  [
    '\u{1f939}\u200d\u2640\ufe0f',
  ], // 🤹‍♀️ E4.0 woman juggling
  [
    '\u{1f939}\u200d\u2640',
  ], // 🤹‍♀ E4.0 woman juggling
  [
    '\u{1f939}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🤹🏻‍♀️ E4.0 woman juggling: light skin tone
  [
    '\u{1f939}\u{1f3fb}\u200d\u2640',
  ], // 🤹🏻‍♀ E4.0 woman juggling: light skin tone
  [
    '\u{1f939}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🤹🏼‍♀️ E4.0 woman juggling: medium-light skin tone
  [
    '\u{1f939}\u{1f3fc}\u200d\u2640',
  ], // 🤹🏼‍♀ E4.0 woman juggling: medium-light skin tone
  [
    '\u{1f939}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🤹🏽‍♀️ E4.0 woman juggling: medium skin tone
  [
    '\u{1f939}\u{1f3fd}\u200d\u2640',
  ], // 🤹🏽‍♀ E4.0 woman juggling: medium skin tone
  [
    '\u{1f939}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🤹🏾‍♀️ E4.0 woman juggling: medium-dark skin tone
  [
    '\u{1f939}\u{1f3fe}\u200d\u2640',
  ], // 🤹🏾‍♀ E4.0 woman juggling: medium-dark skin tone
  [
    '\u{1f939}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🤹🏿‍♀️ E4.0 woman juggling: dark skin tone
  [
    '\u{1f939}\u{1f3ff}\u200d\u2640',
  ], // 🤹🏿‍♀ E4.0 woman juggling: dark skin tone
  [
    '\u{1f9d8}',
  ], // 🧘 E5.0 person in lotus position
  [
    '\u{1f9d8}\u{1f3fb}',
  ], // 🧘🏻 E5.0 person in lotus position: light skin tone
  [
    '\u{1f9d8}\u{1f3fc}',
  ], // 🧘🏼 E5.0 person in lotus position: medium-light skin tone
  [
    '\u{1f9d8}\u{1f3fd}',
  ], // 🧘🏽 E5.0 person in lotus position: medium skin tone
  [
    '\u{1f9d8}\u{1f3fe}',
  ], // 🧘🏾 E5.0 person in lotus position: medium-dark skin tone
  [
    '\u{1f9d8}\u{1f3ff}',
  ], // 🧘🏿 E5.0 person in lotus position: dark skin tone
  [
    '\u{1f9d8}\u200d\u2642\ufe0f',
  ], // 🧘‍♂️ E5.0 man in lotus position
  [
    '\u{1f9d8}\u200d\u2642',
  ], // 🧘‍♂ E5.0 man in lotus position
  [
    '\u{1f9d8}\u{1f3fb}\u200d\u2642\ufe0f',
  ], // 🧘🏻‍♂️ E5.0 man in lotus position: light skin tone
  [
    '\u{1f9d8}\u{1f3fb}\u200d\u2642',
  ], // 🧘🏻‍♂ E5.0 man in lotus position: light skin tone
  [
    '\u{1f9d8}\u{1f3fc}\u200d\u2642\ufe0f',
  ], // 🧘🏼‍♂️ E5.0 man in lotus position: medium-light skin tone
  [
    '\u{1f9d8}\u{1f3fc}\u200d\u2642',
  ], // 🧘🏼‍♂ E5.0 man in lotus position: medium-light skin tone
  [
    '\u{1f9d8}\u{1f3fd}\u200d\u2642\ufe0f',
  ], // 🧘🏽‍♂️ E5.0 man in lotus position: medium skin tone
  [
    '\u{1f9d8}\u{1f3fd}\u200d\u2642',
  ], // 🧘🏽‍♂ E5.0 man in lotus position: medium skin tone
  [
    '\u{1f9d8}\u{1f3fe}\u200d\u2642\ufe0f',
  ], // 🧘🏾‍♂️ E5.0 man in lotus position: medium-dark skin tone
  [
    '\u{1f9d8}\u{1f3fe}\u200d\u2642',
  ], // 🧘🏾‍♂ E5.0 man in lotus position: medium-dark skin tone
  [
    '\u{1f9d8}\u{1f3ff}\u200d\u2642\ufe0f',
  ], // 🧘🏿‍♂️ E5.0 man in lotus position: dark skin tone
  [
    '\u{1f9d8}\u{1f3ff}\u200d\u2642',
  ], // 🧘🏿‍♂ E5.0 man in lotus position: dark skin tone
  [
    '\u{1f9d8}\u200d\u2640\ufe0f',
  ], // 🧘‍♀️ E5.0 woman in lotus position
  [
    '\u{1f9d8}\u200d\u2640',
  ], // 🧘‍♀ E5.0 woman in lotus position
  [
    '\u{1f9d8}\u{1f3fb}\u200d\u2640\ufe0f',
  ], // 🧘🏻‍♀️ E5.0 woman in lotus position: light skin tone
  [
    '\u{1f9d8}\u{1f3fb}\u200d\u2640',
  ], // 🧘🏻‍♀ E5.0 woman in lotus position: light skin tone
  [
    '\u{1f9d8}\u{1f3fc}\u200d\u2640\ufe0f',
  ], // 🧘🏼‍♀️ E5.0 woman in lotus position: medium-light skin tone
  [
    '\u{1f9d8}\u{1f3fc}\u200d\u2640',
  ], // 🧘🏼‍♀ E5.0 woman in lotus position: medium-light skin tone
  [
    '\u{1f9d8}\u{1f3fd}\u200d\u2640\ufe0f',
  ], // 🧘🏽‍♀️ E5.0 woman in lotus position: medium skin tone
  [
    '\u{1f9d8}\u{1f3fd}\u200d\u2640',
  ], // 🧘🏽‍♀ E5.0 woman in lotus position: medium skin tone
  [
    '\u{1f9d8}\u{1f3fe}\u200d\u2640\ufe0f',
  ], // 🧘🏾‍♀️ E5.0 woman in lotus position: medium-dark skin tone
  [
    '\u{1f9d8}\u{1f3fe}\u200d\u2640',
  ], // 🧘🏾‍♀ E5.0 woman in lotus position: medium-dark skin tone
  [
    '\u{1f9d8}\u{1f3ff}\u200d\u2640\ufe0f',
  ], // 🧘🏿‍♀️ E5.0 woman in lotus position: dark skin tone
  [
    '\u{1f9d8}\u{1f3ff}\u200d\u2640',
  ], // 🧘🏿‍♀ E5.0 woman in lotus position: dark skin tone
  [
    '\u{1f6c0}',
  ], // 🛀 E0.6 person taking bath
  [
    '\u{1f6c0}\u{1f3fb}',
  ], // 🛀🏻 E1.0 person taking bath: light skin tone
  [
    '\u{1f6c0}\u{1f3fc}',
  ], // 🛀🏼 E1.0 person taking bath: medium-light skin tone
  [
    '\u{1f6c0}\u{1f3fd}',
  ], // 🛀🏽 E1.0 person taking bath: medium skin tone
  [
    '\u{1f6c0}\u{1f3fe}',
  ], // 🛀🏾 E1.0 person taking bath: medium-dark skin tone
  [
    '\u{1f6c0}\u{1f3ff}',
  ], // 🛀🏿 E1.0 person taking bath: dark skin tone
  [
    '\u{1f6cc}',
  ], // 🛌 E1.0 person in bed
  [
    '\u{1f6cc}\u{1f3fb}',
  ], // 🛌🏻 E4.0 person in bed: light skin tone
  [
    '\u{1f6cc}\u{1f3fc}',
  ], // 🛌🏼 E4.0 person in bed: medium-light skin tone
  [
    '\u{1f6cc}\u{1f3fd}',
  ], // 🛌🏽 E4.0 person in bed: medium skin tone
  [
    '\u{1f6cc}\u{1f3fe}',
  ], // 🛌🏾 E4.0 person in bed: medium-dark skin tone
  [
    '\u{1f6cc}\u{1f3ff}',
  ], // 🛌🏿 E4.0 person in bed: dark skin tone
  [
    '\u{1f9d1}\u200d\u{1f91d}\u200d\u{1f9d1}',
  ], // 🧑‍🤝‍🧑 E12.0 people holding hands
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3fb}',
  ], // 🧑🏻‍🤝‍🧑🏻 E12.0 people holding hands: light skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3fc}',
  ], // 🧑🏻‍🤝‍🧑🏼 E12.1 people holding hands: light skin tone, medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3fd}',
  ], // 🧑🏻‍🤝‍🧑🏽 E12.1 people holding hands: light skin tone, medium skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3fe}',
  ], // 🧑🏻‍🤝‍🧑🏾 E12.1 people holding hands: light skin tone, medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3ff}',
  ], // 🧑🏻‍🤝‍🧑🏿 E12.1 people holding hands: light skin tone, dark skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3fb}',
  ], // 🧑🏼‍🤝‍🧑🏻 E12.0 people holding hands: medium-light skin tone, light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3fc}',
  ], // 🧑🏼‍🤝‍🧑🏼 E12.0 people holding hands: medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3fd}',
  ], // 🧑🏼‍🤝‍🧑🏽 E12.1 people holding hands: medium-light skin tone, medium skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3fe}',
  ], // 🧑🏼‍🤝‍🧑🏾 E12.1 people holding hands: medium-light skin tone, medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3ff}',
  ], // 🧑🏼‍🤝‍🧑🏿 E12.1 people holding hands: medium-light skin tone, dark skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3fb}',
  ], // 🧑🏽‍🤝‍🧑🏻 E12.0 people holding hands: medium skin tone, light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3fc}',
  ], // 🧑🏽‍🤝‍🧑🏼 E12.0 people holding hands: medium skin tone, medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3fd}',
  ], // 🧑🏽‍🤝‍🧑🏽 E12.0 people holding hands: medium skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3fe}',
  ], // 🧑🏽‍🤝‍🧑🏾 E12.1 people holding hands: medium skin tone, medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3ff}',
  ], // 🧑🏽‍🤝‍🧑🏿 E12.1 people holding hands: medium skin tone, dark skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3fb}',
  ], // 🧑🏾‍🤝‍🧑🏻 E12.0 people holding hands: medium-dark skin tone, light skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3fc}',
  ], // 🧑🏾‍🤝‍🧑🏼 E12.0 people holding hands: medium-dark skin tone, medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3fd}',
  ], // 🧑🏾‍🤝‍🧑🏽 E12.0 people holding hands: medium-dark skin tone, medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3fe}',
  ], // 🧑🏾‍🤝‍🧑🏾 E12.0 people holding hands: medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3ff}',
  ], // 🧑🏾‍🤝‍🧑🏿 E12.1 people holding hands: medium-dark skin tone, dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3fb}',
  ], // 🧑🏿‍🤝‍🧑🏻 E12.0 people holding hands: dark skin tone, light skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3fc}',
  ], // 🧑🏿‍🤝‍🧑🏼 E12.0 people holding hands: dark skin tone, medium-light skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3fd}',
  ], // 🧑🏿‍🤝‍🧑🏽 E12.0 people holding hands: dark skin tone, medium skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3fe}',
  ], // 🧑🏿‍🤝‍🧑🏾 E12.0 people holding hands: dark skin tone, medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u{1f91d}\u200d\u{1f9d1}\u{1f3ff}',
  ], // 🧑🏿‍🤝‍🧑🏿 E12.0 people holding hands: dark skin tone
  [
    '\u{1f46d}',
  ], // 👭 E1.0 women holding hands
  [
    '\u{1f46d}\u{1f3fb}',
  ], // 👭🏻 E12.0 women holding hands: light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f91d}\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏻‍🤝‍👩🏼 E12.1 women holding hands: light skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f91d}\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏻‍🤝‍👩🏽 E12.1 women holding hands: light skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f91d}\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏻‍🤝‍👩🏾 E12.1 women holding hands: light skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f91d}\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏻‍🤝‍👩🏿 E12.1 women holding hands: light skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f91d}\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏼‍🤝‍👩🏻 E12.0 women holding hands: medium-light skin tone, light skin tone
  [
    '\u{1f46d}\u{1f3fc}',
  ], // 👭🏼 E12.0 women holding hands: medium-light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f91d}\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏼‍🤝‍👩🏽 E12.1 women holding hands: medium-light skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f91d}\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏼‍🤝‍👩🏾 E12.1 women holding hands: medium-light skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f91d}\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏼‍🤝‍👩🏿 E12.1 women holding hands: medium-light skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f91d}\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏽‍🤝‍👩🏻 E12.0 women holding hands: medium skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f91d}\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏽‍🤝‍👩🏼 E12.0 women holding hands: medium skin tone, medium-light skin tone
  [
    '\u{1f46d}\u{1f3fd}',
  ], // 👭🏽 E12.0 women holding hands: medium skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f91d}\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏽‍🤝‍👩🏾 E12.1 women holding hands: medium skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f91d}\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏽‍🤝‍👩🏿 E12.1 women holding hands: medium skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f91d}\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏾‍🤝‍👩🏻 E12.0 women holding hands: medium-dark skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f91d}\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏾‍🤝‍👩🏼 E12.0 women holding hands: medium-dark skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f91d}\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏾‍🤝‍👩🏽 E12.0 women holding hands: medium-dark skin tone, medium skin tone
  [
    '\u{1f46d}\u{1f3fe}',
  ], // 👭🏾 E12.0 women holding hands: medium-dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f91d}\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏾‍🤝‍👩🏿 E12.1 women holding hands: medium-dark skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f91d}\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏿‍🤝‍👩🏻 E12.0 women holding hands: dark skin tone, light skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f91d}\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏿‍🤝‍👩🏼 E12.0 women holding hands: dark skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f91d}\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏿‍🤝‍👩🏽 E12.0 women holding hands: dark skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f91d}\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏿‍🤝‍👩🏾 E12.0 women holding hands: dark skin tone, medium-dark skin tone
  [
    '\u{1f46d}\u{1f3ff}',
  ], // 👭🏿 E12.0 women holding hands: dark skin tone
  [
    '\u{1f46b}',
  ], // 👫 E0.6 woman and man holding hands
  [
    '\u{1f46b}\u{1f3fb}',
  ], // 👫🏻 E12.0 woman and man holding hands: light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏻‍🤝‍👨🏼 E12.0 woman and man holding hands: light skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏻‍🤝‍👨🏽 E12.0 woman and man holding hands: light skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏻‍🤝‍👨🏾 E12.0 woman and man holding hands: light skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏻‍🤝‍👨🏿 E12.0 woman and man holding hands: light skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏼‍🤝‍👨🏻 E12.0 woman and man holding hands: medium-light skin tone, light skin tone
  [
    '\u{1f46b}\u{1f3fc}',
  ], // 👫🏼 E12.0 woman and man holding hands: medium-light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏼‍🤝‍👨🏽 E12.0 woman and man holding hands: medium-light skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏼‍🤝‍👨🏾 E12.0 woman and man holding hands: medium-light skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏼‍🤝‍👨🏿 E12.0 woman and man holding hands: medium-light skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏽‍🤝‍👨🏻 E12.0 woman and man holding hands: medium skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏽‍🤝‍👨🏼 E12.0 woman and man holding hands: medium skin tone, medium-light skin tone
  [
    '\u{1f46b}\u{1f3fd}',
  ], // 👫🏽 E12.0 woman and man holding hands: medium skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏽‍🤝‍👨🏾 E12.0 woman and man holding hands: medium skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏽‍🤝‍👨🏿 E12.0 woman and man holding hands: medium skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏾‍🤝‍👨🏻 E12.0 woman and man holding hands: medium-dark skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏾‍🤝‍👨🏼 E12.0 woman and man holding hands: medium-dark skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏾‍🤝‍👨🏽 E12.0 woman and man holding hands: medium-dark skin tone, medium skin tone
  [
    '\u{1f46b}\u{1f3fe}',
  ], // 👫🏾 E12.0 woman and man holding hands: medium-dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏾‍🤝‍👨🏿 E12.0 woman and man holding hands: medium-dark skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏿‍🤝‍👨🏻 E12.0 woman and man holding hands: dark skin tone, light skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏿‍🤝‍👨🏼 E12.0 woman and man holding hands: dark skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏿‍🤝‍👨🏽 E12.0 woman and man holding hands: dark skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏿‍🤝‍👨🏾 E12.0 woman and man holding hands: dark skin tone, medium-dark skin tone
  [
    '\u{1f46b}\u{1f3ff}',
  ], // 👫🏿 E12.0 woman and man holding hands: dark skin tone
  [
    '\u{1f46c}',
  ], // 👬 E1.0 men holding hands
  [
    '\u{1f46c}\u{1f3fb}',
  ], // 👬🏻 E12.0 men holding hands: light skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏻‍🤝‍👨🏼 E12.1 men holding hands: light skin tone, medium-light skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏻‍🤝‍👨🏽 E12.1 men holding hands: light skin tone, medium skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏻‍🤝‍👨🏾 E12.1 men holding hands: light skin tone, medium-dark skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏻‍🤝‍👨🏿 E12.1 men holding hands: light skin tone, dark skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏼‍🤝‍👨🏻 E12.0 men holding hands: medium-light skin tone, light skin tone
  [
    '\u{1f46c}\u{1f3fc}',
  ], // 👬🏼 E12.0 men holding hands: medium-light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏼‍🤝‍👨🏽 E12.1 men holding hands: medium-light skin tone, medium skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏼‍🤝‍👨🏾 E12.1 men holding hands: medium-light skin tone, medium-dark skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏼‍🤝‍👨🏿 E12.1 men holding hands: medium-light skin tone, dark skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏽‍🤝‍👨🏻 E12.0 men holding hands: medium skin tone, light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏽‍🤝‍👨🏼 E12.0 men holding hands: medium skin tone, medium-light skin tone
  [
    '\u{1f46c}\u{1f3fd}',
  ], // 👬🏽 E12.0 men holding hands: medium skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏽‍🤝‍👨🏾 E12.1 men holding hands: medium skin tone, medium-dark skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏽‍🤝‍👨🏿 E12.1 men holding hands: medium skin tone, dark skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏾‍🤝‍👨🏻 E12.0 men holding hands: medium-dark skin tone, light skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏾‍🤝‍👨🏼 E12.0 men holding hands: medium-dark skin tone, medium-light skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏾‍🤝‍👨🏽 E12.0 men holding hands: medium-dark skin tone, medium skin tone
  [
    '\u{1f46c}\u{1f3fe}',
  ], // 👬🏾 E12.0 men holding hands: medium-dark skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏾‍🤝‍👨🏿 E12.1 men holding hands: medium-dark skin tone, dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏿‍🤝‍👨🏻 E12.0 men holding hands: dark skin tone, light skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏿‍🤝‍👨🏼 E12.0 men holding hands: dark skin tone, medium-light skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏿‍🤝‍👨🏽 E12.0 men holding hands: dark skin tone, medium skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u{1f91d}\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏿‍🤝‍👨🏾 E12.0 men holding hands: dark skin tone, medium-dark skin tone
  [
    '\u{1f46c}\u{1f3ff}',
  ], // 👬🏿 E12.0 men holding hands: dark skin tone
  [
    '\u{1f48f}',
  ], // 💏 E0.6 kiss
  [
    '\u{1f48f}\u{1f3fb}',
  ], // 💏🏻 E13.1 kiss: light skin tone
  [
    '\u{1f48f}\u{1f3fc}',
  ], // 💏🏼 E13.1 kiss: medium-light skin tone
  [
    '\u{1f48f}\u{1f3fd}',
  ], // 💏🏽 E13.1 kiss: medium skin tone
  [
    '\u{1f48f}\u{1f3fe}',
  ], // 💏🏾 E13.1 kiss: medium-dark skin tone
  [
    '\u{1f48f}\u{1f3ff}',
  ], // 💏🏿 E13.1 kiss: dark skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fc}',
  ], // 🧑🏻‍❤️‍💋‍🧑🏼 E13.1 kiss: person, person, light skin tone, medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fc}',
  ], // 🧑🏻‍❤‍💋‍🧑🏼 E13.1 kiss: person, person, light skin tone, medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fd}',
  ], // 🧑🏻‍❤️‍💋‍🧑🏽 E13.1 kiss: person, person, light skin tone, medium skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fd}',
  ], // 🧑🏻‍❤‍💋‍🧑🏽 E13.1 kiss: person, person, light skin tone, medium skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fe}',
  ], // 🧑🏻‍❤️‍💋‍🧑🏾 E13.1 kiss: person, person, light skin tone, medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fe}',
  ], // 🧑🏻‍❤‍💋‍🧑🏾 E13.1 kiss: person, person, light skin tone, medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3ff}',
  ], // 🧑🏻‍❤️‍💋‍🧑🏿 E13.1 kiss: person, person, light skin tone, dark skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3ff}',
  ], // 🧑🏻‍❤‍💋‍🧑🏿 E13.1 kiss: person, person, light skin tone, dark skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fb}',
  ], // 🧑🏼‍❤️‍💋‍🧑🏻 E13.1 kiss: person, person, medium-light skin tone, light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fb}',
  ], // 🧑🏼‍❤‍💋‍🧑🏻 E13.1 kiss: person, person, medium-light skin tone, light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fd}',
  ], // 🧑🏼‍❤️‍💋‍🧑🏽 E13.1 kiss: person, person, medium-light skin tone, medium skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fd}',
  ], // 🧑🏼‍❤‍💋‍🧑🏽 E13.1 kiss: person, person, medium-light skin tone, medium skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fe}',
  ], // 🧑🏼‍❤️‍💋‍🧑🏾 E13.1 kiss: person, person, medium-light skin tone, medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fe}',
  ], // 🧑🏼‍❤‍💋‍🧑🏾 E13.1 kiss: person, person, medium-light skin tone, medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3ff}',
  ], // 🧑🏼‍❤️‍💋‍🧑🏿 E13.1 kiss: person, person, medium-light skin tone, dark skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3ff}',
  ], // 🧑🏼‍❤‍💋‍🧑🏿 E13.1 kiss: person, person, medium-light skin tone, dark skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fb}',
  ], // 🧑🏽‍❤️‍💋‍🧑🏻 E13.1 kiss: person, person, medium skin tone, light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fb}',
  ], // 🧑🏽‍❤‍💋‍🧑🏻 E13.1 kiss: person, person, medium skin tone, light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fc}',
  ], // 🧑🏽‍❤️‍💋‍🧑🏼 E13.1 kiss: person, person, medium skin tone, medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fc}',
  ], // 🧑🏽‍❤‍💋‍🧑🏼 E13.1 kiss: person, person, medium skin tone, medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fe}',
  ], // 🧑🏽‍❤️‍💋‍🧑🏾 E13.1 kiss: person, person, medium skin tone, medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fe}',
  ], // 🧑🏽‍❤‍💋‍🧑🏾 E13.1 kiss: person, person, medium skin tone, medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3ff}',
  ], // 🧑🏽‍❤️‍💋‍🧑🏿 E13.1 kiss: person, person, medium skin tone, dark skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3ff}',
  ], // 🧑🏽‍❤‍💋‍🧑🏿 E13.1 kiss: person, person, medium skin tone, dark skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fb}',
  ], // 🧑🏾‍❤️‍💋‍🧑🏻 E13.1 kiss: person, person, medium-dark skin tone, light skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fb}',
  ], // 🧑🏾‍❤‍💋‍🧑🏻 E13.1 kiss: person, person, medium-dark skin tone, light skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fc}',
  ], // 🧑🏾‍❤️‍💋‍🧑🏼 E13.1 kiss: person, person, medium-dark skin tone, medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fc}',
  ], // 🧑🏾‍❤‍💋‍🧑🏼 E13.1 kiss: person, person, medium-dark skin tone, medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fd}',
  ], // 🧑🏾‍❤️‍💋‍🧑🏽 E13.1 kiss: person, person, medium-dark skin tone, medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fd}',
  ], // 🧑🏾‍❤‍💋‍🧑🏽 E13.1 kiss: person, person, medium-dark skin tone, medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3ff}',
  ], // 🧑🏾‍❤️‍💋‍🧑🏿 E13.1 kiss: person, person, medium-dark skin tone, dark skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3ff}',
  ], // 🧑🏾‍❤‍💋‍🧑🏿 E13.1 kiss: person, person, medium-dark skin tone, dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fb}',
  ], // 🧑🏿‍❤️‍💋‍🧑🏻 E13.1 kiss: person, person, dark skin tone, light skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fb}',
  ], // 🧑🏿‍❤‍💋‍🧑🏻 E13.1 kiss: person, person, dark skin tone, light skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fc}',
  ], // 🧑🏿‍❤️‍💋‍🧑🏼 E13.1 kiss: person, person, dark skin tone, medium-light skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fc}',
  ], // 🧑🏿‍❤‍💋‍🧑🏼 E13.1 kiss: person, person, dark skin tone, medium-light skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fd}',
  ], // 🧑🏿‍❤️‍💋‍🧑🏽 E13.1 kiss: person, person, dark skin tone, medium skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fd}',
  ], // 🧑🏿‍❤‍💋‍🧑🏽 E13.1 kiss: person, person, dark skin tone, medium skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fe}',
  ], // 🧑🏿‍❤️‍💋‍🧑🏾 E13.1 kiss: person, person, dark skin tone, medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f9d1}\u{1f3fe}',
  ], // 🧑🏿‍❤‍💋‍🧑🏾 E13.1 kiss: person, person, dark skin tone, medium-dark skin tone
  [
    '\u{1f469}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}',
  ], // 👩‍❤️‍💋‍👨 E2.0 kiss: woman, man
  [
    '\u{1f469}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}',
  ], // 👩‍❤‍💋‍👨 E2.0 kiss: woman, man
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏻‍❤️‍💋‍👨🏻 E13.1 kiss: woman, man, light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏻‍❤‍💋‍👨🏻 E13.1 kiss: woman, man, light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏻‍❤️‍💋‍👨🏼 E13.1 kiss: woman, man, light skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏻‍❤‍💋‍👨🏼 E13.1 kiss: woman, man, light skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏻‍❤️‍💋‍👨🏽 E13.1 kiss: woman, man, light skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏻‍❤‍💋‍👨🏽 E13.1 kiss: woman, man, light skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏻‍❤️‍💋‍👨🏾 E13.1 kiss: woman, man, light skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏻‍❤‍💋‍👨🏾 E13.1 kiss: woman, man, light skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏻‍❤️‍💋‍👨🏿 E13.1 kiss: woman, man, light skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏻‍❤‍💋‍👨🏿 E13.1 kiss: woman, man, light skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏼‍❤️‍💋‍👨🏻 E13.1 kiss: woman, man, medium-light skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏼‍❤‍💋‍👨🏻 E13.1 kiss: woman, man, medium-light skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏼‍❤️‍💋‍👨🏼 E13.1 kiss: woman, man, medium-light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏼‍❤‍💋‍👨🏼 E13.1 kiss: woman, man, medium-light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏼‍❤️‍💋‍👨🏽 E13.1 kiss: woman, man, medium-light skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏼‍❤‍💋‍👨🏽 E13.1 kiss: woman, man, medium-light skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏼‍❤️‍💋‍👨🏾 E13.1 kiss: woman, man, medium-light skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏼‍❤‍💋‍👨🏾 E13.1 kiss: woman, man, medium-light skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏼‍❤️‍💋‍👨🏿 E13.1 kiss: woman, man, medium-light skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏼‍❤‍💋‍👨🏿 E13.1 kiss: woman, man, medium-light skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏽‍❤️‍💋‍👨🏻 E13.1 kiss: woman, man, medium skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏽‍❤‍💋‍👨🏻 E13.1 kiss: woman, man, medium skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏽‍❤️‍💋‍👨🏼 E13.1 kiss: woman, man, medium skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏽‍❤‍💋‍👨🏼 E13.1 kiss: woman, man, medium skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏽‍❤️‍💋‍👨🏽 E13.1 kiss: woman, man, medium skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏽‍❤‍💋‍👨🏽 E13.1 kiss: woman, man, medium skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏽‍❤️‍💋‍👨🏾 E13.1 kiss: woman, man, medium skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏽‍❤‍💋‍👨🏾 E13.1 kiss: woman, man, medium skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏽‍❤️‍💋‍👨🏿 E13.1 kiss: woman, man, medium skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏽‍❤‍💋‍👨🏿 E13.1 kiss: woman, man, medium skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏾‍❤️‍💋‍👨🏻 E13.1 kiss: woman, man, medium-dark skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏾‍❤‍💋‍👨🏻 E13.1 kiss: woman, man, medium-dark skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏾‍❤️‍💋‍👨🏼 E13.1 kiss: woman, man, medium-dark skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏾‍❤‍💋‍👨🏼 E13.1 kiss: woman, man, medium-dark skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏾‍❤️‍💋‍👨🏽 E13.1 kiss: woman, man, medium-dark skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏾‍❤‍💋‍👨🏽 E13.1 kiss: woman, man, medium-dark skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏾‍❤️‍💋‍👨🏾 E13.1 kiss: woman, man, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏾‍❤‍💋‍👨🏾 E13.1 kiss: woman, man, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏾‍❤️‍💋‍👨🏿 E13.1 kiss: woman, man, medium-dark skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏾‍❤‍💋‍👨🏿 E13.1 kiss: woman, man, medium-dark skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏿‍❤️‍💋‍👨🏻 E13.1 kiss: woman, man, dark skin tone, light skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏿‍❤‍💋‍👨🏻 E13.1 kiss: woman, man, dark skin tone, light skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏿‍❤️‍💋‍👨🏼 E13.1 kiss: woman, man, dark skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏿‍❤‍💋‍👨🏼 E13.1 kiss: woman, man, dark skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏿‍❤️‍💋‍👨🏽 E13.1 kiss: woman, man, dark skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏿‍❤‍💋‍👨🏽 E13.1 kiss: woman, man, dark skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏿‍❤️‍💋‍👨🏾 E13.1 kiss: woman, man, dark skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏿‍❤‍💋‍👨🏾 E13.1 kiss: woman, man, dark skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏿‍❤️‍💋‍👨🏿 E13.1 kiss: woman, man, dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏿‍❤‍💋‍👨🏿 E13.1 kiss: woman, man, dark skin tone
  [
    '\u{1f468}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}',
  ], // 👨‍❤️‍💋‍👨 E2.0 kiss: man, man
  [
    '\u{1f468}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}',
  ], // 👨‍❤‍💋‍👨 E2.0 kiss: man, man
  [
    '\u{1f468}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏻‍❤️‍💋‍👨🏻 E13.1 kiss: man, man, light skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏻‍❤‍💋‍👨🏻 E13.1 kiss: man, man, light skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏻‍❤️‍💋‍👨🏼 E13.1 kiss: man, man, light skin tone, medium-light skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏻‍❤‍💋‍👨🏼 E13.1 kiss: man, man, light skin tone, medium-light skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏻‍❤️‍💋‍👨🏽 E13.1 kiss: man, man, light skin tone, medium skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏻‍❤‍💋‍👨🏽 E13.1 kiss: man, man, light skin tone, medium skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏻‍❤️‍💋‍👨🏾 E13.1 kiss: man, man, light skin tone, medium-dark skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏻‍❤‍💋‍👨🏾 E13.1 kiss: man, man, light skin tone, medium-dark skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏻‍❤️‍💋‍👨🏿 E13.1 kiss: man, man, light skin tone, dark skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏻‍❤‍💋‍👨🏿 E13.1 kiss: man, man, light skin tone, dark skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏼‍❤️‍💋‍👨🏻 E13.1 kiss: man, man, medium-light skin tone, light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏼‍❤‍💋‍👨🏻 E13.1 kiss: man, man, medium-light skin tone, light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏼‍❤️‍💋‍👨🏼 E13.1 kiss: man, man, medium-light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏼‍❤‍💋‍👨🏼 E13.1 kiss: man, man, medium-light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏼‍❤️‍💋‍👨🏽 E13.1 kiss: man, man, medium-light skin tone, medium skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏼‍❤‍💋‍👨🏽 E13.1 kiss: man, man, medium-light skin tone, medium skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏼‍❤️‍💋‍👨🏾 E13.1 kiss: man, man, medium-light skin tone, medium-dark skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏼‍❤‍💋‍👨🏾 E13.1 kiss: man, man, medium-light skin tone, medium-dark skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏼‍❤️‍💋‍👨🏿 E13.1 kiss: man, man, medium-light skin tone, dark skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏼‍❤‍💋‍👨🏿 E13.1 kiss: man, man, medium-light skin tone, dark skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏽‍❤️‍💋‍👨🏻 E13.1 kiss: man, man, medium skin tone, light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏽‍❤‍💋‍👨🏻 E13.1 kiss: man, man, medium skin tone, light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏽‍❤️‍💋‍👨🏼 E13.1 kiss: man, man, medium skin tone, medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏽‍❤‍💋‍👨🏼 E13.1 kiss: man, man, medium skin tone, medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏽‍❤️‍💋‍👨🏽 E13.1 kiss: man, man, medium skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏽‍❤‍💋‍👨🏽 E13.1 kiss: man, man, medium skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏽‍❤️‍💋‍👨🏾 E13.1 kiss: man, man, medium skin tone, medium-dark skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏽‍❤‍💋‍👨🏾 E13.1 kiss: man, man, medium skin tone, medium-dark skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏽‍❤️‍💋‍👨🏿 E13.1 kiss: man, man, medium skin tone, dark skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏽‍❤‍💋‍👨🏿 E13.1 kiss: man, man, medium skin tone, dark skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏾‍❤️‍💋‍👨🏻 E13.1 kiss: man, man, medium-dark skin tone, light skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏾‍❤‍💋‍👨🏻 E13.1 kiss: man, man, medium-dark skin tone, light skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏾‍❤️‍💋‍👨🏼 E13.1 kiss: man, man, medium-dark skin tone, medium-light skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏾‍❤‍💋‍👨🏼 E13.1 kiss: man, man, medium-dark skin tone, medium-light skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏾‍❤️‍💋‍👨🏽 E13.1 kiss: man, man, medium-dark skin tone, medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏾‍❤‍💋‍👨🏽 E13.1 kiss: man, man, medium-dark skin tone, medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏾‍❤️‍💋‍👨🏾 E13.1 kiss: man, man, medium-dark skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏾‍❤‍💋‍👨🏾 E13.1 kiss: man, man, medium-dark skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏾‍❤️‍💋‍👨🏿 E13.1 kiss: man, man, medium-dark skin tone, dark skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏾‍❤‍💋‍👨🏿 E13.1 kiss: man, man, medium-dark skin tone, dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏿‍❤️‍💋‍👨🏻 E13.1 kiss: man, man, dark skin tone, light skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏿‍❤‍💋‍👨🏻 E13.1 kiss: man, man, dark skin tone, light skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏿‍❤️‍💋‍👨🏼 E13.1 kiss: man, man, dark skin tone, medium-light skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏿‍❤‍💋‍👨🏼 E13.1 kiss: man, man, dark skin tone, medium-light skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏿‍❤️‍💋‍👨🏽 E13.1 kiss: man, man, dark skin tone, medium skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏿‍❤‍💋‍👨🏽 E13.1 kiss: man, man, dark skin tone, medium skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏿‍❤️‍💋‍👨🏾 E13.1 kiss: man, man, dark skin tone, medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏿‍❤‍💋‍👨🏾 E13.1 kiss: man, man, dark skin tone, medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏿‍❤️‍💋‍👨🏿 E13.1 kiss: man, man, dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏿‍❤‍💋‍👨🏿 E13.1 kiss: man, man, dark skin tone
  [
    '\u{1f469}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}',
  ], // 👩‍❤️‍💋‍👩 E2.0 kiss: woman, woman
  [
    '\u{1f469}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}',
  ], // 👩‍❤‍💋‍👩 E2.0 kiss: woman, woman
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏻‍❤️‍💋‍👩🏻 E13.1 kiss: woman, woman, light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏻‍❤‍💋‍👩🏻 E13.1 kiss: woman, woman, light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏻‍❤️‍💋‍👩🏼 E13.1 kiss: woman, woman, light skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏻‍❤‍💋‍👩🏼 E13.1 kiss: woman, woman, light skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏻‍❤️‍💋‍👩🏽 E13.1 kiss: woman, woman, light skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏻‍❤‍💋‍👩🏽 E13.1 kiss: woman, woman, light skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏻‍❤️‍💋‍👩🏾 E13.1 kiss: woman, woman, light skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏻‍❤‍💋‍👩🏾 E13.1 kiss: woman, woman, light skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏻‍❤️‍💋‍👩🏿 E13.1 kiss: woman, woman, light skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏻‍❤‍💋‍👩🏿 E13.1 kiss: woman, woman, light skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏼‍❤️‍💋‍👩🏻 E13.1 kiss: woman, woman, medium-light skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏼‍❤‍💋‍👩🏻 E13.1 kiss: woman, woman, medium-light skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏼‍❤️‍💋‍👩🏼 E13.1 kiss: woman, woman, medium-light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏼‍❤‍💋‍👩🏼 E13.1 kiss: woman, woman, medium-light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏼‍❤️‍💋‍👩🏽 E13.1 kiss: woman, woman, medium-light skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏼‍❤‍💋‍👩🏽 E13.1 kiss: woman, woman, medium-light skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏼‍❤️‍💋‍👩🏾 E13.1 kiss: woman, woman, medium-light skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏼‍❤‍💋‍👩🏾 E13.1 kiss: woman, woman, medium-light skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏼‍❤️‍💋‍👩🏿 E13.1 kiss: woman, woman, medium-light skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏼‍❤‍💋‍👩🏿 E13.1 kiss: woman, woman, medium-light skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏽‍❤️‍💋‍👩🏻 E13.1 kiss: woman, woman, medium skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏽‍❤‍💋‍👩🏻 E13.1 kiss: woman, woman, medium skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏽‍❤️‍💋‍👩🏼 E13.1 kiss: woman, woman, medium skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏽‍❤‍💋‍👩🏼 E13.1 kiss: woman, woman, medium skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏽‍❤️‍💋‍👩🏽 E13.1 kiss: woman, woman, medium skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏽‍❤‍💋‍👩🏽 E13.1 kiss: woman, woman, medium skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏽‍❤️‍💋‍👩🏾 E13.1 kiss: woman, woman, medium skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏽‍❤‍💋‍👩🏾 E13.1 kiss: woman, woman, medium skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏽‍❤️‍💋‍👩🏿 E13.1 kiss: woman, woman, medium skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏽‍❤‍💋‍👩🏿 E13.1 kiss: woman, woman, medium skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏾‍❤️‍💋‍👩🏻 E13.1 kiss: woman, woman, medium-dark skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏾‍❤‍💋‍👩🏻 E13.1 kiss: woman, woman, medium-dark skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏾‍❤️‍💋‍👩🏼 E13.1 kiss: woman, woman, medium-dark skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏾‍❤‍💋‍👩🏼 E13.1 kiss: woman, woman, medium-dark skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏾‍❤️‍💋‍👩🏽 E13.1 kiss: woman, woman, medium-dark skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏾‍❤‍💋‍👩🏽 E13.1 kiss: woman, woman, medium-dark skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏾‍❤️‍💋‍👩🏾 E13.1 kiss: woman, woman, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏾‍❤‍💋‍👩🏾 E13.1 kiss: woman, woman, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏾‍❤️‍💋‍👩🏿 E13.1 kiss: woman, woman, medium-dark skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏾‍❤‍💋‍👩🏿 E13.1 kiss: woman, woman, medium-dark skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏿‍❤️‍💋‍👩🏻 E13.1 kiss: woman, woman, dark skin tone, light skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏿‍❤‍💋‍👩🏻 E13.1 kiss: woman, woman, dark skin tone, light skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏿‍❤️‍💋‍👩🏼 E13.1 kiss: woman, woman, dark skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏿‍❤‍💋‍👩🏼 E13.1 kiss: woman, woman, dark skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏿‍❤️‍💋‍👩🏽 E13.1 kiss: woman, woman, dark skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏿‍❤‍💋‍👩🏽 E13.1 kiss: woman, woman, dark skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏿‍❤️‍💋‍👩🏾 E13.1 kiss: woman, woman, dark skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏿‍❤‍💋‍👩🏾 E13.1 kiss: woman, woman, dark skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f48b}\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏿‍❤️‍💋‍👩🏿 E13.1 kiss: woman, woman, dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\u200d\u{1f48b}\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏿‍❤‍💋‍👩🏿 E13.1 kiss: woman, woman, dark skin tone
  [
    '\u{1f491}',
  ], // 💑 E0.6 couple with heart
  [
    '\u{1f491}\u{1f3fb}',
  ], // 💑🏻 E13.1 couple with heart: light skin tone
  [
    '\u{1f491}\u{1f3fc}',
  ], // 💑🏼 E13.1 couple with heart: medium-light skin tone
  [
    '\u{1f491}\u{1f3fd}',
  ], // 💑🏽 E13.1 couple with heart: medium skin tone
  [
    '\u{1f491}\u{1f3fe}',
  ], // 💑🏾 E13.1 couple with heart: medium-dark skin tone
  [
    '\u{1f491}\u{1f3ff}',
  ], // 💑🏿 E13.1 couple with heart: dark skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f9d1}\u{1f3fc}',
  ], // 🧑🏻‍❤️‍🧑🏼 E13.1 couple with heart: person, person, light skin tone, medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u2764\u200d\u{1f9d1}\u{1f3fc}',
  ], // 🧑🏻‍❤‍🧑🏼 E13.1 couple with heart: person, person, light skin tone, medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f9d1}\u{1f3fd}',
  ], // 🧑🏻‍❤️‍🧑🏽 E13.1 couple with heart: person, person, light skin tone, medium skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u2764\u200d\u{1f9d1}\u{1f3fd}',
  ], // 🧑🏻‍❤‍🧑🏽 E13.1 couple with heart: person, person, light skin tone, medium skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f9d1}\u{1f3fe}',
  ], // 🧑🏻‍❤️‍🧑🏾 E13.1 couple with heart: person, person, light skin tone, medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u2764\u200d\u{1f9d1}\u{1f3fe}',
  ], // 🧑🏻‍❤‍🧑🏾 E13.1 couple with heart: person, person, light skin tone, medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f9d1}\u{1f3ff}',
  ], // 🧑🏻‍❤️‍🧑🏿 E13.1 couple with heart: person, person, light skin tone, dark skin tone
  [
    '\u{1f9d1}\u{1f3fb}\u200d\u2764\u200d\u{1f9d1}\u{1f3ff}',
  ], // 🧑🏻‍❤‍🧑🏿 E13.1 couple with heart: person, person, light skin tone, dark skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f9d1}\u{1f3fb}',
  ], // 🧑🏼‍❤️‍🧑🏻 E13.1 couple with heart: person, person, medium-light skin tone, light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u2764\u200d\u{1f9d1}\u{1f3fb}',
  ], // 🧑🏼‍❤‍🧑🏻 E13.1 couple with heart: person, person, medium-light skin tone, light skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f9d1}\u{1f3fd}',
  ], // 🧑🏼‍❤️‍🧑🏽 E13.1 couple with heart: person, person, medium-light skin tone, medium skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u2764\u200d\u{1f9d1}\u{1f3fd}',
  ], // 🧑🏼‍❤‍🧑🏽 E13.1 couple with heart: person, person, medium-light skin tone, medium skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f9d1}\u{1f3fe}',
  ], // 🧑🏼‍❤️‍🧑🏾 E13.1 couple with heart: person, person, medium-light skin tone, medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u2764\u200d\u{1f9d1}\u{1f3fe}',
  ], // 🧑🏼‍❤‍🧑🏾 E13.1 couple with heart: person, person, medium-light skin tone, medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f9d1}\u{1f3ff}',
  ], // 🧑🏼‍❤️‍🧑🏿 E13.1 couple with heart: person, person, medium-light skin tone, dark skin tone
  [
    '\u{1f9d1}\u{1f3fc}\u200d\u2764\u200d\u{1f9d1}\u{1f3ff}',
  ], // 🧑🏼‍❤‍🧑🏿 E13.1 couple with heart: person, person, medium-light skin tone, dark skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f9d1}\u{1f3fb}',
  ], // 🧑🏽‍❤️‍🧑🏻 E13.1 couple with heart: person, person, medium skin tone, light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u2764\u200d\u{1f9d1}\u{1f3fb}',
  ], // 🧑🏽‍❤‍🧑🏻 E13.1 couple with heart: person, person, medium skin tone, light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f9d1}\u{1f3fc}',
  ], // 🧑🏽‍❤️‍🧑🏼 E13.1 couple with heart: person, person, medium skin tone, medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u2764\u200d\u{1f9d1}\u{1f3fc}',
  ], // 🧑🏽‍❤‍🧑🏼 E13.1 couple with heart: person, person, medium skin tone, medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f9d1}\u{1f3fe}',
  ], // 🧑🏽‍❤️‍🧑🏾 E13.1 couple with heart: person, person, medium skin tone, medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u2764\u200d\u{1f9d1}\u{1f3fe}',
  ], // 🧑🏽‍❤‍🧑🏾 E13.1 couple with heart: person, person, medium skin tone, medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f9d1}\u{1f3ff}',
  ], // 🧑🏽‍❤️‍🧑🏿 E13.1 couple with heart: person, person, medium skin tone, dark skin tone
  [
    '\u{1f9d1}\u{1f3fd}\u200d\u2764\u200d\u{1f9d1}\u{1f3ff}',
  ], // 🧑🏽‍❤‍🧑🏿 E13.1 couple with heart: person, person, medium skin tone, dark skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f9d1}\u{1f3fb}',
  ], // 🧑🏾‍❤️‍🧑🏻 E13.1 couple with heart: person, person, medium-dark skin tone, light skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u2764\u200d\u{1f9d1}\u{1f3fb}',
  ], // 🧑🏾‍❤‍🧑🏻 E13.1 couple with heart: person, person, medium-dark skin tone, light skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f9d1}\u{1f3fc}',
  ], // 🧑🏾‍❤️‍🧑🏼 E13.1 couple with heart: person, person, medium-dark skin tone, medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u2764\u200d\u{1f9d1}\u{1f3fc}',
  ], // 🧑🏾‍❤‍🧑🏼 E13.1 couple with heart: person, person, medium-dark skin tone, medium-light skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f9d1}\u{1f3fd}',
  ], // 🧑🏾‍❤️‍🧑🏽 E13.1 couple with heart: person, person, medium-dark skin tone, medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u2764\u200d\u{1f9d1}\u{1f3fd}',
  ], // 🧑🏾‍❤‍🧑🏽 E13.1 couple with heart: person, person, medium-dark skin tone, medium skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f9d1}\u{1f3ff}',
  ], // 🧑🏾‍❤️‍🧑🏿 E13.1 couple with heart: person, person, medium-dark skin tone, dark skin tone
  [
    '\u{1f9d1}\u{1f3fe}\u200d\u2764\u200d\u{1f9d1}\u{1f3ff}',
  ], // 🧑🏾‍❤‍🧑🏿 E13.1 couple with heart: person, person, medium-dark skin tone, dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f9d1}\u{1f3fb}',
  ], // 🧑🏿‍❤️‍🧑🏻 E13.1 couple with heart: person, person, dark skin tone, light skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u2764\u200d\u{1f9d1}\u{1f3fb}',
  ], // 🧑🏿‍❤‍🧑🏻 E13.1 couple with heart: person, person, dark skin tone, light skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f9d1}\u{1f3fc}',
  ], // 🧑🏿‍❤️‍🧑🏼 E13.1 couple with heart: person, person, dark skin tone, medium-light skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u2764\u200d\u{1f9d1}\u{1f3fc}',
  ], // 🧑🏿‍❤‍🧑🏼 E13.1 couple with heart: person, person, dark skin tone, medium-light skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f9d1}\u{1f3fd}',
  ], // 🧑🏿‍❤️‍🧑🏽 E13.1 couple with heart: person, person, dark skin tone, medium skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u2764\u200d\u{1f9d1}\u{1f3fd}',
  ], // 🧑🏿‍❤‍🧑🏽 E13.1 couple with heart: person, person, dark skin tone, medium skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f9d1}\u{1f3fe}',
  ], // 🧑🏿‍❤️‍🧑🏾 E13.1 couple with heart: person, person, dark skin tone, medium-dark skin tone
  [
    '\u{1f9d1}\u{1f3ff}\u200d\u2764\u200d\u{1f9d1}\u{1f3fe}',
  ], // 🧑🏿‍❤‍🧑🏾 E13.1 couple with heart: person, person, dark skin tone, medium-dark skin tone
  [
    '\u{1f469}\u200d\u2764\ufe0f\u200d\u{1f468}',
  ], // 👩‍❤️‍👨 E2.0 couple with heart: woman, man
  [
    '\u{1f469}\u200d\u2764\u200d\u{1f468}',
  ], // 👩‍❤‍👨 E2.0 couple with heart: woman, man
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏻‍❤️‍👨🏻 E13.1 couple with heart: woman, man, light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏻‍❤‍👨🏻 E13.1 couple with heart: woman, man, light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏻‍❤️‍👨🏼 E13.1 couple with heart: woman, man, light skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏻‍❤‍👨🏼 E13.1 couple with heart: woman, man, light skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏻‍❤️‍👨🏽 E13.1 couple with heart: woman, man, light skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏻‍❤‍👨🏽 E13.1 couple with heart: woman, man, light skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏻‍❤️‍👨🏾 E13.1 couple with heart: woman, man, light skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏻‍❤‍👨🏾 E13.1 couple with heart: woman, man, light skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏻‍❤️‍👨🏿 E13.1 couple with heart: woman, man, light skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏻‍❤‍👨🏿 E13.1 couple with heart: woman, man, light skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏼‍❤️‍👨🏻 E13.1 couple with heart: woman, man, medium-light skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏼‍❤‍👨🏻 E13.1 couple with heart: woman, man, medium-light skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏼‍❤️‍👨🏼 E13.1 couple with heart: woman, man, medium-light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏼‍❤‍👨🏼 E13.1 couple with heart: woman, man, medium-light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏼‍❤️‍👨🏽 E13.1 couple with heart: woman, man, medium-light skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏼‍❤‍👨🏽 E13.1 couple with heart: woman, man, medium-light skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏼‍❤️‍👨🏾 E13.1 couple with heart: woman, man, medium-light skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏼‍❤‍👨🏾 E13.1 couple with heart: woman, man, medium-light skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏼‍❤️‍👨🏿 E13.1 couple with heart: woman, man, medium-light skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏼‍❤‍👨🏿 E13.1 couple with heart: woman, man, medium-light skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏽‍❤️‍👨🏻 E13.1 couple with heart: woman, man, medium skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏽‍❤‍👨🏻 E13.1 couple with heart: woman, man, medium skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏽‍❤️‍👨🏼 E13.1 couple with heart: woman, man, medium skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏽‍❤‍👨🏼 E13.1 couple with heart: woman, man, medium skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏽‍❤️‍👨🏽 E13.1 couple with heart: woman, man, medium skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏽‍❤‍👨🏽 E13.1 couple with heart: woman, man, medium skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏽‍❤️‍👨🏾 E13.1 couple with heart: woman, man, medium skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏽‍❤‍👨🏾 E13.1 couple with heart: woman, man, medium skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏽‍❤️‍👨🏿 E13.1 couple with heart: woman, man, medium skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏽‍❤‍👨🏿 E13.1 couple with heart: woman, man, medium skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏾‍❤️‍👨🏻 E13.1 couple with heart: woman, man, medium-dark skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏾‍❤‍👨🏻 E13.1 couple with heart: woman, man, medium-dark skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏾‍❤️‍👨🏼 E13.1 couple with heart: woman, man, medium-dark skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏾‍❤‍👨🏼 E13.1 couple with heart: woman, man, medium-dark skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏾‍❤️‍👨🏽 E13.1 couple with heart: woman, man, medium-dark skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏾‍❤‍👨🏽 E13.1 couple with heart: woman, man, medium-dark skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏾‍❤️‍👨🏾 E13.1 couple with heart: woman, man, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏾‍❤‍👨🏾 E13.1 couple with heart: woman, man, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏾‍❤️‍👨🏿 E13.1 couple with heart: woman, man, medium-dark skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏾‍❤‍👨🏿 E13.1 couple with heart: woman, man, medium-dark skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏿‍❤️‍👨🏻 E13.1 couple with heart: woman, man, dark skin tone, light skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\u200d\u{1f468}\u{1f3fb}',
  ], // 👩🏿‍❤‍👨🏻 E13.1 couple with heart: woman, man, dark skin tone, light skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏿‍❤️‍👨🏼 E13.1 couple with heart: woman, man, dark skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\u200d\u{1f468}\u{1f3fc}',
  ], // 👩🏿‍❤‍👨🏼 E13.1 couple with heart: woman, man, dark skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏿‍❤️‍👨🏽 E13.1 couple with heart: woman, man, dark skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\u200d\u{1f468}\u{1f3fd}',
  ], // 👩🏿‍❤‍👨🏽 E13.1 couple with heart: woman, man, dark skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏿‍❤️‍👨🏾 E13.1 couple with heart: woman, man, dark skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\u200d\u{1f468}\u{1f3fe}',
  ], // 👩🏿‍❤‍👨🏾 E13.1 couple with heart: woman, man, dark skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏿‍❤️‍👨🏿 E13.1 couple with heart: woman, man, dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\u200d\u{1f468}\u{1f3ff}',
  ], // 👩🏿‍❤‍👨🏿 E13.1 couple with heart: woman, man, dark skin tone
  [
    '\u{1f468}\u200d\u2764\ufe0f\u200d\u{1f468}',
  ], // 👨‍❤️‍👨 E2.0 couple with heart: man, man
  [
    '\u{1f468}\u200d\u2764\u200d\u{1f468}',
  ], // 👨‍❤‍👨 E2.0 couple with heart: man, man
  [
    '\u{1f468}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏻‍❤️‍👨🏻 E13.1 couple with heart: man, man, light skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u2764\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏻‍❤‍👨🏻 E13.1 couple with heart: man, man, light skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏻‍❤️‍👨🏼 E13.1 couple with heart: man, man, light skin tone, medium-light skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u2764\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏻‍❤‍👨🏼 E13.1 couple with heart: man, man, light skin tone, medium-light skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏻‍❤️‍👨🏽 E13.1 couple with heart: man, man, light skin tone, medium skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u2764\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏻‍❤‍👨🏽 E13.1 couple with heart: man, man, light skin tone, medium skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏻‍❤️‍👨🏾 E13.1 couple with heart: man, man, light skin tone, medium-dark skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u2764\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏻‍❤‍👨🏾 E13.1 couple with heart: man, man, light skin tone, medium-dark skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏻‍❤️‍👨🏿 E13.1 couple with heart: man, man, light skin tone, dark skin tone
  [
    '\u{1f468}\u{1f3fb}\u200d\u2764\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏻‍❤‍👨🏿 E13.1 couple with heart: man, man, light skin tone, dark skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏼‍❤️‍👨🏻 E13.1 couple with heart: man, man, medium-light skin tone, light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2764\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏼‍❤‍👨🏻 E13.1 couple with heart: man, man, medium-light skin tone, light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏼‍❤️‍👨🏼 E13.1 couple with heart: man, man, medium-light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2764\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏼‍❤‍👨🏼 E13.1 couple with heart: man, man, medium-light skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏼‍❤️‍👨🏽 E13.1 couple with heart: man, man, medium-light skin tone, medium skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2764\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏼‍❤‍👨🏽 E13.1 couple with heart: man, man, medium-light skin tone, medium skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏼‍❤️‍👨🏾 E13.1 couple with heart: man, man, medium-light skin tone, medium-dark skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2764\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏼‍❤‍👨🏾 E13.1 couple with heart: man, man, medium-light skin tone, medium-dark skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏼‍❤️‍👨🏿 E13.1 couple with heart: man, man, medium-light skin tone, dark skin tone
  [
    '\u{1f468}\u{1f3fc}\u200d\u2764\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏼‍❤‍👨🏿 E13.1 couple with heart: man, man, medium-light skin tone, dark skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏽‍❤️‍👨🏻 E13.1 couple with heart: man, man, medium skin tone, light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2764\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏽‍❤‍👨🏻 E13.1 couple with heart: man, man, medium skin tone, light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏽‍❤️‍👨🏼 E13.1 couple with heart: man, man, medium skin tone, medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2764\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏽‍❤‍👨🏼 E13.1 couple with heart: man, man, medium skin tone, medium-light skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏽‍❤️‍👨🏽 E13.1 couple with heart: man, man, medium skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2764\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏽‍❤‍👨🏽 E13.1 couple with heart: man, man, medium skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏽‍❤️‍👨🏾 E13.1 couple with heart: man, man, medium skin tone, medium-dark skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2764\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏽‍❤‍👨🏾 E13.1 couple with heart: man, man, medium skin tone, medium-dark skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏽‍❤️‍👨🏿 E13.1 couple with heart: man, man, medium skin tone, dark skin tone
  [
    '\u{1f468}\u{1f3fd}\u200d\u2764\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏽‍❤‍👨🏿 E13.1 couple with heart: man, man, medium skin tone, dark skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏾‍❤️‍👨🏻 E13.1 couple with heart: man, man, medium-dark skin tone, light skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2764\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏾‍❤‍👨🏻 E13.1 couple with heart: man, man, medium-dark skin tone, light skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏾‍❤️‍👨🏼 E13.1 couple with heart: man, man, medium-dark skin tone, medium-light skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2764\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏾‍❤‍👨🏼 E13.1 couple with heart: man, man, medium-dark skin tone, medium-light skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏾‍❤️‍👨🏽 E13.1 couple with heart: man, man, medium-dark skin tone, medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2764\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏾‍❤‍👨🏽 E13.1 couple with heart: man, man, medium-dark skin tone, medium skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏾‍❤️‍👨🏾 E13.1 couple with heart: man, man, medium-dark skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2764\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏾‍❤‍👨🏾 E13.1 couple with heart: man, man, medium-dark skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏾‍❤️‍👨🏿 E13.1 couple with heart: man, man, medium-dark skin tone, dark skin tone
  [
    '\u{1f468}\u{1f3fe}\u200d\u2764\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏾‍❤‍👨🏿 E13.1 couple with heart: man, man, medium-dark skin tone, dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏿‍❤️‍👨🏻 E13.1 couple with heart: man, man, dark skin tone, light skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2764\u200d\u{1f468}\u{1f3fb}',
  ], // 👨🏿‍❤‍👨🏻 E13.1 couple with heart: man, man, dark skin tone, light skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏿‍❤️‍👨🏼 E13.1 couple with heart: man, man, dark skin tone, medium-light skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2764\u200d\u{1f468}\u{1f3fc}',
  ], // 👨🏿‍❤‍👨🏼 E13.1 couple with heart: man, man, dark skin tone, medium-light skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏿‍❤️‍👨🏽 E13.1 couple with heart: man, man, dark skin tone, medium skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2764\u200d\u{1f468}\u{1f3fd}',
  ], // 👨🏿‍❤‍👨🏽 E13.1 couple with heart: man, man, dark skin tone, medium skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏿‍❤️‍👨🏾 E13.1 couple with heart: man, man, dark skin tone, medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2764\u200d\u{1f468}\u{1f3fe}',
  ], // 👨🏿‍❤‍👨🏾 E13.1 couple with heart: man, man, dark skin tone, medium-dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏿‍❤️‍👨🏿 E13.1 couple with heart: man, man, dark skin tone
  [
    '\u{1f468}\u{1f3ff}\u200d\u2764\u200d\u{1f468}\u{1f3ff}',
  ], // 👨🏿‍❤‍👨🏿 E13.1 couple with heart: man, man, dark skin tone
  [
    '\u{1f469}\u200d\u2764\ufe0f\u200d\u{1f469}',
  ], // 👩‍❤️‍👩 E2.0 couple with heart: woman, woman
  [
    '\u{1f469}\u200d\u2764\u200d\u{1f469}',
  ], // 👩‍❤‍👩 E2.0 couple with heart: woman, woman
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏻‍❤️‍👩🏻 E13.1 couple with heart: woman, woman, light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏻‍❤‍👩🏻 E13.1 couple with heart: woman, woman, light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏻‍❤️‍👩🏼 E13.1 couple with heart: woman, woman, light skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏻‍❤‍👩🏼 E13.1 couple with heart: woman, woman, light skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏻‍❤️‍👩🏽 E13.1 couple with heart: woman, woman, light skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏻‍❤‍👩🏽 E13.1 couple with heart: woman, woman, light skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏻‍❤️‍👩🏾 E13.1 couple with heart: woman, woman, light skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏻‍❤‍👩🏾 E13.1 couple with heart: woman, woman, light skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏻‍❤️‍👩🏿 E13.1 couple with heart: woman, woman, light skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fb}\u200d\u2764\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏻‍❤‍👩🏿 E13.1 couple with heart: woman, woman, light skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏼‍❤️‍👩🏻 E13.1 couple with heart: woman, woman, medium-light skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏼‍❤‍👩🏻 E13.1 couple with heart: woman, woman, medium-light skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏼‍❤️‍👩🏼 E13.1 couple with heart: woman, woman, medium-light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏼‍❤‍👩🏼 E13.1 couple with heart: woman, woman, medium-light skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏼‍❤️‍👩🏽 E13.1 couple with heart: woman, woman, medium-light skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏼‍❤‍👩🏽 E13.1 couple with heart: woman, woman, medium-light skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏼‍❤️‍👩🏾 E13.1 couple with heart: woman, woman, medium-light skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏼‍❤‍👩🏾 E13.1 couple with heart: woman, woman, medium-light skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏼‍❤️‍👩🏿 E13.1 couple with heart: woman, woman, medium-light skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fc}\u200d\u2764\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏼‍❤‍👩🏿 E13.1 couple with heart: woman, woman, medium-light skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏽‍❤️‍👩🏻 E13.1 couple with heart: woman, woman, medium skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏽‍❤‍👩🏻 E13.1 couple with heart: woman, woman, medium skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏽‍❤️‍👩🏼 E13.1 couple with heart: woman, woman, medium skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏽‍❤‍👩🏼 E13.1 couple with heart: woman, woman, medium skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏽‍❤️‍👩🏽 E13.1 couple with heart: woman, woman, medium skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏽‍❤‍👩🏽 E13.1 couple with heart: woman, woman, medium skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏽‍❤️‍👩🏾 E13.1 couple with heart: woman, woman, medium skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏽‍❤‍👩🏾 E13.1 couple with heart: woman, woman, medium skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏽‍❤️‍👩🏿 E13.1 couple with heart: woman, woman, medium skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fd}\u200d\u2764\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏽‍❤‍👩🏿 E13.1 couple with heart: woman, woman, medium skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏾‍❤️‍👩🏻 E13.1 couple with heart: woman, woman, medium-dark skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏾‍❤‍👩🏻 E13.1 couple with heart: woman, woman, medium-dark skin tone, light skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏾‍❤️‍👩🏼 E13.1 couple with heart: woman, woman, medium-dark skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏾‍❤‍👩🏼 E13.1 couple with heart: woman, woman, medium-dark skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏾‍❤️‍👩🏽 E13.1 couple with heart: woman, woman, medium-dark skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏾‍❤‍👩🏽 E13.1 couple with heart: woman, woman, medium-dark skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏾‍❤️‍👩🏾 E13.1 couple with heart: woman, woman, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏾‍❤‍👩🏾 E13.1 couple with heart: woman, woman, medium-dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏾‍❤️‍👩🏿 E13.1 couple with heart: woman, woman, medium-dark skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3fe}\u200d\u2764\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏾‍❤‍👩🏿 E13.1 couple with heart: woman, woman, medium-dark skin tone, dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏿‍❤️‍👩🏻 E13.1 couple with heart: woman, woman, dark skin tone, light skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\u200d\u{1f469}\u{1f3fb}',
  ], // 👩🏿‍❤‍👩🏻 E13.1 couple with heart: woman, woman, dark skin tone, light skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏿‍❤️‍👩🏼 E13.1 couple with heart: woman, woman, dark skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\u200d\u{1f469}\u{1f3fc}',
  ], // 👩🏿‍❤‍👩🏼 E13.1 couple with heart: woman, woman, dark skin tone, medium-light skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏿‍❤️‍👩🏽 E13.1 couple with heart: woman, woman, dark skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\u200d\u{1f469}\u{1f3fd}',
  ], // 👩🏿‍❤‍👩🏽 E13.1 couple with heart: woman, woman, dark skin tone, medium skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏿‍❤️‍👩🏾 E13.1 couple with heart: woman, woman, dark skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\u200d\u{1f469}\u{1f3fe}',
  ], // 👩🏿‍❤‍👩🏾 E13.1 couple with heart: woman, woman, dark skin tone, medium-dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\ufe0f\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏿‍❤️‍👩🏿 E13.1 couple with heart: woman, woman, dark skin tone
  [
    '\u{1f469}\u{1f3ff}\u200d\u2764\u200d\u{1f469}\u{1f3ff}',
  ], // 👩🏿‍❤‍👩🏿 E13.1 couple with heart: woman, woman, dark skin tone
  [
    '\u{1f468}\u200d\u{1f469}\u200d\u{1f466}',
  ], // 👨‍👩‍👦 E2.0 family: man, woman, boy
  [
    '\u{1f468}\u200d\u{1f469}\u200d\u{1f467}',
  ], // 👨‍👩‍👧 E2.0 family: man, woman, girl
  [
    '\u{1f468}\u200d\u{1f469}\u200d\u{1f467}\u200d\u{1f466}',
  ], // 👨‍👩‍👧‍👦 E2.0 family: man, woman, girl, boy
  [
    '\u{1f468}\u200d\u{1f469}\u200d\u{1f466}\u200d\u{1f466}',
  ], // 👨‍👩‍👦‍👦 E2.0 family: man, woman, boy, boy
  [
    '\u{1f468}\u200d\u{1f469}\u200d\u{1f467}\u200d\u{1f467}',
  ], // 👨‍👩‍👧‍👧 E2.0 family: man, woman, girl, girl
  [
    '\u{1f468}\u200d\u{1f468}\u200d\u{1f466}',
  ], // 👨‍👨‍👦 E2.0 family: man, man, boy
  [
    '\u{1f468}\u200d\u{1f468}\u200d\u{1f467}',
  ], // 👨‍👨‍👧 E2.0 family: man, man, girl
  [
    '\u{1f468}\u200d\u{1f468}\u200d\u{1f467}\u200d\u{1f466}',
  ], // 👨‍👨‍👧‍👦 E2.0 family: man, man, girl, boy
  [
    '\u{1f468}\u200d\u{1f468}\u200d\u{1f466}\u200d\u{1f466}',
  ], // 👨‍👨‍👦‍👦 E2.0 family: man, man, boy, boy
  [
    '\u{1f468}\u200d\u{1f468}\u200d\u{1f467}\u200d\u{1f467}',
  ], // 👨‍👨‍👧‍👧 E2.0 family: man, man, girl, girl
  [
    '\u{1f469}\u200d\u{1f469}\u200d\u{1f466}',
  ], // 👩‍👩‍👦 E2.0 family: woman, woman, boy
  [
    '\u{1f469}\u200d\u{1f469}\u200d\u{1f467}',
  ], // 👩‍👩‍👧 E2.0 family: woman, woman, girl
  [
    '\u{1f469}\u200d\u{1f469}\u200d\u{1f467}\u200d\u{1f466}',
  ], // 👩‍👩‍👧‍👦 E2.0 family: woman, woman, girl, boy
  [
    '\u{1f469}\u200d\u{1f469}\u200d\u{1f466}\u200d\u{1f466}',
  ], // 👩‍👩‍👦‍👦 E2.0 family: woman, woman, boy, boy
  [
    '\u{1f469}\u200d\u{1f469}\u200d\u{1f467}\u200d\u{1f467}',
  ], // 👩‍👩‍👧‍👧 E2.0 family: woman, woman, girl, girl
  [
    '\u{1f468}\u200d\u{1f466}',
  ], // 👨‍👦 E4.0 family: man, boy
  [
    '\u{1f468}\u200d\u{1f466}\u200d\u{1f466}',
  ], // 👨‍👦‍👦 E4.0 family: man, boy, boy
  [
    '\u{1f468}\u200d\u{1f467}',
  ], // 👨‍👧 E4.0 family: man, girl
  [
    '\u{1f468}\u200d\u{1f467}\u200d\u{1f466}',
  ], // 👨‍👧‍👦 E4.0 family: man, girl, boy
  [
    '\u{1f468}\u200d\u{1f467}\u200d\u{1f467}',
  ], // 👨‍👧‍👧 E4.0 family: man, girl, girl
  [
    '\u{1f469}\u200d\u{1f466}',
  ], // 👩‍👦 E4.0 family: woman, boy
  [
    '\u{1f469}\u200d\u{1f466}\u200d\u{1f466}',
  ], // 👩‍👦‍👦 E4.0 family: woman, boy, boy
  [
    '\u{1f469}\u200d\u{1f467}',
  ], // 👩‍👧 E4.0 family: woman, girl
  [
    '\u{1f469}\u200d\u{1f467}\u200d\u{1f466}',
  ], // 👩‍👧‍👦 E4.0 family: woman, girl, boy
  [
    '\u{1f469}\u200d\u{1f467}\u200d\u{1f467}',
  ], // 👩‍👧‍👧 E4.0 family: woman, girl, girl
  [
    '\u{1f5e3}\ufe0f',
  ], // 🗣️ E0.7 speaking head
  [
    '\u{1f5e3}',
  ], // 🗣 E0.7 speaking head
  [
    '\u{1f464}',
  ], // 👤 E0.6 bust in silhouette
  [
    '\u{1f465}',
  ], // 👥 E1.0 busts in silhouette
  [
    '\u{1fac2}',
  ], // 🫂 E13.0 people hugging
  [
    '\u{1f46a}',
  ], // 👪 E0.6 family
  [
    '\u{1f9d1}\u200d\u{1f9d1}\u200d\u{1f9d2}',
  ], // 🧑‍🧑‍🧒 E15.1 family: adult, adult, child
  [
    '\u{1f9d1}\u200d\u{1f9d1}\u200d\u{1f9d2}\u200d\u{1f9d2}',
  ], // 🧑‍🧑‍🧒‍🧒 E15.1 family: adult, adult, child, child
  [
    '\u{1f9d1}\u200d\u{1f9d2}',
  ], // 🧑‍🧒 E15.1 family: adult, child
  [
    '\u{1f9d1}\u200d\u{1f9d2}\u200d\u{1f9d2}',
  ], // 🧑‍🧒‍🧒 E15.1 family: adult, child, child
  [
    '\u{1f463}',
  ], // 👣 E0.6 footprints
  [
    '\u{1fac6}',
  ], // 🫆 E16.0 fingerprint
  [
    '\u{1f3fb}',
  ], // 🏻 E1.0 light skin tone
  [
    '\u{1f3fc}',
  ], // 🏼 E1.0 medium-light skin tone
  [
    '\u{1f3fd}',
  ], // 🏽 E1.0 medium skin tone
  [
    '\u{1f3fe}',
  ], // 🏾 E1.0 medium-dark skin tone
  [
    '\u{1f3ff}',
  ], // 🏿 E1.0 dark skin tone
  [
    '\u{1f9b0}',
  ], // 🦰 E11.0 red hair
  [
    '\u{1f9b1}',
  ], // 🦱 E11.0 curly hair
  [
    '\u{1f9b3}',
  ], // 🦳 E11.0 white hair
  [
    '\u{1f9b2}',
  ], // 🦲 E11.0 bald
  [
    '\u{1f435}',
  ], // 🐵 E0.6 monkey face
  [
    '\u{1f412}',
  ], // 🐒 E0.6 monkey
  [
    '\u{1f98d}',
  ], // 🦍 E3.0 gorilla
  [
    '\u{1f9a7}',
  ], // 🦧 E12.0 orangutan
  [
    '\u{1f436}',
  ], // 🐶 E0.6 dog face
  [
    '\u{1f415}',
  ], // 🐕 E0.7 dog
  [
    '\u{1f9ae}',
  ], // 🦮 E12.0 guide dog
  [
    '\u{1f415}\u200d\u{1f9ba}',
  ], // 🐕‍🦺 E12.0 service dog
  [
    '\u{1f429}',
  ], // 🐩 E0.6 poodle
  [
    '\u{1f43a}',
  ], // 🐺 E0.6 wolf
  [
    '\u{1f98a}',
  ], // 🦊 E3.0 fox
  [
    '\u{1f99d}',
  ], // 🦝 E11.0 raccoon
  [
    '\u{1f431}',
  ], // 🐱 E0.6 cat face
  [
    '\u{1f408}',
  ], // 🐈 E0.7 cat
  [
    '\u{1f408}\u200d\u2b1b',
  ], // 🐈‍⬛ E13.0 black cat
  [
    '\u{1f981}',
  ], // 🦁 E1.0 lion
  [
    '\u{1f42f}',
  ], // 🐯 E0.6 tiger face
  [
    '\u{1f405}',
  ], // 🐅 E1.0 tiger
  [
    '\u{1f406}',
  ], // 🐆 E1.0 leopard
  [
    '\u{1f434}',
  ], // 🐴 E0.6 horse face
  [
    '\u{1face}',
  ], // 🫎 E15.0 moose
  [
    '\u{1facf}',
  ], // 🫏 E15.0 donkey
  [
    '\u{1f40e}',
  ], // 🐎 E0.6 horse
  [
    '\u{1f984}',
  ], // 🦄 E1.0 unicorn
  [
    '\u{1f993}',
  ], // 🦓 E5.0 zebra
  [
    '\u{1f98c}',
  ], // 🦌 E3.0 deer
  [
    '\u{1f9ac}',
  ], // 🦬 E13.0 bison
  [
    '\u{1f42e}',
  ], // 🐮 E0.6 cow face
  [
    '\u{1f402}',
  ], // 🐂 E1.0 ox
  [
    '\u{1f403}',
  ], // 🐃 E1.0 water buffalo
  [
    '\u{1f404}',
  ], // 🐄 E1.0 cow
  [
    '\u{1f437}',
  ], // 🐷 E0.6 pig face
  [
    '\u{1f416}',
  ], // 🐖 E1.0 pig
  [
    '\u{1f417}',
  ], // 🐗 E0.6 boar
  [
    '\u{1f43d}',
  ], // 🐽 E0.6 pig nose
  [
    '\u{1f40f}',
  ], // 🐏 E1.0 ram
  [
    '\u{1f411}',
  ], // 🐑 E0.6 ewe
  [
    '\u{1f410}',
  ], // 🐐 E1.0 goat
  [
    '\u{1f42a}',
  ], // 🐪 E1.0 camel
  [
    '\u{1f42b}',
  ], // 🐫 E0.6 two-hump camel
  [
    '\u{1f999}',
  ], // 🦙 E11.0 llama
  [
    '\u{1f992}',
  ], // 🦒 E5.0 giraffe
  [
    '\u{1f418}',
  ], // 🐘 E0.6 elephant
  [
    '\u{1f9a3}',
  ], // 🦣 E13.0 mammoth
  [
    '\u{1f98f}',
  ], // 🦏 E3.0 rhinoceros
  [
    '\u{1f99b}',
  ], // 🦛 E11.0 hippopotamus
  [
    '\u{1f42d}',
  ], // 🐭 E0.6 mouse face
  [
    '\u{1f401}',
  ], // 🐁 E1.0 mouse
  [
    '\u{1f400}',
  ], // 🐀 E1.0 rat
  [
    '\u{1f439}',
  ], // 🐹 E0.6 hamster
  [
    '\u{1f430}',
  ], // 🐰 E0.6 rabbit face
  [
    '\u{1f407}',
  ], // 🐇 E1.0 rabbit
  [
    '\u{1f43f}\ufe0f',
  ], // 🐿️ E0.7 chipmunk
  [
    '\u{1f43f}',
  ], // 🐿 E0.7 chipmunk
  [
    '\u{1f9ab}',
  ], // 🦫 E13.0 beaver
  [
    '\u{1f994}',
  ], // 🦔 E5.0 hedgehog
  [
    '\u{1f987}',
  ], // 🦇 E3.0 bat
  [
    '\u{1f43b}',
  ], // 🐻 E0.6 bear
  [
    '\u{1f43b}\u200d\u2744\ufe0f',
  ], // 🐻‍❄️ E13.0 polar bear
  [
    '\u{1f43b}\u200d\u2744',
  ], // 🐻‍❄ E13.0 polar bear
  [
    '\u{1f428}',
  ], // 🐨 E0.6 koala
  [
    '\u{1f43c}',
  ], // 🐼 E0.6 panda
  [
    '\u{1f9a5}',
  ], // 🦥 E12.0 sloth
  [
    '\u{1f9a6}',
  ], // 🦦 E12.0 otter
  [
    '\u{1f9a8}',
  ], // 🦨 E12.0 skunk
  [
    '\u{1f998}',
  ], // 🦘 E11.0 kangaroo
  [
    '\u{1f9a1}',
  ], // 🦡 E11.0 badger
  [
    '\u{1f43e}',
  ], // 🐾 E0.6 paw prints
  [
    '\u{1f983}',
  ], // 🦃 E1.0 turkey
  [
    '\u{1f414}',
  ], // 🐔 E0.6 chicken
  [
    '\u{1f413}',
  ], // 🐓 E1.0 rooster
  [
    '\u{1f423}',
  ], // 🐣 E0.6 hatching chick
  [
    '\u{1f424}',
  ], // 🐤 E0.6 baby chick
  [
    '\u{1f425}',
  ], // 🐥 E0.6 front-facing baby chick
  [
    '\u{1f426}',
  ], // 🐦 E0.6 bird
  [
    '\u{1f427}',
  ], // 🐧 E0.6 penguin
  [
    '\u{1f54a}\ufe0f',
  ], // 🕊️ E0.7 dove
  [
    '\u{1f54a}',
  ], // 🕊 E0.7 dove
  [
    '\u{1f985}',
  ], // 🦅 E3.0 eagle
  [
    '\u{1f986}',
  ], // 🦆 E3.0 duck
  [
    '\u{1f9a2}',
  ], // 🦢 E11.0 swan
  [
    '\u{1f989}',
  ], // 🦉 E3.0 owl
  [
    '\u{1f9a4}',
  ], // 🦤 E13.0 dodo
  [
    '\u{1fab6}',
  ], // 🪶 E13.0 feather
  [
    '\u{1f9a9}',
  ], // 🦩 E12.0 flamingo
  [
    '\u{1f99a}',
  ], // 🦚 E11.0 peacock
  [
    '\u{1f99c}',
  ], // 🦜 E11.0 parrot
  [
    '\u{1fabd}',
  ], // 🪽 E15.0 wing
  [
    '\u{1f426}\u200d\u2b1b',
  ], // 🐦‍⬛ E15.0 black bird
  [
    '\u{1fabf}',
  ], // 🪿 E15.0 goose
  [
    '\u{1f426}\u200d\u{1f525}',
  ], // 🐦‍🔥 E15.1 phoenix
  [
    '\u{1f438}',
  ], // 🐸 E0.6 frog
  [
    '\u{1f40a}',
  ], // 🐊 E1.0 crocodile
  [
    '\u{1f422}',
  ], // 🐢 E0.6 turtle
  [
    '\u{1f98e}',
  ], // 🦎 E3.0 lizard
  [
    '\u{1f40d}',
  ], // 🐍 E0.6 snake
  [
    '\u{1f432}',
  ], // 🐲 E0.6 dragon face
  [
    '\u{1f409}',
  ], // 🐉 E1.0 dragon
  [
    '\u{1f995}',
  ], // 🦕 E5.0 sauropod
  [
    '\u{1f996}',
  ], // 🦖 E5.0 T-Rex
  [
    '\u{1f433}',
  ], // 🐳 E0.6 spouting whale
  [
    '\u{1f40b}',
  ], // 🐋 E1.0 whale
  [
    '\u{1f42c}',
  ], // 🐬 E0.6 dolphin
  [
    '\u{1f9ad}',
  ], // 🦭 E13.0 seal
  [
    '\u{1f41f}',
  ], // 🐟 E0.6 fish
  [
    '\u{1f420}',
  ], // 🐠 E0.6 tropical fish
  [
    '\u{1f421}',
  ], // 🐡 E0.6 blowfish
  [
    '\u{1f988}',
  ], // 🦈 E3.0 shark
  [
    '\u{1f419}',
  ], // 🐙 E0.6 octopus
  [
    '\u{1f41a}',
  ], // 🐚 E0.6 spiral shell
  [
    '\u{1fab8}',
  ], // 🪸 E14.0 coral
  [
    '\u{1fabc}',
  ], // 🪼 E15.0 jellyfish
  [
    '\u{1f980}',
  ], // 🦀 E1.0 crab
  [
    '\u{1f99e}',
  ], // 🦞 E11.0 lobster
  [
    '\u{1f990}',
  ], // 🦐 E3.0 shrimp
  [
    '\u{1f991}',
  ], // 🦑 E3.0 squid
  [
    '\u{1f9aa}',
  ], // 🦪 E12.0 oyster
  [
    '\u{1f40c}',
  ], // 🐌 E0.6 snail
  [
    '\u{1f98b}',
  ], // 🦋 E3.0 butterfly
  [
    '\u{1f41b}',
  ], // 🐛 E0.6 bug
  [
    '\u{1f41c}',
  ], // 🐜 E0.6 ant
  [
    '\u{1f41d}',
  ], // 🐝 E0.6 honeybee
  [
    '\u{1fab2}',
  ], // 🪲 E13.0 beetle
  [
    '\u{1f41e}',
  ], // 🐞 E0.6 lady beetle
  [
    '\u{1f997}',
  ], // 🦗 E5.0 cricket
  [
    '\u{1fab3}',
  ], // 🪳 E13.0 cockroach
  [
    '\u{1f577}\ufe0f',
  ], // 🕷️ E0.7 spider
  [
    '\u{1f577}',
  ], // 🕷 E0.7 spider
  [
    '\u{1f578}\ufe0f',
  ], // 🕸️ E0.7 spider web
  [
    '\u{1f578}',
  ], // 🕸 E0.7 spider web
  [
    '\u{1f982}',
  ], // 🦂 E1.0 scorpion
  [
    '\u{1f99f}',
  ], // 🦟 E11.0 mosquito
  [
    '\u{1fab0}',
  ], // 🪰 E13.0 fly
  [
    '\u{1fab1}',
  ], // 🪱 E13.0 worm
  [
    '\u{1f9a0}',
  ], // 🦠 E11.0 microbe
  [
    '\u{1f490}',
  ], // 💐 E0.6 bouquet
  [
    '\u{1f338}',
  ], // 🌸 E0.6 cherry blossom
  [
    '\u{1f4ae}',
  ], // 💮 E0.6 white flower
  [
    '\u{1fab7}',
  ], // 🪷 E14.0 lotus
  [
    '\u{1f3f5}\ufe0f',
  ], // 🏵️ E0.7 rosette
  [
    '\u{1f3f5}',
  ], // 🏵 E0.7 rosette
  [
    '\u{1f339}',
  ], // 🌹 E0.6 rose
  [
    '\u{1f940}',
  ], // 🥀 E3.0 wilted flower
  [
    '\u{1f33a}',
  ], // 🌺 E0.6 hibiscus
  [
    '\u{1f33b}',
  ], // 🌻 E0.6 sunflower
  [
    '\u{1f33c}',
  ], // 🌼 E0.6 blossom
  [
    '\u{1f337}',
  ], // 🌷 E0.6 tulip
  [
    '\u{1fabb}',
  ], // 🪻 E15.0 hyacinth
  [
    '\u{1f331}',
  ], // 🌱 E0.6 seedling
  [
    '\u{1fab4}',
  ], // 🪴 E13.0 potted plant
  [
    '\u{1f332}',
  ], // 🌲 E1.0 evergreen tree
  [
    '\u{1f333}',
  ], // 🌳 E1.0 deciduous tree
  [
    '\u{1f334}',
  ], // 🌴 E0.6 palm tree
  [
    '\u{1f335}',
  ], // 🌵 E0.6 cactus
  [
    '\u{1f33e}',
  ], // 🌾 E0.6 sheaf of rice
  [
    '\u{1f33f}',
  ], // 🌿 E0.6 herb
  [
    '\u2618\ufe0f',
  ], // ☘️ E1.0 shamrock
  [
    '\u2618',
  ], // ☘ E1.0 shamrock
  [
    '\u{1f340}',
  ], // 🍀 E0.6 four leaf clover
  [
    '\u{1f341}',
  ], // 🍁 E0.6 maple leaf
  [
    '\u{1f342}',
  ], // 🍂 E0.6 fallen leaf
  [
    '\u{1f343}',
  ], // 🍃 E0.6 leaf fluttering in wind
  [
    '\u{1fab9}',
  ], // 🪹 E14.0 empty nest
  [
    '\u{1faba}',
  ], // 🪺 E14.0 nest with eggs
  [
    '\u{1f344}',
  ], // 🍄 E0.6 mushroom
  [
    '\u{1fabe}',
  ], // 🪾 E16.0 leafless tree
  [
    '\u{1f347}',
  ], // 🍇 E0.6 grapes
  [
    '\u{1f348}',
  ], // 🍈 E0.6 melon
  [
    '\u{1f349}',
  ], // 🍉 E0.6 watermelon
  [
    '\u{1f34a}',
  ], // 🍊 E0.6 tangerine
  [
    '\u{1f34b}',
  ], // 🍋 E1.0 lemon
  [
    '\u{1f34b}\u200d\u{1f7e9}',
  ], // 🍋‍🟩 E15.1 lime
  [
    '\u{1f34c}',
  ], // 🍌 E0.6 banana
  [
    '\u{1f34d}',
  ], // 🍍 E0.6 pineapple
  [
    '\u{1f96d}',
  ], // 🥭 E11.0 mango
  [
    '\u{1f34e}',
  ], // 🍎 E0.6 red apple
  [
    '\u{1f34f}',
  ], // 🍏 E0.6 green apple
  [
    '\u{1f350}',
  ], // 🍐 E1.0 pear
  [
    '\u{1f351}',
  ], // 🍑 E0.6 peach
  [
    '\u{1f352}',
  ], // 🍒 E0.6 cherries
  [
    '\u{1f353}',
  ], // 🍓 E0.6 strawberry
  [
    '\u{1fad0}',
  ], // 🫐 E13.0 blueberries
  [
    '\u{1f95d}',
  ], // 🥝 E3.0 kiwi fruit
  [
    '\u{1f345}',
  ], // 🍅 E0.6 tomato
  [
    '\u{1fad2}',
  ], // 🫒 E13.0 olive
  [
    '\u{1f965}',
  ], // 🥥 E5.0 coconut
  [
    '\u{1f951}',
  ], // 🥑 E3.0 avocado
  [
    '\u{1f346}',
  ], // 🍆 E0.6 eggplant
  [
    '\u{1f954}',
  ], // 🥔 E3.0 potato
  [
    '\u{1f955}',
  ], // 🥕 E3.0 carrot
  [
    '\u{1f33d}',
  ], // 🌽 E0.6 ear of corn
  [
    '\u{1f336}\ufe0f',
  ], // 🌶️ E0.7 hot pepper
  [
    '\u{1f336}',
  ], // 🌶 E0.7 hot pepper
  [
    '\u{1fad1}',
  ], // 🫑 E13.0 bell pepper
  [
    '\u{1f952}',
  ], // 🥒 E3.0 cucumber
  [
    '\u{1f96c}',
  ], // 🥬 E11.0 leafy green
  [
    '\u{1f966}',
  ], // 🥦 E5.0 broccoli
  [
    '\u{1f9c4}',
  ], // 🧄 E12.0 garlic
  [
    '\u{1f9c5}',
  ], // 🧅 E12.0 onion
  [
    '\u{1f95c}',
  ], // 🥜 E3.0 peanuts
  [
    '\u{1fad8}',
  ], // 🫘 E14.0 beans
  [
    '\u{1f330}',
  ], // 🌰 E0.6 chestnut
  [
    '\u{1fada}',
  ], // 🫚 E15.0 ginger root
  [
    '\u{1fadb}',
  ], // 🫛 E15.0 pea pod
  [
    '\u{1f344}\u200d\u{1f7eb}',
  ], // 🍄‍🟫 E15.1 brown mushroom
  [
    '\u{1fadc}',
  ], // 🫜 E16.0 root vegetable
  [
    '\u{1f35e}',
  ], // 🍞 E0.6 bread
  [
    '\u{1f950}',
  ], // 🥐 E3.0 croissant
  [
    '\u{1f956}',
  ], // 🥖 E3.0 baguette bread
  [
    '\u{1fad3}',
  ], // 🫓 E13.0 flatbread
  [
    '\u{1f968}',
  ], // 🥨 E5.0 pretzel
  [
    '\u{1f96f}',
  ], // 🥯 E11.0 bagel
  [
    '\u{1f95e}',
  ], // 🥞 E3.0 pancakes
  [
    '\u{1f9c7}',
  ], // 🧇 E12.0 waffle
  [
    '\u{1f9c0}',
  ], // 🧀 E1.0 cheese wedge
  [
    '\u{1f356}',
  ], // 🍖 E0.6 meat on bone
  [
    '\u{1f357}',
  ], // 🍗 E0.6 poultry leg
  [
    '\u{1f969}',
  ], // 🥩 E5.0 cut of meat
  [
    '\u{1f953}',
  ], // 🥓 E3.0 bacon
  [
    '\u{1f354}',
  ], // 🍔 E0.6 hamburger
  [
    '\u{1f35f}',
  ], // 🍟 E0.6 french fries
  [
    '\u{1f355}',
  ], // 🍕 E0.6 pizza
  [
    '\u{1f32d}',
  ], // 🌭 E1.0 hot dog
  [
    '\u{1f96a}',
  ], // 🥪 E5.0 sandwich
  [
    '\u{1f32e}',
  ], // 🌮 E1.0 taco
  [
    '\u{1f32f}',
  ], // 🌯 E1.0 burrito
  [
    '\u{1fad4}',
  ], // 🫔 E13.0 tamale
  [
    '\u{1f959}',
  ], // 🥙 E3.0 stuffed flatbread
  [
    '\u{1f9c6}',
  ], // 🧆 E12.0 falafel
  [
    '\u{1f95a}',
  ], // 🥚 E3.0 egg
  [
    '\u{1f373}',
  ], // 🍳 E0.6 cooking
  [
    '\u{1f958}',
  ], // 🥘 E3.0 shallow pan of food
  [
    '\u{1f372}',
  ], // 🍲 E0.6 pot of food
  [
    '\u{1fad5}',
  ], // 🫕 E13.0 fondue
  [
    '\u{1f963}',
  ], // 🥣 E5.0 bowl with spoon
  [
    '\u{1f957}',
  ], // 🥗 E3.0 green salad
  [
    '\u{1f37f}',
  ], // 🍿 E1.0 popcorn
  [
    '\u{1f9c8}',
  ], // 🧈 E12.0 butter
  [
    '\u{1f9c2}',
  ], // 🧂 E11.0 salt
  [
    '\u{1f96b}',
  ], // 🥫 E5.0 canned food
  [
    '\u{1f371}',
  ], // 🍱 E0.6 bento box
  [
    '\u{1f358}',
  ], // 🍘 E0.6 rice cracker
  [
    '\u{1f359}',
  ], // 🍙 E0.6 rice ball
  [
    '\u{1f35a}',
  ], // 🍚 E0.6 cooked rice
  [
    '\u{1f35b}',
  ], // 🍛 E0.6 curry rice
  [
    '\u{1f35c}',
  ], // 🍜 E0.6 steaming bowl
  [
    '\u{1f35d}',
  ], // 🍝 E0.6 spaghetti
  [
    '\u{1f360}',
  ], // 🍠 E0.6 roasted sweet potato
  [
    '\u{1f362}',
  ], // 🍢 E0.6 oden
  [
    '\u{1f363}',
  ], // 🍣 E0.6 sushi
  [
    '\u{1f364}',
  ], // 🍤 E0.6 fried shrimp
  [
    '\u{1f365}',
  ], // 🍥 E0.6 fish cake with swirl
  [
    '\u{1f96e}',
  ], // 🥮 E11.0 moon cake
  [
    '\u{1f361}',
  ], // 🍡 E0.6 dango
  [
    '\u{1f95f}',
  ], // 🥟 E5.0 dumpling
  [
    '\u{1f960}',
  ], // 🥠 E5.0 fortune cookie
  [
    '\u{1f961}',
  ], // 🥡 E5.0 takeout box
  [
    '\u{1f366}',
  ], // 🍦 E0.6 soft ice cream
  [
    '\u{1f367}',
  ], // 🍧 E0.6 shaved ice
  [
    '\u{1f368}',
  ], // 🍨 E0.6 ice cream
  [
    '\u{1f369}',
  ], // 🍩 E0.6 doughnut
  [
    '\u{1f36a}',
  ], // 🍪 E0.6 cookie
  [
    '\u{1f382}',
  ], // 🎂 E0.6 birthday cake
  [
    '\u{1f370}',
  ], // 🍰 E0.6 shortcake
  [
    '\u{1f9c1}',
  ], // 🧁 E11.0 cupcake
  [
    '\u{1f967}',
  ], // 🥧 E5.0 pie
  [
    '\u{1f36b}',
  ], // 🍫 E0.6 chocolate bar
  [
    '\u{1f36c}',
  ], // 🍬 E0.6 candy
  [
    '\u{1f36d}',
  ], // 🍭 E0.6 lollipop
  [
    '\u{1f36e}',
  ], // 🍮 E0.6 custard
  [
    '\u{1f36f}',
  ], // 🍯 E0.6 honey pot
  [
    '\u{1f37c}',
  ], // 🍼 E1.0 baby bottle
  [
    '\u{1f95b}',
  ], // 🥛 E3.0 glass of milk
  [
    '\u2615',
  ], // ☕ E0.6 hot beverage
  [
    '\u{1fad6}',
  ], // 🫖 E13.0 teapot
  [
    '\u{1f375}',
  ], // 🍵 E0.6 teacup without handle
  [
    '\u{1f376}',
  ], // 🍶 E0.6 sake
  [
    '\u{1f37e}',
  ], // 🍾 E1.0 bottle with popping cork
  [
    '\u{1f377}',
  ], // 🍷 E0.6 wine glass
  [
    '\u{1f378}',
  ], // 🍸 E0.6 cocktail glass
  [
    '\u{1f379}',
  ], // 🍹 E0.6 tropical drink
  [
    '\u{1f37a}',
  ], // 🍺 E0.6 beer mug
  [
    '\u{1f37b}',
  ], // 🍻 E0.6 clinking beer mugs
  [
    '\u{1f942}',
  ], // 🥂 E3.0 clinking glasses
  [
    '\u{1f943}',
  ], // 🥃 E3.0 tumbler glass
  [
    '\u{1fad7}',
  ], // 🫗 E14.0 pouring liquid
  [
    '\u{1f964}',
  ], // 🥤 E5.0 cup with straw
  [
    '\u{1f9cb}',
  ], // 🧋 E13.0 bubble tea
  [
    '\u{1f9c3}',
  ], // 🧃 E12.0 beverage box
  [
    '\u{1f9c9}',
  ], // 🧉 E12.0 mate
  [
    '\u{1f9ca}',
  ], // 🧊 E12.0 ice
  [
    '\u{1f962}',
  ], // 🥢 E5.0 chopsticks
  [
    '\u{1f37d}\ufe0f',
  ], // 🍽️ E0.7 fork and knife with plate
  [
    '\u{1f37d}',
  ], // 🍽 E0.7 fork and knife with plate
  [
    '\u{1f374}',
  ], // 🍴 E0.6 fork and knife
  [
    '\u{1f944}',
  ], // 🥄 E3.0 spoon
  [
    '\u{1f52a}',
  ], // 🔪 E0.6 kitchen knife
  [
    '\u{1fad9}',
  ], // 🫙 E14.0 jar
  [
    '\u{1f3fa}',
  ], // 🏺 E1.0 amphora
  [
    '\u{1f30d}',
  ], // 🌍 E0.7 globe showing Europe-Africa
  [
    '\u{1f30e}',
  ], // 🌎 E0.7 globe showing Americas
  [
    '\u{1f30f}',
  ], // 🌏 E0.6 globe showing Asia-Australia
  [
    '\u{1f310}',
  ], // 🌐 E1.0 globe with meridians
  [
    '\u{1f5fa}\ufe0f',
  ], // 🗺️ E0.7 world map
  [
    '\u{1f5fa}',
  ], // 🗺 E0.7 world map
  [
    '\u{1f5fe}',
  ], // 🗾 E0.6 map of Japan
  [
    '\u{1f9ed}',
  ], // 🧭 E11.0 compass
  [
    '\u{1f3d4}\ufe0f',
  ], // 🏔️ E0.7 snow-capped mountain
  [
    '\u{1f3d4}',
  ], // 🏔 E0.7 snow-capped mountain
  [
    '\u26f0\ufe0f',
  ], // ⛰️ E0.7 mountain
  [
    '\u26f0',
  ], // ⛰ E0.7 mountain
  [
    '\u{1f30b}',
  ], // 🌋 E0.6 volcano
  [
    '\u{1f5fb}',
  ], // 🗻 E0.6 mount fuji
  [
    '\u{1f3d5}\ufe0f',
  ], // 🏕️ E0.7 camping
  [
    '\u{1f3d5}',
  ], // 🏕 E0.7 camping
  [
    '\u{1f3d6}\ufe0f',
  ], // 🏖️ E0.7 beach with umbrella
  [
    '\u{1f3d6}',
  ], // 🏖 E0.7 beach with umbrella
  [
    '\u{1f3dc}\ufe0f',
  ], // 🏜️ E0.7 desert
  [
    '\u{1f3dc}',
  ], // 🏜 E0.7 desert
  [
    '\u{1f3dd}\ufe0f',
  ], // 🏝️ E0.7 desert island
  [
    '\u{1f3dd}',
  ], // 🏝 E0.7 desert island
  [
    '\u{1f3de}\ufe0f',
  ], // 🏞️ E0.7 national park
  [
    '\u{1f3de}',
  ], // 🏞 E0.7 national park
  [
    '\u{1f3df}\ufe0f',
  ], // 🏟️ E0.7 stadium
  [
    '\u{1f3df}',
  ], // 🏟 E0.7 stadium
  [
    '\u{1f3db}\ufe0f',
  ], // 🏛️ E0.7 classical building
  [
    '\u{1f3db}',
  ], // 🏛 E0.7 classical building
  [
    '\u{1f3d7}\ufe0f',
  ], // 🏗️ E0.7 building construction
  [
    '\u{1f3d7}',
  ], // 🏗 E0.7 building construction
  [
    '\u{1f9f1}',
  ], // 🧱 E11.0 brick
  [
    '\u{1faa8}',
  ], // 🪨 E13.0 rock
  [
    '\u{1fab5}',
  ], // 🪵 E13.0 wood
  [
    '\u{1f6d6}',
  ], // 🛖 E13.0 hut
  [
    '\u{1f3d8}\ufe0f',
  ], // 🏘️ E0.7 houses
  [
    '\u{1f3d8}',
  ], // 🏘 E0.7 houses
  [
    '\u{1f3da}\ufe0f',
  ], // 🏚️ E0.7 derelict house
  [
    '\u{1f3da}',
  ], // 🏚 E0.7 derelict house
  [
    '\u{1f3e0}',
  ], // 🏠 E0.6 house
  [
    '\u{1f3e1}',
  ], // 🏡 E0.6 house with garden
  [
    '\u{1f3e2}',
  ], // 🏢 E0.6 office building
  [
    '\u{1f3e3}',
  ], // 🏣 E0.6 Japanese post office
  [
    '\u{1f3e4}',
  ], // 🏤 E1.0 post office
  [
    '\u{1f3e5}',
  ], // 🏥 E0.6 hospital
  [
    '\u{1f3e6}',
  ], // 🏦 E0.6 bank
  [
    '\u{1f3e8}',
  ], // 🏨 E0.6 hotel
  [
    '\u{1f3e9}',
  ], // 🏩 E0.6 love hotel
  [
    '\u{1f3ea}',
  ], // 🏪 E0.6 convenience store
  [
    '\u{1f3eb}',
  ], // 🏫 E0.6 school
  [
    '\u{1f3ec}',
  ], // 🏬 E0.6 department store
  [
    '\u{1f3ed}',
  ], // 🏭 E0.6 factory
  [
    '\u{1f3ef}',
  ], // 🏯 E0.6 Japanese castle
  [
    '\u{1f3f0}',
  ], // 🏰 E0.6 castle
  [
    '\u{1f492}',
  ], // 💒 E0.6 wedding
  [
    '\u{1f5fc}',
  ], // 🗼 E0.6 Tokyo tower
  [
    '\u{1f5fd}',
  ], // 🗽 E0.6 Statue of Liberty
  [
    '\u26ea',
  ], // ⛪ E0.6 church
  [
    '\u{1f54c}',
  ], // 🕌 E1.0 mosque
  [
    '\u{1f6d5}',
  ], // 🛕 E12.0 hindu temple
  [
    '\u{1f54d}',
  ], // 🕍 E1.0 synagogue
  [
    '\u26e9\ufe0f',
  ], // ⛩️ E0.7 shinto shrine
  [
    '\u26e9',
  ], // ⛩ E0.7 shinto shrine
  [
    '\u{1f54b}',
  ], // 🕋 E1.0 kaaba
  [
    '\u26f2',
  ], // ⛲ E0.6 fountain
  [
    '\u26fa',
  ], // ⛺ E0.6 tent
  [
    '\u{1f301}',
  ], // 🌁 E0.6 foggy
  [
    '\u{1f303}',
  ], // 🌃 E0.6 night with stars
  [
    '\u{1f3d9}\ufe0f',
  ], // 🏙️ E0.7 cityscape
  [
    '\u{1f3d9}',
  ], // 🏙 E0.7 cityscape
  [
    '\u{1f304}',
  ], // 🌄 E0.6 sunrise over mountains
  [
    '\u{1f305}',
  ], // 🌅 E0.6 sunrise
  [
    '\u{1f306}',
  ], // 🌆 E0.6 cityscape at dusk
  [
    '\u{1f307}',
  ], // 🌇 E0.6 sunset
  [
    '\u{1f309}',
  ], // 🌉 E0.6 bridge at night
  [
    '\u2668\ufe0f',
  ], // ♨️ E0.6 hot springs
  [
    '\u2668',
  ], // ♨ E0.6 hot springs
  [
    '\u{1f3a0}',
  ], // 🎠 E0.6 carousel horse
  [
    '\u{1f6dd}',
  ], // 🛝 E14.0 playground slide
  [
    '\u{1f3a1}',
  ], // 🎡 E0.6 ferris wheel
  [
    '\u{1f3a2}',
  ], // 🎢 E0.6 roller coaster
  [
    '\u{1f488}',
  ], // 💈 E0.6 barber pole
  [
    '\u{1f3aa}',
  ], // 🎪 E0.6 circus tent
  [
    '\u{1f682}',
  ], // 🚂 E1.0 locomotive
  [
    '\u{1f683}',
  ], // 🚃 E0.6 railway car
  [
    '\u{1f684}',
  ], // 🚄 E0.6 high-speed train
  [
    '\u{1f685}',
  ], // 🚅 E0.6 bullet train
  [
    '\u{1f686}',
  ], // 🚆 E1.0 train
  [
    '\u{1f687}',
  ], // 🚇 E0.6 metro
  [
    '\u{1f688}',
  ], // 🚈 E1.0 light rail
  [
    '\u{1f689}',
  ], // 🚉 E0.6 station
  [
    '\u{1f68a}',
  ], // 🚊 E1.0 tram
  [
    '\u{1f69d}',
  ], // 🚝 E1.0 monorail
  [
    '\u{1f69e}',
  ], // 🚞 E1.0 mountain railway
  [
    '\u{1f68b}',
  ], // 🚋 E1.0 tram car
  [
    '\u{1f68c}',
  ], // 🚌 E0.6 bus
  [
    '\u{1f68d}',
  ], // 🚍 E0.7 oncoming bus
  [
    '\u{1f68e}',
  ], // 🚎 E1.0 trolleybus
  [
    '\u{1f690}',
  ], // 🚐 E1.0 minibus
  [
    '\u{1f691}',
  ], // 🚑 E0.6 ambulance
  [
    '\u{1f692}',
  ], // 🚒 E0.6 fire engine
  [
    '\u{1f693}',
  ], // 🚓 E0.6 police car
  [
    '\u{1f694}',
  ], // 🚔 E0.7 oncoming police car
  [
    '\u{1f695}',
  ], // 🚕 E0.6 taxi
  [
    '\u{1f696}',
  ], // 🚖 E1.0 oncoming taxi
  [
    '\u{1f697}',
  ], // 🚗 E0.6 automobile
  [
    '\u{1f698}',
  ], // 🚘 E0.7 oncoming automobile
  [
    '\u{1f699}',
  ], // 🚙 E0.6 sport utility vehicle
  [
    '\u{1f6fb}',
  ], // 🛻 E13.0 pickup truck
  [
    '\u{1f69a}',
  ], // 🚚 E0.6 delivery truck
  [
    '\u{1f69b}',
  ], // 🚛 E1.0 articulated lorry
  [
    '\u{1f69c}',
  ], // 🚜 E1.0 tractor
  [
    '\u{1f3ce}\ufe0f',
  ], // 🏎️ E0.7 racing car
  [
    '\u{1f3ce}',
  ], // 🏎 E0.7 racing car
  [
    '\u{1f3cd}\ufe0f',
  ], // 🏍️ E0.7 motorcycle
  [
    '\u{1f3cd}',
  ], // 🏍 E0.7 motorcycle
  [
    '\u{1f6f5}',
  ], // 🛵 E3.0 motor scooter
  [
    '\u{1f9bd}',
  ], // 🦽 E12.0 manual wheelchair
  [
    '\u{1f9bc}',
  ], // 🦼 E12.0 motorized wheelchair
  [
    '\u{1f6fa}',
  ], // 🛺 E12.0 auto rickshaw
  [
    '\u{1f6b2}',
  ], // 🚲 E0.6 bicycle
  [
    '\u{1f6f4}',
  ], // 🛴 E3.0 kick scooter
  [
    '\u{1f6f9}',
  ], // 🛹 E11.0 skateboard
  [
    '\u{1f6fc}',
  ], // 🛼 E13.0 roller skate
  [
    '\u{1f68f}',
  ], // 🚏 E0.6 bus stop
  [
    '\u{1f6e3}\ufe0f',
  ], // 🛣️ E0.7 motorway
  [
    '\u{1f6e3}',
  ], // 🛣 E0.7 motorway
  [
    '\u{1f6e4}\ufe0f',
  ], // 🛤️ E0.7 railway track
  [
    '\u{1f6e4}',
  ], // 🛤 E0.7 railway track
  [
    '\u{1f6e2}\ufe0f',
  ], // 🛢️ E0.7 oil drum
  [
    '\u{1f6e2}',
  ], // 🛢 E0.7 oil drum
  [
    '\u26fd',
  ], // ⛽ E0.6 fuel pump
  [
    '\u{1f6de}',
  ], // 🛞 E14.0 wheel
  [
    '\u{1f6a8}',
  ], // 🚨 E0.6 police car light
  [
    '\u{1f6a5}',
  ], // 🚥 E0.6 horizontal traffic light
  [
    '\u{1f6a6}',
  ], // 🚦 E1.0 vertical traffic light
  [
    '\u{1f6d1}',
  ], // 🛑 E3.0 stop sign
  [
    '\u{1f6a7}',
  ], // 🚧 E0.6 construction
  [
    '\u2693',
  ], // ⚓ E0.6 anchor
  [
    '\u{1f6df}',
  ], // 🛟 E14.0 ring buoy
  [
    '\u26f5',
  ], // ⛵ E0.6 sailboat
  [
    '\u{1f6f6}',
  ], // 🛶 E3.0 canoe
  [
    '\u{1f6a4}',
  ], // 🚤 E0.6 speedboat
  [
    '\u{1f6f3}\ufe0f',
  ], // 🛳️ E0.7 passenger ship
  [
    '\u{1f6f3}',
  ], // 🛳 E0.7 passenger ship
  [
    '\u26f4\ufe0f',
  ], // ⛴️ E0.7 ferry
  [
    '\u26f4',
  ], // ⛴ E0.7 ferry
  [
    '\u{1f6e5}\ufe0f',
  ], // 🛥️ E0.7 motor boat
  [
    '\u{1f6e5}',
  ], // 🛥 E0.7 motor boat
  [
    '\u{1f6a2}',
  ], // 🚢 E0.6 ship
  [
    '\u2708\ufe0f',
  ], // ✈️ E0.6 airplane
  [
    '\u2708',
  ], // ✈ E0.6 airplane
  [
    '\u{1f6e9}\ufe0f',
  ], // 🛩️ E0.7 small airplane
  [
    '\u{1f6e9}',
  ], // 🛩 E0.7 small airplane
  [
    '\u{1f6eb}',
  ], // 🛫 E1.0 airplane departure
  [
    '\u{1f6ec}',
  ], // 🛬 E1.0 airplane arrival
  [
    '\u{1fa82}',
  ], // 🪂 E12.0 parachute
  [
    '\u{1f4ba}',
  ], // 💺 E0.6 seat
  [
    '\u{1f681}',
  ], // 🚁 E1.0 helicopter
  [
    '\u{1f69f}',
  ], // 🚟 E1.0 suspension railway
  [
    '\u{1f6a0}',
  ], // 🚠 E1.0 mountain cableway
  [
    '\u{1f6a1}',
  ], // 🚡 E1.0 aerial tramway
  [
    '\u{1f6f0}\ufe0f',
  ], // 🛰️ E0.7 satellite
  [
    '\u{1f6f0}',
  ], // 🛰 E0.7 satellite
  [
    '\u{1f680}',
  ], // 🚀 E0.6 rocket
  [
    '\u{1f6f8}',
  ], // 🛸 E5.0 flying saucer
  [
    '\u{1f6ce}\ufe0f',
  ], // 🛎️ E0.7 bellhop bell
  [
    '\u{1f6ce}',
  ], // 🛎 E0.7 bellhop bell
  [
    '\u{1f9f3}',
  ], // 🧳 E11.0 luggage
  [
    '\u231b',
  ], // ⌛ E0.6 hourglass done
  [
    '\u23f3',
  ], // ⏳ E0.6 hourglass not done
  [
    '\u231a',
  ], // ⌚ E0.6 watch
  [
    '\u23f0',
  ], // ⏰ E0.6 alarm clock
  [
    '\u23f1\ufe0f',
  ], // ⏱️ E1.0 stopwatch
  [
    '\u23f1',
  ], // ⏱ E1.0 stopwatch
  [
    '\u23f2\ufe0f',
  ], // ⏲️ E1.0 timer clock
  [
    '\u23f2',
  ], // ⏲ E1.0 timer clock
  [
    '\u{1f570}\ufe0f',
  ], // 🕰️ E0.7 mantelpiece clock
  [
    '\u{1f570}',
  ], // 🕰 E0.7 mantelpiece clock
  [
    '\u{1f55b}',
  ], // 🕛 E0.6 twelve o’clock
  [
    '\u{1f567}',
  ], // 🕧 E0.7 twelve-thirty
  [
    '\u{1f550}',
  ], // 🕐 E0.6 one o’clock
  [
    '\u{1f55c}',
  ], // 🕜 E0.7 one-thirty
  [
    '\u{1f551}',
  ], // 🕑 E0.6 two o’clock
  [
    '\u{1f55d}',
  ], // 🕝 E0.7 two-thirty
  [
    '\u{1f552}',
  ], // 🕒 E0.6 three o’clock
  [
    '\u{1f55e}',
  ], // 🕞 E0.7 three-thirty
  [
    '\u{1f553}',
  ], // 🕓 E0.6 four o’clock
  [
    '\u{1f55f}',
  ], // 🕟 E0.7 four-thirty
  [
    '\u{1f554}',
  ], // 🕔 E0.6 five o’clock
  [
    '\u{1f560}',
  ], // 🕠 E0.7 five-thirty
  [
    '\u{1f555}',
  ], // 🕕 E0.6 six o’clock
  [
    '\u{1f561}',
  ], // 🕡 E0.7 six-thirty
  [
    '\u{1f556}',
  ], // 🕖 E0.6 seven o’clock
  [
    '\u{1f562}',
  ], // 🕢 E0.7 seven-thirty
  [
    '\u{1f557}',
  ], // 🕗 E0.6 eight o’clock
  [
    '\u{1f563}',
  ], // 🕣 E0.7 eight-thirty
  [
    '\u{1f558}',
  ], // 🕘 E0.6 nine o’clock
  [
    '\u{1f564}',
  ], // 🕤 E0.7 nine-thirty
  [
    '\u{1f559}',
  ], // 🕙 E0.6 ten o’clock
  [
    '\u{1f565}',
  ], // 🕥 E0.7 ten-thirty
  [
    '\u{1f55a}',
  ], // 🕚 E0.6 eleven o’clock
  [
    '\u{1f566}',
  ], // 🕦 E0.7 eleven-thirty
  [
    '\u{1f311}',
  ], // 🌑 E0.6 new moon
  [
    '\u{1f312}',
  ], // 🌒 E1.0 waxing crescent moon
  [
    '\u{1f313}',
  ], // 🌓 E0.6 first quarter moon
  [
    '\u{1f314}',
  ], // 🌔 E0.6 waxing gibbous moon
  [
    '\u{1f315}',
  ], // 🌕 E0.6 full moon
  [
    '\u{1f316}',
  ], // 🌖 E1.0 waning gibbous moon
  [
    '\u{1f317}',
  ], // 🌗 E1.0 last quarter moon
  [
    '\u{1f318}',
  ], // 🌘 E1.0 waning crescent moon
  [
    '\u{1f319}',
  ], // 🌙 E0.6 crescent moon
  [
    '\u{1f31a}',
  ], // 🌚 E1.0 new moon face
  [
    '\u{1f31b}',
  ], // 🌛 E0.6 first quarter moon face
  [
    '\u{1f31c}',
  ], // 🌜 E0.7 last quarter moon face
  [
    '\u{1f321}\ufe0f',
  ], // 🌡️ E0.7 thermometer
  [
    '\u{1f321}',
  ], // 🌡 E0.7 thermometer
  [
    '\u2600\ufe0f',
  ], // ☀️ E0.6 sun
  [
    '\u2600',
  ], // ☀ E0.6 sun
  [
    '\u{1f31d}',
  ], // 🌝 E1.0 full moon face
  [
    '\u{1f31e}',
  ], // 🌞 E1.0 sun with face
  [
    '\u{1fa90}',
  ], // 🪐 E12.0 ringed planet
  [
    '\u2b50',
  ], // ⭐ E0.6 star
  [
    '\u{1f31f}',
  ], // 🌟 E0.6 glowing star
  [
    '\u{1f320}',
  ], // 🌠 E0.6 shooting star
  [
    '\u{1f30c}',
  ], // 🌌 E0.6 milky way
  [
    '\u2601\ufe0f',
  ], // ☁️ E0.6 cloud
  [
    '\u2601',
  ], // ☁ E0.6 cloud
  [
    '\u26c5',
  ], // ⛅ E0.6 sun behind cloud
  [
    '\u26c8\ufe0f',
  ], // ⛈️ E0.7 cloud with lightning and rain
  [
    '\u26c8',
  ], // ⛈ E0.7 cloud with lightning and rain
  [
    '\u{1f324}\ufe0f',
  ], // 🌤️ E0.7 sun behind small cloud
  [
    '\u{1f324}',
  ], // 🌤 E0.7 sun behind small cloud
  [
    '\u{1f325}\ufe0f',
  ], // 🌥️ E0.7 sun behind large cloud
  [
    '\u{1f325}',
  ], // 🌥 E0.7 sun behind large cloud
  [
    '\u{1f326}\ufe0f',
  ], // 🌦️ E0.7 sun behind rain cloud
  [
    '\u{1f326}',
  ], // 🌦 E0.7 sun behind rain cloud
  [
    '\u{1f327}\ufe0f',
  ], // 🌧️ E0.7 cloud with rain
  [
    '\u{1f327}',
  ], // 🌧 E0.7 cloud with rain
  [
    '\u{1f328}\ufe0f',
  ], // 🌨️ E0.7 cloud with snow
  [
    '\u{1f328}',
  ], // 🌨 E0.7 cloud with snow
  [
    '\u{1f329}\ufe0f',
  ], // 🌩️ E0.7 cloud with lightning
  [
    '\u{1f329}',
  ], // 🌩 E0.7 cloud with lightning
  [
    '\u{1f32a}\ufe0f',
  ], // 🌪️ E0.7 tornado
  [
    '\u{1f32a}',
  ], // 🌪 E0.7 tornado
  [
    '\u{1f32b}\ufe0f',
  ], // 🌫️ E0.7 fog
  [
    '\u{1f32b}',
  ], // 🌫 E0.7 fog
  [
    '\u{1f32c}\ufe0f',
  ], // 🌬️ E0.7 wind face
  [
    '\u{1f32c}',
  ], // 🌬 E0.7 wind face
  [
    '\u{1f300}',
  ], // 🌀 E0.6 cyclone
  [
    '\u{1f308}',
  ], // 🌈 E0.6 rainbow
  [
    '\u{1f302}',
  ], // 🌂 E0.6 closed umbrella
  [
    '\u2602\ufe0f',
  ], // ☂️ E0.7 umbrella
  [
    '\u2602',
  ], // ☂ E0.7 umbrella
  [
    '\u2614',
  ], // ☔ E0.6 umbrella with rain drops
  [
    '\u26f1\ufe0f',
  ], // ⛱️ E0.7 umbrella on ground
  [
    '\u26f1',
  ], // ⛱ E0.7 umbrella on ground
  [
    '\u26a1',
  ], // ⚡ E0.6 high voltage
  [
    '\u2744\ufe0f',
  ], // ❄️ E0.6 snowflake
  [
    '\u2744',
  ], // ❄ E0.6 snowflake
  [
    '\u2603\ufe0f',
  ], // ☃️ E0.7 snowman
  [
    '\u2603',
  ], // ☃ E0.7 snowman
  [
    '\u26c4',
  ], // ⛄ E0.6 snowman without snow
  [
    '\u2604\ufe0f',
  ], // ☄️ E1.0 comet
  [
    '\u2604',
  ], // ☄ E1.0 comet
  [
    '\u{1f525}',
  ], // 🔥 E0.6 fire
  [
    '\u{1f4a7}',
  ], // 💧 E0.6 droplet
  [
    '\u{1f30a}',
  ], // 🌊 E0.6 water wave
  [
    '\u{1f383}',
  ], // 🎃 E0.6 jack-o-lantern
  [
    '\u{1f384}',
  ], // 🎄 E0.6 Christmas tree
  [
    '\u{1f386}',
  ], // 🎆 E0.6 fireworks
  [
    '\u{1f387}',
  ], // 🎇 E0.6 sparkler
  [
    '\u{1f9e8}',
  ], // 🧨 E11.0 firecracker
  [
    '\u2728',
  ], // ✨ E0.6 sparkles
  [
    '\u{1f388}',
  ], // 🎈 E0.6 balloon
  [
    '\u{1f389}',
  ], // 🎉 E0.6 party popper
  [
    '\u{1f38a}',
  ], // 🎊 E0.6 confetti ball
  [
    '\u{1f38b}',
  ], // 🎋 E0.6 tanabata tree
  [
    '\u{1f38d}',
  ], // 🎍 E0.6 pine decoration
  [
    '\u{1f38e}',
  ], // 🎎 E0.6 Japanese dolls
  [
    '\u{1f38f}',
  ], // 🎏 E0.6 carp streamer
  [
    '\u{1f390}',
  ], // 🎐 E0.6 wind chime
  [
    '\u{1f391}',
  ], // 🎑 E0.6 moon viewing ceremony
  [
    '\u{1f9e7}',
  ], // 🧧 E11.0 red envelope
  [
    '\u{1f380}',
  ], // 🎀 E0.6 ribbon
  [
    '\u{1f381}',
  ], // 🎁 E0.6 wrapped gift
  [
    '\u{1f397}\ufe0f',
  ], // 🎗️ E0.7 reminder ribbon
  [
    '\u{1f397}',
  ], // 🎗 E0.7 reminder ribbon
  [
    '\u{1f39f}\ufe0f',
  ], // 🎟️ E0.7 admission tickets
  [
    '\u{1f39f}',
  ], // 🎟 E0.7 admission tickets
  [
    '\u{1f3ab}',
  ], // 🎫 E0.6 ticket
  [
    '\u{1f396}\ufe0f',
  ], // 🎖️ E0.7 military medal
  [
    '\u{1f396}',
  ], // 🎖 E0.7 military medal
  [
    '\u{1f3c6}',
  ], // 🏆 E0.6 trophy
  [
    '\u{1f3c5}',
  ], // 🏅 E1.0 sports medal
  [
    '\u{1f947}',
  ], // 🥇 E3.0 1st place medal
  [
    '\u{1f948}',
  ], // 🥈 E3.0 2nd place medal
  [
    '\u{1f949}',
  ], // 🥉 E3.0 3rd place medal
  [
    '\u26bd',
  ], // ⚽ E0.6 soccer ball
  [
    '\u26be',
  ], // ⚾ E0.6 baseball
  [
    '\u{1f94e}',
  ], // 🥎 E11.0 softball
  [
    '\u{1f3c0}',
  ], // 🏀 E0.6 basketball
  [
    '\u{1f3d0}',
  ], // 🏐 E1.0 volleyball
  [
    '\u{1f3c8}',
  ], // 🏈 E0.6 american football
  [
    '\u{1f3c9}',
  ], // 🏉 E1.0 rugby football
  [
    '\u{1f3be}',
  ], // 🎾 E0.6 tennis
  [
    '\u{1f94f}',
  ], // 🥏 E11.0 flying disc
  [
    '\u{1f3b3}',
  ], // 🎳 E0.6 bowling
  [
    '\u{1f3cf}',
  ], // 🏏 E1.0 cricket game
  [
    '\u{1f3d1}',
  ], // 🏑 E1.0 field hockey
  [
    '\u{1f3d2}',
  ], // 🏒 E1.0 ice hockey
  [
    '\u{1f94d}',
  ], // 🥍 E11.0 lacrosse
  [
    '\u{1f3d3}',
  ], // 🏓 E1.0 ping pong
  [
    '\u{1f3f8}',
  ], // 🏸 E1.0 badminton
  [
    '\u{1f94a}',
  ], // 🥊 E3.0 boxing glove
  [
    '\u{1f94b}',
  ], // 🥋 E3.0 martial arts uniform
  [
    '\u{1f945}',
  ], // 🥅 E3.0 goal net
  [
    '\u26f3',
  ], // ⛳ E0.6 flag in hole
  [
    '\u26f8\ufe0f',
  ], // ⛸️ E0.7 ice skate
  [
    '\u26f8',
  ], // ⛸ E0.7 ice skate
  [
    '\u{1f3a3}',
  ], // 🎣 E0.6 fishing pole
  [
    '\u{1f93f}',
  ], // 🤿 E12.0 diving mask
  [
    '\u{1f3bd}',
  ], // 🎽 E0.6 running shirt
  [
    '\u{1f3bf}',
  ], // 🎿 E0.6 skis
  [
    '\u{1f6f7}',
  ], // 🛷 E5.0 sled
  [
    '\u{1f94c}',
  ], // 🥌 E5.0 curling stone
  [
    '\u{1f3af}',
  ], // 🎯 E0.6 bullseye
  [
    '\u{1fa80}',
  ], // 🪀 E12.0 yo-yo
  [
    '\u{1fa81}',
  ], // 🪁 E12.0 kite
  [
    '\u{1f52b}',
  ], // 🔫 E0.6 water pistol
  [
    '\u{1f3b1}',
  ], // 🎱 E0.6 pool 8 ball
  [
    '\u{1f52e}',
  ], // 🔮 E0.6 crystal ball
  [
    '\u{1fa84}',
  ], // 🪄 E13.0 magic wand
  [
    '\u{1f3ae}',
  ], // 🎮 E0.6 video game
  [
    '\u{1f579}\ufe0f',
  ], // 🕹️ E0.7 joystick
  [
    '\u{1f579}',
  ], // 🕹 E0.7 joystick
  [
    '\u{1f3b0}',
  ], // 🎰 E0.6 slot machine
  [
    '\u{1f3b2}',
  ], // 🎲 E0.6 game die
  [
    '\u{1f9e9}',
  ], // 🧩 E11.0 puzzle piece
  [
    '\u{1f9f8}',
  ], // 🧸 E11.0 teddy bear
  [
    '\u{1fa85}',
  ], // 🪅 E13.0 piñata
  [
    '\u{1faa9}',
  ], // 🪩 E14.0 mirror ball
  [
    '\u{1fa86}',
  ], // 🪆 E13.0 nesting dolls
  [
    '\u2660\ufe0f',
  ], // ♠️ E0.6 spade suit
  [
    '\u2660',
  ], // ♠ E0.6 spade suit
  [
    '\u2665\ufe0f',
  ], // ♥️ E0.6 heart suit
  [
    '\u2665',
  ], // ♥ E0.6 heart suit
  [
    '\u2666\ufe0f',
  ], // ♦️ E0.6 diamond suit
  [
    '\u2666',
  ], // ♦ E0.6 diamond suit
  [
    '\u2663\ufe0f',
  ], // ♣️ E0.6 club suit
  [
    '\u2663',
  ], // ♣ E0.6 club suit
  [
    '\u265f\ufe0f',
  ], // ♟️ E11.0 chess pawn
  [
    '\u265f',
  ], // ♟ E11.0 chess pawn
  [
    '\u{1f0cf}',
  ], // 🃏 E0.6 joker
  [
    '\u{1f004}',
  ], // 🀄 E0.6 mahjong red dragon
  [
    '\u{1f3b4}',
  ], // 🎴 E0.6 flower playing cards
  [
    '\u{1f3ad}',
  ], // 🎭 E0.6 performing arts
  [
    '\u{1f5bc}\ufe0f',
  ], // 🖼️ E0.7 framed picture
  [
    '\u{1f5bc}',
  ], // 🖼 E0.7 framed picture
  [
    '\u{1f3a8}',
  ], // 🎨 E0.6 artist palette
  [
    '\u{1f9f5}',
  ], // 🧵 E11.0 thread
  [
    '\u{1faa1}',
  ], // 🪡 E13.0 sewing needle
  [
    '\u{1f9f6}',
  ], // 🧶 E11.0 yarn
  [
    '\u{1faa2}',
  ], // 🪢 E13.0 knot
  [
    '\u{1f453}',
  ], // 👓 E0.6 glasses
  [
    '\u{1f576}\ufe0f',
  ], // 🕶️ E0.7 sunglasses
  [
    '\u{1f576}',
  ], // 🕶 E0.7 sunglasses
  [
    '\u{1f97d}',
  ], // 🥽 E11.0 goggles
  [
    '\u{1f97c}',
  ], // 🥼 E11.0 lab coat
  [
    '\u{1f9ba}',
  ], // 🦺 E12.0 safety vest
  [
    '\u{1f454}',
  ], // 👔 E0.6 necktie
  [
    '\u{1f455}',
  ], // 👕 E0.6 t-shirt
  [
    '\u{1f456}',
  ], // 👖 E0.6 jeans
  [
    '\u{1f9e3}',
  ], // 🧣 E5.0 scarf
  [
    '\u{1f9e4}',
  ], // 🧤 E5.0 gloves
  [
    '\u{1f9e5}',
  ], // 🧥 E5.0 coat
  [
    '\u{1f9e6}',
  ], // 🧦 E5.0 socks
  [
    '\u{1f457}',
  ], // 👗 E0.6 dress
  [
    '\u{1f458}',
  ], // 👘 E0.6 kimono
  [
    '\u{1f97b}',
  ], // 🥻 E12.0 sari
  [
    '\u{1fa71}',
  ], // 🩱 E12.0 one-piece swimsuit
  [
    '\u{1fa72}',
  ], // 🩲 E12.0 briefs
  [
    '\u{1fa73}',
  ], // 🩳 E12.0 shorts
  [
    '\u{1f459}',
  ], // 👙 E0.6 bikini
  [
    '\u{1f45a}',
  ], // 👚 E0.6 woman’s clothes
  [
    '\u{1faad}',
  ], // 🪭 E15.0 folding hand fan
  [
    '\u{1f45b}',
  ], // 👛 E0.6 purse
  [
    '\u{1f45c}',
  ], // 👜 E0.6 handbag
  [
    '\u{1f45d}',
  ], // 👝 E0.6 clutch bag
  [
    '\u{1f6cd}\ufe0f',
  ], // 🛍️ E0.7 shopping bags
  [
    '\u{1f6cd}',
  ], // 🛍 E0.7 shopping bags
  [
    '\u{1f392}',
  ], // 🎒 E0.6 backpack
  [
    '\u{1fa74}',
  ], // 🩴 E13.0 thong sandal
  [
    '\u{1f45e}',
  ], // 👞 E0.6 man’s shoe
  [
    '\u{1f45f}',
  ], // 👟 E0.6 running shoe
  [
    '\u{1f97e}',
  ], // 🥾 E11.0 hiking boot
  [
    '\u{1f97f}',
  ], // 🥿 E11.0 flat shoe
  [
    '\u{1f460}',
  ], // 👠 E0.6 high-heeled shoe
  [
    '\u{1f461}',
  ], // 👡 E0.6 woman’s sandal
  [
    '\u{1fa70}',
  ], // 🩰 E12.0 ballet shoes
  [
    '\u{1f462}',
  ], // 👢 E0.6 woman’s boot
  [
    '\u{1faae}',
  ], // 🪮 E15.0 hair pick
  [
    '\u{1f451}',
  ], // 👑 E0.6 crown
  [
    '\u{1f452}',
  ], // 👒 E0.6 woman’s hat
  [
    '\u{1f3a9}',
  ], // 🎩 E0.6 top hat
  [
    '\u{1f393}',
  ], // 🎓 E0.6 graduation cap
  [
    '\u{1f9e2}',
  ], // 🧢 E5.0 billed cap
  [
    '\u{1fa96}',
  ], // 🪖 E13.0 military helmet
  [
    '\u26d1\ufe0f',
  ], // ⛑️ E0.7 rescue worker’s helmet
  [
    '\u26d1',
  ], // ⛑ E0.7 rescue worker’s helmet
  [
    '\u{1f4ff}',
  ], // 📿 E1.0 prayer beads
  [
    '\u{1f484}',
  ], // 💄 E0.6 lipstick
  [
    '\u{1f48d}',
  ], // 💍 E0.6 ring
  [
    '\u{1f48e}',
  ], // 💎 E0.6 gem stone
  [
    '\u{1f507}',
  ], // 🔇 E1.0 muted speaker
  [
    '\u{1f508}',
  ], // 🔈 E0.7 speaker low volume
  [
    '\u{1f509}',
  ], // 🔉 E1.0 speaker medium volume
  [
    '\u{1f50a}',
  ], // 🔊 E0.6 speaker high volume
  [
    '\u{1f4e2}',
  ], // 📢 E0.6 loudspeaker
  [
    '\u{1f4e3}',
  ], // 📣 E0.6 megaphone
  [
    '\u{1f4ef}',
  ], // 📯 E1.0 postal horn
  [
    '\u{1f514}',
  ], // 🔔 E0.6 bell
  [
    '\u{1f515}',
  ], // 🔕 E1.0 bell with slash
  [
    '\u{1f3bc}',
  ], // 🎼 E0.6 musical score
  [
    '\u{1f3b5}',
  ], // 🎵 E0.6 musical note
  [
    '\u{1f3b6}',
  ], // 🎶 E0.6 musical notes
  [
    '\u{1f399}\ufe0f',
  ], // 🎙️ E0.7 studio microphone
  [
    '\u{1f399}',
  ], // 🎙 E0.7 studio microphone
  [
    '\u{1f39a}\ufe0f',
  ], // 🎚️ E0.7 level slider
  [
    '\u{1f39a}',
  ], // 🎚 E0.7 level slider
  [
    '\u{1f39b}\ufe0f',
  ], // 🎛️ E0.7 control knobs
  [
    '\u{1f39b}',
  ], // 🎛 E0.7 control knobs
  [
    '\u{1f3a4}',
  ], // 🎤 E0.6 microphone
  [
    '\u{1f3a7}',
  ], // 🎧 E0.6 headphone
  [
    '\u{1f4fb}',
  ], // 📻 E0.6 radio
  [
    '\u{1f3b7}',
  ], // 🎷 E0.6 saxophone
  [
    '\u{1fa97}',
  ], // 🪗 E13.0 accordion
  [
    '\u{1f3b8}',
  ], // 🎸 E0.6 guitar
  [
    '\u{1f3b9}',
  ], // 🎹 E0.6 musical keyboard
  [
    '\u{1f3ba}',
  ], // 🎺 E0.6 trumpet
  [
    '\u{1f3bb}',
  ], // 🎻 E0.6 violin
  [
    '\u{1fa95}',
  ], // 🪕 E12.0 banjo
  [
    '\u{1f941}',
  ], // 🥁 E3.0 drum
  [
    '\u{1fa98}',
  ], // 🪘 E13.0 long drum
  [
    '\u{1fa87}',
  ], // 🪇 E15.0 maracas
  [
    '\u{1fa88}',
  ], // 🪈 E15.0 flute
  [
    '\u{1fa89}',
  ], // 🪉 E16.0 harp
  [
    '\u{1f4f1}',
  ], // 📱 E0.6 mobile phone
  [
    '\u{1f4f2}',
  ], // 📲 E0.6 mobile phone with arrow
  [
    '\u260e\ufe0f',
  ], // ☎️ E0.6 telephone
  [
    '\u260e',
  ], // ☎ E0.6 telephone
  [
    '\u{1f4de}',
  ], // 📞 E0.6 telephone receiver
  [
    '\u{1f4df}',
  ], // 📟 E0.6 pager
  [
    '\u{1f4e0}',
  ], // 📠 E0.6 fax machine
  [
    '\u{1f50b}',
  ], // 🔋 E0.6 battery
  [
    '\u{1faab}',
  ], // 🪫 E14.0 low battery
  [
    '\u{1f50c}',
  ], // 🔌 E0.6 electric plug
  [
    '\u{1f4bb}',
  ], // 💻 E0.6 laptop
  [
    '\u{1f5a5}\ufe0f',
  ], // 🖥️ E0.7 desktop computer
  [
    '\u{1f5a5}',
  ], // 🖥 E0.7 desktop computer
  [
    '\u{1f5a8}\ufe0f',
  ], // 🖨️ E0.7 printer
  [
    '\u{1f5a8}',
  ], // 🖨 E0.7 printer
  [
    '\u2328\ufe0f',
  ], // ⌨️ E1.0 keyboard
  [
    '\u2328',
  ], // ⌨ E1.0 keyboard
  [
    '\u{1f5b1}\ufe0f',
  ], // 🖱️ E0.7 computer mouse
  [
    '\u{1f5b1}',
  ], // 🖱 E0.7 computer mouse
  [
    '\u{1f5b2}\ufe0f',
  ], // 🖲️ E0.7 trackball
  [
    '\u{1f5b2}',
  ], // 🖲 E0.7 trackball
  [
    '\u{1f4bd}',
  ], // 💽 E0.6 computer disk
  [
    '\u{1f4be}',
  ], // 💾 E0.6 floppy disk
  [
    '\u{1f4bf}',
  ], // 💿 E0.6 optical disk
  [
    '\u{1f4c0}',
  ], // 📀 E0.6 dvd
  [
    '\u{1f9ee}',
  ], // 🧮 E11.0 abacus
  [
    '\u{1f3a5}',
  ], // 🎥 E0.6 movie camera
  [
    '\u{1f39e}\ufe0f',
  ], // 🎞️ E0.7 film frames
  [
    '\u{1f39e}',
  ], // 🎞 E0.7 film frames
  [
    '\u{1f4fd}\ufe0f',
  ], // 📽️ E0.7 film projector
  [
    '\u{1f4fd}',
  ], // 📽 E0.7 film projector
  [
    '\u{1f3ac}',
  ], // 🎬 E0.6 clapper board
  [
    '\u{1f4fa}',
  ], // 📺 E0.6 television
  [
    '\u{1f4f7}',
  ], // 📷 E0.6 camera
  [
    '\u{1f4f8}',
  ], // 📸 E1.0 camera with flash
  [
    '\u{1f4f9}',
  ], // 📹 E0.6 video camera
  [
    '\u{1f4fc}',
  ], // 📼 E0.6 videocassette
  [
    '\u{1f50d}',
  ], // 🔍 E0.6 magnifying glass tilted left
  [
    '\u{1f50e}',
  ], // 🔎 E0.6 magnifying glass tilted right
  [
    '\u{1f56f}\ufe0f',
  ], // 🕯️ E0.7 candle
  [
    '\u{1f56f}',
  ], // 🕯 E0.7 candle
  [
    '\u{1f4a1}',
  ], // 💡 E0.6 light bulb
  [
    '\u{1f526}',
  ], // 🔦 E0.6 flashlight
  [
    '\u{1f3ee}',
  ], // 🏮 E0.6 red paper lantern
  [
    '\u{1fa94}',
  ], // 🪔 E12.0 diya lamp
  [
    '\u{1f4d4}',
  ], // 📔 E0.6 notebook with decorative cover
  [
    '\u{1f4d5}',
  ], // 📕 E0.6 closed book
  [
    '\u{1f4d6}',
  ], // 📖 E0.6 open book
  [
    '\u{1f4d7}',
  ], // 📗 E0.6 green book
  [
    '\u{1f4d8}',
  ], // 📘 E0.6 blue book
  [
    '\u{1f4d9}',
  ], // 📙 E0.6 orange book
  [
    '\u{1f4da}',
  ], // 📚 E0.6 books
  [
    '\u{1f4d3}',
  ], // 📓 E0.6 notebook
  [
    '\u{1f4d2}',
  ], // 📒 E0.6 ledger
  [
    '\u{1f4c3}',
  ], // 📃 E0.6 page with curl
  [
    '\u{1f4dc}',
  ], // 📜 E0.6 scroll
  [
    '\u{1f4c4}',
  ], // 📄 E0.6 page facing up
  [
    '\u{1f4f0}',
  ], // 📰 E0.6 newspaper
  [
    '\u{1f5de}\ufe0f',
  ], // 🗞️ E0.7 rolled-up newspaper
  [
    '\u{1f5de}',
  ], // 🗞 E0.7 rolled-up newspaper
  [
    '\u{1f4d1}',
  ], // 📑 E0.6 bookmark tabs
  [
    '\u{1f516}',
  ], // 🔖 E0.6 bookmark
  [
    '\u{1f3f7}\ufe0f',
  ], // 🏷️ E0.7 label
  [
    '\u{1f3f7}',
  ], // 🏷 E0.7 label
  [
    '\u{1f4b0}',
  ], // 💰 E0.6 money bag
  [
    '\u{1fa99}',
  ], // 🪙 E13.0 coin
  [
    '\u{1f4b4}',
  ], // 💴 E0.6 yen banknote
  [
    '\u{1f4b5}',
  ], // 💵 E0.6 dollar banknote
  [
    '\u{1f4b6}',
  ], // 💶 E1.0 euro banknote
  [
    '\u{1f4b7}',
  ], // 💷 E1.0 pound banknote
  [
    '\u{1f4b8}',
  ], // 💸 E0.6 money with wings
  [
    '\u{1f4b3}',
  ], // 💳 E0.6 credit card
  [
    '\u{1f9fe}',
  ], // 🧾 E11.0 receipt
  [
    '\u{1f4b9}',
  ], // 💹 E0.6 chart increasing with yen
  [
    '\u2709\ufe0f',
  ], // ✉️ E0.6 envelope
  [
    '\u2709',
  ], // ✉ E0.6 envelope
  [
    '\u{1f4e7}',
  ], // 📧 E0.6 e-mail
  [
    '\u{1f4e8}',
  ], // 📨 E0.6 incoming envelope
  [
    '\u{1f4e9}',
  ], // 📩 E0.6 envelope with arrow
  [
    '\u{1f4e4}',
  ], // 📤 E0.6 outbox tray
  [
    '\u{1f4e5}',
  ], // 📥 E0.6 inbox tray
  [
    '\u{1f4e6}',
  ], // 📦 E0.6 package
  [
    '\u{1f4eb}',
  ], // 📫 E0.6 closed mailbox with raised flag
  [
    '\u{1f4ea}',
  ], // 📪 E0.6 closed mailbox with lowered flag
  [
    '\u{1f4ec}',
  ], // 📬 E0.7 open mailbox with raised flag
  [
    '\u{1f4ed}',
  ], // 📭 E0.7 open mailbox with lowered flag
  [
    '\u{1f4ee}',
  ], // 📮 E0.6 postbox
  [
    '\u{1f5f3}\ufe0f',
  ], // 🗳️ E0.7 ballot box with ballot
  [
    '\u{1f5f3}',
  ], // 🗳 E0.7 ballot box with ballot
  [
    '\u270f\ufe0f',
  ], // ✏️ E0.6 pencil
  [
    '\u270f',
  ], // ✏ E0.6 pencil
  [
    '\u2712\ufe0f',
  ], // ✒️ E0.6 black nib
  [
    '\u2712',
  ], // ✒ E0.6 black nib
  [
    '\u{1f58b}\ufe0f',
  ], // 🖋️ E0.7 fountain pen
  [
    '\u{1f58b}',
  ], // 🖋 E0.7 fountain pen
  [
    '\u{1f58a}\ufe0f',
  ], // 🖊️ E0.7 pen
  [
    '\u{1f58a}',
  ], // 🖊 E0.7 pen
  [
    '\u{1f58c}\ufe0f',
  ], // 🖌️ E0.7 paintbrush
  [
    '\u{1f58c}',
  ], // 🖌 E0.7 paintbrush
  [
    '\u{1f58d}\ufe0f',
  ], // 🖍️ E0.7 crayon
  [
    '\u{1f58d}',
  ], // 🖍 E0.7 crayon
  [
    '\u{1f4dd}',
  ], // 📝 E0.6 memo
  [
    '\u{1f4bc}',
  ], // 💼 E0.6 briefcase
  [
    '\u{1f4c1}',
  ], // 📁 E0.6 file folder
  [
    '\u{1f4c2}',
  ], // 📂 E0.6 open file folder
  [
    '\u{1f5c2}\ufe0f',
  ], // 🗂️ E0.7 card index dividers
  [
    '\u{1f5c2}',
  ], // 🗂 E0.7 card index dividers
  [
    '\u{1f4c5}',
  ], // 📅 E0.6 calendar
  [
    '\u{1f4c6}',
  ], // 📆 E0.6 tear-off calendar
  [
    '\u{1f5d2}\ufe0f',
  ], // 🗒️ E0.7 spiral notepad
  [
    '\u{1f5d2}',
  ], // 🗒 E0.7 spiral notepad
  [
    '\u{1f5d3}\ufe0f',
  ], // 🗓️ E0.7 spiral calendar
  [
    '\u{1f5d3}',
  ], // 🗓 E0.7 spiral calendar
  [
    '\u{1f4c7}',
  ], // 📇 E0.6 card index
  [
    '\u{1f4c8}',
  ], // 📈 E0.6 chart increasing
  [
    '\u{1f4c9}',
  ], // 📉 E0.6 chart decreasing
  [
    '\u{1f4ca}',
  ], // 📊 E0.6 bar chart
  [
    '\u{1f4cb}',
  ], // 📋 E0.6 clipboard
  [
    '\u{1f4cc}',
  ], // 📌 E0.6 pushpin
  [
    '\u{1f4cd}',
  ], // 📍 E0.6 round pushpin
  [
    '\u{1f4ce}',
  ], // 📎 E0.6 paperclip
  [
    '\u{1f587}\ufe0f',
  ], // 🖇️ E0.7 linked paperclips
  [
    '\u{1f587}',
  ], // 🖇 E0.7 linked paperclips
  [
    '\u{1f4cf}',
  ], // 📏 E0.6 straight ruler
  [
    '\u{1f4d0}',
  ], // 📐 E0.6 triangular ruler
  [
    '\u2702\ufe0f',
  ], // ✂️ E0.6 scissors
  [
    '\u2702',
  ], // ✂ E0.6 scissors
  [
    '\u{1f5c3}\ufe0f',
  ], // 🗃️ E0.7 card file box
  [
    '\u{1f5c3}',
  ], // 🗃 E0.7 card file box
  [
    '\u{1f5c4}\ufe0f',
  ], // 🗄️ E0.7 file cabinet
  [
    '\u{1f5c4}',
  ], // 🗄 E0.7 file cabinet
  [
    '\u{1f5d1}\ufe0f',
  ], // 🗑️ E0.7 wastebasket
  [
    '\u{1f5d1}',
  ], // 🗑 E0.7 wastebasket
  [
    '\u{1f512}',
  ], // 🔒 E0.6 locked
  [
    '\u{1f513}',
  ], // 🔓 E0.6 unlocked
  [
    '\u{1f50f}',
  ], // 🔏 E0.6 locked with pen
  [
    '\u{1f510}',
  ], // 🔐 E0.6 locked with key
  [
    '\u{1f511}',
  ], // 🔑 E0.6 key
  [
    '\u{1f5dd}\ufe0f',
  ], // 🗝️ E0.7 old key
  [
    '\u{1f5dd}',
  ], // 🗝 E0.7 old key
  [
    '\u{1f528}',
  ], // 🔨 E0.6 hammer
  [
    '\u{1fa93}',
  ], // 🪓 E12.0 axe
  [
    '\u26cf\ufe0f',
  ], // ⛏️ E0.7 pick
  [
    '\u26cf',
  ], // ⛏ E0.7 pick
  [
    '\u2692\ufe0f',
  ], // ⚒️ E1.0 hammer and pick
  [
    '\u2692',
  ], // ⚒ E1.0 hammer and pick
  [
    '\u{1f6e0}\ufe0f',
  ], // 🛠️ E0.7 hammer and wrench
  [
    '\u{1f6e0}',
  ], // 🛠 E0.7 hammer and wrench
  [
    '\u{1f5e1}\ufe0f',
  ], // 🗡️ E0.7 dagger
  [
    '\u{1f5e1}',
  ], // 🗡 E0.7 dagger
  [
    '\u2694\ufe0f',
  ], // ⚔️ E1.0 crossed swords
  [
    '\u2694',
  ], // ⚔ E1.0 crossed swords
  [
    '\u{1f4a3}',
  ], // 💣 E0.6 bomb
  [
    '\u{1fa83}',
  ], // 🪃 E13.0 boomerang
  [
    '\u{1f3f9}',
  ], // 🏹 E1.0 bow and arrow
  [
    '\u{1f6e1}\ufe0f',
  ], // 🛡️ E0.7 shield
  [
    '\u{1f6e1}',
  ], // 🛡 E0.7 shield
  [
    '\u{1fa9a}',
  ], // 🪚 E13.0 carpentry saw
  [
    '\u{1f527}',
  ], // 🔧 E0.6 wrench
  [
    '\u{1fa9b}',
  ], // 🪛 E13.0 screwdriver
  [
    '\u{1f529}',
  ], // 🔩 E0.6 nut and bolt
  [
    '\u2699\ufe0f',
  ], // ⚙️ E1.0 gear
  [
    '\u2699',
  ], // ⚙ E1.0 gear
  [
    '\u{1f5dc}\ufe0f',
  ], // 🗜️ E0.7 clamp
  [
    '\u{1f5dc}',
  ], // 🗜 E0.7 clamp
  [
    '\u2696\ufe0f',
  ], // ⚖️ E1.0 balance scale
  [
    '\u2696',
  ], // ⚖ E1.0 balance scale
  [
    '\u{1f9af}',
  ], // 🦯 E12.0 white cane
  [
    '\u{1f517}',
  ], // 🔗 E0.6 link
  [
    '\u26d3\ufe0f\u200d\u{1f4a5}',
  ], // ⛓️‍💥 E15.1 broken chain
  [
    '\u26d3\u200d\u{1f4a5}',
  ], // ⛓‍💥 E15.1 broken chain
  [
    '\u26d3\ufe0f',
  ], // ⛓️ E0.7 chains
  [
    '\u26d3',
  ], // ⛓ E0.7 chains
  [
    '\u{1fa9d}',
  ], // 🪝 E13.0 hook
  [
    '\u{1f9f0}',
  ], // 🧰 E11.0 toolbox
  [
    '\u{1f9f2}',
  ], // 🧲 E11.0 magnet
  [
    '\u{1fa9c}',
  ], // 🪜 E13.0 ladder
  [
    '\u{1fa8f}',
  ], // 🪏 E16.0 shovel
  [
    '\u2697\ufe0f',
  ], // ⚗️ E1.0 alembic
  [
    '\u2697',
  ], // ⚗ E1.0 alembic
  [
    '\u{1f9ea}',
  ], // 🧪 E11.0 test tube
  [
    '\u{1f9eb}',
  ], // 🧫 E11.0 petri dish
  [
    '\u{1f9ec}',
  ], // 🧬 E11.0 dna
  [
    '\u{1f52c}',
  ], // 🔬 E1.0 microscope
  [
    '\u{1f52d}',
  ], // 🔭 E1.0 telescope
  [
    '\u{1f4e1}',
  ], // 📡 E0.6 satellite antenna
  [
    '\u{1f489}',
  ], // 💉 E0.6 syringe
  [
    '\u{1fa78}',
  ], // 🩸 E12.0 drop of blood
  [
    '\u{1f48a}',
  ], // 💊 E0.6 pill
  [
    '\u{1fa79}',
  ], // 🩹 E12.0 adhesive bandage
  [
    '\u{1fa7c}',
  ], // 🩼 E14.0 crutch
  [
    '\u{1fa7a}',
  ], // 🩺 E12.0 stethoscope
  [
    '\u{1fa7b}',
  ], // 🩻 E14.0 x-ray
  [
    '\u{1f6aa}',
  ], // 🚪 E0.6 door
  [
    '\u{1f6d7}',
  ], // 🛗 E13.0 elevator
  [
    '\u{1fa9e}',
  ], // 🪞 E13.0 mirror
  [
    '\u{1fa9f}',
  ], // 🪟 E13.0 window
  [
    '\u{1f6cf}\ufe0f',
  ], // 🛏️ E0.7 bed
  [
    '\u{1f6cf}',
  ], // 🛏 E0.7 bed
  [
    '\u{1f6cb}\ufe0f',
  ], // 🛋️ E0.7 couch and lamp
  [
    '\u{1f6cb}',
  ], // 🛋 E0.7 couch and lamp
  [
    '\u{1fa91}',
  ], // 🪑 E12.0 chair
  [
    '\u{1f6bd}',
  ], // 🚽 E0.6 toilet
  [
    '\u{1faa0}',
  ], // 🪠 E13.0 plunger
  [
    '\u{1f6bf}',
  ], // 🚿 E1.0 shower
  [
    '\u{1f6c1}',
  ], // 🛁 E1.0 bathtub
  [
    '\u{1faa4}',
  ], // 🪤 E13.0 mouse trap
  [
    '\u{1fa92}',
  ], // 🪒 E12.0 razor
  [
    '\u{1f9f4}',
  ], // 🧴 E11.0 lotion bottle
  [
    '\u{1f9f7}',
  ], // 🧷 E11.0 safety pin
  [
    '\u{1f9f9}',
  ], // 🧹 E11.0 broom
  [
    '\u{1f9fa}',
  ], // 🧺 E11.0 basket
  [
    '\u{1f9fb}',
  ], // 🧻 E11.0 roll of paper
  [
    '\u{1faa3}',
  ], // 🪣 E13.0 bucket
  [
    '\u{1f9fc}',
  ], // 🧼 E11.0 soap
  [
    '\u{1fae7}',
  ], // 🫧 E14.0 bubbles
  [
    '\u{1faa5}',
  ], // 🪥 E13.0 toothbrush
  [
    '\u{1f9fd}',
  ], // 🧽 E11.0 sponge
  [
    '\u{1f9ef}',
  ], // 🧯 E11.0 fire extinguisher
  [
    '\u{1f6d2}',
  ], // 🛒 E3.0 shopping cart
  [
    '\u{1f6ac}',
  ], // 🚬 E0.6 cigarette
  [
    '\u26b0\ufe0f',
  ], // ⚰️ E1.0 coffin
  [
    '\u26b0',
  ], // ⚰ E1.0 coffin
  [
    '\u{1faa6}',
  ], // 🪦 E13.0 headstone
  [
    '\u26b1\ufe0f',
  ], // ⚱️ E1.0 funeral urn
  [
    '\u26b1',
  ], // ⚱ E1.0 funeral urn
  [
    '\u{1f9ff}',
  ], // 🧿 E11.0 nazar amulet
  [
    '\u{1faac}',
  ], // 🪬 E14.0 hamsa
  [
    '\u{1f5ff}',
  ], // 🗿 E0.6 moai
  [
    '\u{1faa7}',
  ], // 🪧 E13.0 placard
  [
    '\u{1faaa}',
  ], // 🪪 E14.0 identification card
  [
    '\u{1f3e7}',
  ], // 🏧 E0.6 ATM sign
  [
    '\u{1f6ae}',
  ], // 🚮 E1.0 litter in bin sign
  [
    '\u{1f6b0}',
  ], // 🚰 E1.0 potable water
  [
    '\u267f',
  ], // ♿ E0.6 wheelchair symbol
  [
    '\u{1f6b9}',
  ], // 🚹 E0.6 men’s room
  [
    '\u{1f6ba}',
  ], // 🚺 E0.6 women’s room
  [
    '\u{1f6bb}',
  ], // 🚻 E0.6 restroom
  [
    '\u{1f6bc}',
  ], // 🚼 E0.6 baby symbol
  [
    '\u{1f6be}',
  ], // 🚾 E0.6 water closet
  [
    '\u{1f6c2}',
  ], // 🛂 E1.0 passport control
  [
    '\u{1f6c3}',
  ], // 🛃 E1.0 customs
  [
    '\u{1f6c4}',
  ], // 🛄 E1.0 baggage claim
  [
    '\u{1f6c5}',
  ], // 🛅 E1.0 left luggage
  [
    '\u26a0\ufe0f',
  ], // ⚠️ E0.6 warning
  [
    '\u26a0',
  ], // ⚠ E0.6 warning
  [
    '\u{1f6b8}',
  ], // 🚸 E1.0 children crossing
  [
    '\u26d4',
  ], // ⛔ E0.6 no entry
  [
    '\u{1f6ab}',
  ], // 🚫 E0.6 prohibited
  [
    '\u{1f6b3}',
  ], // 🚳 E1.0 no bicycles
  [
    '\u{1f6ad}',
  ], // 🚭 E0.6 no smoking
  [
    '\u{1f6af}',
  ], // 🚯 E1.0 no littering
  [
    '\u{1f6b1}',
  ], // 🚱 E1.0 non-potable water
  [
    '\u{1f6b7}',
  ], // 🚷 E1.0 no pedestrians
  [
    '\u{1f4f5}',
  ], // 📵 E1.0 no mobile phones
  [
    '\u{1f51e}',
  ], // 🔞 E0.6 no one under eighteen
  [
    '\u2622\ufe0f',
  ], // ☢️ E1.0 radioactive
  [
    '\u2622',
  ], // ☢ E1.0 radioactive
  [
    '\u2623\ufe0f',
  ], // ☣️ E1.0 biohazard
  [
    '\u2623',
  ], // ☣ E1.0 biohazard
  [
    '\u2b06\ufe0f',
  ], // ⬆️ E0.6 up arrow
  [
    '\u2b06',
  ], // ⬆ E0.6 up arrow
  [
    '\u2197\ufe0f',
  ], // ↗️ E0.6 up-right arrow
  [
    '\u2197',
  ], // ↗ E0.6 up-right arrow
  [
    '\u27a1\ufe0f',
  ], // ➡️ E0.6 right arrow
  [
    '\u27a1',
  ], // ➡ E0.6 right arrow
  [
    '\u2198\ufe0f',
  ], // ↘️ E0.6 down-right arrow
  [
    '\u2198',
  ], // ↘ E0.6 down-right arrow
  [
    '\u2b07\ufe0f',
  ], // ⬇️ E0.6 down arrow
  [
    '\u2b07',
  ], // ⬇ E0.6 down arrow
  [
    '\u2199\ufe0f',
  ], // ↙️ E0.6 down-left arrow
  [
    '\u2199',
  ], // ↙ E0.6 down-left arrow
  [
    '\u2b05\ufe0f',
  ], // ⬅️ E0.6 left arrow
  [
    '\u2b05',
  ], // ⬅ E0.6 left arrow
  [
    '\u2196\ufe0f',
  ], // ↖️ E0.6 up-left arrow
  [
    '\u2196',
  ], // ↖ E0.6 up-left arrow
  [
    '\u2195\ufe0f',
  ], // ↕️ E0.6 up-down arrow
  [
    '\u2195',
  ], // ↕ E0.6 up-down arrow
  [
    '\u2194\ufe0f',
  ], // ↔️ E0.6 left-right arrow
  [
    '\u2194',
  ], // ↔ E0.6 left-right arrow
  [
    '\u21a9\ufe0f',
  ], // ↩️ E0.6 right arrow curving left
  [
    '\u21a9',
  ], // ↩ E0.6 right arrow curving left
  [
    '\u21aa\ufe0f',
  ], // ↪️ E0.6 left arrow curving right
  [
    '\u21aa',
  ], // ↪ E0.6 left arrow curving right
  [
    '\u2934\ufe0f',
  ], // ⤴️ E0.6 right arrow curving up
  [
    '\u2934',
  ], // ⤴ E0.6 right arrow curving up
  [
    '\u2935\ufe0f',
  ], // ⤵️ E0.6 right arrow curving down
  [
    '\u2935',
  ], // ⤵ E0.6 right arrow curving down
  [
    '\u{1f503}',
  ], // 🔃 E0.6 clockwise vertical arrows
  [
    '\u{1f504}',
  ], // 🔄 E1.0 counterclockwise arrows button
  [
    '\u{1f519}',
  ], // 🔙 E0.6 BACK arrow
  [
    '\u{1f51a}',
  ], // 🔚 E0.6 END arrow
  [
    '\u{1f51b}',
  ], // 🔛 E0.6 ON! arrow
  [
    '\u{1f51c}',
  ], // 🔜 E0.6 SOON arrow
  [
    '\u{1f51d}',
  ], // 🔝 E0.6 TOP arrow
  [
    '\u{1f6d0}',
  ], // 🛐 E1.0 place of worship
  [
    '\u269b\ufe0f',
  ], // ⚛️ E1.0 atom symbol
  [
    '\u269b',
  ], // ⚛ E1.0 atom symbol
  [
    '\u{1f549}\ufe0f',
  ], // 🕉️ E0.7 om
  [
    '\u{1f549}',
  ], // 🕉 E0.7 om
  [
    '\u2721\ufe0f',
  ], // ✡️ E0.7 star of David
  [
    '\u2721',
  ], // ✡ E0.7 star of David
  [
    '\u2638\ufe0f',
  ], // ☸️ E0.7 wheel of dharma
  [
    '\u2638',
  ], // ☸ E0.7 wheel of dharma
  [
    '\u262f\ufe0f',
  ], // ☯️ E0.7 yin yang
  [
    '\u262f',
  ], // ☯ E0.7 yin yang
  [
    '\u271d\ufe0f',
  ], // ✝️ E0.7 latin cross
  [
    '\u271d',
  ], // ✝ E0.7 latin cross
  [
    '\u2626\ufe0f',
  ], // ☦️ E1.0 orthodox cross
  [
    '\u2626',
  ], // ☦ E1.0 orthodox cross
  [
    '\u262a\ufe0f',
  ], // ☪️ E0.7 star and crescent
  [
    '\u262a',
  ], // ☪ E0.7 star and crescent
  [
    '\u262e\ufe0f',
  ], // ☮️ E1.0 peace symbol
  [
    '\u262e',
  ], // ☮ E1.0 peace symbol
  [
    '\u{1f54e}',
  ], // 🕎 E1.0 menorah
  [
    '\u{1f52f}',
  ], // 🔯 E0.6 dotted six-pointed star
  [
    '\u{1faaf}',
  ], // 🪯 E15.0 khanda
  [
    '\u2648',
  ], // ♈ E0.6 Aries
  [
    '\u2649',
  ], // ♉ E0.6 Taurus
  [
    '\u264a',
  ], // ♊ E0.6 Gemini
  [
    '\u264b',
  ], // ♋ E0.6 Cancer
  [
    '\u264c',
  ], // ♌ E0.6 Leo
  [
    '\u264d',
  ], // ♍ E0.6 Virgo
  [
    '\u264e',
  ], // ♎ E0.6 Libra
  [
    '\u264f',
  ], // ♏ E0.6 Scorpio
  [
    '\u2650',
  ], // ♐ E0.6 Sagittarius
  [
    '\u2651',
  ], // ♑ E0.6 Capricorn
  [
    '\u2652',
  ], // ♒ E0.6 Aquarius
  [
    '\u2653',
  ], // ♓ E0.6 Pisces
  [
    '\u26ce',
  ], // ⛎ E0.6 Ophiuchus
  [
    '\u{1f500}',
  ], // 🔀 E1.0 shuffle tracks button
  [
    '\u{1f501}',
  ], // 🔁 E1.0 repeat button
  [
    '\u{1f502}',
  ], // 🔂 E1.0 repeat single button
  [
    '\u25b6\ufe0f',
  ], // ▶️ E0.6 play button
  [
    '\u25b6',
  ], // ▶ E0.6 play button
  [
    '\u23e9',
  ], // ⏩ E0.6 fast-forward button
  [
    '\u23ed\ufe0f',
  ], // ⏭️ E0.7 next track button
  [
    '\u23ed',
  ], // ⏭ E0.7 next track button
  [
    '\u23ef\ufe0f',
  ], // ⏯️ E1.0 play or pause button
  [
    '\u23ef',
  ], // ⏯ E1.0 play or pause button
  [
    '\u25c0\ufe0f',
  ], // ◀️ E0.6 reverse button
  [
    '\u25c0',
  ], // ◀ E0.6 reverse button
  [
    '\u23ea',
  ], // ⏪ E0.6 fast reverse button
  [
    '\u23ee\ufe0f',
  ], // ⏮️ E0.7 last track button
  [
    '\u23ee',
  ], // ⏮ E0.7 last track button
  [
    '\u{1f53c}',
  ], // 🔼 E0.6 upwards button
  [
    '\u23eb',
  ], // ⏫ E0.6 fast up button
  [
    '\u{1f53d}',
  ], // 🔽 E0.6 downwards button
  [
    '\u23ec',
  ], // ⏬ E0.6 fast down button
  [
    '\u23f8\ufe0f',
  ], // ⏸️ E0.7 pause button
  [
    '\u23f8',
  ], // ⏸ E0.7 pause button
  [
    '\u23f9\ufe0f',
  ], // ⏹️ E0.7 stop button
  [
    '\u23f9',
  ], // ⏹ E0.7 stop button
  [
    '\u23fa\ufe0f',
  ], // ⏺️ E0.7 record button
  [
    '\u23fa',
  ], // ⏺ E0.7 record button
  [
    '\u23cf\ufe0f',
  ], // ⏏️ E1.0 eject button
  [
    '\u23cf',
  ], // ⏏ E1.0 eject button
  [
    '\u{1f3a6}',
  ], // 🎦 E0.6 cinema
  [
    '\u{1f505}',
  ], // 🔅 E1.0 dim button
  [
    '\u{1f506}',
  ], // 🔆 E1.0 bright button
  [
    '\u{1f4f6}',
  ], // 📶 E0.6 antenna bars
  [
    '\u{1f6dc}',
  ], // 🛜 E15.0 wireless
  [
    '\u{1f4f3}',
  ], // 📳 E0.6 vibration mode
  [
    '\u{1f4f4}',
  ], // 📴 E0.6 mobile phone off
  [
    '\u2640\ufe0f',
  ], // ♀️ E4.0 female sign
  [
    '\u2640',
  ], // ♀ E4.0 female sign
  [
    '\u2642\ufe0f',
  ], // ♂️ E4.0 male sign
  [
    '\u2642',
  ], // ♂ E4.0 male sign
  [
    '\u26a7\ufe0f',
  ], // ⚧️ E13.0 transgender symbol
  [
    '\u26a7',
  ], // ⚧ E13.0 transgender symbol
  [
    '\u2716\ufe0f',
  ], // ✖️ E0.6 multiply
  [
    '\u2716',
  ], // ✖ E0.6 multiply
  [
    '\u2795',
  ], // ➕ E0.6 plus
  [
    '\u2796',
  ], // ➖ E0.6 minus
  [
    '\u2797',
  ], // ➗ E0.6 divide
  [
    '\u{1f7f0}',
  ], // 🟰 E14.0 heavy equals sign
  [
    '\u267e\ufe0f',
  ], // ♾️ E11.0 infinity
  [
    '\u267e',
  ], // ♾ E11.0 infinity
  [
    '\u203c\ufe0f',
  ], // ‼️ E0.6 double exclamation mark
  [
    '\u203c',
  ], // ‼ E0.6 double exclamation mark
  [
    '\u2049\ufe0f',
  ], // ⁉️ E0.6 exclamation question mark
  [
    '\u2049',
  ], // ⁉ E0.6 exclamation question mark
  [
    '\u2753',
  ], // ❓ E0.6 red question mark
  [
    '\u2754',
  ], // ❔ E0.6 white question mark
  [
    '\u2755',
  ], // ❕ E0.6 white exclamation mark
  [
    '\u2757',
  ], // ❗ E0.6 red exclamation mark
  [
    '\u3030\ufe0f',
  ], // 〰️ E0.6 wavy dash
  [
    '\u3030',
  ], // 〰 E0.6 wavy dash
  [
    '\u{1f4b1}',
  ], // 💱 E0.6 currency exchange
  [
    '\u{1f4b2}',
  ], // 💲 E0.6 heavy dollar sign
  [
    '\u2695\ufe0f',
  ], // ⚕️ E4.0 medical symbol
  [
    '\u2695',
  ], // ⚕ E4.0 medical symbol
  [
    '\u267b\ufe0f',
  ], // ♻️ E0.6 recycling symbol
  [
    '\u267b',
  ], // ♻ E0.6 recycling symbol
  [
    '\u269c\ufe0f',
  ], // ⚜️ E1.0 fleur-de-lis
  [
    '\u269c',
  ], // ⚜ E1.0 fleur-de-lis
  [
    '\u{1f531}',
  ], // 🔱 E0.6 trident emblem
  [
    '\u{1f4db}',
  ], // 📛 E0.6 name badge
  [
    '\u{1f530}',
  ], // 🔰 E0.6 Japanese symbol for beginner
  [
    '\u2b55',
  ], // ⭕ E0.6 hollow red circle
  [
    '\u2705',
  ], // ✅ E0.6 check mark button
  [
    '\u2611\ufe0f',
  ], // ☑️ E0.6 check box with check
  [
    '\u2611',
  ], // ☑ E0.6 check box with check
  [
    '\u2714\ufe0f',
  ], // ✔️ E0.6 check mark
  [
    '\u2714',
  ], // ✔ E0.6 check mark
  [
    '\u274c',
  ], // ❌ E0.6 cross mark
  [
    '\u274e',
  ], // ❎ E0.6 cross mark button
  [
    '\u27b0',
  ], // ➰ E0.6 curly loop
  [
    '\u27bf',
  ], // ➿ E1.0 double curly loop
  [
    '\u303d\ufe0f',
  ], // 〽️ E0.6 part alternation mark
  [
    '\u303d',
  ], // 〽 E0.6 part alternation mark
  [
    '\u2733\ufe0f',
  ], // ✳️ E0.6 eight-spoked asterisk
  [
    '\u2733',
  ], // ✳ E0.6 eight-spoked asterisk
  [
    '\u2734\ufe0f',
  ], // ✴️ E0.6 eight-pointed star
  [
    '\u2734',
  ], // ✴ E0.6 eight-pointed star
  [
    '\u2747\ufe0f',
  ], // ❇️ E0.6 sparkle
  [
    '\u2747',
  ], // ❇ E0.6 sparkle
  [
    '©\ufe0f',
  ], // ©️ E0.6 copyright
  [
    '©',
  ], // © E0.6 copyright
  [
    '®\ufe0f',
  ], // ®️ E0.6 registered
  [
    '®',
  ], // ® E0.6 registered
  [
    '\u2122\ufe0f',
  ], // ™️ E0.6 trade mark
  [
    '\u2122',
  ], // ™ E0.6 trade mark
  [
    '\u{1fadf}',
  ], // 🫟 E16.0 splatter
  [
    '#\ufe0f\u20e3',
  ], // #️⃣ E0.6 keycap: #
  [
    '#\u20e3',
  ], // #⃣ E0.6 keycap: #
  [
    '*\ufe0f\u20e3',
  ], // *️⃣ E2.0 keycap: *
  [
    '*\u20e3',
  ], // *⃣ E2.0 keycap: *
  [
    '0\ufe0f\u20e3',
  ], // 0️⃣ E0.6 keycap: 0
  [
    '0\u20e3',
  ], // 0⃣ E0.6 keycap: 0
  [
    '1\ufe0f\u20e3',
  ], // 1️⃣ E0.6 keycap: 1
  [
    '1\u20e3',
  ], // 1⃣ E0.6 keycap: 1
  [
    '2\ufe0f\u20e3',
  ], // 2️⃣ E0.6 keycap: 2
  [
    '2\u20e3',
  ], // 2⃣ E0.6 keycap: 2
  [
    '3\ufe0f\u20e3',
  ], // 3️⃣ E0.6 keycap: 3
  [
    '3\u20e3',
  ], // 3⃣ E0.6 keycap: 3
  [
    '4\ufe0f\u20e3',
  ], // 4️⃣ E0.6 keycap: 4
  [
    '4\u20e3',
  ], // 4⃣ E0.6 keycap: 4
  [
    '5\ufe0f\u20e3',
  ], // 5️⃣ E0.6 keycap: 5
  [
    '5\u20e3',
  ], // 5⃣ E0.6 keycap: 5
  [
    '6\ufe0f\u20e3',
  ], // 6️⃣ E0.6 keycap: 6
  [
    '6\u20e3',
  ], // 6⃣ E0.6 keycap: 6
  [
    '7\ufe0f\u20e3',
  ], // 7️⃣ E0.6 keycap: 7
  [
    '7\u20e3',
  ], // 7⃣ E0.6 keycap: 7
  [
    '8\ufe0f\u20e3',
  ], // 8️⃣ E0.6 keycap: 8
  [
    '8\u20e3',
  ], // 8⃣ E0.6 keycap: 8
  [
    '9\ufe0f\u20e3',
  ], // 9️⃣ E0.6 keycap: 9
  [
    '9\u20e3',
  ], // 9⃣ E0.6 keycap: 9
  [
    '\u{1f51f}',
  ], // 🔟 E0.6 keycap: 10
  [
    '\u{1f520}',
  ], // 🔠 E0.6 input latin uppercase
  [
    '\u{1f521}',
  ], // 🔡 E0.6 input latin lowercase
  [
    '\u{1f522}',
  ], // 🔢 E0.6 input numbers
  [
    '\u{1f523}',
  ], // 🔣 E0.6 input symbols
  [
    '\u{1f524}',
  ], // 🔤 E0.6 input latin letters
  [
    '\u{1f170}\ufe0f',
  ], // 🅰️ E0.6 A button (blood type)
  [
    '\u{1f170}',
  ], // 🅰 E0.6 A button (blood type)
  [
    '\u{1f18e}',
  ], // 🆎 E0.6 AB button (blood type)
  [
    '\u{1f171}\ufe0f',
  ], // 🅱️ E0.6 B button (blood type)
  [
    '\u{1f171}',
  ], // 🅱 E0.6 B button (blood type)
  [
    '\u{1f191}',
  ], // 🆑 E0.6 CL button
  [
    '\u{1f192}',
  ], // 🆒 E0.6 COOL button
  [
    '\u{1f193}',
  ], // 🆓 E0.6 FREE button
  [
    '\u2139\ufe0f',
  ], // ℹ️ E0.6 information
  [
    '\u2139',
  ], // ℹ E0.6 information
  [
    '\u{1f194}',
  ], // 🆔 E0.6 ID button
  [
    '\u24c2\ufe0f',
  ], // Ⓜ️ E0.6 circled M
  [
    '\u24c2',
  ], // Ⓜ E0.6 circled M
  [
    '\u{1f195}',
  ], // 🆕 E0.6 NEW button
  [
    '\u{1f196}',
  ], // 🆖 E0.6 NG button
  [
    '\u{1f17e}\ufe0f',
  ], // 🅾️ E0.6 O button (blood type)
  [
    '\u{1f17e}',
  ], // 🅾 E0.6 O button (blood type)
  [
    '\u{1f197}',
  ], // 🆗 E0.6 OK button
  [
    '\u{1f17f}\ufe0f',
  ], // 🅿️ E0.6 P button
  [
    '\u{1f17f}',
  ], // 🅿 E0.6 P button
  [
    '\u{1f198}',
  ], // 🆘 E0.6 SOS button
  [
    '\u{1f199}',
  ], // 🆙 E0.6 UP! button
  [
    '\u{1f19a}',
  ], // 🆚 E0.6 VS button
  [
    '\u{1f201}',
  ], // 🈁 E0.6 Japanese “here” button
  [
    '\u{1f202}\ufe0f',
  ], // 🈂️ E0.6 Japanese “service charge” button
  [
    '\u{1f202}',
  ], // 🈂 E0.6 Japanese “service charge” button
  [
    '\u{1f237}\ufe0f',
  ], // 🈷️ E0.6 Japanese “monthly amount” button
  [
    '\u{1f237}',
  ], // 🈷 E0.6 Japanese “monthly amount” button
  [
    '\u{1f236}',
  ], // 🈶 E0.6 Japanese “not free of charge” button
  [
    '\u{1f22f}',
  ], // 🈯 E0.6 Japanese “reserved” button
  [
    '\u{1f250}',
  ], // 🉐 E0.6 Japanese “bargain” button
  [
    '\u{1f239}',
  ], // 🈹 E0.6 Japanese “discount” button
  [
    '\u{1f21a}',
  ], // 🈚 E0.6 Japanese “free of charge” button
  [
    '\u{1f232}',
  ], // 🈲 E0.6 Japanese “prohibited” button
  [
    '\u{1f251}',
  ], // 🉑 E0.6 Japanese “acceptable” button
  [
    '\u{1f238}',
  ], // 🈸 E0.6 Japanese “application” button
  [
    '\u{1f234}',
  ], // 🈴 E0.6 Japanese “passing grade” button
  [
    '\u{1f233}',
  ], // 🈳 E0.6 Japanese “vacancy” button
  [
    '\u3297\ufe0f',
  ], // ㊗️ E0.6 Japanese “congratulations” button
  [
    '\u3297',
  ], // ㊗ E0.6 Japanese “congratulations” button
  [
    '\u3299\ufe0f',
  ], // ㊙️ E0.6 Japanese “secret” button
  [
    '\u3299',
  ], // ㊙ E0.6 Japanese “secret” button
  [
    '\u{1f23a}',
  ], // 🈺 E0.6 Japanese “open for business” button
  [
    '\u{1f235}',
  ], // 🈵 E0.6 Japanese “no vacancy” button
  [
    '\u{1f534}',
  ], // 🔴 E0.6 red circle
  [
    '\u{1f7e0}',
  ], // 🟠 E12.0 orange circle
  [
    '\u{1f7e1}',
  ], // 🟡 E12.0 yellow circle
  [
    '\u{1f7e2}',
  ], // 🟢 E12.0 green circle
  [
    '\u{1f535}',
  ], // 🔵 E0.6 blue circle
  [
    '\u{1f7e3}',
  ], // 🟣 E12.0 purple circle
  [
    '\u{1f7e4}',
  ], // 🟤 E12.0 brown circle
  [
    '\u26ab',
  ], // ⚫ E0.6 black circle
  [
    '\u26aa',
  ], // ⚪ E0.6 white circle
  [
    '\u{1f7e5}',
  ], // 🟥 E12.0 red square
  [
    '\u{1f7e7}',
  ], // 🟧 E12.0 orange square
  [
    '\u{1f7e8}',
  ], // 🟨 E12.0 yellow square
  [
    '\u{1f7e9}',
  ], // 🟩 E12.0 green square
  [
    '\u{1f7e6}',
  ], // 🟦 E12.0 blue square
  [
    '\u{1f7ea}',
  ], // 🟪 E12.0 purple square
  [
    '\u{1f7eb}',
  ], // 🟫 E12.0 brown square
  [
    '\u2b1b',
  ], // ⬛ E0.6 black large square
  [
    '\u2b1c',
  ], // ⬜ E0.6 white large square
  [
    '\u25fc\ufe0f',
  ], // ◼️ E0.6 black medium square
  [
    '\u25fc',
  ], // ◼ E0.6 black medium square
  [
    '\u25fb\ufe0f',
  ], // ◻️ E0.6 white medium square
  [
    '\u25fb',
  ], // ◻ E0.6 white medium square
  [
    '\u25fe',
  ], // ◾ E0.6 black medium-small square
  [
    '\u25fd',
  ], // ◽ E0.6 white medium-small square
  [
    '\u25aa\ufe0f',
  ], // ▪️ E0.6 black small square
  [
    '\u25aa',
  ], // ▪ E0.6 black small square
  [
    '\u25ab\ufe0f',
  ], // ▫️ E0.6 white small square
  [
    '\u25ab',
  ], // ▫ E0.6 white small square
  [
    '\u{1f536}',
  ], // 🔶 E0.6 large orange diamond
  [
    '\u{1f537}',
  ], // 🔷 E0.6 large blue diamond
  [
    '\u{1f538}',
  ], // 🔸 E0.6 small orange diamond
  [
    '\u{1f539}',
  ], // 🔹 E0.6 small blue diamond
  [
    '\u{1f53a}',
  ], // 🔺 E0.6 red triangle pointed up
  [
    '\u{1f53b}',
  ], // 🔻 E0.6 red triangle pointed down
  [
    '\u{1f4a0}',
  ], // 💠 E0.6 diamond with a dot
  [
    '\u{1f518}',
  ], // 🔘 E0.6 radio button
  [
    '\u{1f533}',
  ], // 🔳 E0.6 white square button
  [
    '\u{1f532}',
  ], // 🔲 E0.6 black square button
  [
    '\u{1f3c1}',
  ], // 🏁 E0.6 chequered flag
  [
    '\u{1f6a9}',
  ], // 🚩 E0.6 triangular flag
  [
    '\u{1f38c}',
  ], // 🎌 E0.6 crossed flags
  [
    '\u{1f3f4}',
  ], // 🏴 E1.0 black flag
  [
    '\u{1f3f3}\ufe0f',
  ], // 🏳️ E0.7 white flag
  [
    '\u{1f3f3}',
  ], // 🏳 E0.7 white flag
  [
    '\u{1f3f3}\ufe0f\u200d\u{1f308}',
  ], // 🏳️‍🌈 E4.0 rainbow flag
  [
    '\u{1f3f3}\u200d\u{1f308}',
  ], // 🏳‍🌈 E4.0 rainbow flag
  [
    '\u{1f3f3}\ufe0f\u200d\u26a7\ufe0f',
  ], // 🏳️‍⚧️ E13.0 transgender flag
  [
    '\u{1f3f3}\u200d\u26a7\ufe0f',
  ], // 🏳‍⚧️ E13.0 transgender flag
  [
    '\u{1f3f3}\ufe0f\u200d\u26a7',
  ], // 🏳️‍⚧ E13.0 transgender flag
  [
    '\u{1f3f3}\u200d\u26a7',
  ], // 🏳‍⚧ E13.0 transgender flag
  [
    '\u{1f3f4}\u200d\u2620\ufe0f',
  ], // 🏴‍☠️ E11.0 pirate flag
  [
    '\u{1f3f4}\u200d\u2620',
  ], // 🏴‍☠ E11.0 pirate flag
  [
    '\u{1f1e6}\u{1f1e8}',
  ], // 🇦🇨 E2.0 flag: Ascension Island
  [
    '\u{1f1e6}\u{1f1e9}',
  ], // 🇦🇩 E2.0 flag: Andorra
  [
    '\u{1f1e6}\u{1f1ea}',
  ], // 🇦🇪 E2.0 flag: United Arab Emirates
  [
    '\u{1f1e6}\u{1f1eb}',
  ], // 🇦🇫 E2.0 flag: Afghanistan
  [
    '\u{1f1e6}\u{1f1ec}',
  ], // 🇦🇬 E2.0 flag: Antigua & Barbuda
  [
    '\u{1f1e6}\u{1f1ee}',
  ], // 🇦🇮 E2.0 flag: Anguilla
  [
    '\u{1f1e6}\u{1f1f1}',
  ], // 🇦🇱 E2.0 flag: Albania
  [
    '\u{1f1e6}\u{1f1f2}',
  ], // 🇦🇲 E2.0 flag: Armenia
  [
    '\u{1f1e6}\u{1f1f4}',
  ], // 🇦🇴 E2.0 flag: Angola
  [
    '\u{1f1e6}\u{1f1f6}',
  ], // 🇦🇶 E2.0 flag: Antarctica
  [
    '\u{1f1e6}\u{1f1f7}',
  ], // 🇦🇷 E2.0 flag: Argentina
  [
    '\u{1f1e6}\u{1f1f8}',
  ], // 🇦🇸 E2.0 flag: American Samoa
  [
    '\u{1f1e6}\u{1f1f9}',
  ], // 🇦🇹 E2.0 flag: Austria
  [
    '\u{1f1e6}\u{1f1fa}',
  ], // 🇦🇺 E2.0 flag: Australia
  [
    '\u{1f1e6}\u{1f1fc}',
  ], // 🇦🇼 E2.0 flag: Aruba
  [
    '\u{1f1e6}\u{1f1fd}',
  ], // 🇦🇽 E2.0 flag: Åland Islands
  [
    '\u{1f1e6}\u{1f1ff}',
  ], // 🇦🇿 E2.0 flag: Azerbaijan
  [
    '\u{1f1e7}\u{1f1e6}',
  ], // 🇧🇦 E2.0 flag: Bosnia & Herzegovina
  [
    '\u{1f1e7}\u{1f1e7}',
  ], // 🇧🇧 E2.0 flag: Barbados
  [
    '\u{1f1e7}\u{1f1e9}',
  ], // 🇧🇩 E2.0 flag: Bangladesh
  [
    '\u{1f1e7}\u{1f1ea}',
  ], // 🇧🇪 E2.0 flag: Belgium
  [
    '\u{1f1e7}\u{1f1eb}',
  ], // 🇧🇫 E2.0 flag: Burkina Faso
  [
    '\u{1f1e7}\u{1f1ec}',
  ], // 🇧🇬 E2.0 flag: Bulgaria
  [
    '\u{1f1e7}\u{1f1ed}',
  ], // 🇧🇭 E2.0 flag: Bahrain
  [
    '\u{1f1e7}\u{1f1ee}',
  ], // 🇧🇮 E2.0 flag: Burundi
  [
    '\u{1f1e7}\u{1f1ef}',
  ], // 🇧🇯 E2.0 flag: Benin
  [
    '\u{1f1e7}\u{1f1f1}',
  ], // 🇧🇱 E2.0 flag: St. Barthélemy
  [
    '\u{1f1e7}\u{1f1f2}',
  ], // 🇧🇲 E2.0 flag: Bermuda
  [
    '\u{1f1e7}\u{1f1f3}',
  ], // 🇧🇳 E2.0 flag: Brunei
  [
    '\u{1f1e7}\u{1f1f4}',
  ], // 🇧🇴 E2.0 flag: Bolivia
  [
    '\u{1f1e7}\u{1f1f6}',
  ], // 🇧🇶 E2.0 flag: Caribbean Netherlands
  [
    '\u{1f1e7}\u{1f1f7}',
  ], // 🇧🇷 E2.0 flag: Brazil
  [
    '\u{1f1e7}\u{1f1f8}',
  ], // 🇧🇸 E2.0 flag: Bahamas
  [
    '\u{1f1e7}\u{1f1f9}',
  ], // 🇧🇹 E2.0 flag: Bhutan
  [
    '\u{1f1e7}\u{1f1fb}',
  ], // 🇧🇻 E2.0 flag: Bouvet Island
  [
    '\u{1f1e7}\u{1f1fc}',
  ], // 🇧🇼 E2.0 flag: Botswana
  [
    '\u{1f1e7}\u{1f1fe}',
  ], // 🇧🇾 E2.0 flag: Belarus
  [
    '\u{1f1e7}\u{1f1ff}',
  ], // 🇧🇿 E2.0 flag: Belize
  [
    '\u{1f1e8}\u{1f1e6}',
  ], // 🇨🇦 E2.0 flag: Canada
  [
    '\u{1f1e8}\u{1f1e8}',
  ], // 🇨🇨 E2.0 flag: Cocos (Keeling) Islands
  [
    '\u{1f1e8}\u{1f1e9}',
  ], // 🇨🇩 E2.0 flag: Congo - Kinshasa
  [
    '\u{1f1e8}\u{1f1eb}',
  ], // 🇨🇫 E2.0 flag: Central African Republic
  [
    '\u{1f1e8}\u{1f1ec}',
  ], // 🇨🇬 E2.0 flag: Congo - Brazzaville
  [
    '\u{1f1e8}\u{1f1ed}',
  ], // 🇨🇭 E2.0 flag: Switzerland
  [
    '\u{1f1e8}\u{1f1ee}',
  ], // 🇨🇮 E2.0 flag: Côte d’Ivoire
  [
    '\u{1f1e8}\u{1f1f0}',
  ], // 🇨🇰 E2.0 flag: Cook Islands
  [
    '\u{1f1e8}\u{1f1f1}',
  ], // 🇨🇱 E2.0 flag: Chile
  [
    '\u{1f1e8}\u{1f1f2}',
  ], // 🇨🇲 E2.0 flag: Cameroon
  [
    '\u{1f1e8}\u{1f1f3}',
  ], // 🇨🇳 E0.6 flag: China
  [
    '\u{1f1e8}\u{1f1f4}',
  ], // 🇨🇴 E2.0 flag: Colombia
  [
    '\u{1f1e8}\u{1f1f5}',
  ], // 🇨🇵 E2.0 flag: Clipperton Island
  [
    '\u{1f1e8}\u{1f1f6}',
  ], // 🇨🇶 E16.0 flag: Sark
  [
    '\u{1f1e8}\u{1f1f7}',
  ], // 🇨🇷 E2.0 flag: Costa Rica
  [
    '\u{1f1e8}\u{1f1fa}',
  ], // 🇨🇺 E2.0 flag: Cuba
  [
    '\u{1f1e8}\u{1f1fb}',
  ], // 🇨🇻 E2.0 flag: Cape Verde
  [
    '\u{1f1e8}\u{1f1fc}',
  ], // 🇨🇼 E2.0 flag: Curaçao
  [
    '\u{1f1e8}\u{1f1fd}',
  ], // 🇨🇽 E2.0 flag: Christmas Island
  [
    '\u{1f1e8}\u{1f1fe}',
  ], // 🇨🇾 E2.0 flag: Cyprus
  [
    '\u{1f1e8}\u{1f1ff}',
  ], // 🇨🇿 E2.0 flag: Czechia
  [
    '\u{1f1e9}\u{1f1ea}',
  ], // 🇩🇪 E0.6 flag: Germany
  [
    '\u{1f1e9}\u{1f1ec}',
  ], // 🇩🇬 E2.0 flag: Diego Garcia
  [
    '\u{1f1e9}\u{1f1ef}',
  ], // 🇩🇯 E2.0 flag: Djibouti
  [
    '\u{1f1e9}\u{1f1f0}',
  ], // 🇩🇰 E2.0 flag: Denmark
  [
    '\u{1f1e9}\u{1f1f2}',
  ], // 🇩🇲 E2.0 flag: Dominica
  [
    '\u{1f1e9}\u{1f1f4}',
  ], // 🇩🇴 E2.0 flag: Dominican Republic
  [
    '\u{1f1e9}\u{1f1ff}',
  ], // 🇩🇿 E2.0 flag: Algeria
  [
    '\u{1f1ea}\u{1f1e6}',
  ], // 🇪🇦 E2.0 flag: Ceuta & Melilla
  [
    '\u{1f1ea}\u{1f1e8}',
  ], // 🇪🇨 E2.0 flag: Ecuador
  [
    '\u{1f1ea}\u{1f1ea}',
  ], // 🇪🇪 E2.0 flag: Estonia
  [
    '\u{1f1ea}\u{1f1ec}',
  ], // 🇪🇬 E2.0 flag: Egypt
  [
    '\u{1f1ea}\u{1f1ed}',
  ], // 🇪🇭 E2.0 flag: Western Sahara
  [
    '\u{1f1ea}\u{1f1f7}',
  ], // 🇪🇷 E2.0 flag: Eritrea
  [
    '\u{1f1ea}\u{1f1f8}',
  ], // 🇪🇸 E0.6 flag: Spain
  [
    '\u{1f1ea}\u{1f1f9}',
  ], // 🇪🇹 E2.0 flag: Ethiopia
  [
    '\u{1f1ea}\u{1f1fa}',
  ], // 🇪🇺 E2.0 flag: European Union
  [
    '\u{1f1eb}\u{1f1ee}',
  ], // 🇫🇮 E2.0 flag: Finland
  [
    '\u{1f1eb}\u{1f1ef}',
  ], // 🇫🇯 E2.0 flag: Fiji
  [
    '\u{1f1eb}\u{1f1f0}',
  ], // 🇫🇰 E2.0 flag: Falkland Islands
  [
    '\u{1f1eb}\u{1f1f2}',
  ], // 🇫🇲 E2.0 flag: Micronesia
  [
    '\u{1f1eb}\u{1f1f4}',
  ], // 🇫🇴 E2.0 flag: Faroe Islands
  [
    '\u{1f1eb}\u{1f1f7}',
  ], // 🇫🇷 E0.6 flag: France
  [
    '\u{1f1ec}\u{1f1e6}',
  ], // 🇬🇦 E2.0 flag: Gabon
  [
    '\u{1f1ec}\u{1f1e7}',
  ], // 🇬🇧 E0.6 flag: United Kingdom
  [
    '\u{1f1ec}\u{1f1e9}',
  ], // 🇬🇩 E2.0 flag: Grenada
  [
    '\u{1f1ec}\u{1f1ea}',
  ], // 🇬🇪 E2.0 flag: Georgia
  [
    '\u{1f1ec}\u{1f1eb}',
  ], // 🇬🇫 E2.0 flag: French Guiana
  [
    '\u{1f1ec}\u{1f1ec}',
  ], // 🇬🇬 E2.0 flag: Guernsey
  [
    '\u{1f1ec}\u{1f1ed}',
  ], // 🇬🇭 E2.0 flag: Ghana
  [
    '\u{1f1ec}\u{1f1ee}',
  ], // 🇬🇮 E2.0 flag: Gibraltar
  [
    '\u{1f1ec}\u{1f1f1}',
  ], // 🇬🇱 E2.0 flag: Greenland
  [
    '\u{1f1ec}\u{1f1f2}',
  ], // 🇬🇲 E2.0 flag: Gambia
  [
    '\u{1f1ec}\u{1f1f3}',
  ], // 🇬🇳 E2.0 flag: Guinea
  [
    '\u{1f1ec}\u{1f1f5}',
  ], // 🇬🇵 E2.0 flag: Guadeloupe
  [
    '\u{1f1ec}\u{1f1f6}',
  ], // 🇬🇶 E2.0 flag: Equatorial Guinea
  [
    '\u{1f1ec}\u{1f1f7}',
  ], // 🇬🇷 E2.0 flag: Greece
  [
    '\u{1f1ec}\u{1f1f8}',
  ], // 🇬🇸 E2.0 flag: South Georgia & South Sandwich Islands
  [
    '\u{1f1ec}\u{1f1f9}',
  ], // 🇬🇹 E2.0 flag: Guatemala
  [
    '\u{1f1ec}\u{1f1fa}',
  ], // 🇬🇺 E2.0 flag: Guam
  [
    '\u{1f1ec}\u{1f1fc}',
  ], // 🇬🇼 E2.0 flag: Guinea-Bissau
  [
    '\u{1f1ec}\u{1f1fe}',
  ], // 🇬🇾 E2.0 flag: Guyana
  [
    '\u{1f1ed}\u{1f1f0}',
  ], // 🇭🇰 E2.0 flag: Hong Kong SAR China
  [
    '\u{1f1ed}\u{1f1f2}',
  ], // 🇭🇲 E2.0 flag: Heard & McDonald Islands
  [
    '\u{1f1ed}\u{1f1f3}',
  ], // 🇭🇳 E2.0 flag: Honduras
  [
    '\u{1f1ed}\u{1f1f7}',
  ], // 🇭🇷 E2.0 flag: Croatia
  [
    '\u{1f1ed}\u{1f1f9}',
  ], // 🇭🇹 E2.0 flag: Haiti
  [
    '\u{1f1ed}\u{1f1fa}',
  ], // 🇭🇺 E2.0 flag: Hungary
  [
    '\u{1f1ee}\u{1f1e8}',
  ], // 🇮🇨 E2.0 flag: Canary Islands
  [
    '\u{1f1ee}\u{1f1e9}',
  ], // 🇮🇩 E2.0 flag: Indonesia
  [
    '\u{1f1ee}\u{1f1ea}',
  ], // 🇮🇪 E2.0 flag: Ireland
  [
    '\u{1f1ee}\u{1f1f1}',
  ], // 🇮🇱 E2.0 flag: Israel
  [
    '\u{1f1ee}\u{1f1f2}',
  ], // 🇮🇲 E2.0 flag: Isle of Man
  [
    '\u{1f1ee}\u{1f1f3}',
  ], // 🇮🇳 E2.0 flag: India
  [
    '\u{1f1ee}\u{1f1f4}',
  ], // 🇮🇴 E2.0 flag: British Indian Ocean Territory
  [
    '\u{1f1ee}\u{1f1f6}',
  ], // 🇮🇶 E2.0 flag: Iraq
  [
    '\u{1f1ee}\u{1f1f7}',
  ], // 🇮🇷 E2.0 flag: Iran
  [
    '\u{1f1ee}\u{1f1f8}',
  ], // 🇮🇸 E2.0 flag: Iceland
  [
    '\u{1f1ee}\u{1f1f9}',
  ], // 🇮🇹 E0.6 flag: Italy
  [
    '\u{1f1ef}\u{1f1ea}',
  ], // 🇯🇪 E2.0 flag: Jersey
  [
    '\u{1f1ef}\u{1f1f2}',
  ], // 🇯🇲 E2.0 flag: Jamaica
  [
    '\u{1f1ef}\u{1f1f4}',
  ], // 🇯🇴 E2.0 flag: Jordan
  [
    '\u{1f1ef}\u{1f1f5}',
  ], // 🇯🇵 E0.6 flag: Japan
  [
    '\u{1f1f0}\u{1f1ea}',
  ], // 🇰🇪 E2.0 flag: Kenya
  [
    '\u{1f1f0}\u{1f1ec}',
  ], // 🇰🇬 E2.0 flag: Kyrgyzstan
  [
    '\u{1f1f0}\u{1f1ed}',
  ], // 🇰🇭 E2.0 flag: Cambodia
  [
    '\u{1f1f0}\u{1f1ee}',
  ], // 🇰🇮 E2.0 flag: Kiribati
  [
    '\u{1f1f0}\u{1f1f2}',
  ], // 🇰🇲 E2.0 flag: Comoros
  [
    '\u{1f1f0}\u{1f1f3}',
  ], // 🇰🇳 E2.0 flag: St. Kitts & Nevis
  [
    '\u{1f1f0}\u{1f1f5}',
  ], // 🇰🇵 E2.0 flag: North Korea
  [
    '\u{1f1f0}\u{1f1f7}',
  ], // 🇰🇷 E0.6 flag: South Korea
  [
    '\u{1f1f0}\u{1f1fc}',
  ], // 🇰🇼 E2.0 flag: Kuwait
  [
    '\u{1f1f0}\u{1f1fe}',
  ], // 🇰🇾 E2.0 flag: Cayman Islands
  [
    '\u{1f1f0}\u{1f1ff}',
  ], // 🇰🇿 E2.0 flag: Kazakhstan
  [
    '\u{1f1f1}\u{1f1e6}',
  ], // 🇱🇦 E2.0 flag: Laos
  [
    '\u{1f1f1}\u{1f1e7}',
  ], // 🇱🇧 E2.0 flag: Lebanon
  [
    '\u{1f1f1}\u{1f1e8}',
  ], // 🇱🇨 E2.0 flag: St. Lucia
  [
    '\u{1f1f1}\u{1f1ee}',
  ], // 🇱🇮 E2.0 flag: Liechtenstein
  [
    '\u{1f1f1}\u{1f1f0}',
  ], // 🇱🇰 E2.0 flag: Sri Lanka
  [
    '\u{1f1f1}\u{1f1f7}',
  ], // 🇱🇷 E2.0 flag: Liberia
  [
    '\u{1f1f1}\u{1f1f8}',
  ], // 🇱🇸 E2.0 flag: Lesotho
  [
    '\u{1f1f1}\u{1f1f9}',
  ], // 🇱🇹 E2.0 flag: Lithuania
  [
    '\u{1f1f1}\u{1f1fa}',
  ], // 🇱🇺 E2.0 flag: Luxembourg
  [
    '\u{1f1f1}\u{1f1fb}',
  ], // 🇱🇻 E2.0 flag: Latvia
  [
    '\u{1f1f1}\u{1f1fe}',
  ], // 🇱🇾 E2.0 flag: Libya
  [
    '\u{1f1f2}\u{1f1e6}',
  ], // 🇲🇦 E2.0 flag: Morocco
  [
    '\u{1f1f2}\u{1f1e8}',
  ], // 🇲🇨 E2.0 flag: Monaco
  [
    '\u{1f1f2}\u{1f1e9}',
  ], // 🇲🇩 E2.0 flag: Moldova
  [
    '\u{1f1f2}\u{1f1ea}',
  ], // 🇲🇪 E2.0 flag: Montenegro
  [
    '\u{1f1f2}\u{1f1eb}',
  ], // 🇲🇫 E2.0 flag: St. Martin
  [
    '\u{1f1f2}\u{1f1ec}',
  ], // 🇲🇬 E2.0 flag: Madagascar
  [
    '\u{1f1f2}\u{1f1ed}',
  ], // 🇲🇭 E2.0 flag: Marshall Islands
  [
    '\u{1f1f2}\u{1f1f0}',
  ], // 🇲🇰 E2.0 flag: North Macedonia
  [
    '\u{1f1f2}\u{1f1f1}',
  ], // 🇲🇱 E2.0 flag: Mali
  [
    '\u{1f1f2}\u{1f1f2}',
  ], // 🇲🇲 E2.0 flag: Myanmar (Burma)
  [
    '\u{1f1f2}\u{1f1f3}',
  ], // 🇲🇳 E2.0 flag: Mongolia
  [
    '\u{1f1f2}\u{1f1f4}',
  ], // 🇲🇴 E2.0 flag: Macao SAR China
  [
    '\u{1f1f2}\u{1f1f5}',
  ], // 🇲🇵 E2.0 flag: Northern Mariana Islands
  [
    '\u{1f1f2}\u{1f1f6}',
  ], // 🇲🇶 E2.0 flag: Martinique
  [
    '\u{1f1f2}\u{1f1f7}',
  ], // 🇲🇷 E2.0 flag: Mauritania
  [
    '\u{1f1f2}\u{1f1f8}',
  ], // 🇲🇸 E2.0 flag: Montserrat
  [
    '\u{1f1f2}\u{1f1f9}',
  ], // 🇲🇹 E2.0 flag: Malta
  [
    '\u{1f1f2}\u{1f1fa}',
  ], // 🇲🇺 E2.0 flag: Mauritius
  [
    '\u{1f1f2}\u{1f1fb}',
  ], // 🇲🇻 E2.0 flag: Maldives
  [
    '\u{1f1f2}\u{1f1fc}',
  ], // 🇲🇼 E2.0 flag: Malawi
  [
    '\u{1f1f2}\u{1f1fd}',
  ], // 🇲🇽 E2.0 flag: Mexico
  [
    '\u{1f1f2}\u{1f1fe}',
  ], // 🇲🇾 E2.0 flag: Malaysia
  [
    '\u{1f1f2}\u{1f1ff}',
  ], // 🇲🇿 E2.0 flag: Mozambique
  [
    '\u{1f1f3}\u{1f1e6}',
  ], // 🇳🇦 E2.0 flag: Namibia
  [
    '\u{1f1f3}\u{1f1e8}',
  ], // 🇳🇨 E2.0 flag: New Caledonia
  [
    '\u{1f1f3}\u{1f1ea}',
  ], // 🇳🇪 E2.0 flag: Niger
  [
    '\u{1f1f3}\u{1f1eb}',
  ], // 🇳🇫 E2.0 flag: Norfolk Island
  [
    '\u{1f1f3}\u{1f1ec}',
  ], // 🇳🇬 E2.0 flag: Nigeria
  [
    '\u{1f1f3}\u{1f1ee}',
  ], // 🇳🇮 E2.0 flag: Nicaragua
  [
    '\u{1f1f3}\u{1f1f1}',
  ], // 🇳🇱 E2.0 flag: Netherlands
  [
    '\u{1f1f3}\u{1f1f4}',
  ], // 🇳🇴 E2.0 flag: Norway
  [
    '\u{1f1f3}\u{1f1f5}',
  ], // 🇳🇵 E2.0 flag: Nepal
  [
    '\u{1f1f3}\u{1f1f7}',
  ], // 🇳🇷 E2.0 flag: Nauru
  [
    '\u{1f1f3}\u{1f1fa}',
  ], // 🇳🇺 E2.0 flag: Niue
  [
    '\u{1f1f3}\u{1f1ff}',
  ], // 🇳🇿 E2.0 flag: New Zealand
  [
    '\u{1f1f4}\u{1f1f2}',
  ], // 🇴🇲 E2.0 flag: Oman
  [
    '\u{1f1f5}\u{1f1e6}',
  ], // 🇵🇦 E2.0 flag: Panama
  [
    '\u{1f1f5}\u{1f1ea}',
  ], // 🇵🇪 E2.0 flag: Peru
  [
    '\u{1f1f5}\u{1f1eb}',
  ], // 🇵🇫 E2.0 flag: French Polynesia
  [
    '\u{1f1f5}\u{1f1ec}',
  ], // 🇵🇬 E2.0 flag: Papua New Guinea
  [
    '\u{1f1f5}\u{1f1ed}',
  ], // 🇵🇭 E2.0 flag: Philippines
  [
    '\u{1f1f5}\u{1f1f0}',
  ], // 🇵🇰 E2.0 flag: Pakistan
  [
    '\u{1f1f5}\u{1f1f1}',
  ], // 🇵🇱 E2.0 flag: Poland
  [
    '\u{1f1f5}\u{1f1f2}',
  ], // 🇵🇲 E2.0 flag: St. Pierre & Miquelon
  [
    '\u{1f1f5}\u{1f1f3}',
  ], // 🇵🇳 E2.0 flag: Pitcairn Islands
  [
    '\u{1f1f5}\u{1f1f7}',
  ], // 🇵🇷 E2.0 flag: Puerto Rico
  [
    '\u{1f1f5}\u{1f1f8}',
  ], // 🇵🇸 E2.0 flag: Palestinian Territories
  [
    '\u{1f1f5}\u{1f1f9}',
  ], // 🇵🇹 E2.0 flag: Portugal
  [
    '\u{1f1f5}\u{1f1fc}',
  ], // 🇵🇼 E2.0 flag: Palau
  [
    '\u{1f1f5}\u{1f1fe}',
  ], // 🇵🇾 E2.0 flag: Paraguay
  [
    '\u{1f1f6}\u{1f1e6}',
  ], // 🇶🇦 E2.0 flag: Qatar
  [
    '\u{1f1f7}\u{1f1ea}',
  ], // 🇷🇪 E2.0 flag: Réunion
  [
    '\u{1f1f7}\u{1f1f4}',
  ], // 🇷🇴 E2.0 flag: Romania
  [
    '\u{1f1f7}\u{1f1f8}',
  ], // 🇷🇸 E2.0 flag: Serbia
  [
    '\u{1f1f7}\u{1f1fa}',
  ], // 🇷🇺 E0.6 flag: Russia
  [
    '\u{1f1f7}\u{1f1fc}',
  ], // 🇷🇼 E2.0 flag: Rwanda
  [
    '\u{1f1f8}\u{1f1e6}',
  ], // 🇸🇦 E2.0 flag: Saudi Arabia
  [
    '\u{1f1f8}\u{1f1e7}',
  ], // 🇸🇧 E2.0 flag: Solomon Islands
  [
    '\u{1f1f8}\u{1f1e8}',
  ], // 🇸🇨 E2.0 flag: Seychelles
  [
    '\u{1f1f8}\u{1f1e9}',
  ], // 🇸🇩 E2.0 flag: Sudan
  [
    '\u{1f1f8}\u{1f1ea}',
  ], // 🇸🇪 E2.0 flag: Sweden
  [
    '\u{1f1f8}\u{1f1ec}',
  ], // 🇸🇬 E2.0 flag: Singapore
  [
    '\u{1f1f8}\u{1f1ed}',
  ], // 🇸🇭 E2.0 flag: St. Helena
  [
    '\u{1f1f8}\u{1f1ee}',
  ], // 🇸🇮 E2.0 flag: Slovenia
  [
    '\u{1f1f8}\u{1f1ef}',
  ], // 🇸🇯 E2.0 flag: Svalbard & Jan Mayen
  [
    '\u{1f1f8}\u{1f1f0}',
  ], // 🇸🇰 E2.0 flag: Slovakia
  [
    '\u{1f1f8}\u{1f1f1}',
  ], // 🇸🇱 E2.0 flag: Sierra Leone
  [
    '\u{1f1f8}\u{1f1f2}',
  ], // 🇸🇲 E2.0 flag: San Marino
  [
    '\u{1f1f8}\u{1f1f3}',
  ], // 🇸🇳 E2.0 flag: Senegal
  [
    '\u{1f1f8}\u{1f1f4}',
  ], // 🇸🇴 E2.0 flag: Somalia
  [
    '\u{1f1f8}\u{1f1f7}',
  ], // 🇸🇷 E2.0 flag: Suriname
  [
    '\u{1f1f8}\u{1f1f8}',
  ], // 🇸🇸 E2.0 flag: South Sudan
  [
    '\u{1f1f8}\u{1f1f9}',
  ], // 🇸🇹 E2.0 flag: São Tomé & Príncipe
  [
    '\u{1f1f8}\u{1f1fb}',
  ], // 🇸🇻 E2.0 flag: El Salvador
  [
    '\u{1f1f8}\u{1f1fd}',
  ], // 🇸🇽 E2.0 flag: Sint Maarten
  [
    '\u{1f1f8}\u{1f1fe}',
  ], // 🇸🇾 E2.0 flag: Syria
  [
    '\u{1f1f8}\u{1f1ff}',
  ], // 🇸🇿 E2.0 flag: Eswatini
  [
    '\u{1f1f9}\u{1f1e6}',
  ], // 🇹🇦 E2.0 flag: Tristan da Cunha
  [
    '\u{1f1f9}\u{1f1e8}',
  ], // 🇹🇨 E2.0 flag: Turks & Caicos Islands
  [
    '\u{1f1f9}\u{1f1e9}',
  ], // 🇹🇩 E2.0 flag: Chad
  [
    '\u{1f1f9}\u{1f1eb}',
  ], // 🇹🇫 E2.0 flag: French Southern Territories
  [
    '\u{1f1f9}\u{1f1ec}',
  ], // 🇹🇬 E2.0 flag: Togo
  [
    '\u{1f1f9}\u{1f1ed}',
  ], // 🇹🇭 E2.0 flag: Thailand
  [
    '\u{1f1f9}\u{1f1ef}',
  ], // 🇹🇯 E2.0 flag: Tajikistan
  [
    '\u{1f1f9}\u{1f1f0}',
  ], // 🇹🇰 E2.0 flag: Tokelau
  [
    '\u{1f1f9}\u{1f1f1}',
  ], // 🇹🇱 E2.0 flag: Timor-Leste
  [
    '\u{1f1f9}\u{1f1f2}',
  ], // 🇹🇲 E2.0 flag: Turkmenistan
  [
    '\u{1f1f9}\u{1f1f3}',
  ], // 🇹🇳 E2.0 flag: Tunisia
  [
    '\u{1f1f9}\u{1f1f4}',
  ], // 🇹🇴 E2.0 flag: Tonga
  [
    '\u{1f1f9}\u{1f1f7}',
  ], // 🇹🇷 E2.0 flag: Türkiye
  [
    '\u{1f1f9}\u{1f1f9}',
  ], // 🇹🇹 E2.0 flag: Trinidad & Tobago
  [
    '\u{1f1f9}\u{1f1fb}',
  ], // 🇹🇻 E2.0 flag: Tuvalu
  [
    '\u{1f1f9}\u{1f1fc}',
  ], // 🇹🇼 E2.0 flag: Taiwan
  [
    '\u{1f1f9}\u{1f1ff}',
  ], // 🇹🇿 E2.0 flag: Tanzania
  [
    '\u{1f1fa}\u{1f1e6}',
  ], // 🇺🇦 E2.0 flag: Ukraine
  [
    '\u{1f1fa}\u{1f1ec}',
  ], // 🇺🇬 E2.0 flag: Uganda
  [
    '\u{1f1fa}\u{1f1f2}',
  ], // 🇺🇲 E2.0 flag: U.S. Outlying Islands
  [
    '\u{1f1fa}\u{1f1f3}',
  ], // 🇺🇳 E4.0 flag: United Nations
  [
    '\u{1f1fa}\u{1f1f8}',
  ], // 🇺🇸 E0.6 flag: United States
  [
    '\u{1f1fa}\u{1f1fe}',
  ], // 🇺🇾 E2.0 flag: Uruguay
  [
    '\u{1f1fa}\u{1f1ff}',
  ], // 🇺🇿 E2.0 flag: Uzbekistan
  [
    '\u{1f1fb}\u{1f1e6}',
  ], // 🇻🇦 E2.0 flag: Vatican City
  [
    '\u{1f1fb}\u{1f1e8}',
  ], // 🇻🇨 E2.0 flag: St. Vincent & Grenadines
  [
    '\u{1f1fb}\u{1f1ea}',
  ], // 🇻🇪 E2.0 flag: Venezuela
  [
    '\u{1f1fb}\u{1f1ec}',
  ], // 🇻🇬 E2.0 flag: British Virgin Islands
  [
    '\u{1f1fb}\u{1f1ee}',
  ], // 🇻🇮 E2.0 flag: U.S. Virgin Islands
  [
    '\u{1f1fb}\u{1f1f3}',
  ], // 🇻🇳 E2.0 flag: Vietnam
  [
    '\u{1f1fb}\u{1f1fa}',
  ], // 🇻🇺 E2.0 flag: Vanuatu
  [
    '\u{1f1fc}\u{1f1eb}',
  ], // 🇼🇫 E2.0 flag: Wallis & Futuna
  [
    '\u{1f1fc}\u{1f1f8}',
  ], // 🇼🇸 E2.0 flag: Samoa
  [
    '\u{1f1fd}\u{1f1f0}',
  ], // 🇽🇰 E2.0 flag: Kosovo
  [
    '\u{1f1fe}\u{1f1ea}',
  ], // 🇾🇪 E2.0 flag: Yemen
  [
    '\u{1f1fe}\u{1f1f9}',
  ], // 🇾🇹 E2.0 flag: Mayotte
  [
    '\u{1f1ff}\u{1f1e6}',
  ], // 🇿🇦 E2.0 flag: South Africa
  [
    '\u{1f1ff}\u{1f1f2}',
  ], // 🇿🇲 E2.0 flag: Zambia
  [
    '\u{1f1ff}\u{1f1fc}',
  ], // 🇿🇼 E2.0 flag: Zimbabwe
  [
    '\u{1f3f4}\u{e0067}\u{e0062}\u{e0065}\u{e006e}\u{e0067}\u{e007f}',
  ], // 🏴󠁧󠁢󠁥󠁮󠁧󠁿 E5.0 flag: England
  [
    '\u{1f3f4}\u{e0067}\u{e0062}\u{e0073}\u{e0063}\u{e0074}\u{e007f}',
  ], // 🏴󠁧󠁢󠁳󠁣󠁴󠁿 E5.0 flag: Scotland
  [
    '\u{1f3f4}\u{e0067}\u{e0062}\u{e0077}\u{e006c}\u{e0073}\u{e007f}',
  ], // 🏴󠁧󠁢󠁷󠁬󠁳󠁿 E5.0 flag: Wales
];
// dart format on
// BMP character in each category, if any, -1 if none.
const lowerChars = <int>[
  0xd,
  0x1,
  0x39,
  0x200c,
  0x903,
  -0x1,
  0x2620,
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
  0x1f1fc,
  0x1f3f4,
  -0x1,
  0x110bd,
  -0x1,
  0x16d63,
  -0x1,
  -0x1,
  -0x1,
  -0x1,
  -0x1,
  0xe007f,
  -0x1,
];
