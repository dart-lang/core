// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io' show File, exit, stderr;

import 'bin/generate_tables.dart' show generateTables, tableFile;
import 'bin/generate_tests.dart' show generateTests, testFile;
import 'src/args.dart';
import 'src/data_files.dart';
import 'src/grapheme_category_loader.dart';
import 'src/shared.dart';

/// Generates both tests and tables.
///
/// Use this tool for updates, and only access `bin/generate_tables.dart` and
/// `bin/generate_tests.dart` directly during development of those files.
void main(List<String> args) async {
  var flags =
      parseArgs(args, 'generate', allowOptimize: true, allowFile: false);
  if (flags.update && !await checkLicense(flags.acceptLicenseChange)) {
    stderr.writeln('EXITING');
    exit(1);
  }

  var (categories, graphemeTests, emojiTests) = await (
    loadCategories(update: flags.update, verbose: flags.verbose),
    graphemeTestData.load(checkForUpdate: flags.update),
    emojiData.load(checkForUpdate: flags.update),
  ).wait;

  generateTables(File(path(packageRoot, tableFile)), categories,
      optimize: flags.optimize, dryrun: flags.dryrun, verbose: flags.verbose);

  generateTests(File(path(packageRoot, testFile)), [graphemeTests, emojiTests],
      categories,
      dryrun: flags.dryrun, verbose: flags.verbose);

  if (flags.update && !flags.dryrun) {
    var version = guessVersion(await graphemeBreakPropertyData.contents);
    updateReadmeVersion(version);
  }
}

// -----------------------------------------------------------------------------
// Unicode version number.

String? guessVersion(String dataFile) {
  // If first line has format:
  //
  // # GraphemeBreakProperty-16.0.0.txt
  //
  // Then use 16.0.0 as version number.
  var match = RegExp(r'# \w+-(\d+\.\d+\.\d+)\.txt').matchAsPrefix(dataFile);
  return match?[1];
}

void updateReadmeVersion(String? version) {
  var readmeFile = File(packagePath('README.md'));
  var contents = readmeFile.readAsStringSync();
  String replacementText;
  if (version != null) {
    replacementText = 'version $version';
  } else {
    var now = DateTime.timestamp();
    replacementText = 'of ${now.year}-${lz(now.month)}-${lz(now.day)}';
  }
  const startTag = '<!-- unicode-version -->';
  const endTag = '<!-- /unicode-version -->';
  var versionRE = RegExp('(?<=$startTag).*?(?=$endTag)');
  var newContents = contents.replaceFirst(versionRE, replacementText);
  if (contents != newContents) {
    readmeFile.writeAsStringSync(newContents);
  } else if (versionRE.firstMatch(contents) == null) {
    stderr.writeln('MISSING VERSION TAGS IN README.md');
  }
}
