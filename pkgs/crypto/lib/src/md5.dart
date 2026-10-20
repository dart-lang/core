// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:typed_data';

import 'digest.dart';
import 'hash.dart';
import 'hash_sink.dart';
import 'utils.dart';

/// An implementation of the [MD5][rfc] hash function.
///
/// [rfc]: https://tools.ietf.org/html/rfc1321
///
/// **Warning**: MD5 has known collisions and should only be used when required
/// for backwards compatibility.
const Hash md5 = _MD5._();

/// An implementation of the [MD5][rfc] hash function.
///
/// [rfc]: https://tools.ietf.org/html/rfc1321
///
/// **Warning**: MD5 has known collisions and should only be used when required
/// for backwards compatibility.
///
/// Use the [md5] object to perform MD5 hashing.
class _MD5 extends Hash {
  @override
  final int blockSize = 16 * bytesPerWord;

  const _MD5._();

  @override
  ByteConversionSink startChunkedConversion(Sink<Digest> sink) =>
      _MD5Sink(sink);
}

// Constants for MD5Transform routine from RFC 1321 Appendix A.3 (md5c.c):
// https://datatracker.ietf.org/doc/html/rfc1321#appendix-A.3
//
//   #define S11 7
//   #define S12 12
//   #define S13 17
//   #define S14 22
//   #define S21 5
//   #define S22 9
//   #define S23 14
//   #define S24 20
//   #define S31 4
//   #define S32 11
//   #define S33 16
//   #define S34 23
//   #define S41 6
//   #define S42 10
//   #define S43 15
//   #define S44 21
const _s11 = 7;
const _s12 = 12;
const _s13 = 17;
const _s14 = 22;
const _s21 = 5;
const _s22 = 9;
const _s23 = 14;
const _s24 = 20;
const _s31 = 4;
const _s32 = 11;
const _s33 = 16;
const _s34 = 23;
const _s41 = 6;
const _s42 = 10;
const _s43 = 15;
const _s44 = 21;

/// The concrete implementation of `MD5`.
///
/// This is separate so that it can extend [HashSink] without leaking additional
/// public members.
class _MD5Sink extends HashSink {
  @override
  final digest = Uint32List(4);

  _MD5Sink(Sink<Digest> sink) : super(sink, 16, endian: Endian.little) {
    digest[0] = 0x67452301;
    digest[1] = 0xefcdab89;
    digest[2] = 0x98badcfe;
    digest[3] = 0x10325476;
  }

  // Basic MD5 functions F, G, H, and I from RFC 1321 Section 3.4 and
  // Appendix A.3 (md5c.c):
  // https://datatracker.ietf.org/doc/html/rfc1321#section-3.4
  // https://datatracker.ietf.org/doc/html/rfc1321#appendix-A.3
  //
  //   #define F(x, y, z) (((x) & (y)) | ((~x) & (z)))
  //   #define G(x, y, z) (((x) & (z)) | ((y) & (~z)))
  //   #define H(x, y, z) ((x) ^ (y) ^ (z))
  //   #define I(x, y, z) ((y) ^ ((x) | (~z)))

  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  @pragma('wasm:prefer-inline')
  static int _f(int x, int y, int z) => (x & y) | ((~x & mask32) & z);

  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  @pragma('wasm:prefer-inline')
  static int _g(int x, int y, int z) => (x & z) | (y & (~z & mask32));

  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  @pragma('wasm:prefer-inline')
  static int _h(int x, int y, int z) => x ^ y ^ z;

  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  @pragma('wasm:prefer-inline')
  static int _i(int x, int y, int z) => y ^ (x | (~z & mask32));

  // FF, GG, HH, and II transformations for rounds 1, 2, 3, and 4 from
  // RFC 1321 Section 3.4 and Appendix A.3 (md5c.c):
  //
  //   #define ROTATE_LEFT(x, n) (((x) << (n)) | ((x) >> (32-(n))))
  //
  //   #define FF(a, b, c, d, x, s, ac) { \
  //    (a) += F ((b), (c), (d)) + (x) + (UINT4)(ac); \
  //    (a) = ROTATE_LEFT ((a), (s)); \
  //    (a) += (b); \
  //     }
  //   #define GG(a, b, c, d, x, s, ac) { \
  //    (a) += G ((b), (c), (d)) + (x) + (UINT4)(ac); \
  //    (a) = ROTATE_LEFT ((a), (s)); \
  //    (a) += (b); \
  //     }
  //   #define HH(a, b, c, d, x, s, ac) { \
  //    (a) += H ((b), (c), (d)) + (x) + (UINT4)(ac); \
  //    (a) = ROTATE_LEFT ((a), (s)); \
  //    (a) += (b); \
  //     }
  //   #define II(a, b, c, d, x, s, ac) { \
  //    (a) += I ((b), (c), (d)) + (x) + (UINT4)(ac); \
  //    (a) = ROTATE_LEFT ((a), (s)); \
  //    (a) += (b); \
  //     }
  //
  // Note: In C, FF/GG/HH/II are statement macros that mutate their first
  // parameter `(a)` in place; here `_ff`/`_gg`/`_hh`/`_ii` return the updated
  // value for the first parameter (`a = _ff(a, ...)`).

  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  @pragma('wasm:prefer-inline')
  static int _ff(int a, int b, int c, int d, int x, int s, int ac) {
    a = add32(a, add32(add32(_f(b, c, d), x), ac));
    a = rotl32(a, s);
    return add32(a, b);
  }

  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  @pragma('wasm:prefer-inline')
  static int _gg(int a, int b, int c, int d, int x, int s, int ac) {
    a = add32(a, add32(add32(_g(b, c, d), x), ac));
    a = rotl32(a, s);
    return add32(a, b);
  }

  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  @pragma('wasm:prefer-inline')
  static int _hh(int a, int b, int c, int d, int x, int s, int ac) {
    a = add32(a, add32(add32(_h(b, c, d), x), ac));
    a = rotl32(a, s);
    return add32(a, b);
  }

  @pragma('vm:prefer-inline')
  @pragma('dart2js:prefer-inline')
  @pragma('wasm:prefer-inline')
  static int _ii(int a, int b, int c, int d, int x, int s, int ac) {
    a = add32(a, add32(add32(_i(b, c, d), x), ac));
    a = rotl32(a, s);
    return add32(a, b);
  }

  @override
  void updateHash(Uint32List x) {
    // This makes the VM get rid of some "GenericCheckBound" calls.
    // See https://github.com/dart-lang/sdk/issues/60753
    // ignore: unnecessary_statements
    x[15];

    // Access [3] first to get rid of some "GenericCheckBound" calls.
    var d = digest[3];
    var c = digest[2];
    var b = digest[1];
    var a = digest[0];

    // Round 1 (RFC 1321 Section 3.4 & Appendix A.3, MD5Transform):
    //   FF (a, b, c, d, x[ 0], S11, 0xd76aa478); /* 1 */
    //   FF (d, a, b, c, x[ 1], S12, 0xe8c7b756); /* 2 */
    //   FF (c, d, a, b, x[ 2], S13, 0x242070db); /* 3 */
    //   FF (b, c, d, a, x[ 3], S14, 0xc1bdceee); /* 4 */
    //   FF (a, b, c, d, x[ 4], S11, 0xf57c0faf); /* 5 */
    //   FF (d, a, b, c, x[ 5], S12, 0x4787c62a); /* 6 */
    //   FF (c, d, a, b, x[ 6], S13, 0xa8304613); /* 7 */
    //   FF (b, c, d, a, x[ 7], S14, 0xfd469501); /* 8 */
    //   FF (a, b, c, d, x[ 8], S11, 0x698098d8); /* 9 */
    //   FF (d, a, b, c, x[ 9], S12, 0x8b44f7af); /* 10 */
    //   FF (c, d, a, b, x[10], S13, 0xffff5bb1); /* 11 */
    //   FF (b, c, d, a, x[11], S14, 0x895cd7be); /* 12 */
    //   FF (a, b, c, d, x[12], S11, 0x6b901122); /* 13 */
    //   FF (d, a, b, c, x[13], S12, 0xfd987193); /* 14 */
    //   FF (c, d, a, b, x[14], S13, 0xa679438e); /* 15 */
    //   FF (b, c, d, a, x[15], S14, 0x49b40821); /* 16 */
    a = _ff(a, b, c, d, x[0], _s11, 0xd76aa478); // 1
    d = _ff(d, a, b, c, x[1], _s12, 0xe8c7b756); // 2
    c = _ff(c, d, a, b, x[2], _s13, 0x242070db); // 3
    b = _ff(b, c, d, a, x[3], _s14, 0xc1bdceee); // 4
    a = _ff(a, b, c, d, x[4], _s11, 0xf57c0faf); // 5
    d = _ff(d, a, b, c, x[5], _s12, 0x4787c62a); // 6
    c = _ff(c, d, a, b, x[6], _s13, 0xa8304613); // 7
    b = _ff(b, c, d, a, x[7], _s14, 0xfd469501); // 8
    a = _ff(a, b, c, d, x[8], _s11, 0x698098d8); // 9
    d = _ff(d, a, b, c, x[9], _s12, 0x8b44f7af); // 10
    c = _ff(c, d, a, b, x[10], _s13, 0xffff5bb1); // 11
    b = _ff(b, c, d, a, x[11], _s14, 0x895cd7be); // 12
    a = _ff(a, b, c, d, x[12], _s11, 0x6b901122); // 13
    d = _ff(d, a, b, c, x[13], _s12, 0xfd987193); // 14
    c = _ff(c, d, a, b, x[14], _s13, 0xa679438e); // 15
    b = _ff(b, c, d, a, x[15], _s14, 0x49b40821); // 16

    // Round 2 (RFC 1321 Section 3.4 & Appendix A.3, MD5Transform):
    //   GG (a, b, c, d, x[ 1], S21, 0xf61e2562); /* 17 */
    //   GG (d, a, b, c, x[ 6], S22, 0xc040b340); /* 18 */
    //   GG (c, d, a, b, x[11], S23, 0x265e5a51); /* 19 */
    //   GG (b, c, d, a, x[ 0], S24, 0xe9b6c7aa); /* 20 */
    //   GG (a, b, c, d, x[ 5], S21, 0xd62f105d); /* 21 */
    //   GG (d, a, b, c, x[10], S22,  0x2441453); /* 22 */
    //   GG (c, d, a, b, x[15], S23, 0xd8a1e681); /* 23 */
    //   GG (b, c, d, a, x[ 4], S24, 0xe7d3fbc8); /* 24 */
    //   GG (a, b, c, d, x[ 9], S21, 0x21e1cde6); /* 25 */
    //   GG (d, a, b, c, x[14], S22, 0xc33707d6); /* 26 */
    //   GG (c, d, a, b, x[ 3], S23, 0xf4d50d87); /* 27 */
    //   GG (b, c, d, a, x[ 8], S24, 0x455a14ed); /* 28 */
    //   GG (a, b, c, d, x[13], S21, 0xa9e3e905); /* 29 */
    //   GG (d, a, b, c, x[ 2], S22, 0xfcefa3f8); /* 30 */
    //   GG (c, d, a, b, x[ 7], S23, 0x676f02d9); /* 31 */
    //   GG (b, c, d, a, x[12], S24, 0x8d2a4c8a); /* 32 */
    a = _gg(a, b, c, d, x[1], _s21, 0xf61e2562); // 17
    d = _gg(d, a, b, c, x[6], _s22, 0xc040b340); // 18
    c = _gg(c, d, a, b, x[11], _s23, 0x265e5a51); // 19
    b = _gg(b, c, d, a, x[0], _s24, 0xe9b6c7aa); // 20
    a = _gg(a, b, c, d, x[5], _s21, 0xd62f105d); // 21
    d = _gg(d, a, b, c, x[10], _s22, 0x02441453); // 22
    c = _gg(c, d, a, b, x[15], _s23, 0xd8a1e681); // 23
    b = _gg(b, c, d, a, x[4], _s24, 0xe7d3fbc8); // 24
    a = _gg(a, b, c, d, x[9], _s21, 0x21e1cde6); // 25
    d = _gg(d, a, b, c, x[14], _s22, 0xc33707d6); // 26
    c = _gg(c, d, a, b, x[3], _s23, 0xf4d50d87); // 27
    b = _gg(b, c, d, a, x[8], _s24, 0x455a14ed); // 28
    a = _gg(a, b, c, d, x[13], _s21, 0xa9e3e905); // 29
    d = _gg(d, a, b, c, x[2], _s22, 0xfcefa3f8); // 30
    c = _gg(c, d, a, b, x[7], _s23, 0x676f02d9); // 31
    b = _gg(b, c, d, a, x[12], _s24, 0x8d2a4c8a); // 32

    // Round 3 (RFC 1321 Section 3.4 & Appendix A.3, MD5Transform):
    //   HH (a, b, c, d, x[ 5], S31, 0xfffa3942); /* 33 */
    //   HH (d, a, b, c, x[ 8], S32, 0x8771f681); /* 34 */
    //   HH (c, d, a, b, x[11], S33, 0x6d9d6122); /* 35 */
    //   HH (b, c, d, a, x[14], S34, 0xfde5380c); /* 36 */
    //   HH (a, b, c, d, x[ 1], S31, 0xa4beea44); /* 37 */
    //   HH (d, a, b, c, x[ 4], S32, 0x4bdecfa9); /* 38 */
    //   HH (c, d, a, b, x[ 7], S33, 0xf6bb4b60); /* 39 */
    //   HH (b, c, d, a, x[10], S34, 0xbebfbc70); /* 40 */
    //   HH (a, b, c, d, x[13], S31, 0x289b7ec6); /* 41 */
    //   HH (d, a, b, c, x[ 0], S32, 0xeaa127fa); /* 42 */
    //   HH (c, d, a, b, x[ 3], S33, 0xd4ef3085); /* 43 */
    //   HH (b, c, d, a, x[ 6], S34,  0x4881d05); /* 44 */
    //   HH (a, b, c, d, x[ 9], S31, 0xd9d4d039); /* 45 */
    //   HH (d, a, b, c, x[12], S32, 0xe6db99e5); /* 46 */
    //   HH (c, d, a, b, x[15], S33, 0x1fa27cf8); /* 47 */
    //   HH (b, c, d, a, x[ 2], S34, 0xc4ac5665); /* 48 */
    a = _hh(a, b, c, d, x[5], _s31, 0xfffa3942); // 33
    d = _hh(d, a, b, c, x[8], _s32, 0x8771f681); // 34
    c = _hh(c, d, a, b, x[11], _s33, 0x6d9d6122); // 35
    b = _hh(b, c, d, a, x[14], _s34, 0xfde5380c); // 36
    a = _hh(a, b, c, d, x[1], _s31, 0xa4beea44); // 37
    d = _hh(d, a, b, c, x[4], _s32, 0x4bdecfa9); // 38
    c = _hh(c, d, a, b, x[7], _s33, 0xf6bb4b60); // 39
    b = _hh(b, c, d, a, x[10], _s34, 0xbebfbc70); // 40
    a = _hh(a, b, c, d, x[13], _s31, 0x289b7ec6); // 41
    d = _hh(d, a, b, c, x[0], _s32, 0xeaa127fa); // 42
    c = _hh(c, d, a, b, x[3], _s33, 0xd4ef3085); // 43
    b = _hh(b, c, d, a, x[6], _s34, 0x04881d05); // 44
    a = _hh(a, b, c, d, x[9], _s31, 0xd9d4d039); // 45
    d = _hh(d, a, b, c, x[12], _s32, 0xe6db99e5); // 46
    c = _hh(c, d, a, b, x[15], _s33, 0x1fa27cf8); // 47
    b = _hh(b, c, d, a, x[2], _s34, 0xc4ac5665); // 48

    // Round 4 (RFC 1321 Section 3.4 & Appendix A.3, MD5Transform):
    //   II (a, b, c, d, x[ 0], S41, 0xf4292244); /* 49 */
    //   II (d, a, b, c, x[ 7], S42, 0x432aff97); /* 50 */
    //   II (c, d, a, b, x[14], S43, 0xab9423a7); /* 51 */
    //   II (b, c, d, a, x[ 5], S44, 0xfc93a039); /* 52 */
    //   II (a, b, c, d, x[12], S41, 0x655b59c3); /* 53 */
    //   II (d, a, b, c, x[ 3], S42, 0x8f0ccc92); /* 54 */
    //   II (c, d, a, b, x[10], S43, 0xffeff47d); /* 55 */
    //   II (b, c, d, a, x[ 1], S44, 0x85845dd1); /* 56 */
    //   II (a, b, c, d, x[ 8], S41, 0x6fa87e4f); /* 57 */
    //   II (d, a, b, c, x[15], S42, 0xfe2ce6e0); /* 58 */
    //   II (c, d, a, b, x[ 6], S43, 0xa3014314); /* 59 */
    //   II (b, c, d, a, x[13], S44, 0x4e0811a1); /* 60 */
    //   II (a, b, c, d, x[ 4], S41, 0xf7537e82); /* 61 */
    //   II (d, a, b, c, x[11], S42, 0xbd3af235); /* 62 */
    //   II (c, d, a, b, x[ 2], S43, 0x2ad7d2bb); /* 63 */
    //   II (b, c, d, a, x[ 9], S44, 0xeb86d391); /* 64 */
    a = _ii(a, b, c, d, x[0], _s41, 0xf4292244); // 49
    d = _ii(d, a, b, c, x[7], _s42, 0x432aff97); // 50
    c = _ii(c, d, a, b, x[14], _s43, 0xab9423a7); // 51
    b = _ii(b, c, d, a, x[5], _s44, 0xfc93a039); // 52
    a = _ii(a, b, c, d, x[12], _s41, 0x655b59c3); // 53
    d = _ii(d, a, b, c, x[3], _s42, 0x8f0ccc92); // 54
    c = _ii(c, d, a, b, x[10], _s43, 0xffeff47d); // 55
    b = _ii(b, c, d, a, x[1], _s44, 0x85845dd1); // 56
    a = _ii(a, b, c, d, x[8], _s41, 0x6fa87e4f); // 57
    d = _ii(d, a, b, c, x[15], _s42, 0xfe2ce6e0); // 58
    c = _ii(c, d, a, b, x[6], _s43, 0xa3014314); // 59
    b = _ii(b, c, d, a, x[13], _s44, 0x4e0811a1); // 60
    a = _ii(a, b, c, d, x[4], _s41, 0xf7537e82); // 61
    d = _ii(d, a, b, c, x[11], _s42, 0xbd3af235); // 62
    c = _ii(c, d, a, b, x[2], _s43, 0x2ad7d2bb); // 63
    b = _ii(b, c, d, a, x[9], _s44, 0xeb86d391); // 64

    digest[0] = add32(a, digest[0]);
    digest[1] = add32(b, digest[1]);
    digest[2] = add32(c, digest[2]);
    digest[3] = add32(d, digest[3]);
  }
}
