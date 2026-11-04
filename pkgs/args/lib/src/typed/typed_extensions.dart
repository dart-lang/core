// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../arg_parser.dart';
import '../option.dart';
import 'option_bundle.dart';
import 'option_descriptor.dart';

/// Extension on [ArgParser] to register [OptionDescriptor] and [OptionBundle]
/// instances.
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

  /// Registers [bundle] onto this parser.
  void registerBundle(
    OptionBundle bundle, {
    bool verboseHelp = false,
    bool? hide,
  }) {
    bundle.register(this, verboseHelp: verboseHelp, hide: hide);
  }

  /// Registers [bundles] onto this parser.
  void registerBundles(
    Iterable<OptionBundle> bundles, {
    bool verboseHelp = false,
    bool? hide,
  }) {
    for (final bundle in bundles) {
      bundle.register(this, verboseHelp: verboseHelp, hide: hide);
    }
  }
}

/// Extension on [Option] exposing its associated [OptionDescriptor], if any,
/// and copying options across [ArgParser] instances.
extension TypedOptionExtension on Option {
  /// The [OptionDescriptor] that registered this option, or `null` if it was
  /// registered imperatively via [ArgParser.addOption], [ArgParser.addFlag], or
  /// [ArgParser.addMultiOption].
  OptionDescriptor<Object?>? get descriptor =>
      descriptorOf(this) as OptionDescriptor<Object?>?;

  /// Copies this option into [target], preserving any associated
  /// [OptionDescriptor] and parse-time value validator.
  void copyTo(
    ArgParser target, {
    bool? hide,
    String? help,
  }) {
    final effectiveHide = hide ?? this.hide;
    final effectiveHelp = help ?? this.help;
    switch (type) {
      case OptionType.flag:
        target.addFlag(
          name,
          abbr: abbr,
          help: effectiveHelp,
          defaultsTo: defaultsTo as bool?,
          negatable: negatable ?? true,
          callback: callback as void Function(bool)?,
          hide: effectiveHide,
          hideNegatedUsage: hideNegatedUsage ?? false,
          aliases: aliases,
        );
      case OptionType.single:
        target.addOption(
          name,
          abbr: abbr,
          help: effectiveHelp,
          valueHelp: valueHelp,
          allowed: allowed,
          allowedHelp: allowedHelp,
          defaultsTo: defaultsTo as String?,
          callback: callback as void Function(String?)?,
          mandatory: mandatory,
          hide: effectiveHide,
          aliases: aliases,
        );
      case OptionType.multiple:
        final multiDefaults = switch (defaultsTo) {
          final Iterable<String> values => values,
          final Iterable<Object?> values => [
              for (final item in values) item as String,
            ],
          _ => null,
        };
        target.addMultiOption(
          name,
          abbr: abbr,
          help: effectiveHelp,
          valueHelp: valueHelp,
          allowed: allowed,
          allowedHelp: allowedHelp,
          defaultsTo: multiDefaults,
          callback: callback as void Function(List<String>)?,
          splitCommas: splitCommas,
          hide: effectiveHide,
          aliases: aliases,
        );
    }
    if ((descriptorOf(this), target.options[name])
        case (final existingDescriptor?, final copiedOption?)) {
      setDescriptorOf(
        copiedOption,
        existingDescriptor,
        validator: validatorOf(this),
      );
    }
  }
}
