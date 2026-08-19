// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:test/test.dart';

import 'wycheproof_data.dart';

Uint8List _hexToBytes(String hexString) {
  if (hexString.isEmpty) return Uint8List(0);
  return Uint8List.fromList(hex.decode(hexString));
}

void main() {
  const suites = {
    'hmac_sha256_test.json': sha256,
    'hmac_sha512_test.json': sha512,
    'hmac_sha384_test.json': sha384,
    'hmac_sha224_test.json': sha224,
    'hmac_sha512_224_test.json': sha512224,
    'hmac_sha512_256_test.json': sha512256,
    'hmac_sha1_test.json': sha1,
  };

  for (final entry in suites.entries) {
    final filename = entry.key;
    final hashAlgorithm = entry.value;

    group('Wycheproof $filename', () {
      final base64String = wycheproofVectorsBase64[filename];
      if (base64String == null) {
        fail(
          'Test vector $filename not found in wycheproofVectorsBase64. '
          'Run tool/pull_wycheproof.dart.',
        );
      }

      final jsonString = utf8.decode(base64.decode(base64String));
      final jsonVector = json.decode(jsonString) as Map<String, dynamic>;
      final testGroups = (jsonVector['testGroups'] as List<dynamic>)
          .cast<Map<String, dynamic>>();

      for (final groupData in testGroups) {
        final keySize = groupData['keySize'] as int;
        final tagSize = groupData['tagSize'] as int;
        final tests =
            (groupData['tests'] as List<dynamic>).cast<Map<String, dynamic>>();

        group('keySize: $keySize, tagSize: $tagSize', () {
          for (final testCase in tests) {
            final tcId = testCase['tcId'] as int;
            final comment = testCase['comment'] as String;
            final result = testCase['result'] as String;
            final keyHex = testCase['key'] as String;
            final msgHex = testCase['msg'] as String;
            final tagHex = testCase['tag'] as String;

            test('tcId $tcId: $comment', () {
              final keyBytes = _hexToBytes(keyHex);
              final msgBytes = _hexToBytes(msgHex);
              final expectedTag = _hexToBytes(tagHex);

              final hmac = Hmac(hashAlgorithm, keyBytes);
              final digest = hmac.convert(msgBytes);

              // Wycheproof tests tag truncation down to tagSize bits.
              final tagByteLength = tagSize ~/ 8;
              final actualTag = digest.bytes.sublist(0, tagByteLength);

              if (result == 'valid' || result == 'acceptable') {
                expect(actualTag, equals(expectedTag));
              } else if (result == 'invalid') {
                expect(actualTag, isNot(equals(expectedTag)));
              } else {
                fail('Unknown test result flag: $result');
              }
            });
          }
        });
      }
    });
  }
}
