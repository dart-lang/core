## 1.1.0-nullsafety.5

* Update sdk constraints to `>=2.12.0-0 <3.0.0` based on beta release
  guidelines.

## 1.1.0-nullsafety.4

* Allow the 2.12 dev SDKs.

## 1.1.0-nullsafety.3

* Added `stringBeforeLength` and `stringAfterLength` to `CharacterRange`.
* Added `CharacterRange.at` constructor.
* Added `getRange(start, end)` and `characterAt(pos)` to `Characters`
  as alternative to `.take(end).skip(start)` and `getRange(pos, pos + 1)`.
* Change some positional parameter names from `other` to `characters`.
* Allow the 2.10 stable SDK.

## 1.1.0-nullsafety.2

* Update for the 2.10 dev sdk.

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
