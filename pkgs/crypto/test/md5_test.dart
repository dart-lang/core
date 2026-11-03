// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:test/test.dart';

void main() {
  group('RFC 1321 A.5 test suite', () {
    for (final MapEntry(key: message, value: digest) in _rfc1321.entries) {
      test('"$message"', () {
        expect(md5.convert(utf8.encode(message)).toString(), digest);
      });
    }
  });

  group('NESSIE test vectors', () {
    test('set 1: "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"',
        () {
      expect(
        md5
            .convert(
              utf8.encode(
                'abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq',
              ),
            )
            .toString(),
        '8215ef0796a20bcaaae116d3876c664a',
      );
    });

    test('set 1: one million "a"', () {
      final bytes = Uint8List(1000000)..fillRange(0, 1000000, 0x61);
      expect(
        md5.convert(bytes).toString(),
        '7707d6ae4e027c70eea2a935c2296f21',
      );
    });

    test('set 2: n zero bytes for n = 0..127', () {
      for (var n = 0; n < _nessieZeroBytes.length; n++) {
        expect(
          md5.convert(Uint8List(n)).toString(),
          _nessieZeroBytes[n],
          reason: 'n = $n',
        );
      }
    });

    test('set 4: 128 zero bits, iterated 100000 times', () {
      var digest = md5.convert(Uint8List(16));
      expect(digest.toString(), '4ae71336e44bf9bf79d2752e234818a5');
      for (var i = 1; i < 100000; i++) {
        digest = md5.convert(digest.bytes);
      }
      expect(digest.toString(), '1a83f51285e4d89403d00c46ef8508fe');
    });
  });

  test('padding boundaries', () {
    for (final MapEntry(key: n, value: digest) in _aVectors.entries) {
      final bytes = Uint8List(n)..fillRange(0, n, 0x61);
      expect(md5.convert(bytes).toString(), digest, reason: 'n = $n');
    }
  });
}

// https://datatracker.ietf.org/doc/html/rfc1321#appendix-A.5
const Map<String, String> _rfc1321 = {
  '': 'd41d8cd98f00b204e9800998ecf8427e',
  'a': '0cc175b9c0f1b6a831c399e269772661',
  'abc': '900150983cd24fb0d6963f7d28e17f72',
  'message digest': 'f96b697d7cb7938d525a2f31aaf161d0',
  'abcdefghijklmnopqrstuvwxyz': 'c3fcd3d76192e4007dfb496cca67e13b',
  'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789':
      'd174ab98d277d9f5a5611c2c9f419d9f',
  '12345678901234567890123456789012345678901234567890123456789012345678901234567890':
      '57edf4a22be3c955ac49da2e2107b67a',
};

// NESSIE test vectors for MD5 (set 2: md5 of n zero bytes, n = 0..127) from:
//   https://www.cosic.esat.kuleuven.be/nessie/testvectors/hash/md5/Md5-128.unverified.test-vectors
const List<String> _nessieZeroBytes = [
  'd41d8cd98f00b204e9800998ecf8427e',
  '93b885adfe0da089cdf634904fd59f71',
  'c4103f122d27677c9db144cae1394a66',
  '693e9af84d3dfcc71e640e005bdc5e2e',
  'f1d3ff8443297732862df21dc4e57262',
  'ca9c491ac66b2c62500882e93f3719a8',
  '7319468847d7b1aee40dbf5dd963c999',
  'd310a40483f9399dd7ed1712e0fdd702',
  '7dea362b3fac8e00956a4952a3d4f474',
  '3f2829b2ffe8434d67f98a2a98968652',
  'a63c90cc3684ad8b0a2176a6a8fe9005',
  '74da4121dc1c0ed2a8e5b0741f824034',
  '8dd6bb7329a71449b0a1b292b5999164',
  '0b867e53c1d233ce9fe49d54549a2323',
  '36df9540a5ef4996a9737657e4a8929c',
  '3449c9e5e332f1dbb81505cd739fbf3f',
  '4ae71336e44bf9bf79d2752e234818a5',
  'f3c8bdb6b9df478f227af2ce61c8a5a1',
  'ff035bff2dcf972ee7dfd023455997ef',
  '0e6bce6899fae841f79024afbdf7db1d',
  '441018525208457705bf09a8ee3c1093',
  '2319ac34f4848755a639fd524038dfd3',
  'db46e81649d6863b16bd99ab139c865b',
  '6b43b583e2b662724b6fbb5189f6ab28',
  '1681ffc6e046c7af98c9e6c232a3fe0a',
  'd28c293e10139d5d8f6e4592aeaffc1b',
  'a396c59a96af3b36d364448c7b687fb1',
  '65435a5d117aa6b052a5f737d9946a7b',
  '1c9e99e48a495fe81d388fdb4900e59f',
  '4aa476a72347ba44c9bd20c974d0f181',
  '862dec5c27142824a394bc6464928f48',
  '3861facee9efc127e340387f1936b8fb',
  '70bc8f4b72a86921468bf8e8441dce51',
  '099a150e83972a433492a59c2fbe98e0',
  '0b91f1d54f932dc6382dc69f197900cf',
  'c54104d7894a1941ca710981da437f9f',
  '81684c2e68ade2cd4bf9f2e8a67dd4fe',
  '21e2e8fe686ed0003b67d698b1273481',
  'f3a534d52e3fe0c7a85b30ca00ca7424',
  '002d5910de023eddce8358edf169c07f',
  'fd4b38e94292e00251b9f39c47ee5710',
  'f5cfd73023c1eedb6b9569736073f1dd',
  'c183857770364b05c2011bdebb914ed3',
  'aea2fa668453e23c431649801e5ea548',
  '3e5ceb07f51a70d9d431714f04c0272f',
  '7622214b8536afe7b89b1c6606069b0d',
  'd898504a722bff1524134c6ab6a5eaa5',
  '0d7db7ff842f89a36b58fa2541de2a6c',
  'b203621a65475445e6fcdca717c667b5',
  '884bb48a55da67b4812805cb8905277d',
  '871bdd96b159c14d15c8d97d9111e9c8',
  'e2365bc6a6fbd41287fae648437296fa',
  '469aa816010c9c8639a9176f625189af',
  'eca0470178275ac94e5de381969ed232',
  '8910e6fc12f07a52b796eb55fbf3edda',
  'c9ea3314b91c9fd4e38f9432064fd1f2',
  'e3c4dd21a9171fd39d208efa09bf7883',
  'ab9d8ef2ffa9145d6c325cefa41d5d4e',
  '2c1cf4f76fa1cecc0c4737cfd8d95118',
  '22031453e4c3a1a0d47b0b97d83d8984',
  'a302a771ee0e3127b8950f0a67d17e49',
  'e2a482a3896964675811dba0bfde2f0b',
  '8d7d1020185f9b09cc22e789887be328',
  '65cecfb980d72fde57d175d6ec1c3f64',
  '3b5d3c7d207e37dceeedd301e35e2e58',
  '1ef5e829303a139ce967440e0cdca10c',
  '402535c9f22ff836ea91dd12e8b8847b',
  '53553242d57214aaa5726a09b05fe7bc',
  '7c909b3e2820c8b47ed418753698a6da',
  '3b8151acfb469ae41d3f0449058076e1',
  '3287282fa1a1523a294fb018e3679872',
  '2f0f98115f17f2869c1f59ba804af077',
  'ac3b5a19643ee5816a1df17f2fadaae3',
  'fa67ab9184f8d574cef7cd8e0b2f1a78',
  'aa6672fe9e8426f8dd570c81095e1476',
  '6e36ba0fe61f7c6334305d61299c04cf',
  'e6b62b76fb2eb2a0e0adde0c067da680',
  '2b62a30906a2b8bf3b68abd2ef9d105b',
  'b79abf5c5f2244956c7246e9112595ce',
  '55712f2f2f21a8321b9ee45d40b89091',
  'bbf7c6077962a7c28114dbd10be947cd',
  '9546c10433c45bfb9947449dd8d304de',
  '516c0567e329930b320357809a0c9149',
  '0efce63cf4c085888a2772125dfe7aaa',
  '3561c0dffdb90248fa1fc2d4fb86f08a',
  'eeb20c9bc165677800b6dc7621a50cc9',
  'bb1ef3ddda35b590d4aa204d0493e921',
  'eecae68e4f9ee6f037742aac8f36cc1b',
  'f2331152449c622545360f18dfdf0e2d',
  '335a7c8e767a2dd0ecf3460eaabb0bbd',
  '3277ca99dfe4a704df82c63ac9e876fd',
  '67130d31b6048171a64ed87d36022a6e',
  '534d78034b774b6266f2189576f8c6e3',
  '90c805bcb9fa376aacfb38d598ec7bb6',
  '363c2e67f9e853fbc532d0b6404db30a',
  '0a1dfc18c8c8381f05f8ad9d2b4509b5',
  'aceb486e7e4b2d2f1c5f2328b503502b',
  '9e0573ecb4a0800788a3aa64ad731bbc',
  '33aa8cb471ba9dee750c069bca801127',
  'fa8715078d45101200a6e2bf7321aa04',
  '6d0bb00954ceb7fbee436bb55a8397a9',
  '22577911e88af39f79409e6de8eed4d9',
  'f5e502b5576c2ceb07f0f03afdede1f7',
  '213e635dac590095b5681a944a5713a2',
  '3189de1ff1f8afed0f70e352dfcd2abb',
  'd1950d80f172e80f1c48685c51835807',
  'f536fbf78e26387affb82ee89943b870',
  'eaf25f841c19e96c5ad6217e6286e28b',
  '60c6b126049a35e50fffeadf17279275',
  'aa9ecdc8d4e3ecddb3cdc851ea2eeb61',
  'faee174ece449bca53aea3129d925069',
  '03bc63b77bec853adcb65719a21459ce',
  'c20019258ca235d2408334dfbc5e67e3',
  'b9205d5c0a413e022f6c36d4bdfa0750',
  '301657e2669b4c76979a15f801cc2adf',
  '39dbf807a41e5e4e63b59c9535c72eb7',
  '617f292bebf954b26d56f326b51c8a82',
  'b5d466335d65b171b686700dee05ef74',
  '1a6bf84723f4e07dc1f35f162acec19b',
  '8271cb2e6a546123b43096a2efce39d2',
  '222f7d881ded1871724a1b9a1cb94247',
  '709c6a80af0276b170c521117ede47c6',
  'b7d01d15f7334eed7ea235515822f7d5',
  'b1fec41621e338896e2d26f232a6b006',
  '3aaceebd65f0b79f9ae1718d3241bf37',
  '38397588c4d02f8b95c263852e9aee7a',
  '91492f3350f4a1c513741f6aa8a96b5a',
  'e457fbae1dd166a0c89d244ac03f4e93',
];

// md5('a' * n) for n around the 56/64 and 120/128 byte padding boundaries,
// generated with:
//   python3 -c "import hashlib; print(hashlib.md5(b'a' * N).hexdigest())"
const Map<int, String> _aVectors = {
  55: 'ef1772b6dff9a122358552954ad0df65',
  56: '3b0c8ac703f828b04c6c197006d17218',
  57: '652b906d60af96844ebd21b674f35e93',
  63: 'b06521f39153d618550606be297466d5',
  64: '014842d480b571495a4a0363793f7367',
  65: 'c743a45e0d2e6a95cb859adae0248435',
  119: '8a7bd0732ed6a28ce75f6dabc90e1613',
  120: '5f61c0ccad4cac44c75ff505e1f1e537',
  121: 'f6acfca2d47c87f2b14ca038234d3614',
  127: '020406e1d05cdc2aa287641f7ae2cc39',
  128: 'e510683b3f5ffe4093d021808bc6ff70',
  129: 'b325dc1c6f5e7a2b7cf465b9feab7948',
};
