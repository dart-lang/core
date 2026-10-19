// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:typed_data';

import 'digest.dart';
import 'utils.dart';

/// A base class for [ByteConversionSink] implementations for hash algorithms.
///
/// Subclasses should override [updateHash] and [digest].
abstract class HashSink extends ByteConversionSink {
  /// The inner sink that this should forward to.
  final Sink<Digest> _sink;

  /// Whether the hash function operates on big-endian words.
  final Endian _endian;

  /// A [ByteData] view of the current chunk of data.
  ///
  /// This is an instance variable to avoid re-allocating.
  final ByteData _byteDataView;

  /// The actual chunk of bytes currently accumulating.
  ///
  /// The same allocation will be reused over and over again; once full it is
  /// passed to the underlying hashing algorithm for processing.
  final Uint8List _chunk;

  /// The index of the next insertion into the chunk.
  int _chunkNextIndex = 0;

  /// A [Uint32List] (in specified endian) copy of the chunk.
  ///
  /// This is an instance variable to avoid re-allocating.
  final Uint32List _chunk32;

  /// Messages with more than 2^53-1 bits are not supported.
  ///
  /// This is the largest value that is precisely representable
  /// on both JS and the Dart VM.
  /// So the maximum length in bytes is (2^53-1)/8.
  static const _maxMessageLengthInBytes = 0x0003ffffffffffff;

  /// The length of the input data so far, in bytes.
  int _lengthInBytes = 0;

  /// Whether [close] has been called.
  bool _isClosed = false;

  /// The words in the current digest.
  ///
  /// This should be updated each time [updateHash] is called.
  Uint32List get digest;

  /// The number of signature bytes emitted at the end of the message.
  ///
  /// An encrypted message is followed by a signature which depends
  /// on the encryption algorithm used. This value specifies the
  /// number of bytes used by this signature. It must always be
  /// a power of 2 and no less than 8.
  final int _signatureBytes;

  /// Creates a new hash.
  ///
  /// [chunkSizeInWords] represents the size of the input chunks processed by
  /// the algorithm, in terms of 32-bit words.
  HashSink(
    Sink<Digest> sink,
    int chunkSizeInWords, {
    Endian endian = Endian.big,
    int signatureBytes = 8,
  }) : this._(
          sink,
          Uint8List(chunkSizeInWords * bytesPerWord),
          endian,
          signatureBytes,
        );

  HashSink._(
    this._sink,
    this._chunk,
    this._endian,
    this._signatureBytes,
  )   : assert(_signatureBytes >= 8),
        _chunk32 = Uint32List(_chunk.length ~/ bytesPerWord),
        _byteDataView = _chunk.buffer.asByteData();

  /// Runs a single iteration of the hash computation, updating [digest] with
  /// the result.
  ///
  /// [chunk] is the current chunk, whose size is given by the
  /// `chunkSizeInWords` parameter passed to the constructor.
  void updateHash(Uint32List chunk);

  @override
  void add(List<int> data) {
    if (_isClosed) throw StateError('Hash.add() called after close().');
    _lengthInBytes += data.length;
    _addData(data, 0, data.length);
  }

  @override
  void addSlice(List<int> chunk, int start, int end, bool isLast) {
    if (_isClosed) throw StateError('Hash.addSlice() called after close().');
    RangeError.checkValidRange(start, end, chunk.length);
    if (start < end) {
      _lengthInBytes += end - start;
      _addData(chunk, start, end);
    }
    if (isLast) close();
  }

  void _addData(List<int> data, int start, int end) {
    var dataIndex = start;
    var chunkNextIndex = _chunkNextIndex;
    final size = _chunk.length;
    while (true) {
      // Check if there is enough data left in [data] for a full chunk.
      var restEnd = chunkNextIndex + end - dataIndex;
      if (restEnd < size) {
        // There is not enough data, so just add into [_chunk].
        _chunk.setRange(chunkNextIndex, restEnd, data, dataIndex);
        _chunkNextIndex = restEnd;
        return;
      }

      // There is enough data to fill the chunk. Fill it and process it.
      _chunk.setRange(chunkNextIndex, size, data, dataIndex);
      dataIndex += size - chunkNextIndex;

      _processChunk();
      chunkNextIndex = 0;
    }
  }

  @pragma('vm:prefer-inline')
  void _processChunk() {
    // Now do endian conversion to words.
    var j = 0;
    do {
      _chunk32[j] = _byteDataView.getUint32(j * bytesPerWord, _endian);
      j++;
    } while (j < _chunk32.length);

    updateHash(_chunk32);
  }

  @override
  void close() {
    if (_isClosed) return;
    _isClosed = true;

    _finalizeAndProcessData();
    assert(_chunkNextIndex == 0);
    _sink.add(Digest(_byteDigest()));
    _sink.close();
  }

  Uint8List _byteDigest() {
    if (_endian == Endian.host) return digest.buffer.asUint8List();

    // Cache the digest locally as `get` could be expensive.
    final cachedDigest = digest;
    final byteDigest = Uint8List(cachedDigest.lengthInBytes);
    final byteData = byteDigest.buffer.asByteData();
    for (var i = 0; i < cachedDigest.length; i++) {
      byteData.setUint32(i * bytesPerWord, cachedDigest[i]);
    }
    return byteDigest;
  }

  /// Finalizes the data and finishes the hash.
  ///
  /// This adds a 1 bit to the end of the message, and expands it with 0 bits to
  /// pad it out.
  void _finalizeAndProcessData() {
    if (_lengthInBytes > _maxMessageLengthInBytes) {
      throw UnsupportedError(
        'Hashing is unsupported for messages with more than 2^53 bits.',
      );
    }

    // Pad out the data with 0x80, eight or sixteen 0s, and as many more 0s
    // as we need to land cleanly on a chunk boundary.
    _chunk[_chunkNextIndex++] = 0x80;

    // If the length doesn't fit in this chunk, pad it with 0s and process it.
    if (_chunkNextIndex > _chunk.length - _signatureBytes) {
      _chunk.fillRange(_chunkNextIndex, _chunk.length, 0);
      _processChunk();
      _chunkNextIndex = 0;
    }

    var lengthInBits = _lengthInBytes * bitsPerByte;

    // Add the full length of the input data as a 64-bit value at the end of the
    // hash. Note: we're only writing out 64 bits, so zero-fill up to
    // `_chunk.length - 8` even if the signature is 128-bit.
    final offset = _chunk.length - 8;
    _chunk.fillRange(_chunkNextIndex, offset, 0);

    if (!const bool.fromEnvironment('dart.library.js_interop')) {
      _byteDataView.setUint64(offset, lengthInBits, _endian);
    } else {
      // ByteData.setUint64 isn't supported on dart2js so we implement it
      // manually instead.
      var highBits = lengthInBits ~/ 0x100000000; // >> 32
      var lowBits = lengthInBits & mask32;
      if (_endian == Endian.big) {
        _byteDataView.setUint32(offset, highBits, _endian);
        _byteDataView.setUint32(offset + bytesPerWord, lowBits, _endian);
      } else {
        _byteDataView.setUint32(offset, lowBits, _endian);
        _byteDataView.setUint32(offset + bytesPerWord, highBits, _endian);
      }
    }

    _processChunk();
    _chunkNextIndex = 0;
  }
}
