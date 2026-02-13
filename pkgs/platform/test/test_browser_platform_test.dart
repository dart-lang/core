// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@OnPlatform({'!browser': Skip('Browser-only functionality')})
library;

import 'dart:convert' show jsonDecode, jsonEncode;

import 'package:platform/src/util/json_keys.dart' as json_key;
import 'package:platform/testing.dart';
import 'package:test/test.dart';

void main() {
  const testPlatformUA = 'Test UserAgent';
  const testPlatformVersion = 'Test Version';

  final original = BrowserPlatform.current;

  test('Is compiled on browser', () {
    expect(original, isNotNull);
    expect(Platform.current.browserPlatform, same(original));
  });

  if (original == null) return; // Promote to non-null from here.

  group('TestBrowserPlatform', () {
    group('fromPlatform', () {
      test('copiesAllProperties', () {
        var testPlatform = TestBrowserPlatform.fromPlatform(original);
        testBrowser(
          testPlatform,
          jsonDecode(original.toJson()) as Map<String, Object?>,
        );
      });
    });

    group('copyWith', () {
      test('overrides a value, but leaves others intact', () {
        var expected = jsonDecode(original.toJson()) as Map<String, Object?>;
        var testPlatform = TestBrowserPlatform.fromPlatform(original);

        BrowserPlatform copy = testPlatform.copyWith(version: '42.0');
        expected[json_key.version] = '42.0';
        testBrowser(copy, expected);
      });
      test('can override all values', () {
        var testPlatform = TestBrowserPlatform.fromPlatform(original);
        var expected = <String, Object?>{
          json_key.userAgent: testPlatformUA,
          json_key.version: testPlatformVersion,
        };
        var copy = testPlatform.copyWith(
          userAgent: expected[json_key.userAgent] as String?,
          version: expected[json_key.version] as String?,
        );
        testBrowser(copy, expected);
      });
    });

    group('json', () {
      test('fromJson', () {
        var json = <String, Object?>{
          json_key.userAgent: testPlatformUA,
          json_key.version: testPlatformVersion,
        };
        var jsonText = jsonEncode(json);
        var testPlatform = TestBrowserPlatform.fromJson(jsonText);
        testBrowser(testPlatform, json);
        // Compare toJson.
        expect(jsonDecode(testPlatform.toJson()), json);
      });

      test('fromEmptyJson', () {
        var testPlatform = TestBrowserPlatform.fromJson('{}');
        testBrowser(testPlatform, {});
      });

      test('fromNullJson', () {
        // Explicit null values are allowed in the JSON, treated as unset value.
        var allNulls = <String, Object?>{
          json_key.userAgent: null,
          json_key.version: null,
        };
        var testPlatform = TestBrowserPlatform.fromJson(jsonEncode(allNulls));
        testBrowser(testPlatform, {});
        expect(testPlatform.toJson(), '{}');
      });

      test('fromJsonToJson', () {
        var current = original;
        var jsonText = current.toJson();
        var json = jsonDecode(jsonText) as Map<String, Object?>;
        var testPlatform = TestBrowserPlatform.fromJson(jsonText);
        testBrowser(testPlatform, json);
        expect(jsonDecode(testPlatform.toJson()), json);
      });

      test('fromJsonErrors', () {
        void fromJsonError(String source) {
          expect(
            () => TestBrowserPlatform.fromJson(source),
            throwsFormatException,
          );
        }

        // Not valid JSON at all.
        fromJsonError('not-JSON!');

        // Not a map at top-level.
        fromJsonError('"a"');
        fromJsonError('[]');

        // These properties must be strings or null.
        for (var name in [json_key.userAgent, json_key.version]) {
          fromJsonError('{"$name": 42}');
          fromJsonError('{"$name": ["not a string"]}');
          fromJsonError('{"$name": {"not" : "a string"}}');
        }
      });
    });

    test('Throws when unset non-null values are read', () {
      final platform = TestBrowserPlatform();
      // Sanity check, in case `testBrowser` was bugged.
      expect(() => platform.userAgent, throwsA(isStateError));
      expect(() => platform.version, throwsA(isStateError));
    });
  });

  group('runtime override', () {
    test('sync', () {
      var testPlatform = TestBrowserPlatform.fromPlatform(
        original,
      ).copyWith(userAgent: testPlatformUA);
      expect(testPlatform.userAgent, testPlatformUA);
      testPlatform.run(() {
        expect(BrowserPlatform.current, same(testPlatform));
        expect(Platform.current.browserPlatform, same(testPlatform));
        expect(BrowserPlatform.current?.userAgent, testPlatformUA);
        expect(BrowserPlatform.current?.version, original.version);
      });
    });
    test('async', () async {
      var currentNative = original;
      var testPlatform = TestBrowserPlatform.fromPlatform(
        currentNative,
      ).copyWith(userAgent: testPlatformUA);
      var parts = 0;
      var asyncTesting = testPlatform.run(() async {
        // Runs synchronously.
        expect(BrowserPlatform.current, same(testPlatform));
        expect(Platform.current.browserPlatform, same(testPlatform));
        expect(BrowserPlatform.current?.userAgent, testPlatformUA);
        parts++;
        await Future(() {}); // Timer-delay.
        // Test platform is still current after async gap.
        expect(BrowserPlatform.current, same(testPlatform));
        expect(Platform.current.browserPlatform, same(testPlatform));
        expect(BrowserPlatform.current?.userAgent, testPlatformUA);
        parts++;
      });
      expect(parts, 1);
      expect(BrowserPlatform.current, same(original));
      expect(Platform.current.browserPlatform, same(original));
      expect(BrowserPlatform.current?.userAgent, original.userAgent);
      await asyncTesting;
      expect(parts, 2);
    });
  });
  group('nested overrides', () {
    final testPlatformNative = TestBrowserPlatform.fromPlatform(
      original,
    ).copyWith(userAgent: testPlatformUA);
    final testPlatformNative2 = TestBrowserPlatform.fromPlatform(
      testPlatformNative,
    ).copyWith(version: testPlatformVersion);
    test('sync', () {
      testPlatformNative.run(() {
        expect(BrowserPlatform.current, same(testPlatformNative));
        expect(Platform.current.browserPlatform, same(testPlatformNative));
        expect(BrowserPlatform.current?.userAgent, testPlatformUA);
        expect(BrowserPlatform.current?.version, original.version);
        testPlatformNative2.run(() {
          expect(BrowserPlatform.current, same(testPlatformNative2));
          expect(Platform.current.browserPlatform, same(testPlatformNative2));
          expect(BrowserPlatform.current?.userAgent, testPlatformUA);
          expect(BrowserPlatform.current?.version, testPlatformVersion);
        });
        // Previous override restored when done.
        expect(BrowserPlatform.current, same(testPlatformNative));
        expect(Platform.current.browserPlatform, same(testPlatformNative));
        expect(BrowserPlatform.current?.userAgent, testPlatformUA);
        expect(BrowserPlatform.current?.version, original.version);
      });
    });
    test('async', () async {
      await testPlatformNative.run(() async {
        expect(BrowserPlatform.current, same(testPlatformNative));
        expect(Platform.current.browserPlatform, same(testPlatformNative));
        expect(BrowserPlatform.current?.userAgent, testPlatformUA);
        expect(BrowserPlatform.current?.version, original.version);
        var parts = 0;
        var asyncTesting = testPlatformNative2.run(() async {
          expect(BrowserPlatform.current, same(testPlatformNative2));
          expect(Platform.current.browserPlatform, same(testPlatformNative2));
          expect(BrowserPlatform.current?.userAgent, testPlatformUA);
          expect(BrowserPlatform.current?.version, testPlatformVersion);
          parts++;
          await Future(() {});
          expect(BrowserPlatform.current, same(testPlatformNative2));
          expect(Platform.current.browserPlatform, same(testPlatformNative2));
          expect(BrowserPlatform.current?.userAgent, testPlatformUA);
          expect(BrowserPlatform.current?.version, testPlatformVersion);
          parts++;
        });
        expect(parts, 1);
        // Previous override restored when done.
        expect(BrowserPlatform.current, same(testPlatformNative));
        expect(Platform.current.browserPlatform, same(testPlatformNative));
        expect(BrowserPlatform.current?.userAgent, testPlatformUA);
        expect(BrowserPlatform.current?.version, original.version);
        await asyncTesting;
        expect(parts, 2);
      });
    });
  });
}

/// Checks that the operation `read()` throws if `expected` is `null`,
/// and otherwise it returns a value equal to `expected`.
void _testProperty(Object? Function() read, Object? expected) {
  if (expected == null) {
    expect(read, throwsStateError);
  } else {
    expect(read(), expected);
  }
}

/// Check the properties of a [BrowserPlatform].
///
/// The [expectedValues] is uses the same format as JSON serialization of a
/// [BrowserPlatform].
///
/// If any of the expected values arguments are `null`, reading the
/// corresponding property is expected to throw a `StateError`
/// (except for `NativePackage.packageConfig` which is nullable).
/// If the operating system value is `null`, all the  `isAndroid`..`isWindows`
/// are expected to throw too.
/// Otherwise they are tested to give the expected true/false value
/// for the expected operating system.
void testBrowser(BrowserPlatform actual, Map<String, Object?> expectedValues) {
  _testProperty(() => actual.userAgent, expectedValues[json_key.userAgent]);
  _testProperty(() => actual.version, expectedValues[json_key.version]);
}
