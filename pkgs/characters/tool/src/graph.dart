// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// An asymmetric weighted complete graph.
///
/// The vertices are identified by numbers 0 through [vertexCount] - 1.
/// Edges are pairs of vertices.
class Graph {
  /// Number of vertices.
  final int vertexCount;

  /// Table of weights, a list of length `vertexCount`*`vertexCount`.
  final List<int> _table;

  /// Creates a new complete graph with [vertexCount] vertices.
  ///
  /// The initial weights on all edges are [initialWeight].
  Graph(this.vertexCount, [int initialWeight = 0])
      : _table = List<int>.filled(vertexCount * vertexCount, initialWeight);

  /// Update the weight on the edges from [fromVertex] to [toVertex].
  void setWeight(int fromVertex, int toVertex, int newWeight) {
    _table[fromVertex * vertexCount + toVertex] = newWeight;
  }

  /// The weight of the edge from [fromVertex] to [toVertex].
  int weight(int fromVertex, int toVertex) =>
      _table[fromVertex * vertexCount + toVertex];

  /// The cumulative weight of the (sub-)path from `path[from]` to `path[to]`.
  ///
  /// If [to] is less than [from], the sub-path is traversed in reverse.
  /// The values in `path` should be vertices in this graph.
  int pathWeight(List<int> path, int from, int to) {
    var weight = 0;
    var cursor = path[from];
    var step = from <= to ? 1 : -1;
    for (var i = from; i != to;) {
      i += step;
      var next = path[i];
      weight += this.weight(cursor, next);
      cursor = next;
    }
    return weight;
  }

  /// Swaps the positions of [vertex1] and [vertex2], updating the weight table.
  void swap(int vertex1, int vertex2) {
    if (vertex1 == vertex2) return;
    // Swap rows.
    for (var i = 0; i < vertexCount; i++) {
      var weightTo1 = weight(i, vertex1);
      var weightTo2 = weight(i, vertex2);
      setWeight(i, vertex1, weightTo2);
      setWeight(i, vertex2, weightTo1);
    }
    // Swap columns.
    for (var i = 0; i < vertexCount; i++) {
      var weightFrom1 = weight(vertex1, i);
      var weightFrom2 = weight(vertex2, i);
      setWeight(vertex1, i, weightFrom2);
      setWeight(vertex2, i, weightFrom1);
    }
    assert(weight(vertex1, vertex1) == 0);
    assert(weight(vertex2, vertex2) == 0);
  }

  /// Creates a new graph without the last vertex (or last [count] vertices).
  Graph removeLastVertex([int count = 1]) {
    RangeError.checkValueInInterval(count, 1, vertexCount, "count");
    var newCount = vertexCount - count;
    var result = Graph(newCount);
    for (var i = 0; i < newCount; i++) {
      result._table
          .setRange(i * newCount, (i + 1) * newCount, _table, i * vertexCount);
    }
    return result;
  }

  int get maxWeight => _table.reduce((a, b) => a >= b ? a : b);
}
