// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:platform/testing.dart';
import 'package:test/test.dart';

import 'readme_cross_platform.dart' as cross_platform_example;
import 'readme_native.dart' as native_example;

List<String> _capturePrints(void Function() body) {
  final lines = <String>[];
  runZoned(
    body,
    zoneSpecification: ZoneSpecification(
      print: (self, parent, zone, line) => lines.add(line),
    ),
  );
  return lines;
}

void main() {
  final mockNative = TestNativePlatform(
    operatingSystem: NativePlatform.linux,
    operatingSystemVersion: '6.1.0',
  );
  final mockBrowser = TestBrowserPlatform(userAgent: 'TestBrowser/1.0');

  test('native README example prints host OS or non-native error', () {
    expect(mockNative.run(() => _capturePrints(native_example.main)), [
      'Running on linux 6.1.0',
    ]);
    expect(mockBrowser.run(() => _capturePrints(native_example.main)), [
      'Error: not running on a native platform!',
    ]);
  });

  test('cross-platform README example switches on native vs browser', () {
    expect(mockNative.run(() => _capturePrints(cross_platform_example.main)), [
      'Running on linux v.6.1.0',
    ]);
    expect(mockBrowser.run(() => _capturePrints(cross_platform_example.main)), [
      'Running on TestBrowser/1.0',
    ]);
  });
}
