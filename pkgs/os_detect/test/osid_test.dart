// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "dart:async";

import "package:os_detect/os_detect.dart";
import 'package:os_detect/override.dart';
import "package:test/test.dart";

void main() {
  test("Exists and is consistent", () {
    expect(operatingSystem, isNotNull);
    expect(operatingSystemVersion, isNotNull);

    expect(isLinux, operatingSystem == "linux");
    expect(isAndroid, operatingSystem == "android");
    expect(isMacOS, operatingSystem == "macos");
    expect(isWindows, operatingSystem == "windows");
    expect(isIOS, operatingSystem == "ios");
    expect(isFuchsia, operatingSystem == "fuchsia");
    expect(isBrowser, operatingSystem == "browser");
  });

  test("Override", () {
    const overrideName = "argle-bargle";
    const overrideVersion = "glop-glyf";
    const overrideOS = OperatingSystem(overrideName, overrideVersion);
    Zone? overrideZone;

    var originalName = operatingSystem;
    var originalVersion = operatingSystemVersion;
    var originalID = OperatingSystem.current;
    var originalZone = Zone.current;
    expect(originalName, isNot(overrideName));
    expect(originalVersion, isNot(overrideVersion));

    // Override OS ID.
    overrideOperatingSystem(overrideOS, () {
      overrideZone = Zone.current;
      expect(operatingSystem, overrideName);
      expect(operatingSystemVersion, overrideVersion);
      expect(OperatingSystem.current, same(overrideOS));
      // Nested override.
      overrideOperatingSystem(originalID, () {
        expect(operatingSystem, originalName);
        expect(operatingSystemVersion, originalVersion);
        expect(OperatingSystem.current, same(originalID));
      });
      expect(operatingSystem, overrideName);
      expect(operatingSystemVersion, overrideVersion);
      expect(OperatingSystem.current, same(overrideOS));
      // Captured parent zone does not have override.
      originalZone.run(() {
        expect(operatingSystem, originalName);
        expect(operatingSystemVersion, originalVersion);
      });
      expect(operatingSystem, overrideName);
      expect(operatingSystemVersion, overrideVersion);
      expect(OperatingSystem.current, same(overrideOS));
    });

    expect(operatingSystem, originalName);
    expect(operatingSystemVersion, originalVersion);

    // A captured override zone retains the override.
    overrideZone!.run(() {
      expect(operatingSystem, overrideName);
      expect(operatingSystemVersion, overrideVersion);
      expect(OperatingSystem.current, same(overrideOS));
    });
  });
}
