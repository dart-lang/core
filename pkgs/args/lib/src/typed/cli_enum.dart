// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// An enumerated command-line option value.
///
/// Enums implementing this interface can be used with `EnumDescriptor` and
/// `DefaultedEnumDescriptor` to parse command-line option values matching
/// [cliName] into enum values and populate per-value [helpText] in usage
/// output.
abstract interface class CliEnum implements Enum {
  /// The string used to select this value on the command line.
  String get cliName;

  /// The description of this value shown in usage output.
  String get helpText;
}
