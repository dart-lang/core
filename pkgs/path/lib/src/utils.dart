// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'characters.dart' as chars;

/// Whether [char] is the code for an ASCII letter (uppercase or lowercase).
bool isAlphabetic(int char) =>
    chars.lowerA <= (char |= 0x20) && char <= chars.lowerZ;

/// Whether [char] is the code for an ASCII digit.
bool isNumeric(int char) => char ^ chars.zero <= 9;

/// Whether [path] has a URL-formatted Windows drive letter beginning at
/// [index].
bool isDriveLetter(String path, int index) =>
    driveLetterEnd(path, index) != index;

/// Index after drive letter starting at [index], or [index] if none.
///
/// The [path] is a URI-formed path.
/// A valid drive letter must be followed by a colon and then either a `/`,
/// a `#`, a `?` or the end of the path.
///
/// ```
/// d:/abc => 3
/// d:/    => 3
/// d:     => 2
/// d:#    => 2
/// d:?    => 2
/// d      => 0
/// d:a    => 0
/// ```
/// Same with every `:` replaced by `%3a` or `%3A`, and then the
/// returned numbers would be increased by 2.
int driveLetterEnd(String path, int index) {
  if (path.length < index + 2) return index;
  if (!isAlphabetic(path.codeUnitAt(index))) return index;
  final colonChar = path.codeUnitAt(index + 1);
  final int indexAfter;
  if (colonChar == chars.colon) {
    indexAfter = index + 2; // After '<letter>:'
  } else if (colonChar == chars.percent &&
      path.length >= index + 4 &&
      path.codeUnitAt(index + 2) == (chars.zero + 3) &&
      (path.codeUnitAt(index + 3) | 0x20) == chars.lowerA) {
    indexAfter = index + 4; // After '<letter>%3A'.
  } else {
    return index;
  }
  if (path.length == indexAfter) return indexAfter;
  final nextChar = path.codeUnitAt(indexAfter);
  if (nextChar == chars.slash) return indexAfter + 1;
  if (nextChar == chars.hash || nextChar == chars.question) return indexAfter;
  return index;
}

/// Position after a leading URL scheme in [path], if any.
///
/// If [path] starts with a valid URL scheme at position [index], then returns
/// then index after the following colon, otherwise returns [index].
int endOfScheme(String path, int index) {
  if (index >= path.length) return index;
  final firstChar = path.codeUnitAt(index);
  if (!isAlphabetic(firstChar)) return index;
  for (var i = index + 1; i < path.length; i++) {
    final codeUnit = path.codeUnitAt(i);
    if (!isAlphabetic(codeUnit) &&
        !isNumeric(codeUnit) &&
        codeUnit != chars.plus &&
        codeUnit != chars.minus &&
        codeUnit != chars.period) {
      if (codeUnit == chars.colon) {
        return i + 1;
      }
      break;
    }
  }
  return index;
}

/// Checks if [path] starts with `"file:"`, case insensitively.
bool startsWithFileColon(String path) {
  if (path.length < 5) return false;
  return path.length >= 5 &&
      path.codeUnitAt(4) == chars.colon &&
      (path.codeUnitAt(0) | 0x20) == chars.lowerF &&
      (path.codeUnitAt(1) | 0x20) == chars.lowerI &&
      (path.codeUnitAt(2) | 0x20) == chars.lowerL &&
      (path.codeUnitAt(3) | 0x20) == chars.lowerE;
}

/// Position after a URI authority part at [index], if any.
///
/// The [path] must be a URI formatted text.
///
/// If an authority part is found, meaning that [path] starts with `//` at
/// [index], the result is the position of the first
/// non-authority character, which must be one of `/`, `?` or `#`,
/// or the end of the `path`.
/// Otherwise the result is [index].
int authorityEnd(String path, int index) {
  if (!path.startsWith('//', index)) return index;
  index += 2;
  while (index < path.length) {
    final codeUnit = path.codeUnitAt(index);
    if (codeUnit == chars.question || codeUnit == chars.hash) break;
    if (codeUnit == chars.slash) break;
    index++;
  }
  return index;
}

String removeQueryFragment(String pathSegment) {
  for (var i = 0; i < pathSegment.length; i++) {
    final codeUnit = pathSegment.codeUnitAt(i);
    if (codeUnit == chars.question || codeUnit == chars.hash) {
      return pathSegment.substring(0, i);
    }
  }
  return pathSegment;
}
