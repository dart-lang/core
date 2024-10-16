// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "dart:collection";
import "dart:typed_data";

import "indirect_table.dart";
import "list_overlap.dart";

/// Splits an indirect table with one large chunk into separate smaller chunks.
///
/// No new chunk is larger than the largest entry.
///
/// Preserves the entries, but they now point into the new chunks.
/// All chunks are distinct, and no chunk is a sub-list of another chunk.
void chunkifyTable(IndirectTable table) {
  if (table.chunks.length != 1) {
    throw ArgumentError("Single chunk table required");
  }
  var data = table.chunks[0];
  var entries = table.entries.toList();
  entries.sort((a, b) => b.length - a.length);
  var uniqueChunks = <Uint8List>[];
  var duplicateDetector =
      HashMap<Uint8List, TableEntry>(equals: _equals, hashCode: _hash);
  for (var entry in entries) {
    var chunk = data.sublist(entry.start, entry.end);
    var existingEntry = duplicateDetector[chunk];
    if (existingEntry != null) {
      entry.copyFrom(existingEntry);
    } else {
      // Check if chunk is a sublist of any existing chunk.
      var chunkNum = 0;
      var indexOf = 0;
      for (; chunkNum < uniqueChunks.length; chunkNum++) {
        var existingChunk = uniqueChunks[chunkNum];
        if (existingChunk.length > chunk.length) {
          var position = _indexOf(chunk, existingChunk);
          if (position >= 0) {
            indexOf = position;
            break;
          }
        }
      }
      if (chunkNum == uniqueChunks.length) {
        uniqueChunks.add(chunk);
      }
      entry.update(chunkNum, indexOf, entry.length);
      duplicateDetector[chunk] = entry;
    }
  }
  table.chunks = uniqueChunks;
}

int _indexOf(Uint8List short, Uint8List long) {
  var length = short.length;
  var range = long.length - length;
  outer:
  for (var i = 0; i < range; i++) {
    for (var j = 0; j < short.length; j++) {
      if (short[j] != long[i + j]) continue outer;
    }
    return i;
  }
  return -1;
}

/// Combines an indirect table with multiple chunks into only one chunk.
void combineChunkedTable(IndirectTable table) {
  var overlapped = combineLists(table.chunks);
  for (var entry in table.entries) {
    var chunkEntry = overlapped.entries[entry.chunkNumber];
    entry.update(0, entry.start + chunkEntry.start, entry.length);
  }
  table.chunks = [overlapped.chunks[0]];
}

/// Hash on a list.
int _hash(Uint8List list) {
  var view = list.buffer.asUint32List();
  var hash = 0;
  for (var i = 0; i < view.length; i++) {
    hash = (hash * 37 ^ view[i]) & 0xFFFFFFFF;
  }
  return hash;
}

/// Equality of lists of equal length.
bool _equals(Uint8List a, Uint8List b) {
  assert(a.length == b.length);
  assert(a.length % 8 == 0);
  // Compare 32 bits at a time.
  var aView = a.buffer.asInt64List();
  var bView = b.buffer.asInt64List();
  for (var i = 0; i < aView.length; i++) {
    if (aView[i] != bView[i]) return false;
  }
  return true;
}
