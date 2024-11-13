// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';
import 'shared.dart' as util;

// Abstraction over files fetched from the `unicode.org/Public` UCD repository.
// If any of these URIs stop working, find out where they have moved to.

final graphemeBreakPropertyData = DataFile(
    'https://unicode.org/Public/UCD/latest/ucd/auxiliary/GraphemeBreakProperty.txt',
    'third_party/Unicode_Consortium/GraphemeBreakProperty.txt');

final emojiData = DataFile(
    'https://unicode.org/Public/UCD/latest/ucd/emoji/emoji-data.txt',
    'third_party/Unicode_Consortium/emoji_data.txt');

final graphemeTestData = DataFile(
    'https://unicode.org/Public/UCD/latest/ucd/auxiliary/GraphemeBreakTest.txt',
    'third_party/Unicode_Consortium/GraphemeBreakTest.txt');

final emojiTestData = DataFile(
    'https://unicode.org/Public/emoji/latest/emoji-test.txt',
    'third_party/Unicode_Consortium/emoji_test.txt');

final licenseFile = DataFile('https://www.unicode.org/license.txt',
    'third_party/Unicode_Consortium/UNICODE_LICENSE.txt');

final derivedData = DataFile(
    'https://unicode.org/Public/UCD/latest/ucd/DerivedCoreProperties.txt',
    'third_party/Unicode_Consortium/DerivedCoreProperties.txt');

class DataFile {
  /// Source URI.
  final String sourceLocation;

  /// Target file path relative to package root.
  final String targetLocation;

  /// Cached contents.
  String? _contents;

  DataFile(this.sourceLocation, this.targetLocation);

  Future<String> get contents async => _contents ??= await load();

  /// Loads file, fetching it from the source first if necessary.
  ///
  /// If [checkForUpdate] is `false`, the content of an existing file at
  /// [targetLocation] is read. If there is no file or if [checkForUpdate]
  /// is `true`, new content is fetched from the [sourceLocation] URI
  /// and written to the [targetLocation] file.
  Future<String> load({bool checkForUpdate = false}) async =>
      (checkForUpdate ? null : _contents) ??
      (_contents = await util.fetch(sourceLocation,
          targetFile: _targetFile, forceLoad: checkForUpdate));

  /// Fetches content, compares to existing content.
  ///
  /// Returns `null` if no change, a path to a temporary file containing the
  /// new content if there are changes.
  Future<String?> checkChange([bool Function(String, String)? equals]) async {
    equals ??= _eq;
    var contents = await this.contents;
    var tmpFile = File(util.tmpPath(targetLocation));
    var newContents =
        await util.fetch(sourceLocation, targetFile: tmpFile, forceLoad: true);
    if (equals(contents, newContents)) {
      return null;
    }
    return tmpFile.path;
  }

  static bool _eq(String a, String b) => a == b;

  void copyFrom(String contentPath) {
    _contents = null;
    File(contentPath).copySync(_targetFile.path);
  }

  File get _targetFile => File(util.packagePath(targetLocation));
}
