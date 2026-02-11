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

  @override
  int rootLength(String path, {bool withDrive = false}) {
    if (path.isEmpty) return 0;
    // Find scheme. Recognize `file:` scheme specifically,
    // since it is required for `withDrive` to apply.
    final int afterScheme;
    if (withDrive && startsWithFileColon(path)) {
      // Check for authority, then drive letter.
      const fileSchemeLength = 'file:'.length;
      afterScheme = fileSchemeLength;
    } else {
      withDrive = false;
      afterScheme = endOfScheme(path, 0);
    }
    // If there is a scheme, include authority if any.
    // If no scheme, a leading `//` is considered part of a path, unlike
    // how a URI would parse it. (For backwards compatibility)
    final afterAuthority = afterScheme > 0
        ? authorityEnd(path, afterScheme)
        : 0;

    // If no scheme and no authority, include leading `/` in root.
    // If scheme or authority, do not include a first `/` of the path in root.
    // If scheme and no authority, include first segment of path in root,
    //    but do not look for drive letters (even if scheme is `file:`).
    // If `file:` scheme and authority (`//` or `//...`), and `withDrive`,
    //    look for drive letter at start of path (after first slash).

    if (afterAuthority == path.length) return afterAuthority;
    final nextChar = path.codeUnitAt(afterAuthority);
    final int afterPathRoot;
    if (isSeparator(nextChar)) {
      afterPathRoot = afterAuthority + 1;
      if (withDrive && afterAuthority > afterScheme) {
        final afterDriveLetter = driveLetterEnd(path, afterPathRoot);
        if (afterDriveLetter > afterPathRoot) return afterDriveLetter;
      }
      if (afterAuthority == 0) return afterPathRoot;
      return afterAuthority;
    }
    if (afterAuthority > afterScheme) {
      // Has authority, not followed by `/`, so empty path.
      // Character after authority must be `#` or `?`, or end of path.
      return afterAuthority;
    }
    if (afterScheme > 0) {
      // If scheme, no authority, no leading `/` in path, include next segment
      // in root (and not `/`).
      var char = nextChar;
      var i = afterAuthority;
      while (char != chars.hash &&
          char != chars.question &&
          char != chars.slash) {
        i++;
        if (i == path.length) break;
        char = path.codeUnitAt(i);
      }
      return i; // Never checks for drive letter after non-authority.
    }
    // No scheme, no authority, path does not start with `/`.
    return 0;
  }

  @override
  bool isRootRelative(String path) =>
      path.isNotEmpty &&
      isSeparator(path.codeUnitAt(0)) &&
      (path.length < 2 || !isSeparator(path.codeUnitAt(1)));

  @override
  String? getRelativeRoot(String path) => isRootRelative(path) ? '/' : null;

  @override
  String pathFromUri(Uri uri) => uri.toString();

  @override
  Uri relativePathToUri(String path) => Uri.parse(path);
  @override
  Uri absolutePathToUri(String path) => Uri.parse(path);
}
