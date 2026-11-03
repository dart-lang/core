// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:test/test.dart';

void main() {
  final key = List<int>.generate(20, (i) => i);
  final data = List<int>.generate(100, (i) => (i * 131 + 17) & 0xff);

  const hashes = {'md5': md5, 'sha1': sha1, 'sha256': sha256, 'sha512': sha512};
  for (final MapEntry(key: name, value: hash) in hashes.entries) {
    test('$name: addSlice with isLast closes the sink and emits the digest',
        () {
      final hmac = Hmac(hash, key);
      final digests = <Digest>[];
      final outer = hmac.startChunkedConversion(
        ChunkedConversionSink<Digest>.withCallback(digests.addAll),
      );
      outer.add(data.sublist(0, 10));
      outer.addSlice(data, 10, 37, false);
      outer.addSlice(data, 37, data.length, true);
      expect(digests.map((d) => d.toString()), [
        hmac.convert(data).toString(),
      ]);
      expect(() => outer.add([0]), throwsStateError);
      expect(() => outer.addSlice([0], 0, 1, false), throwsStateError);
    });
  }
}
