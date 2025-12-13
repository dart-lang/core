// Copyright (c) 2025, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Reusable utilities for benchmarking sorting algorithms.
library;

import 'dart:math';
import 'package:benchmark_harness/benchmark_harness.dart';

// Sink variable to prevent the compiler from optimizing away benchmark code.
int sink = 0;

/// The aggregated result of a benchmark run.
class BenchmarkResult {
  final double mean;
  final int median;
  final double stdDev;
  final List<int> allTimes;

  BenchmarkResult(this.mean, this.median, this.stdDev, this.allTimes);
}

/// Base class for sorting benchmarks with dataset generation.
abstract class SortBenchmarkBase extends BenchmarkBase {
  final int size;
  late final List<List<int>> _datasets;
  int _iteration = 0;
  int _checksum = 0;

  SortBenchmarkBase(super.name, this.size);

  /// Generate datasets for this benchmark condition.
  List<List<int>> generateDatasets();

  @override
  void setup() {
    _datasets = generateDatasets();
  }

  /// Get the next list to sort (creates a copy).
  List<int> get nextList {
    final dataset = _datasets[_iteration];
    _iteration++;
    if (_iteration == _datasets.length) _iteration = 0;
    return dataset.toList();
  }

  /// Update checksum to prevent compiler optimization.
  void updateChecksum(List<int> list) {
    sink ^= list.first ^ list.last ^ list[list.length >> 1] ^ _checksum++;
  }

  /// The core sorting operation to benchmark.
  void performSort();

  @override
  void run() => performSort();
}

/// Data pattern generators for consistent testing.
class DatasetGenerators {
  /// Generate random integer lists.
  static List<List<int>> random(int size, {int count = 128, int? seed}) {
    final r = Random(seed ?? 12345);
    return List.generate(
        count, (_) => List.generate(size, (_) => r.nextInt(size)));
  }

  /// Generate sorted lists.
  static List<List<int>> sorted(int size) {
    return [List.generate(size, (i) => i, growable: true)];
  }

  /// Generate reverse-sorted lists.
  static List<List<int>> reverse(int size) {
    return [List.generate(size, (i) => size - i - 1, growable: true)];
  }

  /// Generate lists with few unique values.
  static List<List<int>> fewUnique(int size,
      {int uniqueCount = 7, int count = 128, int? seed}) {
    final r = Random(seed ?? 67890);
    return List.generate(
        count, (_) => List.generate(size, (_) => r.nextInt(uniqueCount)));
  }

  /// Generate pathological input (worst-case for naive quicksort).
  /// Contains even-indexed elements followed by odd-indexed in reverse.
  static List<List<int>> pathological(int size) {
    final sorted = List.generate(size, (i) => i, growable: false);
    final secondLoopStart = (size - 1).isOdd ? size - 1 : size - 2;
    final pathological = [
      for (var i = 0; i < size; i += 2) sorted[i],
      for (var i = secondLoopStart; i > -1; i -= 2) sorted[i],
    ];
    return [pathological];
  }

  /// Generate nearly sorted lists (only a few elements out of place).
  static List<List<int>> nearlySorted(int size,
      {double swapPercent = 0.05, int count = 128, int? seed}) {
    final r = Random(seed ?? 11111);
    return List.generate(count, (_) {
      final list = List.generate(size, (i) => i, growable: true);
      final numSwaps = (size * swapPercent).round();
      for (var i = 0; i < numSwaps; i++) {
        final idx1 = r.nextInt(size);
        final idx2 = r.nextInt(size);
        final temp = list[idx1];
        list[idx1] = list[idx2];
        list[idx2] = temp;
      }
      return list;
    });
  }
}

/// Run a benchmark multiple times and collect statistics.
BenchmarkResult runBenchmark(SortBenchmarkBase benchmark, int samples) {
  final times = <int>[];

  // Setup datasets
  benchmark.setup();

  // Warmup runs (not timed)
  for (var i = 0; i < 3; i++) {
    benchmark.run();
  }

  // Timed runs
  for (var i = 0; i < samples; i++) {
    final stopwatch = Stopwatch()..start();
    benchmark.run();
    stopwatch.stop();
    times.add(stopwatch.elapsedMicroseconds);
  }

  times.sort();
  final mean = times.reduce((a, b) => a + b) / samples;
  final median = times[samples >> 1];

  // Calculate standard deviation
  final variance =
      times.map((t) => pow(t - mean, 2)).reduce((a, b) => a + b) / samples;
  final stdDev = sqrt(variance);

  return BenchmarkResult(mean, median, stdDev, times);
}

/// Print benchmark results as a markdown table.
///
/// [baselineName] and [comparisonName] are the labels for the
/// two implementations
/// being compared (e.g., "Legacy", "pdqsort", "MergeSort", etc.).
void printResultsAsMarkdownTable(
    Map<String, (BenchmarkResult, BenchmarkResult)> results, int size,
    {required String baselineName,
    required String comparisonName,
    bool showStdDev = false}) {
  final separator = '=' * 100;
  print('\n$separator');
  print('Benchmark Results (Size: $size): $comparisonName vs. $baselineName');
  print(separator);

  // Calculate dynamic column widths based on name lengths
  final baselineColWidth = max(baselineName.length + 5, 13);
  final comparisonColWidth = max(comparisonName.length + 5, 13);

  final baselineHeader = '$baselineName (µs)'.padRight(baselineColWidth);
  final comparisonHeader = '$comparisonName (µs)'.padRight(comparisonColWidth);

  if (showStdDev) {
    print(
        '''| Data Condition      | $baselineHeader | $comparisonHeader | Improvement | StdDev        |''');
    print(
        '''| :------------------ | :${'-' * (baselineColWidth - 2)}: | :${'-' * (comparisonColWidth - 2)}: | :---------: | :-----------: |''');
  } else {
    print(
        '''| Data Condition      | $baselineHeader | $comparisonHeader | Improvement | Winner          |''');
    print(
        '''| :------------------ | :${'-' * (baselineColWidth - 2)}: | :${'-' * (comparisonColWidth - 2)}: | :---------: | :-------------: |''');
  }

  print(
      '''| **Mean**            | ${' ' * baselineColWidth} | ${' ' * comparisonColWidth} |             |                 |''');

  for (final entry in results.entries) {
    final condition = entry.key;
    final (baseline, comparison) = entry.value;

    final improvement = (baseline.mean - comparison.mean) / baseline.mean * 100;
    final improvementString =
        '${improvement > 0 ? '+' : ''}${improvement.toStringAsFixed(2)}%';
    final baselineMean = baseline.mean.round().toString();
    final comparisonMean = comparison.mean.round().toString();

    if (showStdDev) {
      final stdDevString =
          '${baseline.stdDev.round()}/${comparison.stdDev.round()}';
      print(
          '''| ${condition.padRight(19)} | ${baselineMean.padLeft(baselineColWidth)} | ${comparisonMean.padLeft(comparisonColWidth)} | ${improvementString.padLeft(11)} | ${stdDevString.padLeft(13)} |''');
    } else {
      final winner = improvement > 0 ? '$comparisonName 🚀' : baselineName;
      print(
          '''| ${condition.padRight(19)} | ${baselineMean.padLeft(baselineColWidth)} | ${comparisonMean.padLeft(comparisonColWidth)} | ${improvementString.padLeft(11)} | ${winner.padLeft(15)} |''');
    }
  }

  print(
      '''| **Median**          | ${' ' * baselineColWidth} | ${' ' * comparisonColWidth} |             |                 |''');

  for (final entry in results.entries) {
    final condition = entry.key;
    final (baseline, comparison) = entry.value;

    final improvement =
        (baseline.median - comparison.median) / baseline.median * 100;
    final improvementString =
        '${improvement > 0 ? '+' : ''}${improvement.toStringAsFixed(2)}%';
    final baselineMedian = baseline.median.toString();
    final comparisonMedian = comparison.median.toString();

    if (showStdDev) {
      print(
          '''| ${condition.padRight(19)} | ${baselineMedian.padLeft(baselineColWidth)} | ${comparisonMedian.padLeft(comparisonColWidth)} | ${improvementString.padLeft(11)} | ${' '.padLeft(13)} |''');
    } else {
      final winner = improvement > 0 ? '$comparisonName 🚀' : baselineName;
      print(
          '''| ${condition.padRight(19)} | ${baselineMedian.padLeft(baselineColWidth)} | ${comparisonMedian.padLeft(comparisonColWidth)} | ${improvementString.padLeft(11)} | ${winner.padLeft(15)} |''');
    }
  }

  print(separator);
}
