// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Given a list of lists of integers, figure out a good way to overlap
// these into a single list, with a list of indices telling where each
// original list started.

import "dart:typed_data";

import "atsp.dart";
import "indirect_table.dart";

/// Takes a set of distinct chunks, and finds a semi-optimal overlapping.
///
/// The overlapping is a single chunk, of minimal length, containing all
/// the original chunk's contents, and an indirection entry pointing
/// to the position in the new table.
IndirectTable combineLists(List<Uint8List> input) {
  // See how much chunks are overlapping.
  var chunkCount = input.length;
  var graph = Graph(chunkCount + 1);
  for (var i = 0; i < input.length; i++) {
    var firstChunk = input[i];
    for (var j = 0; j < input.length; j++) {
      if (i == j) continue;
      var secondChunk = input[j];
      var overlap = _overlap(firstChunk, secondChunk);
      graph.setWeight(i, j, secondChunk.length - overlap);
    }
  }

  // Find an optimal(ish) path.

  // First create a cycle through the one extra node (index `chunkCount`).
  var path = List<int>.filled(chunkCount + 2, chunkCount);
  for (var i = 0; i <= chunkCount; i++) {
    path[i + 1] = i;
  }

  while (opt3(graph, path)) {}
  // Then break the cycle at the extra node.
  // The way we optimize, it's still first/last.
  assert(path.last == chunkCount);
  assert(path.first == chunkCount);

  var chunkLength =
      input[path[1]].length + graph.pathWeight(path, 1, path.length - 2);

  var chunkData = Uint8List(chunkLength);
  var entries = List<TableEntry>.filled(input.length, TableEntry(0, 0, 0));
  {
    // Handle path chunks.
    var prevChunkNum = path[1];
    var firstChunk = input[prevChunkNum];
    chunkData.setRange(0, firstChunk.length, firstChunk);
    entries[prevChunkNum] = TableEntry(0, 0, firstChunk.length);
    var index = firstChunk.length;
    for (var i = 2; i < path.length - 1; i++) {
      var nextChunkNum = path[i];
      var chunk = input[nextChunkNum];
      var nonOverlap = graph.weight(prevChunkNum, nextChunkNum);
      var overlap = chunk.length - nonOverlap;
      entries[nextChunkNum] = TableEntry(0, index - overlap, chunk.length);
      chunkData.setRange(index, index + nonOverlap, chunk, overlap);
      index += nonOverlap;
      prevChunkNum = nextChunkNum;
    }
  }
  return IndirectTable([chunkData], entries);
}

/// Finds how much overlap there is between [first] and [second] in that order.
int _overlap(Uint8List first, Uint8List second) {
  var maxOverlap =
      (first.length < second.length ? first.length : second.length) - 1;
  outer:
  for (var overlap = maxOverlap; overlap > 0; overlap--) {
    var firstStart = first.length - overlap;
    for (var j = 0; j < overlap; j++) {
      if (first[firstStart + j] != second[j]) continue outer;
    }
    return overlap;
  }
  return 0;
}
