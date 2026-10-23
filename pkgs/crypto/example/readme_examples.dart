// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// This file contains code snippets for crypto/README.md.

// ignore_for_file: unused_local_variable, prefer_single_quotes

import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

void main() {
  // #docregion digest-single
  var bytes = utf8.encode("foobar"); // data being hashed

  var digest = sha1.convert(bytes);

  print("Digest as bytes: ${digest.bytes}");
  print("Digest as hex string: $digest");
  // #enddocregion digest-single

  // #docregion digest-chunked
  var firstChunk = utf8.encode("foo");
  var secondChunk = utf8.encode("bar");

  var output = AccumulatorSink<Digest>();
  var input = sha1.startChunkedConversion(output);
  input.add(firstChunk);
  input.add(secondChunk); // call `add` for every chunk of input data
  input.close();
  var chunkedDigest = output.events.single;

  print("Digest as bytes: ${chunkedDigest.bytes}");
  print("Digest as hex string: $chunkedDigest");
  // #enddocregion digest-chunked

  // #docregion digest-hmac
  var key = utf8.encode('p@ssw0rd');
  var hmacBytes = utf8.encode("foobar");

  var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
  var hmacDigest = hmacSha256.convert(hmacBytes);

  print("HMAC digest as bytes: ${hmacDigest.bytes}");
  print("HMAC digest as hex string: $hmacDigest");
  // #enddocregion digest-hmac
}
