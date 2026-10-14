// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../../command_runner.dart';
import '../arg_parser.dart';
import '../arg_results.dart';
import '../option.dart';
import 'option_bundle.dart';
import 'option_descriptor.dart';

/// Type-safe argument extraction extension for [ArgResults].
extension SafeArgResults on ArgResults {
  /// Returns the resolved value for [descriptor], falling back to its default
  /// value.
  T getValue<T>(OptionDescriptor<T> descriptor) => descriptor.getValue(this);

  /// Parses [bundle] from these results into a strongly-typed value [T].
  T getBundle<T>(ValueOptionBundle<T> bundle) => bundle.parse(this);

  /// Returns whether [descriptor] was explicitly provided on the command line.
  ///
  /// Named `wasProvided` because [ArgResults.wasParsed] is an instance method
  /// taking a `String` option name, which extension methods cannot overload.
  bool wasProvided(OptionDescriptor<Object?> descriptor) =>
      descriptor.wasProvided(this);

  /// Returns whether [descriptor] is registered in these results.
  bool hasOption(OptionDescriptor<Object?> descriptor) =>
      descriptor.isRegistered(this);
}

/// Type-safe argument extraction extension for [Command].
extension CommandSafeArgResults on Command<dynamic> {
  ArgResults? get _effectiveResults {
    final local = argResults;
    final global = globalResults;
    if (local != null && global != null) {
      setRootOf(local, global);
    }
    return local ?? global;
  }

  /// Returns the resolved value for [descriptor], falling back to its default
  /// value.
  ///
  /// Converts any [FormatException] thrown during value parsing into a
  /// [UsageException] via [usageException].
  T getValue<T>(OptionDescriptor<T> descriptor) {
    try {
      return descriptor.getValue(_effectiveResults);
    } on FormatException catch (e) {
      usageException(e.message);
    }
  }

  /// Parses [bundle] from this command's [argResults] and [globalResults].
  ///
  /// Converts any [FormatException] thrown during bundle parsing into a
  /// [UsageException] via [usageException].
  T getBundle<T>(ValueOptionBundle<T> bundle) {
    try {
      return bundle.parse(_effectiveResults);
    } on FormatException catch (e) {
      usageException(e.message);
    }
  }

  /// Returns whether [descriptor] was explicitly provided on the command line.
  bool wasProvided(OptionDescriptor<Object?> descriptor) =>
      descriptor.wasProvided(_effectiveResults);

  /// Checks if this option was explicitly parsed (alias for [wasProvided]).
  bool wasParsed(OptionDescriptor<Object?> descriptor) =>
      descriptor.wasProvided(_effectiveResults);

  /// Returns whether [descriptor] is registered on this command (or globally).
  bool hasOption(OptionDescriptor<Object?> descriptor) =>
      descriptor.isRegistered(_effectiveResults);

  /// Registers [bundles] onto this command.
  void registerOptionBundles(
    Iterable<OptionBundle> bundles, {
    bool verboseHelp = false,
  }) {
    for (final bundle in bundles) {
      bundle.registerOnCommand(this, verboseHelp: verboseHelp);
    }
  }
}

/// Extension on [ArgParser] to register option descriptors and bundles cleanly.
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

  /// Adds an [OptionDescriptor] directly to this parser.
  void addOptionDescriptor(
    OptionDescriptor<Object?> descriptor, {
    bool verboseHelp = false,
    bool? hide,
    String? help,
  }) {
    descriptor.addTo(this, verboseHelp: verboseHelp, hide: hide, help: help);
  }

  /// Adds multiple [descriptors] directly to this parser.
  void addOptionDescriptors(
    Iterable<OptionDescriptor<Object?>> descriptors, {
    bool verboseHelp = false,
    bool? hide,
  }) {
    for (final descriptor in descriptors) {
      descriptor.addTo(this, verboseHelp: verboseHelp, hide: hide);
    }
  }

  /// Registers [bundle] into this parser.
  void registerBundle(OptionBundle bundle, {bool verboseHelp = false}) {
    bundle.register(this, verboseHelp: verboseHelp);
  }

  /// Registers multiple [bundles] into this parser.
  void registerBundles(
    Iterable<OptionBundle> bundles, {
    bool verboseHelp = false,
  }) {
    for (final bundle in bundles) {
      bundle.register(this, verboseHelp: verboseHelp);
    }
  }
}

/// Extension on [Option] exposing its associated [OptionDescriptor], if any.
extension TypedOptionExtension on Option {
  /// The [OptionDescriptor] that registered this option, or `null` if it was
  /// registered imperatively via [ArgParser.addOption] or [ArgParser.addFlag].
  OptionDescriptor<Object?>? get descriptor =>
      descriptorOf(this) as OptionDescriptor<Object?>?;
}
