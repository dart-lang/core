// Copyright (c) 2025, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Benchmarks comparing the new pdqsort implementation against the baseline.
/// This code is ONLY for benchmarking and should not be used in production.
library;

import 'package:collection/src/algorithms.dart' show quickSort;
import 'benchmark_utils.dart';
import 'legacy_quicksort.dart' as legacy;

// --- Legacy Benchmarks (Old quickSort) ---

class LegacyRandomBenchmark extends SortBenchmarkBase {
  LegacyRandomBenchmark(int size) : super('Legacy.Random', size);

  @override
  List<List<int>> generateDatasets() => DatasetGenerators.random(size);

  @override
  void performSort() {
    final list = nextList;
    legacy.quickSort(list, (a, b) => a.compareTo(b));
    updateChecksum(list);
  }
}

class LegacySortedBenchmark extends SortBenchmarkBase {
  LegacySortedBenchmark(int size) : super('Legacy.Sorted', size);

  @override
  List<List<int>> generateDatasets() => DatasetGenerators.sorted(size);

  @override
  void performSort() {
    final list = nextList;
    legacy.quickSort(list, (a, b) => a.compareTo(b));
    updateChecksum(list);
  }
}

class LegacyReverseBenchmark extends SortBenchmarkBase {
  LegacyReverseBenchmark(int size) : super('Legacy.Reverse', size);

  @override
  List<List<int>> generateDatasets() => DatasetGenerators.reverse(size);

  @override
  void performSort() {
    final list = nextList;
    legacy.quickSort(list, (a, b) => a.compareTo(b));
    updateChecksum(list);
  }
}

class LegacyFewUniqueBenchmark extends SortBenchmarkBase {
  LegacyFewUniqueBenchmark(int size) : super('Legacy.FewUnique', size);

  @override
  List<List<int>> generateDatasets() => DatasetGenerators.fewUnique(size);

  @override
  void performSort() {
    final list = nextList;
    legacy.quickSort(list, (a, b) => a.compareTo(b));
    updateChecksum(list);
  }
}

class LegacyPathologicalBenchmark extends SortBenchmarkBase {
  LegacyPathologicalBenchmark(int size) : super('Legacy.Pathological', size);

  @override
  List<List<int>> generateDatasets() => DatasetGenerators.pathological(size);

  @override
  void performSort() {
    final list = nextList;
    legacy.quickSort(list, (a, b) => a.compareTo(b));
    updateChecksum(list);
  }
}

class LegacyNearlySortedBenchmark extends SortBenchmarkBase {
  LegacyNearlySortedBenchmark(int size) : super('Legacy.NearlySorted', size);

  @override
  List<List<int>> generateDatasets() => DatasetGenerators.nearlySorted(size);

  @override
  void performSort() {
    final list = nextList;
    legacy.quickSort(list, (a, b) => a.compareTo(b));
    updateChecksum(list);
  }
}

// --- Enhancement Benchmarks (New pdqsort) ---

class EnhancementRandomBenchmark extends SortBenchmarkBase {
  EnhancementRandomBenchmark(int size) : super('Enhancement.Random', size);

  @override
  List<List<int>> generateDatasets() => DatasetGenerators.random(size);

  @override
  void performSort() {
    final list = nextList;
    quickSort(list, (a, b) => a.compareTo(b));
    updateChecksum(list);
  }
}

class EnhancementSortedBenchmark extends SortBenchmarkBase {
  EnhancementSortedBenchmark(int size) : super('Enhancement.Sorted', size);

  @override
  List<List<int>> generateDatasets() => DatasetGenerators.sorted(size);

  @override
  void performSort() {
    final list = nextList;
    quickSort(list, (a, b) => a.compareTo(b));
    updateChecksum(list);
  }
}

class EnhancementReverseBenchmark extends SortBenchmarkBase {
  EnhancementReverseBenchmark(int size) : super('Enhancement.Reverse', size);

  @override
  List<List<int>> generateDatasets() => DatasetGenerators.reverse(size);

  @override
  void performSort() {
    final list = nextList;
    quickSort(list, (a, b) => a.compareTo(b));
    updateChecksum(list);
  }
}

class EnhancementFewUniqueBenchmark extends SortBenchmarkBase {
  EnhancementFewUniqueBenchmark(int size)
      : super('Enhancement.FewUnique', size);

  @override
  List<List<int>> generateDatasets() => DatasetGenerators.fewUnique(size);

  @override
  void performSort() {
    final list = nextList;
    quickSort(list, (a, b) => a.compareTo(b));
    updateChecksum(list);
  }
}

class EnhancementPathologicalBenchmark extends SortBenchmarkBase {
  EnhancementPathologicalBenchmark(int size)
      : super('Enhancement.Pathological', size);

  @override
  List<List<int>> generateDatasets() => DatasetGenerators.pathological(size);

  @override
  void performSort() {
    final list = nextList;
    quickSort(list, (a, b) => a.compareTo(b));
    updateChecksum(list);
  }
}

class EnhancementNearlySortedBenchmark extends SortBenchmarkBase {
  EnhancementNearlySortedBenchmark(int size)
      : super('Enhancement.NearlySorted', size);

  @override
  List<List<int>> generateDatasets() => DatasetGenerators.nearlySorted(size);

  @override
  void performSort() {
    final list = nextList;
    quickSort(list, (a, b) => a.compareTo(b));
    updateChecksum(list);
  }
}

// --- Main ---

void main(List<String> args) {
  const samples = 12;

  // Support multiple sizes via command-line args or use default
  final sizes = args.isEmpty ? [50000] : args.map(int.parse).toList();

  for (final size in sizes) {
    print('\n${'=' * 80}');
    print('Running benchmarks with size: $size');
    print('=' * 80);

    final benchmarks = [
      ('Random', LegacyRandomBenchmark(size), EnhancementRandomBenchmark(size)),
      ('Sorted', LegacySortedBenchmark(size), EnhancementSortedBenchmark(size)),
      (
        'Reverse Sorted',
        LegacyReverseBenchmark(size),
        EnhancementReverseBenchmark(size)
      ),
      (
        'Few Unique',
        LegacyFewUniqueBenchmark(size),
        EnhancementFewUniqueBenchmark(size)
      ),
      (
        'Nearly Sorted',
        LegacyNearlySortedBenchmark(size),
        EnhancementNearlySortedBenchmark(size)
      ),
      (
        'Pathological',
        LegacyPathologicalBenchmark(size),
        EnhancementPathologicalBenchmark(size)
      ),
    ];

    final results = <String, (BenchmarkResult, BenchmarkResult)>{};

    print('Running benchmarks ($samples samples each)...');
    for (final (condition, legacy, enhancement) in benchmarks) {
      print('  Testing $condition...');
      final legacyResult = runBenchmark(legacy, samples);
      final enhancementResult = runBenchmark(enhancement, samples);
      results[condition] = (legacyResult, enhancementResult);
    }

    printResultsAsMarkdownTable(
      results,
      size,
      baselineName: 'Legacy',
      comparisonName: 'pdqsort',
    );
  }
}
