// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Shared constants and classes used to represent a recongized OS type
///
/// Not exported in the public API, but used to communicate between
/// `override.dart` and the conditionally imported `osid_X.dart` files.
///
/// When the platform is statically known, all but one of the subclasses
/// should be tree-shaken, so an `os is AndroidOS` can be resolved to
/// a constant true/false depending on whether the class is the retained one
/// or not.
library;

/// Operating identity object.
///
/// By only instantiating these subtypes guarded by target-OS guarded
/// checks, unless using the "for testing" `OperatingSystem` constructor,
/// all but one of the subclasses should be tree-shaken,
/// and, e.g., the `_isId is IOS` test above should become tree-shakable
/// on all other platforms.
sealed class RecognizedOS {
  // The recognized OS identifier strings recognized.
  static const androidId = 'android';
  static const browserId = 'browser';
  static const fuchsiaId = 'fuchsia';
  static const iOSId = 'ios';
  static const linuxId = 'linux';
  static const macOSId = 'macos';
  static const windowsId = 'windows';

  abstract final String id;
  const RecognizedOS();
}

/// Operations system object for Android.
class AndroidOS extends RecognizedOS {
  @override
  final String id = RecognizedOS.androidId;
  const AndroidOS();
}

/// Operations system object for browsers.
class BrowserOS extends RecognizedOS {
  @override
  final String id = RecognizedOS.browserId;
  const BrowserOS();
}

/// Operations system object for Fuchsia.
class FuchsiaOS extends RecognizedOS {
  @override
  final String id = RecognizedOS.fuchsiaId;
  const FuchsiaOS();
}

/// Operations system object for iOS.
class IOS extends RecognizedOS {
  @override
  final String id = RecognizedOS.iOSId;
  const IOS();
}

/// Operations system object for Linux.
class LinuxOS extends RecognizedOS {
  @override
  final String id = RecognizedOS.linuxId;
  const LinuxOS();
}

/// Operations system object for MacOS.
class MacOS extends RecognizedOS {
  @override
  final String id = RecognizedOS.macOSId;
  const MacOS();
}

/// Operations system object for Windows.
class WindowsOS extends RecognizedOS {
  @override
  final String id = RecognizedOS.windowsId;
  const WindowsOS();
}

/// Fallback to represent unknown operating system.
///
/// Do not use for one of the recognized operating
/// systems
class UnknownOS extends RecognizedOS {
  @override
  final String id;
  const UnknownOS(this.id)
      : assert(id != RecognizedOS.linuxId),
        assert(id != RecognizedOS.macOSId),
        assert(id != RecognizedOS.windowsId),
        assert(id != RecognizedOS.androidId),
        assert(id != RecognizedOS.iOSId),
        assert(id != RecognizedOS.fuchsiaId),
        assert(id != RecognizedOS.browserId);
}
