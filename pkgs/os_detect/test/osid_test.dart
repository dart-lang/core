// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "dart:async";

import "package:os_id/os_id.dart";
import 'package:os_id/override.dart';

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
    const overrideID = OperatingSystemID(overrideName, overrideVersion);
    Zone/*?*/ overrideZone;

    var originalName = operatingSystem;
    var originalVersion = operatingSystemVersion;
    var originalID = OperatingSystemID.current;
    var originalZone = Zone.current;
    expect(originalName, isNot(overrideName));
    expect(originalVersion, isNot(overrideVersion));


    // Override OS ID.
    overrideOperatingSystem(overrideID, () {
      overrideZone = Zone.current;
      expect(operatingSystem, overrideName);
      expect(operatingSystemVersion, overrideVersion);
      expect(OperatingSystemID.current, same(overrideID));
      // Nested override.
      overrideOperatingSystem(originalID, () {
        expect(operatingSystem, originalName);
        expect(operatingSystemVersion, originalVersion);
        expect(OperatingSystemID.current, same(originalID));
      });
      expect(operatingSystem, overrideName);
      expect(operatingSystemVersion, overrideVersion);
      expect(OperatingSystemID.current, same(overrideID));
      // Captured parent zone does not have override.
      originalZone.run(() {
        expect(operatingSystem, originalName);
        expect(operatingSystemVersion, originalVersion);
      });
      expect(operatingSystem, overrideName);
      expect(operatingSystemVersion, overrideVersion);
      expect(OperatingSystemID.current, same(overrideID));
    });

    expect(operatingSystem, originalName);
    expect(operatingSystemVersion, originalVersion);

    // A captured override zone retains the override.
    overrideZone/*!*/.run(() {
      expect(operatingSystem, overrideName);
      expect(operatingSystemVersion, overrideVersion);
      expect(OperatingSystemID.current, same(overrideID));
    });
  });
}
