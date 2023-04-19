// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Class to write string literals for bytes or words.
///
/// The string will be `'` delimited.
/// Escapes as necessary, and performs line breaks to stay within 80
/// characters.
class StringLiteralWriter {
  final StringSink buffer;
  final String _padding;
  final int _lineLength;
  final bool Function(int) _escape;
  int _currentLineLength = 0;

  static final Map<int, String> _escapeCache = {};

  StringLiteralWriter(this.buffer,
      {int padding = 0, int lineLength = 80, bool Function(int)? escape})
      : _padding = " " * padding,
        _lineLength = lineLength,
        _escape = escape ?? _defaultEscape;

  static bool _defaultEscape(int codeUnit) {
    return codeUnit < 0x20 || codeUnit >= 0x7f && codeUnit <= 0xa0;
  }

  void start([int initialOffset = 0]) {
    if (initialOffset >= _lineLength - 2) {
      buffer
        ..write('\n')
        ..write(_padding);
      initialOffset = _padding.length;
    }
    buffer.write("'");
    _currentLineLength = initialOffset + 1;
  }

  /// Adds a single UTF-16 code unit.
  void add(int codeUnit) {
    // Always escape: `\n`, `\r`, `'`, `$` and `\`, plus anything the user wants.
    if (_escape(codeUnit) ||
        codeUnit == 0x24 ||
        codeUnit == 0x27 ||
        codeUnit == 0x5c ||
        codeUnit == 0x0a ||
        codeUnit == 0x0d) {
      _writeEscape(codeUnit);
      return;
    }
    if (_currentLineLength >= _lineLength - 1) {
      _wrap();
    }
    _currentLineLength++;
    buffer.writeCharCode(codeUnit);
  }

  void _writeEscape(int codeUnit) {
    var replacement = _escapeCache[codeUnit];
    if (replacement == null) {
      if (codeUnit < 0x10) {
        if (codeUnit == "\b".codeUnitAt(0)) {
          replacement = r"\b";
        } else if (codeUnit == "\t".codeUnitAt(0)) {
          replacement = r"\t";
        } else if (codeUnit == "\n".codeUnitAt(0)) {
          replacement = r"\n";
        } else if (codeUnit == "\v".codeUnitAt(0)) {
          replacement = r"\v";
        } else if (codeUnit == "\f".codeUnitAt(0)) {
          replacement = r"\f";
        } else if (codeUnit == "\r".codeUnitAt(0)) {
          replacement = r"\r";
        } else {
          replacement = r"\x0" + codeUnit.toRadixString(16);
        }
      } else if (codeUnit < 0x100) {
        if (codeUnit == r"$".codeUnitAt(0)) {
          replacement = r"\$";
        } else if (codeUnit == "'".codeUnitAt(0)) {
          replacement = r"\'";
        }
        if (codeUnit == r"\".codeUnitAt(0)) {
          replacement = r"\\";
        } else {
          replacement = r"\x" + codeUnit.toRadixString(16);
        }
      } else if (codeUnit < 0x1000) {
        replacement = r"\u0" + codeUnit.toRadixString(16);
      } else if (codeUnit < 0x10000) {
        replacement = r"\u" + codeUnit.toRadixString(16);
      } else {
        replacement = "\\u{${codeUnit.toRadixString(16)}}";
      }
      _escapeCache[codeUnit] = replacement;
    }
    if (_currentLineLength + replacement.length + 1 > _lineLength) {
      _wrap();
    }
    buffer.write(replacement);
    _currentLineLength += replacement.length;
  }

  void _wrap() {
    buffer
      ..write("'\n")
      ..write(_padding)
      ..write("'");
    _currentLineLength = _padding.length + 1;
  }

  void end() {
    buffer.write("'");
  }
}
