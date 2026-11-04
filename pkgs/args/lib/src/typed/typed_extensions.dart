// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../arg_parser.dart';
import '../option.dart';
import 'option_descriptor.dart';

/// Extension on [ArgParser] to register [OptionDescriptor] instances.
extension TypedArgParserExtension on ArgParser {
  /// Adds [descriptor] to this parser.
  void addDescriptor(
    OptionDescriptor<Object?> descriptor, {
    bool verboseHelp = false,
    bool? hide,
    String? help,
  }) {
    descriptor.addTo(this, verboseHelp: verboseHelp, hide: hide, help: help);
  }

  /// Adds [descriptors] to this parser.
  void addDescriptors(
    Iterable<OptionDescriptor<Object?>> descriptors, {
    bool verboseHelp = false,
    bool? hide,
  }) {
    for (final descriptor in descriptors) {
      descriptor.addTo(this, verboseHelp: verboseHelp, hide: hide);
    }
  }
}

/// Extension on [Option] exposing its associated [OptionDescriptor], if any.
extension TypedOptionExtension on Option {
  /// The [OptionDescriptor] that registered this option, or `null` if it was
  /// registered imperatively via [ArgParser.addOption], [ArgParser.addFlag], or
  /// [ArgParser.addMultiOption].
  OptionDescriptor<Object?>? get descriptor =>
      descriptorOf(this) as OptionDescriptor<Object?>?;
}
