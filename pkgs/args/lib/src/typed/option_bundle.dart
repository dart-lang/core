// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../arg_parser.dart';
import '../arg_results.dart';
import 'option_descriptor.dart';

/// A reusable group of [OptionDescriptor] instances and nested [subBundles]
/// that register onto an [ArgParser].
abstract class OptionBundle {
  const OptionBundle();

  /// An optional section header displayed above this bundle's options in
  /// `--help` usage output.
  String? get title => null;

  /// The option descriptors contained in this bundle.
  List<OptionDescriptor<Object?>> get descriptors => const [];

  /// Child bundles composed inside this bundle.
  List<OptionBundle> get subBundles => const [];

  /// Registers all [descriptors] and [subBundles] onto [parser].
  void register(
    ArgParser parser, {
    bool verboseHelp = false,
    bool? hide,
  }) {
    if (title case final header?
        when descriptors.isEmpty ||
            descriptors.any((d) => !d.isRegisteredOnParser(parser))) {
      parser.addSeparator(header);
    }
    for (final descriptor in descriptors) {
      descriptor.addTo(parser, verboseHelp: verboseHelp, hide: hide);
    }
    for (final subBundle in subBundles) {
      subBundle.register(parser, verboseHelp: verboseHelp, hide: hide);
    }
  }
}

/// An [OptionBundle] that parses its registered options from [ArgResults] into
/// a typed value [T].
abstract class ValueOptionBundle<T> extends OptionBundle {
  const ValueOptionBundle();

  /// Parses the registered options in [results] into an instance of [T].
  T parse(ArgResults results);
}
