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
  T getValue<T>(OptionDescriptor<T> descriptor, {ArgResults? globalResults}) =>
      descriptor.getValue(this, globalResults: globalResults);

  /// Parses [bundle] from these results into a strongly-typed value [T].
  T getBundle<T>(ValueOptionBundle<T> bundle, {ArgResults? globalResults}) =>
      bundle.parse(this, globalResults: globalResults);

  /// Returns whether [descriptor] was explicitly provided on the command line.
  bool wasProvided(
    OptionDescriptor<Object?> descriptor, {
    ArgResults? globalResults,
  }) =>
      descriptor.wasProvided(this, globalResults: globalResults);

  /// Returns whether [descriptor] is registered in these results.
  bool hasOption(
    OptionDescriptor<Object?> descriptor, {
    ArgResults? globalResults,
  }) =>
      descriptor.isRegistered(this, globalResults: globalResults);
}

/// Type-safe argument extraction extension for [Command].
extension CommandSafeArgResults on Command<dynamic> {
  /// Returns the resolved value for [descriptor], falling back to its default
  /// value.
  ///
  /// Converts any [FormatException] thrown during value parsing into a
  /// [UsageException] via [usageException].
  T getValue<T>(OptionDescriptor<T> descriptor) {
    try {
      return descriptor.getValue(argResults, globalResults: globalResults);
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
      return bundle.parse(argResults, globalResults: globalResults);
    } on FormatException catch (e) {
      usageException(e.message);
    }
  }

  /// Returns whether [descriptor] was explicitly provided on the command line.
  bool wasProvided(OptionDescriptor<Object?> descriptor) =>
      descriptor.wasProvided(argResults, globalResults: globalResults);

  /// Checks if this option was explicitly parsed (alias for [wasProvided]).
  bool wasParsed(OptionDescriptor<Object?> descriptor) =>
      descriptor.wasProvided(argResults, globalResults: globalResults);

  /// Returns whether [descriptor] is registered on this command (or globally).
  bool hasOption(OptionDescriptor<Object?> descriptor) =>
      descriptor.isRegistered(argResults, globalResults: globalResults);

  /// Registers [bundles] onto this command.
  void registerOptionBundles(List<OptionBundle> bundles) {
    for (final bundle in bundles) {
      bundle.registerOnCommand(this);
    }
  }
}

/// Extension on [ArgParser] to register option descriptors and bundles cleanly.
extension ArgParserBundleExtension on ArgParser {
  /// Adds an [OptionDescriptor] directly to this parser.
  void addOptionDescriptor(OptionDescriptor<Object?> descriptor) {
    descriptor.addTo(this);
  }

  /// Adds multiple [descriptors] directly to this parser.
  void addOptionDescriptors(List<OptionDescriptor<Object?>> descriptors) {
    for (final descriptor in descriptors) {
      descriptor.addTo(this);
    }
  }

  /// Registers [bundle] into this parser.
  void registerBundle(OptionBundle bundle) {
    bundle.register(this);
  }

  /// Registers multiple [bundles] into this parser.
  void registerBundles(List<OptionBundle> bundles) {
    for (final bundle in bundles) {
      bundle.register(this);
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
