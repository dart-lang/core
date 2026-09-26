import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:test/test.dart';

void main() {
  group('StringReplacer', () {
    test('rejects empty key in constructor and static replace', () {
      expect(() => StringReplacer({'': 'x'}), throwsArgumentError);
      expect(() => StringReplacer({'a': '1', '': 'x'}), throwsArgumentError);
      expect(
        () => StringReplacer.replace('abc', {'': 'x'}),
        throwsArgumentError,
      );
      expect(
        () => StringReplacer.replace('abc', {'a': '1', '': 'x'}),
        throwsArgumentError,
      );
      expect(
        () => StringReplacer.replace('', {'': 'x'}),
        throwsArgumentError,
      );
    });

    test('empty map returns identical input', () {
      final replacer = StringReplacer(const {});
      final input = String.fromCharCodes('hello'.codeUnits);
      expect(identical(replacer.convert(input), input), isTrue);
      expect(identical(StringReplacer.replace(input, const {}), input), isTrue);
      expect(replacer.convert(input, 1, 4), 'ell');
      expect(StringReplacer.replace(input, const {}, 1, 4), 'ell');
    });

    test('basic replacements', () {
      const map = {'a': 'A', 'b': 'B'};
      final replacer = StringReplacer(map);
      expect(replacer.convert('apple banana'), 'Apple BAnAnA');
      expect(StringReplacer.replace('apple banana', map), 'Apple BAnAnA');
    });

    test('identity path with no allocation (single and multi-unit keys)', () {
      final singleReplacer = StringReplacer({'x': 'y', 'z': 'w'});
      final multiReplacer = StringReplacer({'az': 'Y', 'bc': 'Z'});
      final input = String.fromCharCodes('abd_efg'.codeUnits);

      expect(identical(singleReplacer.convert(input), input), isTrue);
      expect(
        identical(StringReplacer.replace(input, {'x': 'y', 'z': 'w'}), input),
        isTrue,
      );
      // Note: 'a' and 'b' appear in `input`, so the first-unit table bucket is
      // non-null, but neither 'az' nor 'bc' matches. Must still return `input`.
      expect(identical(multiReplacer.convert(input), input), isTrue);
      expect(
        identical(StringReplacer.replace(input, {'az': 'Y', 'bc': 'Z'}), input),
        isTrue,
      );
    });

    test('simultaneous swap (no rescan)', () {
      const map = {'a': 'b', 'b': 'a'};
      final replacer = StringReplacer(map);
      expect(replacer.convert('ab'), 'ba');
      expect(StringReplacer.replace('ab', map), 'ba');
    });

    test('HTML entity decoding (double decode hazard)', () {
      const map = {
        '&quot;': '"',
        '&amp;': '&',
        '&lt;': '<',
        '&gt;': '>',
      };
      final replacer = StringReplacer(map);
      expect(replacer.convert('&amp;lt;'), '&lt;');
      expect(StringReplacer.replace('&amp;lt;', map), '&lt;');
    });

    test('backslash unescaping hazard', () {
      const map = {
        r'\n': '\n',
        r'\"': '"',
        r'\\': r'\',
      };
      final replacer = StringReplacer(map);
      expect(replacer.convert(r'\\n'), r'\n');
      expect(StringReplacer.replace(r'\\n', map), r'\n');
    });

    test('template injection hazard', () {
      const map = {
        '{QUERY}': 'what is {CONTEXT}?',
        '{CONTEXT}': 'SECRET',
      };
      final replacer = StringReplacer(map);
      expect(
        replacer.convert('Q: {QUERY} C: {CONTEXT}'),
        'Q: what is {CONTEXT}? C: SECRET',
      );
      expect(
        StringReplacer.replace('Q: {QUERY} C: {CONTEXT}', map),
        'Q: what is {CONTEXT}? C: SECRET',
      );
    });

    test('leftmost-longest key tie-breaker independent of map order', () {
      const map1 = {'a': '1', 'ab': '2', 'abc': '3', 'bc': '4'};
      const map2 = {'bc': '4', 'abc': '3', 'a': '1', 'ab': '2'};
      final r1 = StringReplacer(map1);
      final r2 = StringReplacer(map2);

      for (final input in ['a', 'ab', 'abc', 'abcd', 'abca', 'abbc', 'xabcy']) {
        final expected = r1.convert(input);
        expect(r2.convert(input), expected, reason: 'input="$input"');
        expect(
          StringReplacer.replace(input, map1),
          expected,
          reason: 'static map1 input="$input"',
        );
        expect(
          StringReplacer.replace(input, map2),
          expected,
          reason: 'static map2 input="$input"',
        );
      }
      expect(r1.convert('ab'), '2');
      expect(r1.convert('abc'), '3');
      expect(r1.convert('abbc'), '24');
    });

    test('greedy prefix failure fallback (Aho-Corasick hazard)', () {
      const map = {'abcd': 'X', 'bc': 'Y'};
      final replacer = StringReplacer(map);
      expect(replacer.convert('abc'), 'aY');
      expect(StringReplacer.replace('abc', map), 'aY');
      expect(replacer.convert('abcz'), 'aYz');
      expect(StringReplacer.replace('abcz', map), 'aYz');
    });

    test('start and end slice bounds', () {
      const map = {'ab': 'X', 'bc': 'Y'};
      final replacer = StringReplacer(map);
      // Full string 'abbc' -> 'XY', but slicing [1, 3] ('bb') has no match,
      // and slicing [0, 1] ('a') cannot match 'ab' across slice end.
      expect(replacer.convert('abbc', 1, 3), 'bb');
      expect(StringReplacer.replace('abbc', map, 1, 3), 'bb');
      expect(replacer.convert('abbc', 0, 1), 'a');
      expect(StringReplacer.replace('abbc', map, 0, 1), 'a');
      expect(replacer.convert('abbc', 2, 4), 'Y');
      expect(StringReplacer.replace('abbc', map, 2, 4), 'Y');
      expect(() => replacer.convert('abc', -1, 2), throwsRangeError);
      expect(() => replacer.convert('abc', 0, 4), throwsRangeError);
      expect(() => replacer.convert('abc', 2, 1), throwsRangeError);
      expect(() => StringReplacer.replace('abc', map, -1, 2), throwsRangeError);
      expect(replacer.convert('abbc', 2, 2), '');
      expect(StringReplacer.replace('abbc', map, 2, 2), '');
      expect(replacer.convert(''), '');
      expect(StringReplacer.replace('', map), '');
    });

    test('deletion does not join surrounding characters for rescan', () {
      const map = {'x': '', 'ab': 'Y'};
      final replacer = StringReplacer(map);
      expect(replacer.convert('axb'), 'ab');
      expect(StringReplacer.replace('axb', map), 'ab');
      expect(replacer.convert('axbab'), 'abY');
      expect(StringReplacer.replace('axbab', map), 'abY');
    });

    test('adjacent back-to-back matches', () {
      const map = {'aa': 'b', 'a': 'c'};
      final replacer = StringReplacer(map);
      expect(replacer.convert('aaaaa'), 'bbc');
      expect(StringReplacer.replace('aaaaa', map), 'bbc');
    });

    test('single-key map fast path (full string and slices)', () {
      const map = {'foo': 'bar'};
      final replacer = StringReplacer(map);
      final padding = '.' * 80;
      final noMatch = String.fromCharCodes('${padding}baz$padding'.codeUnits);
      expect(identical(replacer.convert(noMatch), noMatch), isTrue);
      expect(identical(StringReplacer.replace(noMatch, map), noMatch), isTrue);

      final oneMatch = '${padding}foo$padding';
      final expectedOne = '${padding}bar$padding';
      expect(replacer.convert(oneMatch), expectedOne);
      expect(StringReplacer.replace(oneMatch, map), expectedOne);

      final multiMatch = '${padding}foo_${padding}_foo_${padding}_foo';
      final expectedMulti = '${padding}bar_${padding}_bar_${padding}_bar';
      expect(replacer.convert(multiMatch), expectedMulti);
      expect(StringReplacer.replace(multiMatch, map), expectedMulti);

      // Slice that excludes outer matches and only replaces the middle 'foo'
      final start = padding.length + 3; // after first 'foo'
      final end = multiMatch.length - 3; // before last 'foo'
      expect(
        replacer.convert(multiMatch, start, end),
        '_${padding}_bar_${padding}_',
      );
      expect(
        StringReplacer.replace(multiMatch, map, start, end),
        '_${padding}_bar_${padding}_',
      );
    });

    test('non-Latin-1 keys and first-unit 0xFF bucket collisions', () {
      // 'a' is 0x0061, 'š' is 0x0161 (both have firstUnit & 0xFF == 0x61).
      // '😀' and '🚀' share the high surrogate 0xD83D.
      const map = {
        'a': 'A',
        'š': 'S',
        'šb': 'SB',
        'ab': 'AB',
        '€': 'EUR',
        '😀': ':smile:',
        '🚀': ':rocket:',
      };
      final replacer = StringReplacer(map);
      final padding = '_' * 80;
      final input = 'a š šb ab € 😀 🚀 ă $padding a šb € 🚀';
      final expected =
          'A S SB AB EUR :smile: :rocket: ă $padding A SB EUR :rocket:';
      expect(replacer.convert(input), expected);
      expect(StringReplacer.replace(input, map), expected);

      // Single-code-unit non-Latin-1 key ('€' == 0x20AC >= 256)
      const euroMap = {'€': 'EUR'};
      final euroReplacer = StringReplacer(euroMap);
      expect(euroReplacer.convert('100€ + 50€'), '100EUR + 50EUR');
      expect(StringReplacer.replace('100€ + 50€', euroMap), '100EUR + 50EUR');
    });

    test('long strings (> 64 chars) across active-key pruning states', () {
      const map = {
        'alpha': 'ALPHA',
        'alphabet': 'ALPHABET',
        'beta': 'BETA',
        'gamma': 'GAMMA',
        'unused1': 'U1',
        'unused2': 'U2',
      };
      final replacer = StringReplacer(map);
      final pad = '-' * 40;

      // 1. 0 active keys in long string -> identical return
      final none = String.fromCharCodes('$pad.$pad.$pad'.codeUnits);
      expect(identical(replacer.convert(none), none), isTrue);
      expect(identical(StringReplacer.replace(none, map), none), isTrue);
      expect(replacer.convert(none, 10, none.length - 10),
          none.substring(10, none.length - 10));
      expect(StringReplacer.replace(none, map, 10, none.length - 10),
          none.substring(10, none.length - 10));

      // 2. Exactly 1 active key in long string (single and multiple matches)
      final singleHit = '${pad}beta$pad$pad';
      expect(replacer.convert(singleHit), '${pad}BETA$pad$pad');
      expect(StringReplacer.replace(singleHit, map), '${pad}BETA$pad$pad');

      final multiSingleKey = '${pad}beta${pad}beta${pad}beta$pad';
      final expectedMultiSingle = '${pad}BETA${pad}BETA${pad}BETA$pad';
      expect(replacer.convert(multiSingleKey), expectedMultiSingle);
      expect(StringReplacer.replace(multiSingleKey, map), expectedMultiSingle);

      // 3. 2+ active keys that prune down to 1 active key in the tail:
      // 'alphabet' (longest match over 'alpha') occurs once at the start,
      // then only 'beta' occurs once or multiple times in the remaining tail.
      final pruneToOneOccurrence = 'alphabet$pad${pad}beta$pad';
      expect(
        replacer.convert(pruneToOneOccurrence),
        'ALPHABET$pad${pad}BETA$pad',
      );
      expect(
        StringReplacer.replace(pruneToOneOccurrence, map),
        'ALPHABET$pad${pad}BETA$pad',
      );

      final pruneToMultipleOccurrences =
          'alphabet${pad}beta${pad}beta${pad}beta$pad';
      expect(
        replacer.convert(pruneToMultipleOccurrences),
        'ALPHABET${pad}BETA${pad}BETA${pad}BETA$pad',
      );
      expect(
        StringReplacer.replace(pruneToMultipleOccurrences, map),
        'ALPHABET${pad}BETA${pad}BETA${pad}BETA$pad',
      );

      // 4. Slice boundary cutting across a potential key match at `end`:
      // 'alphabet' starts at `end - 5`, so inside the slice only 'alpha' fits!
      final boundaryInput = '$pad${pad}alphabet';
      final sliceEnd = boundaryInput.length - 3; // cuts off 'bet'
      expect(
        replacer.convert(boundaryInput, 0, sliceEnd),
        '$pad${pad}ALPHA',
      );
      expect(
        StringReplacer.replace(boundaryInput, map, 0, sliceEnd),
        '$pad${pad}ALPHA',
      );
    });

    group('chunked conversion', () {
      void testChunked(
        Map<String, String> map,
        List<String> chunks,
        String expected,
      ) {
        final replacer = StringReplacer(map);
        final results = <String>[];
        final sink = replacer.startChunkedConversion(
          StringConversionSink.withCallback(results.add),
        );
        for (var i = 0; i < chunks.length; i++) {
          sink.addSlice(chunks[i], 0, chunks[i].length, i == chunks.length - 1);
        }
        sink.close();
        expect(results.join(), expected);
      }

      test('single-unit keys chunked', () {
        testChunked({'a': '1'}, ['b', 'a', 'b', 'a'], 'b1b1');
      });

      test('split key', () {
        testChunked({'abc': '1'}, ['a', 'b', 'c'], '1');
      });

      test('fallback when key does not complete', () {
        testChunked({'abcd': 'X', 'bc': 'Y'}, ['ab', 'cz'], 'aYz');
        testChunked({'abcd': 'X', 'bc': 'Y'}, ['abc', 'z'], 'aYz');
      });

      test('incomplete prefix flushed on close()', () {
        final replacer = StringReplacer({'abcd': 'X', 'bc': 'Y'});
        final results = <String>[];
        // Pass a plain Sink<String> (not a StringConversionSink) to verify
        // startChunkedConversion wrapping, and use sink.add() + sink.close().
        final plainSink = _ListStringSink(results);
        final sink = replacer.startChunkedConversion(plainSink);
        sink.add('');
        sink.add('a');
        sink.add('bc');
        sink.close();
        expect(plainSink.isClosed, isTrue);
        expect(results.join(), 'aY');
      });

      test('empty map and non-zero slice offsets in addSlice', () {
        final emptyReplacer = StringReplacer(const {});
        final emptyOut = StringBuffer();
        final emptySink = emptyReplacer.startChunkedConversion(
          StringConversionSink.fromStringSink(emptyOut),
        );
        emptySink.addSlice('xxhelloyy', 2, 7, false);
        emptySink.addSlice('xx', 1, 1, false);
        emptySink.addSlice('xx worldyy', 2, 8, true);
        expect(emptyOut.toString(), 'hello world');

        final replacer = StringReplacer({'ab': 'X', 'bc': 'Y'});
        final out = StringBuffer();
        final sink = replacer.startChunkedConversion(
          StringConversionSink.fromStringSink(out),
        );
        sink.addSlice('..a..', 2, 3, false); // 'a' buffered
        sink.addSlice('..b..', 2, 2, false); // empty slice while buffer != ''
        sink.addSlice('..bc..', 2, 4, false); // 'bc' -> 'ab' becomes 'X', 'c'
        sink.addSlice('..', 1, 1, true); // empty final slice flushes 'c'
        expect(out.toString(), 'Xc');

        expect(
          () => sink.addSlice('abc', -1, 2, false),
          throwsRangeError,
        );
      });

      test('long waiting across chunks', () {
        testChunked({'abcdef': 'X'}, ['a', 'b', 'c', 'd', 'e', 'f'], 'X');
      });

      test('surrogate pairs safely handled', () {
        testChunked({'😃': 'happy'}, ['😃', '😃'], 'happyhappy');
        // Split across surrogate pair code units
        const smile = '😃';
        testChunked(
          {'😃': 'happy'},
          [smile.substring(0, 1), smile.substring(1, 2)],
          'happy',
        );
      });

      test('exhaustive chunk splits match one-shot convert', () {
        const maps = <Map<String, String>>[
          {'a': '1', 'ab': '2', 'abc': '3', 'bc': '4'},
          {'abcd': 'X', 'bc': 'Y', 'b': 'Z'},
          {'&amp;': '&', '&lt;': '<', '&gt;': '>', '&': '&amp;'},
          {'\r\n': '\n', '\r': '\n'},
        ];
        const inputs = [
          'abcabbcabczabcd',
          '&amp;lt;&gt;&amp;',
          'a\r\nb\rc\r\n',
        ];

        for (final map in maps) {
          final replacer = StringReplacer(map);
          for (final input in inputs) {
            final expected = replacer.convert(input);
            expect(StringReplacer.replace(input, map), expected);

            // 1-char chunks, 2-char chunks, 3-char chunks
            for (var step = 1; step <= 4; step++) {
              final out = StringBuffer();
              final sink = replacer.startChunkedConversion(
                StringConversionSink.fromStringSink(out),
              );
              for (var i = 0; i < input.length; i += step) {
                final end = (i + step < input.length) ? i + step : input.length;
                sink.addSlice(input, i, end, false);
              }
              sink.close();
              expect(
                out.toString(),
                expected,
                reason: 'step=$step map=$map input="$input"',
              );
            }
          }
        }
      });
    });
  });
}

class _ListStringSink implements Sink<String> {
  final List<String> results;
  bool isClosed = false;

  _ListStringSink(this.results);

  @override
  void add(String data) {
    results.add(data);
  }

  @override
  void close() {
    isClosed = true;
  }
}
