// Copyright (c) 2025, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Centralized generation of datasets for all benchmarks.
///
/// Ensures all algorithms are tested on the exact same data.
library;

import 'dart:math';

const size = 50000;
const count = 128; // Number of lists to cycle through.

final List<List<int>> random = _generateRandom();
final List<List<int>> sorted = _generateSorted();
final List<List<int>> reverse = _generateReverse();
final List<List<int>> fewUnique = _generateFewUnique();
final List<List<int>> pathological = _generatePathological();

List<List<int>> _generateRandom() {
  final r = Random(12345);
  return List.generate(
      count, (_) => List.generate(size, (_) => r.nextInt(2000)));
}

List<List<int>> _generateSorted() {
  final base = List.generate(size, (i) => i);
  return List.generate(count, (_) => List<int>.from(base));
}

List<List<int>> _generateReverse() {
  final base = List.generate(size, (i) => size - 1 - i);
  return List.generate(count, (_) => List<int>.from(base));
}

List<List<int>> _generateFewUnique() {
  final r = Random(67890);
  return List.generate(count, (_) => List.generate(size, (_) => r.nextInt(7)));
}

List<List<int>> _generatePathological() {
  final base = List.generate(size, (i) => i);
  // Creates a "V-shape" or "organ pipe" array that can be challenging
  // for quicksort implementations by promoting unbalanced partitions.
  final pathological = <int>[
    for (int i = 0; i < size; i++)
      if (i.isEven) base[i],
    for (int i = size - 1; i > 0; i--)
      if (i.isOdd) base[i],
  ];
  return List.generate(count, (_) => List<int>.from(pathological));
}
