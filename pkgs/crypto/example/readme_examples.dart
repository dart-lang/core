// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

void main() {
  _digestSingle();
  _digestChunked();
  _digestHmac();
}

void _digestSingle() {
  // #region digest-single
  var bytes = utf8.encode('foobar'); // data being hashed

  var digest = sha1.convert(bytes);

  print('Digest as bytes: ${digest.bytes}');
  print('Digest as hex string: $digest');
  // #endregion digest-single
}

void _digestChunked() {
  // #region digest-chunked
  var firstChunk = utf8.encode('foo');
  var secondChunk = utf8.encode('bar');

  var output = AccumulatorSink<Digest>();
  var input = sha1.startChunkedConversion(output);
  input.add(firstChunk);
  input.add(secondChunk); // call `add` for every chunk of input data
  input.close();
  var digest = output.events.single;

  print('Digest as bytes: ${digest.bytes}');
  print('Digest as hex string: $digest');
  // #endregion digest-chunked
}

void _digestHmac() {
  // #region digest-hmac
  var key = utf8.encode('p@ssw0rd');
  var bytes = utf8.encode('foobar');

  var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
  var digest = hmacSha256.convert(bytes);

  print('HMAC digest as bytes: ${digest.bytes}');
  print('HMAC digest as hex string: $digest');
  // #endregion digest-hmac
}
