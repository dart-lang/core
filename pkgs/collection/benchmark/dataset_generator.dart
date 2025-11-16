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

final List<int> _sortedBase = List.generate(size, (i) => i, growable: false);
final List<int> _reversedBase = _sortedBase.reversed.toList(growable: false);

// Ensure the reverse loop for the pathological list starts on the highest
// odd index, regardless of whether `size` is even or odd.
final int secondLoopStart = (size - 1).isOdd ? size - 1 : size - 2;

/// It consists of all even-indexed elements followed by all odd-indexed
/// elements in reverse order.
final List<int> _pathologicalBase = [
  for (var i = 0; i < size; i += 2) _sortedBase[i],
  for (var i = secondLoopStart; i > -1; i -= 2) _sortedBase[i],
];

final List<List<int>> random = _generateRandom();
final List<List<int>> sorted = _generateSorted();
final List<List<int>> reverse = _generateReverse();
final List<List<int>> fewUnique = _generateFewUnique();
final List<List<int>> pathological = _generatePathological();

List<List<int>> _generateRandom() {
  final r = Random(12345);
  return List.generate(
      count, (_) => List.generate(size, (_) => r.nextInt(size)));
}

List<List<int>> _generateSorted() =>
    List.generate(count, (_) => List.of(_sortedBase, growable: true));

List<List<int>> _generateReverse() =>
    List.generate(count, (_) => List.of(_reversedBase, growable: true));

List<List<int>> _generateFewUnique() {
  final r = Random(67890);
  return List.generate(count, (_) => List.generate(size, (_) => r.nextInt(7)));
}

List<List<int>> _generatePathological() =>
    List.generate(count, (_) => List.of(_pathologicalBase, growable: true));
