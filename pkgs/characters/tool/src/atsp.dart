// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// See: Asymmetric Traveling Salesman Problem.

// Strategy for finding optimal overlapping of chunks of a larger table,
// to save space.
// Does so by solving traveling salesman/hamiltonian cycle in a graph
// where the distance between chunks is how little they overlap
// (chunk length minus overlap size).

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

  int get maxWeight => _table.reduce((a, b) => a >= b ? a : b);
}

/// Optimize a cycle of a graph to minimize the edge weight.
///
/// The [cycle] must have the same node as first and last element.
///
/// This is an implementation of one step of 3-opt, a simple algorithm to
/// approximate an asymmetric traveling salesman problem (ATSP).
/// It splits the cycle into three parts and then find the best recombination
/// of the parts, each potentially reversed.
bool opt3(Graph graph, List<int> cycle) {
  // Perhaps optimize the weight computations by creating
  // a single array of cumulative weights, so any range can be computed
  // as a difference between two points in that array.
  for (var i = 1; i < cycle.length; i++) {
    // Find three cut points in the cycle, A|B, C|D, and E|F,
    // then find the cumulative weights of each section
    // B-C, C-D, and E-A, in both directions, as well as the
    // weight between the end-points.
    //
    // with Z being used to represent the start/end of the list
    // representation (so the A-F/F-A ranges cross over the cycle
    // representation edges)
    // Find the weights
    var nodeA = cycle[i - 1];
    var nodeB = cycle[i];
    // Weight of one-step transition from A to B.
    var wAB = graph.weight(nodeA, nodeB);
    var wBA = graph.weight(nodeB, nodeA);
    // Weight of entire path for start to A.
    var pZA = graph.pathWeight(cycle, 0, i - 1);
    var pAZ = graph.pathWeight(cycle, i - 1, 0);
    for (var j = i + 1; j < cycle.length; j++) {
      var nodeC = cycle[j - 1];
      var nodeD = cycle[j];
      var wAC = graph.weight(nodeA, nodeC);
      var wCA = graph.weight(nodeC, nodeA);
      var wAD = graph.weight(nodeA, nodeD);
      var wDA = graph.weight(nodeD, nodeA);
      var wBD = graph.weight(nodeB, nodeD);
      var wDB = graph.weight(nodeD, nodeB);
      var wCD = graph.weight(nodeC, nodeD);
      var wDC = graph.weight(nodeD, nodeC);
      var pBC = graph.pathWeight(cycle, i, j - 1);
      var pCB = graph.pathWeight(cycle, j - 1, i);
      for (var k = j + 1; k < cycle.length; k++) {
        var nodeE = cycle[k - 1];
        var nodeF = cycle[k];
        var wAE = graph.weight(nodeA, nodeE);
        var wEA = graph.weight(nodeE, nodeA);
        var wBE = graph.weight(nodeB, nodeE);
        var wEB = graph.weight(nodeE, nodeB);
        var wCE = graph.weight(nodeC, nodeE);
        var wEC = graph.weight(nodeE, nodeC);
        var wBF = graph.weight(nodeB, nodeF);
        var wFB = graph.weight(nodeF, nodeB);
        var wCF = graph.weight(nodeC, nodeF);
        var wFC = graph.weight(nodeF, nodeC);
        var wEF = graph.weight(nodeE, nodeF);
        var wFE = graph.weight(nodeF, nodeE);
        var wDF = graph.weight(nodeD, nodeF);
        var wFD = graph.weight(nodeF, nodeD);
        var pDE = graph.pathWeight(cycle, j, k - 1);
        var pED = graph.pathWeight(cycle, k - 1, j);
        var pFA = graph.pathWeight(cycle, k, cycle.length - 1) + pZA;
        var pAF = graph.pathWeight(cycle, cycle.length - 1, k) + pAZ;

        // Find best recombination of the three sections B-C, D-E, F-A,
        // with each possibly reversed.
        // Since there are only two ways to order three-element cycles,
        // and three parts that can be reversed, this gives 16 combinations.
        var wABCDEF = pFA + wAB + pBC + wCD + pDE + wEF;
        var wACBDEF = pFA + wAC + pCB + wBD + pDE + wEF;
        var wABCEDF = pFA + wAB + pBC + wCE + pED + wDF;
        var wACBEDF = pFA + wAC + pCB + wBE + pED + wDF;
        var wFBCDEA = pAF + wFB + pBC + wCD + pDE + wEA;
        var wFCBDEA = pAF + wFC + pCB + wBD + pDE + wEA;
        var wFBCEDA = pAF + wFB + pBC + wCE + pED + wDA;
        var wFCBEDA = pAF + wFC + pCB + wBE + pED + wDA;
        var wADEBCF = pFA + wAD + pDE + wEB + pBC + wCF;
        var wADECBF = pFA + wAD + pDE + wEC + pCB + wBF;
        var wAEDBCF = pFA + wAE + pED + wDB + pBC + wCF;
        var wAEDCBF = pFA + wAE + pED + wDC + pCB + wBF;
        var wFDEBCA = pAF + wFD + pDE + wEB + pBC + wCA;
        var wFDECBA = pAF + wFD + pDE + wEC + pCB + wBA;
        var wFEDBCA = pAF + wFE + pED + wDB + pBC + wCA;
        var wFEDCBA = pAF + wFE + pED + wDC + pCB + wBA;
        var best = min([
          wABCDEF,
          wACBDEF,
          wABCEDF,
          wACBEDF,
          wFBCDEA,
          wFCBDEA,
          wFBCEDA,
          wFCBEDA,
          wADEBCF,
          wADECBF,
          wAEDBCF,
          wAEDCBF,
          wFDEBCA,
          wFDECBA,
          wFEDBCA,
          wFEDCBA
        ]);
        if (best < wABCDEF) {
          // Reorder and reverse to match the (or a) best solution.
          if (best == wACBDEF) {
            _reverse(cycle, i, j - 1);
          } else if (best == wABCEDF) {
            _reverse(cycle, j, k - 1);
          } else if (best == wACBEDF) {
            _reverse(cycle, i, j - 1);
            _reverse(cycle, j, k - 1);
          } else if (best == wFBCDEA) {
            _reverse(cycle, i, k - 1);
            _reverse(cycle, 0, cycle.length - 1);
          } else if (best == wFCBDEA) {
            _reverse(cycle, i, j - 1);
            _reverse(cycle, i, k - 1);
            _reverse(cycle, 0, cycle.length - 1);
          } else if (best == wFBCEDA) {
            _reverse(cycle, j, k - 1);
            _reverse(cycle, i, k - 1);
            _reverse(cycle, 0, cycle.length - 1);
          } else if (best == wFCBEDA) {
            _reverse(cycle, i, j - 1);
            _reverse(cycle, j, k - 1);
            _reverse(cycle, i, k - 1);
            _reverse(cycle, 0, cycle.length - 1);
          } else if (best == wADEBCF) {
            _reverse(cycle, i, j - 1);
            _reverse(cycle, j, k - 1);
            _reverse(cycle, i, k - 1);
          } else if (best == wADECBF) {
            _reverse(cycle, j, k - 1);
            _reverse(cycle, i, k - 1);
          } else if (best == wAEDBCF) {
            _reverse(cycle, i, j - 1);
            _reverse(cycle, i, k - 1);
          } else if (best == wAEDCBF) {
            _reverse(cycle, i, k - 1);
          } else if (best == wFDEBCA) {
            _reverse(cycle, i, j - 1);
            _reverse(cycle, j, k - 1);
            _reverse(cycle, 0, cycle.length - 1);
          } else if (best == wFDECBA) {
            _reverse(cycle, j, k - 1);
            _reverse(cycle, 0, cycle.length - 1);
          } else if (best == wFEDBCA) {
            _reverse(cycle, i, j - 1);
            _reverse(cycle, 0, cycle.length - 1);
          } else if (best == wFEDCBA) {
            _reverse(cycle, 0, cycle.length - 1);
          } else {
            throw AssertionError("Unreachable");
          }
          return true;
        }
      }
    }
  }
  return false;
}

/// Reverses a slice of a list.
void _reverse(List<int> list, int from, int to) {
  while (from < to) {
    var tmp = list[from];
    list[from] = list[to];
    list[to] = tmp;
    from++;
    to--;
  }
}

int min(List<int> values) {
  var result = values[0];
  for (var i = 1; i < values.length; i++) {
    var value = values[i];
    if (value < result) result = value;
  }
  return result;
}
