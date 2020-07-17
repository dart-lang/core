## 1.1.0-nullsafety.1

* Allow the <=2.9.10 stable sdks.

## 1.1.0-nullsafety

* Make package null safe.

## 1.0.0

* Core APIs deemed stable; package version set to 1.0.0.
* Added `split` methods on `Characters` and `CharacterRange`.

## 0.5.0

* Change [codeUnits] getter to [utf16CodeUnits] which returns an iterable.
  This avoids leaking that the underlying string has efficient UTF-16
  code unit access in the API, and allows the same interface to be
  just as efficiently implemented on top of UTF-8.

## 0.4.0

* Added an extension method on `String` to allow easy access to the `Characters`
  of the string:

  ```dart
  print('The first character is: ' + myString.characters.first)
  ```

* Updated Dart SDK dependency to Dart 2.6.0

## 0.3.1

* Added small example in `example/main.dart`
* Enabled pedantic lints and updated code to resolve issues.

## 0.3.0

* Updated API which does not expose the underlying string indices.

## 0.1.0

* Initial release
