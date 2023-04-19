// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "dart:io";
import "shared.dart";

// Abstraction over files fetched from the `unicode.org/Public` UCD repository.

// TODO: Find way to detect newest Unicode version,
// and compute URIs from that.

final graphemeBreakPropertyData = DataFile(
    // "https://unicode.org/Public/15.0.0/ucd/auxiliary/GraphemeBreakProperty.txt",
    "https://unicode.org/Public/UCD/latest/ucd/auxiliary/GraphemeBreakProperty.txt",
    "third_party/Unicode_Consortium/GraphemeBreakProperty.txt");

final emojiData = DataFile(
    // "https://unicode.org/Public/15.0.0/ucd/emoji/emoji-data.txt",
    "https://unicode.org/Public/UCD/latest/ucd/emoji/emoji-data.txt",
    "third_party/Unicode_Consortium/emoji_data.txt");

final graphemeTestData = DataFile(
    // "https://unicode.org/Public/15.0.0/ucd/auxiliary/GraphemeBreakTest.txt",
    "https://unicode.org/Public/UCD/latest/ucd/auxiliary/GraphemeBreakTest.txt",
    "third_party/Unicode_Consortium/GraphemeBreakTest.txt");

final emojiTestData = DataFile(
    // "https://www.unicode.org/Public/emoji/15.0/emoji-test.txt",
    "https://unicode.org/Public/emoji/latest/emoji-test.txt",
    "third_party/Unicode_Consortium/emoji_test.txt");

final licenseFile = DataFile("https://www.unicode.org/license.txt",
    "third_party/Unicode_Consortium/UNICODE_LICENSE.txt");

class DataFile {
  final String sourceLocation;
  // Target location relative to package root.
  final String targetLocation;
  String? _contents;
  DataFile(this.sourceLocation, this.targetLocation);

  Future<String> get contents async => _contents ??= await load();

  Future<String> load({bool checkForUpdate = false}) async =>
      (checkForUpdate ? null : _contents) ??
      (_contents = await fetch(sourceLocation,
          targetFile: File(path(packageRoot, targetLocation)),
          forceLoad: checkForUpdate));
}
