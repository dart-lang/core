// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "dart:math";

import "package:test/test.dart";

import "package:characters/characters.dart";

import "src/unicode_tests.dart";
import "src/unicode_grapheme_tests.dart";
import "src/various_tests.dart";

Random random;

void main([List<String> args]) {
  // Ensure random seed is part of every test failure message,
  // and that it can be reapplied for testing.
  var seed = (args != null && args.isNotEmpty)
      ? int.parse(args[0])
      : Random().nextInt(0x3FFFFFFF);
  random = Random(seed);
  group("[Random Seed: $seed]", tests);
  group("index", () {
    test("simple", () {
      var flag = "\u{1F1E9}\u{1F1F0}";
      var string = "Hi $flag!"; // Regional Indications "DK".
      expect(string.length, 8);
      expect(gc(string).toList(), ["H", "i", " ", flag, "!"]);

      expect(gc(string).indexOf(gc("")), 0);
      expect(gc(string).indexOf(gc(""), 3), 3);
      expect(gc(string).indexOf(gc(""), 4), 7);
      expect(gc(string).indexOf(gc(flag)), 3);
      expect(gc(string).indexOf(gc(flag), 3), 3);
      expect(gc(string).indexOf(gc(flag), 4), lessThan(0));

      expect(gc(string).indexAfter(gc("")), 0);
      expect(gc(string).indexAfter(gc(""), 3), 3);
      expect(gc(string).indexAfter(gc(""), 4), 7);
      expect(gc(string).indexAfter(gc(flag)), 7);
      expect(gc(string).indexAfter(gc(flag), 7), 7);
      expect(gc(string).indexAfter(gc(flag), 8), lessThan(0));

      expect(gc(string).lastIndexOf(gc("")), string.length);
      expect(gc(string).lastIndexOf(gc(""), 7), 7);
      expect(gc(string).lastIndexOf(gc(""), 6), 3);
      expect(gc(string).lastIndexOf(gc(""), 0), 0);
      expect(gc(string).lastIndexOf(gc(flag)), 3);
      expect(gc(string).lastIndexOf(gc(flag), 6), 3);
      expect(gc(string).lastIndexOf(gc(flag), 2), lessThan(0));

      expect(gc(string).lastIndexAfter(gc("")), string.length);
      expect(gc(string).lastIndexAfter(gc(""), 7), 7);
      expect(gc(string).lastIndexAfter(gc(""), 6), 3);
      expect(gc(string).lastIndexAfter(gc(""), 0), 0);
      expect(gc(string).lastIndexAfter(gc(flag)), 7);
      expect(gc(string).lastIndexAfter(gc(flag), 7), 7);
      expect(gc(string).lastIndexAfter(gc(flag), 6), lessThan(0));
    });
    test("multiple", () {
      var flag = "\u{1F1E9}\u{1F1F0}"; // DK.
      var revFlag = "\u{1F1F0}\u{1F1E9}"; // KD.
      var string = "-${flag}-$flag$flag-";
      expect(gc(string).indexOf(gc(flag)), 1);
      expect(gc(string).indexOf(gc(flag), 2), 6);
      expect(gc(string).indexOf(gc(flag), 6), 6);
      expect(gc(string).indexOf(gc(flag), 7), 10);
      expect(gc(string).indexOf(gc(flag), 10), 10);
      expect(gc(string).indexOf(gc(flag), 11), lessThan(0));

      expect(gc(string).indexOf(gc(revFlag)), lessThan(0));
    });

    test("nonBoundary", () {
      // Composite pictogram example, from https://en.wikipedia.org/wiki/Zero-width_joiner.
      var flag = "\u{1f3f3}"; // U+1F3F3, Flag, waving. Category Pictogram.
      var white = "\ufe0f"; // U+FE0F, Variant selector 16. Category Extend.
      var zwj = "\u200d"; // U+200D, ZWJ
      var rainbow = "\u{1f308}"; // U+1F308, Rainbow. Category Pictogram
      var flagRainbow = "$flag$white$zwj$rainbow";
      expect(gc(flagRainbow).length, 1);
      for (var part in [flag, white, zwj, rainbow]) {
        expect(gc(flagRainbow).indexOf(gc(part)), lessThan(0));
        expect(gc(flagRainbow).indexAfter(gc(part)), lessThan(0));
        expect(gc(flagRainbow).lastIndexOf(gc(part)), lessThan(0));
        expect(gc(flagRainbow).lastIndexAfter(gc(part)), lessThan(0));
      }
      expect(gc(flagRainbow + flagRainbow).indexOf(gc(flagRainbow)), 0);
      expect(gc(flagRainbow + flagRainbow).indexAfter(gc(flagRainbow)), 6);
      expect(gc(flagRainbow + flagRainbow).lastIndexOf(gc(flagRainbow)), 6);
      expect(gc(flagRainbow + flagRainbow).lastIndexAfter(gc(flagRainbow)), 12);
      //                                      1     11   11       11           2
      // indices           0           67    90     12   34       67           3
      var partsAndWhole =
          "$flagRainbow $flag $white $zwj $rainbow $flagRainbow";
      // Flag and rainbow are independent graphemes.
      expect(gc(partsAndWhole).toList(), [
        flagRainbow,
        " ",
        flag,
        " $white", // Other + Extend
        " $zwj", // Other + ZWJ
        " ",
        rainbow,
        " ",
        flagRainbow
      ]);
      expect(gc(partsAndWhole).indexOf(gc(flag)), 7);
      expect(gc(partsAndWhole).indexAfter(gc(flag)), 9);
      expect(gc(partsAndWhole).lastIndexOf(gc(flag)), 7);
      expect(gc(partsAndWhole).lastIndexAfter(gc(flag)), 9);

      expect(gc(partsAndWhole).indexOf(gc(rainbow)), 14);
      expect(gc(partsAndWhole).indexAfter(gc(rainbow)), 16);
      expect(gc(partsAndWhole).lastIndexOf(gc(rainbow)), 14);
      expect(gc(partsAndWhole).lastIndexAfter(gc(rainbow)), 16);

      expect(gc(partsAndWhole).indexOf(gc(white)), lessThan(0));
      expect(gc(partsAndWhole).indexAfter(gc(white)), lessThan(0));
      expect(gc(partsAndWhole).lastIndexOf(gc(white)), lessThan(0));
      expect(gc(partsAndWhole).lastIndexAfter(gc(white)), lessThan(0));
      expect(gc(partsAndWhole).indexOf(gc(" $white")), 9);
      expect(gc(partsAndWhole).indexAfter(gc(" $white")), 11);
      expect(gc(partsAndWhole).lastIndexOf(gc(" $white")), 9);
      expect(gc(partsAndWhole).lastIndexAfter(gc(" $white")), 11);

      expect(gc(partsAndWhole).indexOf(gc(zwj)), lessThan(0));
      expect(gc(partsAndWhole).indexAfter(gc(zwj)), lessThan(0));
      expect(gc(partsAndWhole).lastIndexOf(gc(zwj)), lessThan(0));
      expect(gc(partsAndWhole).lastIndexAfter(gc(zwj)), lessThan(0));
      expect(gc(partsAndWhole).indexOf(gc(" $zwj")), 11);
      expect(gc(partsAndWhole).indexAfter(gc(" $zwj")), 13);
      expect(gc(partsAndWhole).lastIndexOf(gc(" $zwj")), 11);
      expect(gc(partsAndWhole).lastIndexAfter(gc(" $zwj")), 13);
    });
  });
}

void tests() {
  test("empty", () {
    expectGC(gc(""), []);
  });
  group("gc-ASCII", () {
    for (var text in [
      "",
      "A",
      "123456abcdefab",
    ]) {
      test('"$text"', () {
        expectGC(gc(text), charsOf(text));
      });
    }
    test("CR+NL", () {
      expectGC(gc("a\r\nb"), ["a", "\r\n", "b"]);
      expectGC(gc("a\n\rb"), ["a", "\n", "\r", "b"]);
    });
  });
  group("Non-ASCII single-code point", () {
    for (var text in [
      "à la mode",
      "rødgrød-æble-ål",
    ]) {
      test('"$text"', () {
        expectGC(gc(text), charsOf(text));
      });
    }
  });
  group("Combining marks", () {
    var text = "a\u0300 la mode";
    test('"$text"', () {
      expectGC(gc(text), ["a\u0300", " ", "l", "a", " ", "m", "o", "d", "e"]);
    });
    var text2 = "æble-a\u030Al";
    test('"$text2"', () {
      expectGC(gc(text2), ["æ", "b", "l", "e", "-", "a\u030A", "l"]);
    });
  });

  group("Regional Indicators", () {
    test('"🇦🇩🇰🇾🇪🇸"', () {
      // Andorra, Cayman Islands, Spain.
      expectGC(gc("🇦🇩🇰🇾🇪🇸"), ["🇦🇩", "🇰🇾", "🇪🇸"]);
    });
    test('"X🇦🇩🇰🇾🇪🇸"', () {
      // Other, Andorra, Cayman Islands, Spain.
      expectGC(gc("X🇦🇩🇰🇾🇪🇸"), ["X", "🇦🇩", "🇰🇾", "🇪🇸"]);
    });
    test('"🇩🇰🇾🇪🇸"', () {
      // Denmark, Yemen, unmatched S.
      expectGC(gc("🇩🇰🇾🇪🇸"), ["🇩🇰", "🇾🇪", "🇸"]);
    });
    test('"X🇩🇰🇾🇪🇸"', () {
      // Other, Denmark, Yemen, unmatched S.
      expectGC(gc("X🇩🇰🇾🇪🇸"), ["X", "🇩🇰", "🇾🇪", "🇸"]);
    });
  });

  group("Hangul", () {
    // Individual characters found on Wikipedia. Not expected to make sense.
    test('"읍쌍된밟"', () {
      expectGC(gc("읍쌍된밟"), ["읍", "쌍", "된", "밟"]);
    });
  });

  group("Unicode test", () {
    for (var gcs in splitTests) {
      test("[${testDescription(gcs)}]", () {
        expectGC(gc(gcs.join()), gcs);
      });
    }
  });

  group("Emoji test", () {
    for (var gcs in emojis) {
      test("[${testDescription(gcs)}]", () {
        expectGC(gc(gcs.join()), gcs);
      });
    }
  });

  group("Zalgo test", () {
    for (var gcs in zalgo) {
      test("[${testDescription(gcs)}]", () {
        expectGC(gc(gcs.join()), gcs);
      });
    }
  });
}

// Converts text with no multi-code-point grapheme clusters into
// list of grapheme clusters.
List<String> charsOf(String text) =>
    text.runes.map((r) => String.fromCharCode(r)).toList();

void expectGC(Characters actual, List<String> expected) {
  var text = expected.join();

  // Iterable operations.
  expect(actual.string, text);
  expect(actual.toString(), text);
  expect(actual.toList(), expected);
  expect(actual.length, expected.length);
  if (expected.isNotEmpty) {
    expect(actual.first, expected.first);
    expect(actual.last, expected.last);
  } else {
    expect(() => actual.first, throwsStateError);
    expect(() => actual.last, throwsStateError);
  }
  if (expected.length == 1) {
    expect(actual.single, expected.single);
  } else {
    expect(() => actual.single, throwsStateError);
  }
  expect(actual.isEmpty, expected.isEmpty);
  expect(actual.isNotEmpty, expected.isNotEmpty);
  expect(actual.contains(""), false);
  for (var char in expected) {
    expect(actual.contains(char), true);
  }
  for (int i = 1; i < expected.length; i++) {
    expect(actual.contains(expected[i - 1] + expected[i]), false);
  }
  expect(actual.skip(1).toList(), expected.skip(1).toList());
  expect(actual.take(1).toList(), expected.take(1).toList());
  expect(actual.skip(1).toString(), expected.skip(1).join());
  expect(actual.take(1).toString(), expected.take(1).join());

  if (expected.isNotEmpty) {
    expect(actual.skipLast(1).toList(),
        expected.take(expected.length - 1).toList());
    expect(actual.takeLast(1).toList(),
        expected.skip(expected.length - 1).toList());
    expect(actual.skipLast(1).toString(),
        expected.take(expected.length - 1).join());
    expect(actual.takeLast(1).toString(),
        expected.skip(expected.length - 1).join());

    expect(actual.indexOf(gc(expected.first)), 0);
    expect(actual.indexAfter(gc(expected.first)), expected.first.length);
    expect(actual.lastIndexOf(gc(expected.last)),
        text.length - expected.last.length);
    expect(actual.lastIndexAfter(gc(expected.last)), text.length);
    if (expected.length > 1) {
      if (expected[0] != expected[1]) {
        expect(actual.indexOf(gc(expected[1])), expected[0].length);
      }
    }
  }

  expect(actual.getRange(1, 3).toString(), expected.take(3).skip(1).join());
  expect(actual.getRange(1, 3).toString(), expected.take(3).skip(1).join());

  bool isEven(String s) => s.length.isEven;

  expect(
      actual.skipWhile(isEven).toList(), expected.skipWhile(isEven).toList());
  expect(
      actual.takeWhile(isEven).toList(), expected.takeWhile(isEven).toList());
  expect(
      actual.skipWhile(isEven).toString(), expected.skipWhile(isEven).join());
  expect(
      actual.takeWhile(isEven).toString(), expected.takeWhile(isEven).join());

  expect(actual.skipLastWhile(isEven).toString(),
      expected.toList().reversed.skipWhile(isEven).toList().reversed.join());
  expect(actual.takeLastWhile(isEven).toString(),
      expected.toList().reversed.takeWhile(isEven).toList().reversed.join());

  expect(actual.where(isEven).toString(), expected.where(isEven).join());

  expect((actual + actual).toString(), actual.string + actual.string);

  List<int> accumulatedLengths = [0];
  for (int i = 0; i < expected.length; i++) {
    accumulatedLengths.add(accumulatedLengths.last + expected[i].length);
  }

  // Iteration.
  var it = actual.iterator;
  expect(it.start, 0);
  expect(it.end, 0);
  for (var i = 0; i < expected.length; i++) {
    expect(it.moveNext(), true);
    expect(it.start, accumulatedLengths[i]);
    expect(it.end, accumulatedLengths[i + 1]);
    expect(it.current, expected[i]);

    expect(actual.elementAt(i), expected[i]);
    expect(actual.skip(i).first, expected[i]);
  }
  expect(it.moveNext(), false);
  expect(it.start, accumulatedLengths.last);
  expect(it.end, accumulatedLengths.last);
  for (var i = expected.length - 1; i >= 0; i--) {
    expect(it.movePrevious(), true);
    expect(it.start, accumulatedLengths[i]);
    expect(it.end, accumulatedLengths[i + 1]);
    expect(it.current, expected[i]);
  }
  expect(it.movePrevious(), false);
  expect(it.start, 0);
  expect(it.end, 0);

  // GraphemeClusters operations.
  expect(actual.toUpperCase().toString(), text.toUpperCase());
  expect(actual.toLowerCase().toString(), text.toLowerCase());

  if (text.isNotEmpty) {
    expect(actual.insertAt(1, gc("abc")).toString(),
        text.replaceRange(1, 1, "abc"));
    expect(actual.replaceSubstring(0, 1, gc("abc")).toString(),
        text.replaceRange(0, 1, "abc"));
    expect(actual.substring(0, 1).string, actual.string.substring(0, 1));
  }

  expect(actual.string, text);

  expect(actual.containsAll(gc("")), true);
  expect(actual.containsAll(actual), true);
  if (expected.isNotEmpty) {
    int steps = min(5, expected.length);
    for (int s = 0; s <= steps; s++) {
      int i = expected.length * s ~/ steps;
      expect(actual.startsWith(gc(expected.sublist(0, i).join())), true);
      expect(actual.endsWith(gc(expected.sublist(i).join())), true);
      for (int t = s + 1; t <= steps; t++) {
        int j = expected.length * t ~/ steps;
        int start = accumulatedLengths[i];
        int end = accumulatedLengths[j];
        var slice = expected.sublist(i, j).join();
        var gcs = gc(slice);
        expect(actual.containsAll(gcs), true);
        expect(actual.startsWith(gcs, start), true);
        expect(actual.endsWith(gcs, end), true);
      }
    }
    if (accumulatedLengths.last > expected.length) {
      int i = expected.indexWhere((s) => s.length != 1);
      assert(accumulatedLengths[i + 1] > accumulatedLengths[i] + 1);
      expect(
          actual.startsWith(gc(text.substring(0, accumulatedLengths[i] + 1))),
          false);
      expect(actual.endsWith(gc(text.substring(accumulatedLengths[i] + 1))),
          false);
      if (i > 0) {
        expect(
            actual.startsWith(
                gc(text.substring(1, accumulatedLengths[i] + 1)), 1),
            false);
      }
      if (i < expected.length - 1) {
        int secondToLast = accumulatedLengths[expected.length - 1];
        expect(
            actual.endsWith(
                gc(text.substring(accumulatedLengths[i] + 1, secondToLast)),
                secondToLast),
            false);
      }
    }
  }

  {
    // Random walk back and forth.
    var it = actual.iterator;
    int pos = -1;
    if (random.nextBool()) {
      pos = expected.length;
      it.reset(text.length);
    }
    int steps = 5 + random.nextInt(expected.length * 2 + 1);
    bool lastMove = false;
    while (true) {
      bool back = false;
      if (pos < 0) {
        expect(lastMove, false);
        expect(it.start, 0);
        expect(it.end, 0);
      } else if (pos >= expected.length) {
        expect(lastMove, false);
        expect(it.start, text.length);
        expect(it.end, text.length);
        back = true;
      } else {
        expect(lastMove, true);
        expect(it.current, expected[pos]);
        expect(it.start, accumulatedLengths[pos]);
        expect(it.end, accumulatedLengths[pos + 1]);
        back = random.nextBool();
      }
      if (--steps < 0) break;
      if (back) {
        lastMove = it.movePrevious();
        pos -= 1;
      } else {
        lastMove = it.moveNext();
        pos += 1;
      }
    }
  }
}

Characters gc(String string) => Characters(string);
