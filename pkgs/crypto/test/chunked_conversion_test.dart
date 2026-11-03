// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:test/test.dart';

void main() {
  const hashes = {
    'md5': md5,
    'sha1': sha1,
    'sha224': sha224,
    'sha256': sha256,
    'sha384': sha384,
    'sha512': sha512,
    'sha512/224': sha512224,
    'sha512/256': sha512256,
  };

  // Non-uniform bytes, so that stale buffer contents would change the digest.
  final data = Uint8List.fromList(
    List.generate(300, (i) => (i * 131 + 17) & 0xff),
  );

  for (final MapEntry(key: name, value: hash) in hashes.entries) {
    test('$name: chunked conversion matches convert for every length', () {
      for (var length = 0; length <= data.length; length++) {
        final expected =
            hash.convert(Uint8List.sublistView(data, 0, length)).toString();
        for (final chunkSize in const [1, 3, 64, 65, 127, 129]) {
          expect(
            _added(hash, data, length, chunkSize).toString(),
            expected,
            reason: 'length $length added $chunkSize bytes at a time',
          );
          expect(
            _sliced(hash, data, length, chunkSize).toString(),
            expected,
            reason: 'length $length sliced $chunkSize bytes at a time',
          );
        }
      }
    });
  }
}

/// Hashes the first [length] bytes of [data] by passing [chunkSize] bytes at a
/// time to [ByteConversionSink.add].
Digest _added(Hash hash, Uint8List data, int length, int chunkSize) {
  late Digest digest;
  final sink = hash.startChunkedConversion(
    ChunkedConversionSink<Digest>.withCallback((digests) {
      digest = digests.single;
    }),
  );
  for (var start = 0; start < length; start += chunkSize) {
    sink.add(
        Uint8List.sublistView(data, start, min(start + chunkSize, length)));
  }
  sink.close();
  return digest;
}

/// Hashes the first [length] bytes of [data] by passing [chunkSize] bytes at a
/// time to [ByteConversionSink.addSlice], closing with `isLast`.
Digest _sliced(Hash hash, Uint8List data, int length, int chunkSize) {
  late Digest digest;
  final sink = hash.startChunkedConversion(
    ChunkedConversionSink<Digest>.withCallback((digests) {
      digest = digests.single;
    }),
  );
  var start = 0;
  do {
    final end = min(start + chunkSize, length);
    sink.addSlice(data, start, end, end == length);
    start = end;
  } while (start < length);
  return digest;
}
