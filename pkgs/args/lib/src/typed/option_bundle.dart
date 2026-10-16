// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../../command_runner.dart';
import '../arg_parser.dart';
import '../arg_results.dart';
import 'option_descriptor.dart';

/// An aggregation of related [OptionDescriptor] instances that can be
/// registered and bound to an [ArgParser] or [Command] as a cohesive domain
/// unit.
abstract class OptionBundle {
  const OptionBundle();

  /// An optional visual section header displayed above this bundle's options
  /// in `--help` usage output.
  String? get title => null;

  /// The list of option descriptors contained within this bundle.
  List<OptionDescriptor<Object?>> get descriptors =>
      const <OptionDescriptor<Object?>>[];

  /// Optional child bundles composed inside this bundle.
  List<OptionBundle> get subBundles => const <OptionBundle>[];

  /// Registers all option descriptors and child bundles into [parser].
  void register(
    ArgParser parser, {
    bool verboseHelp = false,
    bool? hide,
  }) {
    if (title != null) {
      parser.addSeparator(title!);
    }
    for (final descriptor in descriptors) {
      descriptor.addTo(parser, verboseHelp: verboseHelp, hide: hide);
    }
    for (final subBundle in subBundles) {
      subBundle.register(parser, verboseHelp: verboseHelp, hide: hide);
    }
  }

  /// Registers this bundle onto a [Command], populating [Command.argParser].
  void registerOnCommand(
    Command<dynamic> command, {
    bool verboseHelp = false,
    bool? hide,
  }) {
    register(command.argParser, verboseHelp: verboseHelp, hide: hide);
  }
}

/// An [OptionBundle] that also parses its registered descriptors into a
/// strongly-typed domain value or configuration object [T].
abstract class ValueOptionBundle<T> extends OptionBundle {
  const ValueOptionBundle();

  /// Parses the registered options from [results] into an instance of [T].
  T parse(ArgResults? results);
}
