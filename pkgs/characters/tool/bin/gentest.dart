// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "dart:io";

import "../src/args.dart";
import "../src/data_files.dart";
import "../src/shared.dart";
import "../src/string_literal_writer.dart";

// Generates tests for grapheme cluster splitting from the Unicode
// GraphemeBreakTest.txt file.
//
// Fetches the data files from the Unicode web site.

const defaultVerbose = false;

const testFile = "test/src/unicode_grapheme_tests.dart";

void main(List<String> args) async {
  var flags = parseArgs(args, "gentest");

  var output = flags.dryrun
      ? null
      : flags.targetFile ?? File(path(packageRoot, testFile));

  if (output != null && !output.existsSync()) {
    try {
      output.createSync(recursive: true);
    } catch (e) {
      stderr.writeln("Cannot find or create file: ${output.path}");
      stderr.writeln("Writing to stdout");
      output = null;
    }
  }

  await generateTests(output,
      update: flags.update, verbose: flags.verbose, dryrun: flags.dryrun);
}

Future<void> generateTests(File? output,
    {bool update = false,
    bool dryrun = false,
    bool verbose = defaultVerbose}) async {
  var buffer = StringBuffer(copyright)
    ..writeln("// Generated code. Do not edit.")
    ..writeln("// Generated from [${graphemeTestData.sourceLocation}]"
        "(../../${graphemeTestData.targetLocation})")
    ..writeln("// and [${emojiTestData.sourceLocation}]"
        "(../../${emojiTestData.targetLocation}).")
    ..writeln("// Licensed under the Unicode Inc. License Agreement")
    ..writeln("// (${licenseFile.sourceLocation}, "
        "../../third_party/${licenseFile.targetLocation})")
    ..writeln("// ignore_for_file: lines_longer_than_80_chars")
    ..writeln();

  var texts = await Future.wait([
    graphemeTestData.load(checkForUpdate: update),
    emojiTestData.load(checkForUpdate: update)
  ]);
  if (update) {
    // Force license file update.
    await licenseFile.load(checkForUpdate: true);
  }
  {
    buffer
      ..writeln("// Grapheme cluster tests.")
      ..writeln("const List<List<String>> splitTests = [");
    var test = texts[0];
    var lineRE = RegExp(r"^(÷.*?)#", multiLine: true);
    var tokensRE = RegExp(r"[÷×]|[\dA-F]+");
    var writer = StringLiteralWriter(buffer, lineLength: 9999, escape: _escape);
    for (var line in lineRE.allMatches(test)) {
      var tokens = tokensRE.allMatches(line[0]!).map((x) => x[0]!).toList();
      assert(tokens.first == "÷");
      assert(tokens.last == "÷");

      var parts = <List<int>>[];
      var chars = <int>[];
      for (var i = 1; i < tokens.length; i += 2) {
        var cp = int.parse(tokens[i], radix: 16);
        chars.add(cp);
        if (tokens[i + 1] == "÷") {
          parts.add(chars);
          chars = [];
        }
      }
      buffer.write("  [");
      for (var i = 0; i < parts.length; i++) {
        if (i > 0) buffer.write(", ");
        writer.start(0);
        parts[i].forEach(writer.add);
        writer.end();
      }
      buffer.writeln("],");
    }
    buffer.writeln("];");
  }
  {
    buffer
      ..writeln("// Emoji tests.")
      ..writeln("const List<List<String>> emojis = [");
    // Emojis
    var emojis = texts[1];
    var lineRE = RegExp(r"^([ \dA-F]*?);", multiLine: true);
    var tokensRE = RegExp(r"[\dA-F]+");
    var writer = StringLiteralWriter(buffer, lineLength: 9999, escape: _escape);
    for (var line in lineRE.allMatches(emojis)) {
      buffer.write("  [");
      writer.start();
      for (var token in tokensRE.allMatches(line[1]!)) {
        var value = int.parse(token[0]!, radix: 16);
        writer.add(value);
      }
      writer.end();
      buffer.writeln("],");
    }
    buffer.writeln("];");
  }
  if (dryrun || output == null) {
    stdout.write(buffer);
  } else {
    if (verbose) {
      stderr.writeln("Writing ${output.path}");
    }
    output.writeAsStringSync(buffer.toString());
  }
}

bool _escape(int cp) => cp > 0xff || cp & 0x60 == 0 || cp == 0x7f;
