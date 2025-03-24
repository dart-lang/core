// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../characters.dart' as chars;
import '../internal_style.dart';
import '../utils.dart';

/// The style for URL paths.
class UrlStyle extends InternalStyle {
  @override
  final name = 'url';
  @override
  final separator = '/';
  final separators = const ['/'];

  // Deprecated properties.

  @override
  final separatorPattern = RegExp(r'/');
  @override
  final needsSeparatorPattern = RegExp(r'(^[a-zA-Z][-+.a-zA-Z\d]*://|[^/])$');
  @override
  final rootPattern = RegExp(r'[a-zA-Z][-+.a-zA-Z\d]*://[^/]*');
  @override
  final relativeRootPattern = RegExp(r'^/');

  @override
  bool containsSeparator(String path) => path.contains('/');

  @override
  bool isSeparator(int codeUnit) => codeUnit == chars.slash;

  @override
  bool needsSeparator(String path) {
    if (path.isEmpty) return false;

    // A URL that doesn't end in "/" always needs a separator.
    if (!isSeparator(path.codeUnitAt(path.length - 1))) return true;

    // A URI that's just "scheme://" needs an extra separator, despite ending
    // with "/".
    return path.endsWith('://') && rootLength(path) == path.length;
  }

  /// Checks if [path] starts with `"file:"`, case insensitively.
  static bool _startsWithFileColon(String path) {
    if (path.length < 5) return false;
    const f = 0x66;
    const i = 0x69;
    const l = 0x6c;
    const e = 0x65;
    return path.codeUnitAt(4) == chars.colon &&
        (path.codeUnitAt(0) | 0x20) == f &&
        (path.codeUnitAt(1) | 0x20) == i &&
        (path.codeUnitAt(2) | 0x20) == l &&
        (path.codeUnitAt(3) | 0x20) == e;
  }

  @override
  int rootLength(String path, {bool withDrive = false}) {
    if (path.isEmpty) return 0;
    if (withDrive && _startsWithFileColon(path)) {
      return _rootAuthorityLength(path, 5, withDrive: true);
    }
    final firstChar = path.codeUnitAt(0);
    if (chars.isLetter(firstChar)) {
      // Check if starting with scheme or drive letter.
      for (var i = 1; i < path.length; i++) {
        final codeUnit = path.codeUnitAt(i);
        if (chars.isLetter(codeUnit) ||
            chars.isDigit(codeUnit) ||
            codeUnit == chars.plus ||
            codeUnit == chars.minus ||
            codeUnit == chars.period) {
          continue;
        }
        if (codeUnit == chars.colon) {
          return _rootAuthorityLength(path, i + 1, withDrive: false);
        }
        break;
      }
      return 0;
    }
    return _rootAuthorityLength(path, 0, withDrive: false);
  }

  /// Checks for authority part at start or after scheme.
  ///
  /// If found, includes this in the root length.
  ///
  /// Includes an authority starting at `//` until the next `/`, `?` or `#`,
  /// or the end of the path.
  int _rootAuthorityLength(String path, int index, {required bool withDrive}) {
    if (path.startsWith('//', index)) {
      index += 2;
      while (true) {
        if (index == path.length) return index;
        final codeUnit = path.codeUnitAt(index);
        if (codeUnit == chars.question || codeUnit == chars.hash) return index;
        index++;
        if (isSeparator(codeUnit)) break;
      }
    }
    if (withDrive) return _withDrive(path, index);
    return index;
  }

  /// Checks for `[a-z]:/`, or `[a-z]:` when followed by `?` or `#` or nothing.
  /// 
  /// If found, includes this in the root length.
  int _withDrive(String path, int index) {
    final afterDrive = index + 2;
    if (path.length < afterDrive ||
        !chars.isLetter(path.codeUnitAt(index)) ||
        path.codeUnitAt(index + 1) != chars.colon) {
      return index;
    }
    if (path.length == afterDrive) return afterDrive;
    final nextChar = path.codeUnitAt(afterDrive);
    if (nextChar == chars.slash) {
      // Include following slash in root.
      return afterDrive + 1;
    }
    if (nextChar == chars.question || nextChar == chars.hash) {
      return afterDrive;
    }
    return index;
  }

  @override
  bool isRootRelative(String path) =>
      path.isNotEmpty && isSeparator(path.codeUnitAt(0));

  @override
  String? getRelativeRoot(String path) => isRootRelative(path) ? '/' : null;

  @override
  String pathFromUri(Uri uri) => uri.toString();

  @override
  Uri relativePathToUri(String path) => Uri.parse(path);
  @override
  Uri absolutePathToUri(String path) => Uri.parse(path);
}
