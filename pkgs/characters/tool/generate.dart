// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "dart:io" show File, exit;

import "bin/generate_tables.dart" show generateTables, tableFile;
import "bin/generate_tests.dart" show generateTests, testFile;
import "src/args.dart";
import "src/shared.dart";

/// Generates both tests and tables.
///
/// Use this tool for updates, and only access `bin/generate_tables.dart` and
/// `bin/generate_tests.dart` directly during development of those files.
void main(List<String> args) async {
  var flags =
      parseArgs(args, "generate", allowOptimize: true, allowFile: false);
  if (flags.update && !await checkLicense(flags.acceptLicenseChange)) {
    print("EXITING");
    exit(1);
  }

  await generateTables(File(path(packageRoot, tableFile)),
      optimize: flags.optimize,
      update: flags.update,
      dryrun: flags.dryrun,
      verbose: flags.verbose);

  await generateTests(File(path(packageRoot, testFile)),
      update: flags.update, dryrun: flags.dryrun, verbose: flags.verbose);
}
