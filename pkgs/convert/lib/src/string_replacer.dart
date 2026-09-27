// Copyright (c) 2026, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

/// True when compiled to JavaScript (`dart2js`/`ddc`) or Wasm (`dart2wasm`),
/// where `String` is backed by the host JS engine's string representation and
/// `String.indexOf` uses native SIMD string search.
const bool _isWeb = bool.fromEnvironment('dart.library.js_interop');

/// Replaces multiple literal strings in a single left-to-right pass.
///
/// At each position, the longest matching key wins, independent of the
/// iteration order of the input map. Replaced text is never rescanned. Keys
/// are compared as UTF-16 code units.
final class StringReplacer extends Converter<String, String> {
  final List<String> _keys;
  final List<String> _values;
  final List<List<_Entry>?>? _table;
  final List<String?>? _unitTable;
  final bool _allSingle;

  /// Creates a new [StringReplacer] with the given [replacements].
  ///
  /// Throws an [ArgumentError] if any key is empty.
  factory StringReplacer(Map<String, String> replacements) {
    var allSingle = true;

    for (final key in replacements.keys) {
      if (key.isEmpty) {
        throw ArgumentError.value(
          '',
          'replacements',
          'Empty key is not allowed.',
        );
      }
      if (key.length != 1 || key.codeUnitAt(0) >= 256) {
        allSingle = false;
      }
    }

    final count = replacements.length;
    if (count == 0) {
      return const StringReplacer._(true, [], [], null, null);
    }

    if (allSingle) {
      final keys = List<String>.filled(count, '');
      final values = List<String>.filled(count, '');
      final unitTable = List<String?>.filled(256, null);
      var i = 0;
      for (final entry in replacements.entries) {
        final k = entry.key;
        final v = entry.value;
        keys[i] = k;
        values[i] = v;
        unitTable[k.codeUnitAt(0)] = v;
        i++;
      }
      return StringReplacer._(true, keys, values, unitTable, null);
    } else {
      final entries = <_Entry>[
        for (final entry in replacements.entries)
          _Entry(entry.key, entry.value, entry.key.codeUnitAt(0)),
      ]..sort((a, b) => b.key.length.compareTo(a.key.length));

      final keys = List<String>.generate(
        count,
        (i) => entries[i].key,
        growable: false,
      );
      final values = List<String>.generate(
        count,
        (i) => entries[i].value,
        growable: false,
      );
      final table = List<List<_Entry>?>.filled(256, null);
      for (var i = 0; i < count; i++) {
        final e = entries[i];
        (table[e.firstUnit & 0xFF] ??= <_Entry>[]).add(e);
      }
      return StringReplacer._(false, keys, values, null, table);
    }
  }

  const StringReplacer._(
    this._allSingle,
    this._keys,
    this._values,
    this._unitTable,
    this._table,
  );

  /// Replaces all occurrences of keys in [replacements] within [input] in a
  /// single left-to-right pass without requiring a prebuilt [StringReplacer].
  ///
  /// At each position, the longest matching key wins, independent of the
  /// iteration order of [replacements]. Inserted replacement text is never
  /// rescanned.
  ///
  /// If [start] and [end] are provided, only the substring from [start] to
  /// [end] is scanned and returned.
  ///
  /// When no keys match and `start == 0 && end == input.length`, returns
  /// [input] unchanged.
  ///
  /// Throws an [ArgumentError] if any key in [replacements] is empty.
  static String replace(
    String input,
    Map<String, String> replacements, [
    int start = 0,
    int? end,
  ]) {
    end = RangeError.checkValidRange(start, end, input.length);
    if (replacements.isEmpty) {
      return (start == 0 && end == input.length)
          ? input
          : input.substring(start, end);
    }
    if (_isWeb || end - start < 64 || replacements.length == 1) {
      return _replaceOneShotIndexOf(input, replacements, start, end);
    }
    return StringReplacer(replacements).convert(input, start, end);
  }

  @override
  String convert(String input, [int start = 0, int? end]) {
    end = RangeError.checkValidRange(start, end, input.length);

    if (start == end) return '';
    if (_keys.isEmpty) {
      return (start == 0 && end == input.length)
          ? input
          : input.substring(start, end);
    }

    if (_isWeb && end - start > 48) {
      return _replaceWeb(input, start, end);
    }

    if (_allSingle) {
      return _replaceUnits(input, start, end);
    } else {
      return _replaceGeneralOneShot(input, start, end);
    }
  }

  @override
  StringConversionSink startChunkedConversion(Sink<String> sink) =>
      _StringReplacerSink(
        this,
        sink is StringConversionSink ? sink : StringConversionSink.from(sink),
      );

  String _replaceUnits(String s, int start, int end) {
    final unitTable = _unitTable!;
    var i = start;
    while (i < end) {
      final unit = s.codeUnitAt(i);
      if (unit < 256 && unitTable[unit] != null) break;
      i++;
    }
    if (i == end) {
      return (start == 0 && end == s.length) ? s : s.substring(start, end);
    }

    final out = StringBuffer();
    var lastFlush = start;

    for (; i < end; i++) {
      final unit = s.codeUnitAt(i);
      if (unit < 256) {
        final replacement = unitTable[unit];
        if (replacement != null) {
          if (i > lastFlush) out.write(s.substring(lastFlush, i));
          out.write(replacement);
          lastFlush = i + 1;
        }
      }
    }
    if (end > lastFlush) {
      out.write(s.substring(lastFlush, end));
    }
    return out.toString();
  }

  String _replaceGeneralOneShot(String s, int start, int end) {
    final table = _table!;
    var i = start;
    while (i < end && table[s.codeUnitAt(i) & 0xFF] == null) {
      i++;
    }
    if (i == end) {
      return (start == 0 && end == s.length) ? s : s.substring(start, end);
    }

    StringBuffer? out;
    var lastFlush = start;

    while (i < end) {
      final unit = s.codeUnitAt(i);
      final entries = table[unit & 0xFF];
      if (entries != null) {
        final bestMatch = _matchAt(s, i, end, unit, entries);
        if (bestMatch != null) {
          out ??= StringBuffer();
          if (i > lastFlush) out.write(s.substring(lastFlush, i));
          out.write(bestMatch.value);
          i += bestMatch.key.length;
          lastFlush = i;
          continue;
        }
      }
      i++;
    }

    if (out == null) {
      return (start == 0 && end == s.length) ? s : s.substring(start, end);
    }
    if (end > lastFlush) {
      out.write(s.substring(lastFlush, end));
    }
    return out.toString();
  }

  static _Entry? _matchAt(
    String s,
    int i,
    int end,
    int unit,
    List<_Entry> entries,
  ) {
    for (var k = 0; k < entries.length; k++) {
      final e = entries[k];
      if (e.firstUnit != unit) continue;
      final key = e.key;
      final n = key.length;
      if (i + n <= end && _regionMatches(s, i, key, n)) {
        return e;
      }
    }
    return null;
  }

  static bool _regionMatches(String s, int i, String key, int n) {
    for (var j = 1; j < n; j++) {
      if (s.codeUnitAt(i + j) != key.codeUnitAt(j)) return false;
    }
    return true;
  }

  String _replaceWeb(String s, int start, int end) {
    final keys = _keys;
    final values = _values;
    final n = keys.length;
    List<String>? activeKeys;
    List<String>? activeValues;
    List<int>? activePos;
    var best = -1;
    var bestPos = end;
    var bestLen = 0;

    for (var k = 0; k < n; k++) {
      final key = keys[k];
      final p = start == 0 ? s.indexOf(key) : s.indexOf(key, start);
      if (p >= 0 && p + key.length <= end) {
        final idx = (activeKeys ??= <String>[]).length;
        activeKeys.add(key);
        (activeValues ??= <String>[]).add(values[k]);
        (activePos ??= <int>[]).add(p);
        final keyLen = key.length;
        if (p < bestPos || (p == bestPos && keyLen > bestLen)) {
          best = idx;
          bestPos = p;
          bestLen = keyLen;
        }
      }
    }

    if (activeKeys == null) {
      return (start == 0 && end == s.length) ? s : s.substring(start, end);
    }

    return _finishActiveKeyReplace(
      s,
      start,
      end,
      activeKeys,
      activeValues!,
      activePos!,
      best,
      bestPos,
    );
  }

  static String _replaceOneShotIndexOf(
    String s,
    Map<String, String> replacements,
    int start,
    int end,
  ) {
    final sliceLen = end - start;
    List<String>? activeKeys;
    List<String>? activeValues;
    List<int>? activePos;
    var best = -1;
    var bestPos = end;
    var bestLen = 0;

    for (final key in replacements.keys) {
      if (key.isEmpty) {
        throw ArgumentError.value(
          '',
          'replacements',
          'Empty key is not allowed.',
        );
      }
      final keyLen = key.length;
      if (keyLen > sliceLen) continue;
      final p = start == 0 ? s.indexOf(key) : s.indexOf(key, start);
      if (p >= 0 && p + keyLen <= end) {
        final idx = (activeKeys ??= <String>[]).length;
        activeKeys.add(key);
        (activeValues ??= <String>[]).add(replacements[key]!);
        (activePos ??= <int>[]).add(p);
        if (p < bestPos || (p == bestPos && keyLen > bestLen)) {
          best = idx;
          bestPos = p;
          bestLen = keyLen;
        }
      }
    }

    if (activeKeys == null) {
      return (start == 0 && end == s.length) ? s : s.substring(start, end);
    }

    return _finishActiveKeyReplace(
      s,
      start,
      end,
      activeKeys,
      activeValues!,
      activePos!,
      best,
      bestPos,
    );
  }

  static String _finishActiveKeyReplace(
    String s,
    int start,
    int end,
    List<String> activeKeys,
    List<String> activeVals,
    List<int> positions,
    int best,
    int bestPos,
  ) {
    var activeCount = activeKeys.length;

    if (activeCount == 1) {
      if (_isWeb && start == 0 && end == s.length) {
        return s.replaceAll(activeKeys[0], activeVals[0]);
      }
      return _replaceSingleKeySlice(
        s,
        start,
        end,
        activeKeys[0],
        activeVals[0],
        positions[0],
      );
    }

    final out = StringBuffer();
    var lastFlush = start;

    while (best >= 0) {
      if (activeCount == 1) {
        _appendSingleKeyRemaining(
          out,
          s,
          lastFlush,
          end,
          activeKeys[0],
          activeVals[0],
          positions[0],
        );
        return out.toString();
      }

      final matchKey = activeKeys[best];
      if (bestPos > lastFlush) out.write(s.substring(lastFlush, bestPos));
      out.write(activeVals[best]);
      lastFlush = bestPos + matchKey.length;

      best = -1;
      bestPos = end;
      var bestLen = 0;
      var k = 0;
      while (k < activeCount) {
        var p = positions[k];
        final key = activeKeys[k];
        final keyLen = key.length;
        if (p < lastFlush) {
          p = s.indexOf(key, lastFlush);
          if (p < 0 || p + keyLen > end) {
            activeCount--;
            if (k < activeCount) {
              activeKeys[k] = activeKeys[activeCount];
              activeVals[k] = activeVals[activeCount];
              positions[k] = positions[activeCount];
            }
            continue;
          }
          positions[k] = p;
        }
        if (p < bestPos || (p == bestPos && keyLen > bestLen)) {
          best = k;
          bestPos = p;
          bestLen = keyLen;
        }
        k++;
      }
    }

    if (end > lastFlush) {
      out.write(s.substring(lastFlush, end));
    }
    return out.toString();
  }

  static String _replaceSingleKeySlice(
    String s,
    int start,
    int end,
    String key,
    String value,
    int firstPos,
  ) {
    final out = StringBuffer();
    _appendSingleKeyRemaining(out, s, start, end, key, value, firstPos);
    return out.toString();
  }

  static void _appendSingleKeyRemaining(
    StringBuffer out,
    String s,
    int lastFlush,
    int end,
    String key,
    String value,
    int firstPos,
  ) {
    final keyLen = key.length;
    if (firstPos > lastFlush) out.write(s.substring(lastFlush, firstPos));
    out.write(value);
    lastFlush = firstPos + keyLen;
    var pos = s.indexOf(key, lastFlush);
    if (pos < 0 || pos + keyLen > end) {
      if (end > lastFlush) {
        out.write(s.substring(lastFlush, end));
      }
      return;
    }
    if (_isWeb) {
      if (pos > lastFlush) out.write(s.substring(lastFlush, pos));
      out.write(s.substring(pos, end).replaceAll(key, value));
      return;
    }
    while (true) {
      if (pos > lastFlush) out.write(s.substring(lastFlush, pos));
      out.write(value);
      lastFlush = pos + keyLen;
      pos = s.indexOf(key, lastFlush);
      if (pos < 0 || pos + keyLen > end) break;
    }
    if (end > lastFlush) {
      out.write(s.substring(lastFlush, end));
    }
  }

  int _processGeneralChunk(
    String s,
    int start,
    int end,
    bool isLast,
    StringSink out,
  ) {
    if (start == end) return end;
    final table = _table!;

    var i = start;
    var lastFlush = start;

    while (i < end) {
      final unit = s.codeUnitAt(i);
      final entries = table[unit & 0xFF];
      if (entries != null) {
        _Entry? bestMatch;
        var waitingForMoreData = false;

        for (var k = 0; k < entries.length; k++) {
          final e = entries[k];
          if (e.firstUnit != unit) continue;
          final key = e.key;
          final keyLen = key.length;

          if (i + keyLen <= end) {
            if (_regionMatches(s, i, key, keyLen)) {
              bestMatch = e;
              break;
            }
          } else {
            if (!isLast && _matchesPrefix(s, i, key, end - i)) {
              waitingForMoreData = true;
              break;
            }
          }
        }

        if (waitingForMoreData) {
          break; // Stop at `i`, wait for more.
        }

        if (bestMatch != null) {
          if (i > lastFlush) out.write(s.substring(lastFlush, i));
          out.write(bestMatch.value);
          i += bestMatch.key.length;
          lastFlush = i;
          continue;
        }
      }
      i++;
    }

    if (i > lastFlush) {
      out.write(s.substring(lastFlush, i));
    }
    return i;
  }

  static bool _matchesPrefix(String s, int i, String key, int prefixLen) {
    for (var j = 1; j < prefixLen; j++) {
      if (s.codeUnitAt(i + j) != key.codeUnitAt(j)) return false;
    }
    return true;
  }
}

final class _Entry {
  final String key;
  final String value;
  final int firstUnit;
  const _Entry(this.key, this.value, this.firstUnit);
}

class _StringReplacerSink extends StringConversionSinkBase {
  final StringReplacer _replacer;
  final StringConversionSink _sink;
  String _buffer = '';

  _StringReplacerSink(this._replacer, this._sink);

  @override
  void addSlice(String chunk, int start, int end, bool isLast) {
    end = RangeError.checkValidRange(start, end, chunk.length);
    if (start == end && !isLast) return;

    String text;
    if (_buffer.isEmpty) {
      text = (start == 0 && end == chunk.length)
          ? chunk
          : chunk.substring(start, end);
    } else {
      text = _buffer + chunk.substring(start, end);
      _buffer = '';
    }

    if (text.isEmpty && !isLast) return;

    if (isLast) {
      if (text.isNotEmpty) {
        _sink.add(_replacer.convert(text));
      }
      _sink.close();
      return;
    }

    if (_replacer._allSingle) {
      _sink.add(_replacer.convert(text));
    } else {
      final out = StringBuffer();
      final processed = _replacer._processGeneralChunk(
        text,
        0,
        text.length,
        false,
        out,
      );
      if (out.isNotEmpty) {
        _sink.add(out.toString());
      }
      _buffer = text.substring(processed);
    }
  }

  @override
  void close() {
    if (_buffer.isNotEmpty) {
      _sink.add(_replacer.convert(_buffer));
      _buffer = '';
    }
    _sink.close();
  }
}
