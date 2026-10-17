// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// An interface for enums that provide custom CLI names and help text.
abstract interface class CliEnum implements Enum {
  /// The name used to identify this value on the command line (e.g. kebab-cased
  /// or short code).
  String get cliName;

  /// The help text describing this specific enum choice in usage documentation.
  String get helpText;

  /// Generates an `allowedHelp` map from a collection of [CliEnum] values.
  static Map<String, String> allowedHelp<T extends CliEnum>(
    Iterable<T> values,
  ) =>
      Map<String, String>.fromEntries(
        values.map((T e) => MapEntry<String, String>(e.cliName, e.helpText)),
      );
}
