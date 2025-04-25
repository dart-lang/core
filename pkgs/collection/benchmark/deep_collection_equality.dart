// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:collection/collection.dart';

void main() {
  for (var unordered in [true, false]) {
    DeepCollectionEqualityEqualsBenchmark(unordered).report();
    DeepCollectionEqualityHashBenchmark(unordered).report();
  }
}

class DeepCollectionEqualityBase extends BenchmarkBase {
  final DeepCollectionEquality equality;

  DeepCollectionEqualityBase(bool unordered, String function)
      : equality = unordered
            ? const DeepCollectionEquality.unordered()
            : const DeepCollectionEquality(),
        super('DeepCollectionQuality${unordered ? 'Unordered' : ''}.$function');
}

class DeepCollectionEqualityHashBenchmark extends DeepCollectionEqualityBase {
  DeepCollectionEqualityHashBenchmark(bool unordered)
      : super(unordered, 'hash');

  @override
  void run() {
    hash = equality.hash(mapA);
  }

  static int hash = 0;
}

class DeepCollectionEqualityEqualsBenchmark extends DeepCollectionEqualityBase {
  DeepCollectionEqualityEqualsBenchmark(bool unordered)
      : super(unordered, 'equals');

  @override
  void run() {
    equals = equality.equals(mapA, mapB);
  }

  static bool equals = false;
}

final mapA = {
  for (var i = 0; i < 100; i++)
    {
      [for (var j = i; j < i + 10; j++) j]: i.isEven ? i : '$i',
    },
};

final mapB = {
  for (var i = 0; i < 100; i++)
    {
      [for (var j = i; j < i + 10; j++) j]: i.isEven ? i : '$i',
    },
};
