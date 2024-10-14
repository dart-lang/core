// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "dart:typed_data";

/// A table with chunks and indirections.
///
/// Contains a number, one or more, of chunks,
/// and a list of entries which point to entire chunks or parts of chunks.
///
/// The entries represent sequnences of values.
/// Each such sequence is stored in one of the chunks.
///
/// The main goal of these tools are to go from an initial complete
/// table with one chunk and non-overlapping entries,
/// to a smaller table with one chunk where the entry sequences may overlap.
///
/// Having multiple chunks is an intermediate step which allows the code
/// to keep the entries consistent during the transformations.
class IndirectTable {
  /// Individual chunks.
  List<Uint8List> chunks;

  /// Position and length of each entry in one of the [chunks].
  List<TableEntry> entries;
  IndirectTable(this.chunks, this.entries);
}

class TableEntry {
  int chunkNumber;
  int start;
  int length;
  TableEntry(this.chunkNumber, this.start, this.length);
  int get end => start + length;

  void update(int chunkNumber, int start, int length) {
    this.chunkNumber = chunkNumber;
    this.start = start;
    this.length = length;
  }

  TableEntry copy() => TableEntry(chunkNumber, start, length);

  void copyFrom(TableEntry other) {
    chunkNumber = other.chunkNumber;
    start = other.start;
    length = other.length;
  }

  @override
  String toString() =>
      "$chunkNumber[${start.toRadixString(16)}:${end.toRadixString(16)}]";
}
