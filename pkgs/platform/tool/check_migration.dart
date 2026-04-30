#! /bin/env dart
// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Internal test script for checking that the `fix_data.yaml` works.
///
/// Run this script as
/// ```console
/// dart check_migration.dart
/// ```
/// or
/// ```console
/// dart tool/check_migration.dart
/// ```
/// from the package root directory.
///
/// *MUST* be run with the `dart` executable.
/// The script uses `Platform.executable` from `dart:io` to run `dart analyze`
/// and `dart fix`.
///
/// It will copy `../tool/src/sample/legacy_example_code*.dart` to
/// a temporary directory (`../tmp/`), remove the `// ignore_for_file`
/// lines guarding deprecated uses, and run `dart fix` on the code.
/// It will then run `dart analyze` to see if there are any deprecated
/// uses left.
///
/// Accepts the following flags (mainly useful while debugging the script
/// or package):
/// * `-R`: Retain the post-`dart fix` files.
/// * `-r`: Retain the post-`dart fix` files if `dart fix` did not remove
///         all warnings.
///         Otherwise the files are deleted before exiting.
/// * `-v`: Increase verbosity of output while running the script.
library;

import 'dart:io';

import 'src/dart_sdk.dart';
import 'src/path.dart' as path;

int verbose = 0;

void main(List<String> args) {
  // Keep the files after running, always or only if not successful.
  var retain = false;
  var retainOnError = false;
  for (var arg in args) {
    if (arg == '-r') {
      retainOnError = true;
    } else if (arg == '-R') {
      retain = retainOnError = true;
    } else if (arg == '-v') {
      verbose++;
    } else {
      stderr.writeln('Unexpected argument: $arg');
    }
  }

  // Try to detect whether this script was run by the `dart` CLI.
  //
  // Currently it assumes so if the executable exists and is named `dart`
  // or `dart.exe`.
  var dartExe = findDartExe();
  if (dartExe == null) {
    stderr.writeln('Must be run with the Dart CLI executable.');
    exit(1);
  }

  var selfPath = File.fromUri(Platform.script).path;
  // Put samples in `test/` to avoid warnings about `@visibleForTesting`.
  var migrationTestDir = Directory(
    path.join(path.parentDirectory(selfPath), 'out', 'test', 'migration_test'),
  );
  migrationTestDir.createSync(recursive: true);

  var sourceFileDir = path.join(path.dirname(selfPath), 'src', 'sample');
  for (var sourceFile in Directory(sourceFileDir).listSync()) {
    var sourceFilePath = sourceFile.path;
    if (sourceFile is! File ||
        !sourceFilePath.endsWith('dart') ||
        !sourceFilePath.contains('example_code')) {
      continue;
    }
    var fileName = path.basename(sourceFilePath);
    var content = sourceFile.readAsStringSync();
    content = content.replaceFirst(
      ' ignore_for_file: deprecated_member_use_from_same_package',
      '',
    );
    var testFile = File(path.join(migrationTestDir.path, fileName));
    testFile.writeAsStringSync(content);
    // Run `dart fix` on file.
    if (verbose > 0) {
      stdout.writeln('Running: dart fix --apply ${testFile.path}');
    }
    var dartFixResult = run(dartExe, ['fix', '--apply', testFile.path]);
    if (dartFixResult.exitCode != 0) {
      stderr.writeln(
        'FAILED($dartFixResult.exitCode):'
        'dart fix --apply ${testFile.path}',
      );
      printProcessOutput(dartFixResult);
      if (!retainOnError) {
        migrationTestDir.deleteSync(recursive: true);
      }
      exit(1);
    }
    stderr.writeln(dartFixResult.stdout);

    if (verbose > 0) {
      stdout.writeln('Running: dart analyze ${testFile.path}');
    }
    var dartAnalyzeResult = run(dartExe, ['analyze', testFile.path]);
    stdout.writeln(dartAnalyzeResult.stdout);
    // TODO: Maybe, if verbose, and `/bin/diff` exists, print the diff after
    // fixing.
  }

  if (!retain) {
    if (verbose > 1) {
      stderr.writeln('Deleting directory: ${migrationTestDir.path}');
    }
    migrationTestDir.deleteSync(recursive: true);
  }
}
