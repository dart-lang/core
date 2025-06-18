// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:characters/src/grapheme_clusters/breaks.dart';
import 'package:characters/src/grapheme_clusters/constants.dart';

import '../test/src/text_samples.dart';
import '../test/src/unicode_grapheme_tests.dart';
import '../test/src/various_tests.dart';

// Low-level benchmark of the grapheme cluster step functions.
// Use ../benchmark/benchmark.dart for the more high-level `Characters`
// methods.

void main(List<String> args) {
  var count = 5;
  if (args.isNotEmpty) {
    count = int.parse(args[0]);
  }
  var text = genesis +
      hangul +
      genesis +
      diacretics +
      recJoin(splitTests) +
      recJoin(emojis) +
      recJoin(zalgo);
  var codeUnits = text.length;
  var codePoints = text.runes.length;
  // Warmup.
  var gcSumForward = benchForward(text, -1, codePoints, codeUnits, 150);
  var gcSumBackwards = benchBackward(text, -1, codePoints, codeUnits, 150);
  if (gcSumForward != gcSumBackwards) {
    print(
      'ERROR: Did not count the same number of grapheme clusters: '
      '$gcSumForward forward vs. $gcSumBackwards backward.',
    );
    return;
  }

  for (var i = 0; i < count; i++) {
    gcSumForward = benchForward(text, i, codePoints, codeUnits, 1500);
    gcSumBackwards = benchBackward(text, i, codePoints, codeUnits, 1500);
  }
  print('gc: Grapheme Clusters, cp: Code Points, cu: Code Units.');
  if (gcSumForward != gcSumBackwards) {
    print(
      'ERROR: Did not count the same number of grapheme clusters: '
      '$gcSumForward forward vs. $gcSumBackwards backward.',
    );
  } else {
    var surrogates = codeUnits - codePoints;
    print(
      'Total: $gcSumForward gc, $codePoints cp, $codeUnits cu, '
      '$surrogates surrogates '
      '(${(surrogates / codePoints * 100).toStringAsFixed(3)}%)',
    );
    print('Avg ${(codePoints / gcSumForward).toStringAsFixed(3)} cp/gc');
    print('Avg ${(codeUnits / gcSumForward).toStringAsFixed(3)} cu/gc');
  }
}

String recJoin(Iterable<List<String>> texts) =>
    texts.map((x) => x.join('')).join('\n');

int benchForward(String text, int round, int cp, int cu, int limit) {
  var n = 0;
  var step = 10;
  var gc = 0;
  var e = 0;
  var sw = Stopwatch()..start();
  do {
    for (var i = 0; i < step; i++) {
      var breaks = Breaks(text, 0, text.length, stateSoTNoBreak);
      while (breaks.nextBreak() >= 0) {
        gc++;
      }
    }
    e = sw.elapsedMilliseconds;
    n += step;
    step += step;
  } while (e < limit);
  if (limit > 500) {
    print(
      'Forward  #$round: ${(gc / e).round()} gc/ms, '
      '${(n * cp / e).round()} cp/ms, '
      '${(n * cu / e).round()} cu/ms, '
      '$n rounds in $e ms',
    );
  }
  return gc ~/ n;
}

int benchBackward(String text, int round, int cp, int cu, int limit) {
  var n = 0;
  var step = 10;
  var gc = 0;
  var e = 0;
  var sw = Stopwatch()..start();
  do {
    for (var i = 0; i < step; i++) {
      var breaks = BackBreaks(text, text.length, 0, stateEoTNoBreak);
      while (breaks.nextBreak() >= 0) {
        gc++;
      }
    }
    e = sw.elapsedMilliseconds;
    n += step;
    step += step;
  } while (e < limit);
  if (limit > 500) {
    print(
      'Backward #$round: ${(gc / e).round()} gc/ms, '
      '${(n * cp / e).round()} cp/ms, '
      '${(n * cu / e).round()} cu/ms, '
      '$n rounds in $e ms',
    );
  }
  return gc ~/ n;
}
