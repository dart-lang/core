// Copyright (c) 2025, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:math';

import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:collection/src/algorithms.dart' show quickSort;
import 'package:collection/src/utils.dart';

import 'dataset_generator.dart' as dataset_generator;

// Sink variable to prevent the compiler from optimizing away benchmark code.
int sink = 0;

/// The final aggregated result of a benchmark.
class BenchmarkResult {
  final double mean;
  final int median;
  BenchmarkResult(this.mean, this.median);
}

/// A base class for our sort benchmarks to reduce boilerplate.
/// Note: We extend `BenchmarkBase` for its structure but will use our own
/// timing.
abstract class SortBenchmarkBase extends BenchmarkBase {
  final List<List<int>> datasets;
  int _iteration = 0;
  int _checksum = 0;

  SortBenchmarkBase(super.name, this.datasets);

  List<int> getNextList() {
    // Cloning the list is crucial so each run sorts an unsorted list.
    return List<int>.from(datasets[_iteration++ % datasets.length]);
  }

  void updateChecksum(List<int> list) {
    // A simple checksum to ensure the list is used and not optimized away.
    sink ^= list.first ^ list.last ^ list[list.length >> 1] ^ _checksum++;
  }

  /// The core operation to be benchmarked.
  void performSort();

  @override
  void run() => performSort();
}

// --- Benchmark Classes ---

// Baseline (Old SDK quickSort)
class QuickSortBaselineRandomBenchmark extends SortBenchmarkBase {
  QuickSortBaselineRandomBenchmark()
      : super('Baseline.Random', dataset_generator.random);
  @override
  void performSort() {
    final list = getNextList();
    quickSortBaseline(list, (a, b) => a.compareTo(b));
    updateChecksum(list);
  }
}

class QuickSortBaselineSortedBenchmark extends SortBenchmarkBase {
  QuickSortBaselineSortedBenchmark()
      : super('Baseline.Sorted', dataset_generator.sorted);
  @override
  void performSort() {
    final list = getNextList();
    quickSortBaseline(list, (a, b) => a.compareTo(b));
    updateChecksum(list);
  }
}

class QuickSortBaselineReverseBenchmark extends SortBenchmarkBase {
  QuickSortBaselineReverseBenchmark()
      : super('Baseline.Reverse', dataset_generator.reverse);
  @override
  void performSort() {
    final list = getNextList();
    quickSortBaseline(list, (a, b) => a.compareTo(b));
    updateChecksum(list);
  }
}

class QuickSortBaselineFewUniqueBenchmark extends SortBenchmarkBase {
  QuickSortBaselineFewUniqueBenchmark()
      : super('Baseline.FewUnique', dataset_generator.fewUnique);
  @override
  void performSort() {
    final list = getNextList();
    quickSortBaseline(list, (a, b) => a.compareTo(b));
    updateChecksum(list);
  }
}

class QuickSortBaselinePathologicalBenchmark extends SortBenchmarkBase {
  QuickSortBaselinePathologicalBenchmark()
      : super('Baseline.Pathological', dataset_generator.pathological);
  @override
  void performSort() {
    final list = getNextList();
    quickSortBaseline(list, (a, b) => a.compareTo(b));
    updateChecksum(list);
  }
}

// Enhancement (New pdqsort)
class PdqSortEnhancementRandomBenchmark extends SortBenchmarkBase {
  PdqSortEnhancementRandomBenchmark()
      : super('Enhancement.Random', dataset_generator.random);
  @override
  void performSort() {
    final list = getNextList();
    quickSort(list, (a, b) => a.compareTo(b));
    updateChecksum(list);
  }
}

class PdqSortEnhancementSortedBenchmark extends SortBenchmarkBase {
  PdqSortEnhancementSortedBenchmark()
      : super('Enhancement.Sorted', dataset_generator.sorted);
  @override
  void performSort() {
    final list = getNextList();
    quickSort(list, (a, b) => a.compareTo(b));
    updateChecksum(list);
  }
}

class PdqSortEnhancementReverseBenchmark extends SortBenchmarkBase {
  PdqSortEnhancementReverseBenchmark()
      : super('Enhancement.Reverse', dataset_generator.reverse);
  @override
  void performSort() {
    final list = getNextList();
    quickSort(list, (a, b) => a.compareTo(b));
    updateChecksum(list);
  }
}

class PdqSortEnhancementFewUniqueBenchmark extends SortBenchmarkBase {
  PdqSortEnhancementFewUniqueBenchmark()
      : super('Enhancement.FewUnique', dataset_generator.fewUnique);
  @override
  void performSort() {
    final list = getNextList();
    quickSort(list, (a, b) => a.compareTo(b));
    updateChecksum(list);
  }
}

class PdqSortEnhancementPathologicalBenchmark extends SortBenchmarkBase {
  PdqSortEnhancementPathologicalBenchmark()
      : super('Enhancement.Pathological', dataset_generator.pathological);
  @override
  void performSort() {
    final list = getNextList();
    quickSort(list, (a, b) => a.compareTo(b));
    updateChecksum(list);
  }
}

// --- Main Execution Logic ---

void main() {
  const samples = 12;

  final benchmarks = [
    (
      'Random',
      QuickSortBaselineRandomBenchmark(),
      PdqSortEnhancementRandomBenchmark()
    ),
    (
      'Sorted',
      QuickSortBaselineSortedBenchmark(),
      PdqSortEnhancementSortedBenchmark()
    ),
    (
      'Reverse Sorted',
      QuickSortBaselineReverseBenchmark(),
      PdqSortEnhancementReverseBenchmark()
    ),
    (
      'Few Unique',
      QuickSortBaselineFewUniqueBenchmark(),
      PdqSortEnhancementFewUniqueBenchmark()
    ),
    (
      'Pathological',
      QuickSortBaselinePathologicalBenchmark(),
      PdqSortEnhancementPathologicalBenchmark()
    ),
  ];

  final results = <String, (BenchmarkResult, BenchmarkResult)>{};

  print('Running benchmarks ($samples samples each)...');
  for (final (condition, baseline, enhancement) in benchmarks) {
    final baselineResult = _runBenchmark(baseline, samples);
    final enhancementResult = _runBenchmark(enhancement, samples);
    results[condition] = (baselineResult, enhancementResult);
  }

  _printResultsAsMarkdownTable(results);
}

BenchmarkResult _runBenchmark(SortBenchmarkBase benchmark, int samples) {
  final times = <int>[];
  // Warmup run (not timed).
  benchmark.run();
  for (var i = 0; i < samples; i++) {
    final stopwatch = Stopwatch()..start();
    benchmark.run();
    stopwatch.stop();
    times.add(stopwatch.elapsedMicroseconds);
  }
  times.sort();
  final mean = times.reduce((a, b) => a + b) / samples;
  final median = times[samples >> 1];
  return BenchmarkResult(mean, median);
}

void _printResultsAsMarkdownTable(
    Map<String, (BenchmarkResult, BenchmarkResult)> results) {
  final separator = '=' * 80;
  print('\n$separator');
  print(
      'Benchmark Results: pdqsort (Enhancement) vs. SDK quickSort (Baseline)');
  print(separator);
  print(
      '''| Data Condition      | Baseline (µs) | Enhancement (µs) | Improvement | Winner        |''');
  print(
      '''| :------------------ | :------------ | :--------------- | :---------- | :------------ |''');
  print(
      '''| *Mean*              |               |                  |             |               |''');

  for (final entry in results.entries) {
    final condition = entry.key;
    final (baseline, enhancement) = entry.value;

    final improvement =
        (baseline.mean - enhancement.mean) / baseline.mean * 100;
    final winner = improvement > 0 ? 'Enhancement 🚀' : 'Baseline';
    final improvementString =
        '${improvement > 0 ? '+' : ''}${improvement.toStringAsFixed(2)}%';

    final baselineMean = baseline.mean.round();
    final enhancementMean = enhancement.mean.round();

    print(
        '''| ${condition.padRight(19)} | ${baselineMean.toString().padLeft(13)} | ${enhancementMean.toString().padLeft(16)} | ${improvementString.padLeft(11)} | $winner |''');
  }

  print(
      '''| *Median*            |               |                  |             |               |''');

  for (final entry in results.entries) {
    final condition = entry.key;
    final (baseline, enhancement) = entry.value;

    final improvement =
        (baseline.median - enhancement.median) / baseline.median * 100;
    final winner = improvement > 0 ? 'Enhancement 🚀' : 'Baseline';
    final improvementString =
        '${improvement > 0 ? '+' : ''}${improvement.toStringAsFixed(2)}%';

    // No rounding needed for median as it's an int.
    final baselineMedian = baseline.median;
    final enhancementMedian = enhancement.median;

    print(
        '''| ${condition.padRight(19)} | ${baselineMedian.toString().padLeft(13)} | ${enhancementMedian.toString().padLeft(16)} | ${improvementString.padLeft(11)} | $winner |''');
  }

  print(separator);
}

// ===========================================================================
// BASELINE IMPLEMENTATION
// A direct copy of the original SDK quickSort, renamed to avoid conflicts.
// ===========================================================================

void quickSortBaseline<E>(
  List<E> elements,
  int Function(E a, E b) compare, [
  int start = 0,
  int? end,
]) {
  end = RangeError.checkValidRange(start, end, elements.length);
  _quickSortBaseline<E, E>(elements, identity, compare, Random(), start, end);
}

void _quickSortBaseline<E, K>(
  List<E> list,
  K Function(E element) keyOf,
  int Function(K a, K b) compare,
  Random random,
  int start,
  int end,
) {
  const minQuickSortLength = 32;
  var length = end - start;
  while (length >= minQuickSortLength) {
    var pivotIndex = random.nextInt(length) + start;
    var pivot = list[pivotIndex];
    var pivotKey = keyOf(pivot);
    var endSmaller = start;
    var startGreater = end;
    var startPivots = end - 1;
    list[pivotIndex] = list[startPivots];
    list[startPivots] = pivot;
    while (endSmaller < startPivots) {
      var current = list[endSmaller];
      var relation = compare(keyOf(current), pivotKey);
      if (relation < 0) {
        endSmaller++;
      } else {
        startPivots--;
        var currentTarget = startPivots;
        list[endSmaller] = list[startPivots];
        if (relation > 0) {
          startGreater--;
          currentTarget = startGreater;
          list[startPivots] = list[startGreater];
        }
        list[currentTarget] = current;
      }
    }
    if (endSmaller - start < end - startGreater) {
      _quickSortBaseline(list, keyOf, compare, random, start, endSmaller);
      start = startGreater;
    } else {
      _quickSortBaseline(list, keyOf, compare, random, startGreater, end);
      end = endSmaller;
    }
    length = end - start;
  }
  _movingInsertionSortBaseline<E, K>(
      list, keyOf, compare, start, end, list, start);
}

void _movingInsertionSortBaseline<E, K>(
  List<E> list,
  K Function(E element) keyOf,
  int Function(K, K) compare,
  int start,
  int end,
  List<E> target,
  int targetOffset,
) {
  var length = end - start;
  if (length == 0) return;
  target[targetOffset] = list[start];
  for (var i = 1; i < length; i++) {
    var element = list[start + i];
    var elementKey = keyOf(element);
    var min = targetOffset;
    var max = targetOffset + i;
    while (min < max) {
      var mid = min + ((max - min) >> 1);
      if (compare(elementKey, keyOf(target[mid])) < 0) {
        max = mid;
      } else {
        min = mid + 1;
      }
    }
    target.setRange(min + 1, targetOffset + i + 1, target, min);
    target[min] = element;
  }
}
