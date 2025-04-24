// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'characters.dart' as chars;
import 'internal_style.dart';
import 'style.dart';
import 'utils.dart' show endOfScheme, removeQueryFragment;

class ParsedPath {
  /// The [InternalStyle] that was used to parse this path.
  InternalStyle style;

  /// The absolute root portion of the path, or `null` if the path is relative.
  /// On POSIX systems, this will be `null` or "/". On Windows, it can be
  /// `null`, "//" for a UNC path, or something like "C:\" for paths with drive
  /// letters.
  String? root;

  /// Whether this path is root-relative.
  ///
  /// See `Context.isRootRelative`.
  bool isRootRelative;

  /// The path-separated parts of the path. All but the last will be
  /// directories.
  List<String> parts;

  /// The path separators preceding each part.
  ///
  /// The first one will be an empty string unless the root requires a separator
  /// between it and the path. The last one will be an empty string unless the
  /// path ends with a trailing separator.
  List<String> separators;

  /// The file extension of the last non-empty part, or "" if it doesn't have
  /// one.
  String extension([int level = 1]) => _splitExtension(level)[1];

  /// Whether this is an absolute path.
  bool get isAbsolute => root != null;

  factory ParsedPath.parse(String path, InternalStyle style) {
    // Remove the root prefix, if any.
    final root = style.getRoot(path);
    final isRootRelative = style.isRootRelative(path);
    if (root != null) path = path.substring(root.length);

    // Split the parts on path separators.
    final parts = <String>[];
    final separators = <String>[];

    var start = 0;

    if (path.isNotEmpty && style.isSeparator(path.codeUnitAt(0))) {
      separators.add(path[0]);
      start = 1;
    } else {
      separators.add('');
    }

    for (var i = start; i < path.length; i++) {
      final codeUnit = path.codeUnitAt(i);
      if (style.isSeparator(codeUnit)) {
        parts.add(path.substring(start, i));
        separators.add(path[i]);
        start = i + 1;
      }
      if (style == Style.url &&
          (codeUnit == chars.question || codeUnit == chars.hash)) {
        // Include `?` and `#` in final path segment.
        break;
      }
    }

    // Add the final part, if any.
    if (start < path.length) {
      parts.add(path.substring(start));
      separators.add('');
    }

    return ParsedPath._(style, root, isRootRelative, parts, separators);
  }

  ParsedPath._(
    this.style,
    this.root,
    this.isRootRelative,
    this.parts,
    this.separators,
  );

  String get basename {
    final copy = clone();
    copy.removeTrailingSeparators();
    if (copy.parts.isEmpty) return root ?? '';
    return copy.parts.last;
  }

  String get basenameWithoutExtension => _splitExtension()[0];

  bool get hasTrailingSeparator =>
      parts.isNotEmpty && (parts.last == '' || separators.last != '');

  void removeTrailingSeparators() {
    while (parts.isNotEmpty && parts.last == '') {
      parts.removeLast();
      separators.removeLast();
    }
    if (separators.isNotEmpty) separators[separators.length - 1] = '';
  }

  void normalize({bool canonicalize = false}) {
    // Handle '.', '..', and empty parts.
    var leadingDoubles = 0;
    final newParts = <String>[];
    if (style == Style.url && parts.isNotEmpty) {
      parts.last = removeQueryFragment(parts.last);
      if (canonicalize && endOfScheme(parts.first, 0) > 0) {
        // Normalize scheme and authority.
        parts.first = parts.first.toLowerCase();
      }
    }
    for (var part in parts) {
      if (part == '.' || part == '') {
        // Do nothing. Ignore it.
      } else if (part == '..') {
        // Pop the last part off.
        if (newParts.isNotEmpty) {
          newParts.removeLast();
        } else {
          // Backed out past the beginning, so preserve the "..".
          leadingDoubles++;
        }
      } else {
        newParts.add(canonicalize ? style.canonicalizePart(part) : part);
      }
    }

    // A relative path can back out from the start directory.
    if (!isAbsolute) {
      newParts.insertAll(0, List.filled(leadingDoubles, '..'));
    }

    // If we collapsed down to nothing, do ".".
    if (newParts.isEmpty && !isAbsolute) {
      newParts.add('.');
    }

    // Canonicalize separators.
    parts = newParts;
    separators = List.filled(
      newParts.length + 1,
      style.separator,
      growable: true,
    );

    final root = this.root;
    if (root == null || newParts.isEmpty || !style.needsSeparator(root)) {
      separators[0] = '';
    }

    if (root != null) {
      if (style == Style.windows) {
        // Normalize the Windows root if needed.
        final canonRoot = canonicalize ? root.toLowerCase() : root;
        this.root = canonRoot.replaceAll('/', r'\');
      } else if (canonicalize && style == Style.url) {
        // Canonicalize the URL scheme and authority.
        this.root = root.toLowerCase();
      }
    }
    removeTrailingSeparators();
  }

  @override
  String toString() {
    final builder = StringBuffer();
    if (root != null) builder.write(root);
    for (var i = 0; i < parts.length; i++) {
      builder.write(separators[i]);
      builder.write(parts[i]);
    }
    builder.write(separators.last);

    return builder.toString();
  }

  /// Returns k-th last index of the `character` in the `path`.
  ///
  /// If `k` exceeds the count of `character`s in `path`, the left most index
  /// of the `character` is returned.
  int _kthLastIndexOf(String path, String character, int k) {
    var count = 0, leftMostIndexedCharacter = 0;
    for (var index = path.length - 1; index >= 0; --index) {
      if (path[index] == character) {
        leftMostIndexedCharacter = index;
        ++count;
        if (count == k) {
          return index;
        }
      }
    }
    return leftMostIndexedCharacter;
  }

  /// Splits the last non-empty part of the path into a `[basename, extension]`
  /// pair.
  ///
  /// Takes an optional parameter `level` which makes possible to return
  /// multiple extensions having `level` number of dots. If `level` exceeds the
  /// number of dots, the path is split at the first most dot. The value of
  /// `level` must be greater than 0, else `RangeError` is thrown.
  ///
  /// Returns a two-element list. The first is the name of the file without any
  /// extension. The second is the extension or "" if it has none.
  List<String> _splitExtension([int level = 1]) {
    if (level <= 0) {
      throw RangeError.value(
        level,
        'level',
        "level's value must be greater than 0",
      );
    }

    final file = parts.cast<String?>().lastWhere(
          (p) => p != '',
          orElse: () => null,
        );

    if (file == null) return ['', ''];
    if (file == '..') return ['..', ''];

    final lastDot = _kthLastIndexOf(file, '.', level);

    // If there is no dot, or it's the first character, like '.bashrc', it
    // doesn't count.
    if (lastDot <= 0) return [file, ''];

    return [file.substring(0, lastDot), file.substring(lastDot)];
  }

  ParsedPath clone() => ParsedPath._(
        style,
        root,
        isRootRelative,
        List.from(parts),
        List.from(separators),
      );
}
