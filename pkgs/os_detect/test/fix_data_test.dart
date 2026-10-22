// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Verifies the data-driven fixes declared in `lib/fix_data.yaml` against the
// golden files in `test_fixes/`. See `test_fixes/README.md`.
@TestOn('vm')
library;

import 'dart:io';

import 'package:test/test.dart';

/// The lowest SDK the golden files can be resolved on.
///
/// `test_fixes/` depends on `package:platform` 3.2, which requires Dart 3.10.
const _minimumSdk = (major: 3, minor: 10);

void main() {
  final testFixes = Directory('test_fixes');

  test('fix_data.yaml matches the golden files in test_fixes/', () async {
    final pubGet = await Process.run(
        Platform.resolvedExecutable,
        const [
          'pub',
          'get',
        ],
        workingDirectory: testFixes.path);
    expect(
      pubGet.exitCode,
      0,
      reason: 'Failed to resolve test_fixes/:\n${pubGet.stderr}',
    );

    final result = await Process.run(
        Platform.resolvedExecutable,
        const [
          'fix',
          '--compare-to-golden',
        ],
        workingDirectory: testFixes.path);

    printOnFailure('${result.stdout}\n${result.stderr}');
    expect(
      result.exitCode,
      0,
      reason: 'Golden files are out of date. Update lib/fix_data.yaml or '
          'regenerate test_fixes/*.expect; see test_fixes/README.md.',
    );
  }, skip: _skipReason(testFixes));
}

/// Why the golden comparison cannot run here, or `null` if it can.
String? _skipReason(Directory testFixes) {
  if (!testFixes.existsSync()) {
    return 'Must be run from the package root; ${testFixes.path} not found.';
  }
  final version = Platform.version.split(' ').first.split('.');
  final major = int.tryParse(version.first) ?? 0;
  final minor = version.length > 1 ? int.tryParse(version[1]) ?? 0 : 0;
  if (major < _minimumSdk.major ||
      (major == _minimumSdk.major && minor < _minimumSdk.minor)) {
    return 'Requires Dart ${_minimumSdk.major}.${_minimumSdk.minor} or later; '
        'running ${Platform.version}.';
  }
  return null;
}
