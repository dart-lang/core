// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Verifies the data-driven fixes declared in `lib/fix_data.yaml` against the
// golden files in `test_fixes/`. See `test_fixes/README.md`.
@TestOn('vm')
library;

import 'dart:io';

import 'package:cli_util/cli_util.dart';
import 'package:test/test.dart';

/// The lowest SDK version that the golden files can be resolved on.
///
/// `test_fixes/` depends on `package:platform` 3.2, which requires Dart 3.10.
const _minimumSdk = (major: 3, minor: 10);

void main() {
  final testFixes = Directory('test_fixes');

  test('fix_data.yaml matches the golden files in test_fixes/', () async {
    final dart = dartExecutable;
    if (dart == null) {
      fail('Could not locate a Dart executable.');
    }

    final pubGet = await Process.run(dart, const [
      'pub',
      'get',
    ], workingDirectory: testFixes.path);
    expect(
      pubGet.exitCode,
      0,
      reason: 'Failed to resolve test_fixes/:\n${pubGet.stderr}',
    );

    final result = await Process.run(dart, const [
      'fix',
      '--compare-to-golden',
    ], workingDirectory: testFixes.path);

    printOnFailure('${result.stdout}\n${result.stderr}');
    expect(
      result.exitCode,
      0,
      reason:
          'Golden files are out of date. Update lib/fix_data.yaml or '
          'regenerate test_fixes/*.expect; see test_fixes/README.md.',
    );
  }, skip: _skipReason(testFixes));
}

/// Why the golden comparison cannot run here, or `null` if it can.
String? _skipReason(Directory testFixes) {
  if (!testFixes.existsSync()) {
    return 'Must be run from the package root; ${testFixes.path} not found.';
  }
  final semVerPattern = RegExp(r'^(\d+)\.(\d+)\.');
  if (semVerPattern.firstMatch(Platform.version) case final match?) {
    final major = int.parse(match[1]!);
    final minor = int.parse(match[2]!);
    if (major > _minimumSdk.major ||
        (major == _minimumSdk.major && minor >= _minimumSdk.minor)) {
      return null;
    }
    return 'Requires Dart ${_minimumSdk.major}.${_minimumSdk.minor} or later; '
        'running ${Platform.version}.';
  }
  return 'Platform.version is not a valid SemVer version: ${Platform.version}';
}
