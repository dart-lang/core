// Benchmark the Unicode grapheme iterator with Otzaria-like text.
//
// Run: dart run benchmark/plain_text_benchmark.dart
// Compare the same Dart VM, runtime mode, and hardware across revisions.

import 'package:characters/characters.dart';

void main() {
  final samples = <String, String>{
    'plain Hebrew': List.filled(
      300,
      'בראשית ברא אלוקים את השמים ואת הארץ. ',
    ).join(),
    'vowelized Hebrew': List.filled(
      300,
      'בְּרֵאשִׁית בָּרָא אֱלֹקִים. ',
    ).join(),
    'ASCII': List.filled(300, 'A simple English sentence to measure. ').join(),
    'mixed Unicode': List.filled(
      300,
      'שלום ABC \u{1F600} בְּרֵאשִׁית. ',
    ).join(),
  };

  for (final entry in samples.entries) {
    final characters = Characters(entry.value);
    var clusters = 0;
    final watch = Stopwatch()..start();
    for (var i = 0; i < 100; i++) {
      final range = characters.iterator;
      while (range.moveNext()) {
        clusters++;
      }
    }
    watch.stop();
    final clustersPerMs = clusters * 1000 / watch.elapsedMicroseconds;
    print('${entry.key}: ${clustersPerMs.toStringAsFixed(1)} clusters/ms');
  }
}
