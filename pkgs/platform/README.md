[![Pub](https://img.shields.io/pub/v/platform.svg)](https://pub.dev/packages/platform)

A generic platform abstraction for Dart.

### Cross-platform platform API
Provides access to platform specific information of the current runtime platform
through a cross-platform API.

On a native platform, the `NativePlatform` class in this package provides a
lightweight wrapper around the static `Platform` properties of `dart:io`,
with the same rich, Dart-idiomatic API for querying the current runtime.

On the web, there is no `NativePlatform` object, and cross-platform client code
can avoid dependencies on such properties simply by checking if
`Platform.current.nativePlatform` is `null`.
Instead web code has a `Platform.current.browserPlatform` values that is
a non-`null` `BrowserPlatform`.

Example:
```dart
import 'package:platform/platform.dart';

void main() {
  switch (Platform.current) {
    case Platform(:var nativePlatform?):
      // `nativePlatform` has `dart:io`'s `Platform` properties.
      print(
        'Running on ${nativePlatform.operatingSystem} v.'
        '${nativePlatform.operatingSystemVersion}',
      );
    case Platform(:var browserPlatform?):
      // `browserPlatform` has version information from `windows.userAgent`.
      print('Running on ${browserPlatform.userAgent}');
  }
}
```

### Code size

Using platform-specific properties like `Platform.isLinux` as branch conditions
will allow a production compiler to completely omit the branch
that it knows it's not currently compiling for.

### Testing and Mocking

In tests, the `package:platform/testing.dart` library provides ways to mock
platform objects with custom tailored configurations,
and allows `Zone` based overriding of the `Platform.current` value.
> [!NOTE]
> The testing library should only be used in tests, since its mere presence
> may affect how much code a compiled program will retain.
