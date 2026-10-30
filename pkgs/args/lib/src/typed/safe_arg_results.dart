// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../arg_parser.dart';
import '../arg_results.dart';
import '../option.dart';
import 'option_descriptor.dart';

/// Type-safe argument extraction extension for [ArgResults].
extension SafeArgResults on ArgResults {
  /// Returns the resolved value for [descriptor], falling back to its default
  /// value.
  T getValue<T>(OptionDescriptor<T> descriptor) => descriptor.getValue(this);

  /// Returns whether [descriptor] was explicitly provided on the command line.
  ///
  /// Named `wasProvided` because [ArgResults.wasParsed] is an instance method
  /// taking a `String` option name, which extension methods cannot overload.
  bool wasProvided(OptionDescriptor<Object?> descriptor) =>
      descriptor.wasProvided(this);

  /// Returns whether [descriptor] is registered in these results (or in the
  /// root global results for [OptionScope.global] and [OptionScope.any]).
  bool hasOption(OptionDescriptor<Object?> descriptor) =>
      descriptor.isRegistered(this);
}

/// Extension on [ArgParser] to register option descriptors cleanly.
extension ArgParserBundleExtension on ArgParser {
  /// Adds an [OptionDescriptor] directly to this parser.
  void addDescriptor(
    OptionDescriptor<Object?> descriptor, {
    bool verboseHelp = false,
    bool? hide,
    String? help,
  }) {
    descriptor.addTo(this, verboseHelp: verboseHelp, hide: hide, help: help);
  }

  /// Adds multiple [descriptors] directly to this parser.
  void addDescriptors(
    Iterable<OptionDescriptor<Object?>> descriptors, {
    bool verboseHelp = false,
    bool? hide,
  }) {
    for (final descriptor in descriptors) {
      descriptor.addTo(this, verboseHelp: verboseHelp, hide: hide);
    }
  }

  /// Adds an [OptionDescriptor] directly to this parser (alias for
  /// [addDescriptor]).
  void addOptionDescriptor(
    OptionDescriptor<Object?> descriptor, {
    bool verboseHelp = false,
    bool? hide,
    String? help,
  }) {
    addDescriptor(descriptor, verboseHelp: verboseHelp, hide: hide, help: help);
  }

  /// Adds multiple [descriptors] directly to this parser (alias for
  /// [addDescriptors]).
  void addOptionDescriptors(
    Iterable<OptionDescriptor<Object?>> descriptors, {
    bool verboseHelp = false,
    bool? hide,
  }) {
    addDescriptors(descriptors, verboseHelp: verboseHelp, hide: hide);
  }
}

/// Extension on [Option] exposing its associated [OptionDescriptor], if any.
extension TypedOptionExtension on Option {
  /// The [OptionDescriptor] that registered this option, or `null` if it was
  /// registered imperatively via [ArgParser.addOption] or [ArgParser.addFlag].
  OptionDescriptor<Object?>? get descriptor =>
      descriptorOf(this) as OptionDescriptor<Object?>?;
}
