// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Check that test platforms can be created for any platform.

import 'package:platform/testing.dart';
import 'package:test/test.dart';

void main() {
  test('Test native platform', () {
    final currentNative = NativePlatform.current;
    final testNative = TestNativePlatform(operatingSystem: 'banana');
    testNative.run(() {
      expect(NativePlatform.current, isNot(same(currentNative)));
      expect(NativePlatform.current, same(testNative));
      expect(Platform.current.nativePlatform, same(testNative));
      expect(NativePlatform.current?.operatingSystem, 'banana');
    });
  });

  test('Test browser platform', () {
    final currentBrowser = BrowserPlatform.current;
    final testBrowser = TestBrowserPlatform(version: 'banana');
    testBrowser.run(() {
      expect(BrowserPlatform.current, isNot(same(currentBrowser)));
      expect(BrowserPlatform.current, same(testBrowser));
      expect(Platform.current.browserPlatform, same(testBrowser));
      expect(BrowserPlatform.current?.version, 'banana');
    });
  });
}
