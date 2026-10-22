[![Dart CI](https://github.com/dart-lang/core/actions/workflows/convert.yaml/badge.svg)](https://github.com/dart-lang/core/actions/workflows/convert.yaml)
[![pub package](https://img.shields.io/pub/v/convert.svg)](https://pub.dev/packages/convert)
[![package publisher](https://img.shields.io/pub/publisher/convert.svg)](https://pub.dev/packages/convert/publisher)

Contains encoders and decoders for converting between different
data representations. It's the external counterpart of the
[`dart:convert`](https://api.dart.dev/dart-convert/dart-convert-library.html)
SDK library, and contains less-central APIs and APIs that need more flexible
versioning.

## Hexadecimal

The `hex` codec converts lists of bytes to and from hexadecimal strings,
following [the Base16 spec](https://datatracker.ietf.org/doc/html/rfc4648#section-8).

```dart
import 'package:convert/convert.dart';

void main() {
  final bytes = [0, 1, 2, 3, 255];

  // Encode bytes to a hex string.
  final encoded = hex.encode(bytes);
  print(encoded); // 00010203ff

  // Decode a hex string back to bytes.
  final decoded = hex.decode(encoded);
  print(decoded); // [0, 1, 2, 3, 255]
}
```

## Percent (URL) encoding

The `percent` codec converts lists of bytes to and from percent-encoded (also
known as URL-encoded) strings according to
[RFC 3986](https://datatracker.ietf.org/doc/html/rfc3986#section-2.1).

```dart
import 'dart:convert';
import 'package:convert/convert.dart';

void main() {
  final bytes = utf8.encode('hello world!');

  // Encode bytes to a percent-encoded string.
  final encoded = percent.encode(bytes);
  print(encoded); // hello%20world%21

  // Decode a percent-encoded string back to bytes.
  final decoded = percent.decode(encoded);
  print(utf8.decode(decoded)); // hello world!
}
```

## FixedDateTimeFormatter

`FixedDateTimeFormatter` formats and parses `DateTime` values using a simple,
fixed-length pattern where each format character represents a single digit.

```dart
import 'package:convert/convert.dart';

void main() {
  final formatter = FixedDateTimeFormatter('YYYYMMDDhhmmss');

  // Encode a DateTime into a string.
  final encoded = formatter.encode(DateTime.utc(1996, 4, 25, 5, 3, 22));
  print(encoded); // 19960425050322

  // Decode a string into a DateTime (returns UTC by default).
  final dateTime = formatter.decode(encoded);
  print(dateTime); // 1996-04-25 05:03:22.000Z
}
```
