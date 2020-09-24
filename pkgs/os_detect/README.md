[![Build Status](https://travis-ci.org/lrhn/os_id.svg?branch=master)](https://travis-ci.org/lrhn/os_id)

Platform independent access to information about the current operating system.

## Querying the current OS

Exposes `operatingSystem` and `operatingSystemVersion` strings
similar to those of the `Platform` class in `dart:io`,
but also works on the web.
The `operatingSystem` of a browser is the string "browser".
Also exposes convenience getters like `isLinux`, `isAndroid` and `isBrowser`
based on the `operatingSystem` string.

To use this package instead of `dart:io`, replace
the import of `dart:io` with:
```dart
import "package:os_id/os_id.dart" as Platform;
```
That should keep the code working if the only functionality used from `dart:io`
is operating system detection.
You should then use your IDE to rename the import prefix from `Platform`
to something lower-cased which follows the style guide for import prefixes.

Any new platform which supports neither `dart:io` nor `dart:html`
can make itself recognizable by configuring
the `dart.os.name` and `dart.os.version` environment settings,
so that `const String.fromEnvironment` can access them.

## Overriding the current OS string

It's possible to override the current operating system string,
as exposed by `operatingSystem` and `operatingSystemVersion`
in `package:os_id/os_id.dart`.
To do so, import the `package:os_id/override.dart` library
and use the `overrideOperatingSystem` function to run code in a zone
where the operating system and version values are set
to whatever values are desired.

The class `OperatingSystemID` can also be used directly to
abstract over the operating system name and version.
The `OperatingSystemID.current` defaults to the values provided by the platform
when not overridden using `overrideOperatingSystem`.
