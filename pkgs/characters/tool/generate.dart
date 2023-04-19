// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "dart:io" show File;

import "bin/gentable.dart" show generateTables, tableFile;
import "bin/gentest.dart" show generateTests, testFile;
import "src/args.dart";
import "src/shared.dart";

/// Generates both tests and tables.
///
/// Use this tool for updates, and `bin/gentable.dart` and `bin/gentest.dart`
/// mainly during development.
void main(List<String> args) async {
  var flags =
      parseArgs(args, "generate", allowOptimize: true, allowFile: false);
  await generateTables(File(path(packageRoot, tableFile)),
      optimize: flags.optimize,
      update: flags.update,
      dryrun: flags.dryrun,
      verbose: flags.verbose);
  await generateTests(File(path(packageRoot, testFile)),
      update: flags.update, dryrun: flags.dryrun, verbose: flags.verbose);
}
