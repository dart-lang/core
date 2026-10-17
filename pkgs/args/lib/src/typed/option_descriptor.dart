// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../arg_parser.dart';
import '../arg_results.dart';
import '../option.dart';

/// Defines the lookup scope for an [OptionDescriptor].
enum OptionScope {
  /// Look up only within the subcommand's local [ArgResults].
  local,

  /// Look up only within the root command runner's global [ArgResults].
  global,

  /// Check local [ArgResults] first, falling back to global [ArgResults].
  any,
}

/// A metadata-rich, type-safe descriptor for a command-line option or flag.
abstract class OptionDescriptor<T> {
  const OptionDescriptor({
    required this.name,
    required this.help,
    this.abbr,
    this.aliases = const <String>[],
    this.valueHelp,
    this.defaultsTo,
    this.allowed,
    this.allowedHelp,
    this.mandatory = false,
    this.scope = OptionScope.local,
    this.hide = false,
    this.verboseOnly = false,
  });

  /// The CLI option name (without leading dashes).
  final String name;

  /// The help string displayed in usage output.
  final String help;

  /// An optional single-character abbreviation.
  final String? abbr;

  /// Alternative names for this option or flag.
  final List<String> aliases;

  /// An optional label displayed in usage to represent the value.
  final String? valueHelp;

  /// The default value if not specified on the command line.
  final T? defaultsTo;

  /// An optional list of allowed values.
  final List<String>? allowed;

  /// An optional map of allowed values to their descriptions.
  final Map<String, String>? allowedHelp;

  /// Whether this option is required on the command line.
  final bool mandatory;

  /// The scope where this option's result is located.
  final OptionScope scope;

  /// Whether to hide this option from usage output by default.
  final bool hide;

  /// Whether to hide this option from usage output unless `verboseHelp: true`
  /// is passed to [addTo].
  final bool verboseOnly;

  /// The CLI flag representation (e.g., `--target`).
  String get flag => '--$name';

  /// Registers this option with [parser], retaining descriptor identity on the
  /// created [Option] so duplicate registrations of the same descriptor
  /// instance are idempotent and conflicting descriptors throw an
  /// [ArgumentError].
  ///
  /// When [verboseHelp] is `false`, options with [verboseOnly] set to `true`
  /// are hidden from usage output. Passing [hide] or [help] overrides this
  /// descriptor's default visibility or help text for [parser] while
  /// preserving descriptor identity.
  void addTo(
    ArgParser parser, {
    bool verboseHelp = false,
    bool? hide,
    String? help,
  });

  /// Checks if this option was explicitly provided on the command line.
  bool wasProvided(ArgResults? results) {
    final target = _resolveTargetResults(results);
    return target != null && _isRegisteredIn(target) && target.wasParsed(name);
  }

  /// Checks if this option was explicitly parsed (alias for [wasProvided]).
  bool wasParsed(ArgResults? results) => wasProvided(results);

  /// Checks if this option was registered in [results] or its root global
  /// results.
  bool isRegistered(ArgResults? results) {
    final target = _resolveTargetResults(results);
    return target != null && _isRegisteredIn(target);
  }

  /// Checks if this specific [OptionDescriptor] is registered on [parser].
  bool isRegisteredOnParser(ArgParser parser) {
    final option = parser.options[name];
    if (option == null) {
      return false;
    }
    if (descriptorOf(option) case final existing?) {
      return identical(existing, this);
    }
    // Fallback for parsers cloned imperatively via addFlag/addOption/addMultiOption
    // (where no option on [parser] carries a descriptor) when metadata matches.
    return option.type == _optionType &&
        option.help == help &&
        (option.isMultiple || option.defaultsTo == _rawDefaultsTo) &&
        parser.options.values.every((opt) => descriptorOf(opt) == null);
  }

  /// Returns the resolved value for this option.
  T getValue(ArgResults? results);

  OptionType get _optionType;

  Object? get _rawDefaultsTo => defaultsTo;

  bool _isRegisteredIn(ArgResults results) => switch (parserOf(results)) {
        final parser? => isRegisteredOnParser(parser),
        null => true,
      };

  ArgResults? _resolveTargetResults(ArgResults? results) {
    if (results == null) {
      return null;
    }
    final globalResults = rootOf(results);
    return switch (scope) {
      OptionScope.local => results,
      OptionScope.global => globalResults,
      OptionScope.any
          when _isRegisteredIn(results) && results.wasParsed(name) =>
        results,
      OptionScope.any
          when _isRegisteredIn(globalResults) &&
              globalResults.wasParsed(name) =>
        globalResults,
      OptionScope.any when _isRegisteredIn(results) => results,
      OptionScope.any => globalResults,
    };
  }

  bool _effectiveHide({required bool verboseHelp, bool? hide}) =>
      hide ?? (this.hide || (verboseOnly && !verboseHelp));

  bool _isAlreadyRegistered(ArgParser parser) {
    if (parser.options[name] case final existingOption?) {
      final existing = descriptorOf(existingOption);
      if (identical(existing, this)) {
        return true;
      }
      final existingInfo = existing is OptionDescriptor<Object?>
          ? 'descriptor (help: "${existing.help}")'
          : 'non-descriptor option';
      throw ArgumentError(
        'Conflicting option descriptor registered for "$name"!\n'
        'Existing: $existingInfo\n'
        'New: descriptor (help: "$help")',
      );
    }
    return false;
  }

  void _attachDescriptor(ArgParser parser) {
    if (parser.options[name] case final option?) {
      setDescriptorOf(option, this);
    }
  }
}

/// A private base class providing shared string option registration for
/// [StringOptionDescriptor] and [DefaultedStringOptionDescriptor].
abstract base class _StringOptionDescriptorBase<R> extends OptionDescriptor<R> {
  const _StringOptionDescriptorBase({
    required super.name,
    required super.help,
    super.abbr,
    super.aliases = const <String>[],
    super.valueHelp,
    super.defaultsTo,
    super.allowed,
    super.allowedHelp,
    super.mandatory = false,
    super.scope = OptionScope.local,
    super.hide = false,
    super.verboseOnly = false,
  });

  @override
  OptionType get _optionType => OptionType.single;

  @override
  void addTo(
    ArgParser parser, {
    bool verboseHelp = false,
    bool? hide,
    String? help,
  }) {
    if (_isAlreadyRegistered(parser)) {
      return;
    }

    parser.addOption(
      name,
      abbr: abbr,
      aliases: aliases,
      help: help ?? this.help,
      valueHelp: valueHelp,
      defaultsTo: defaultsTo as String?,
      allowed: allowed,
      allowedHelp: allowedHelp,
      mandatory: mandatory,
      hide: _effectiveHide(verboseHelp: verboseHelp, hide: hide),
    );
    _attachDescriptor(parser);
  }
}

/// A descriptor for single-value string options.
final class StringOptionDescriptor
    extends _StringOptionDescriptorBase<String?> {
  const StringOptionDescriptor({
    required super.name,
    required super.help,
    super.abbr,
    super.aliases = const <String>[],
    super.valueHelp,
    super.defaultsTo,
    super.allowed,
    super.allowedHelp,
    super.mandatory,
    super.scope,
    super.hide,
    super.verboseOnly,
  });

  @override
  String? getValue(ArgResults? results) {
    final target = _resolveTargetResults(results);
    if (target != null && _isRegisteredIn(target)) {
      return target[name] as String? ?? defaultsTo;
    }
    return defaultsTo;
  }
}

/// A descriptor for single-value string options that have a non-null default
/// value.
final class DefaultedStringOptionDescriptor
    extends _StringOptionDescriptorBase<String> {
  const DefaultedStringOptionDescriptor({
    required super.name,
    required super.help,
    required String super.defaultsTo,
    super.abbr,
    super.aliases = const <String>[],
    super.valueHelp,
    super.allowed,
    super.allowedHelp,
    super.scope,
    super.hide,
    super.verboseOnly,
  });

  @override
  String getValue(ArgResults? results) {
    final target = _resolveTargetResults(results);
    if (target != null && _isRegisteredIn(target)) {
      return (target[name] as String?) ?? defaultsTo!;
    }
    return defaultsTo!;
  }
}

/// A private base class providing shared boolean flag registration for
/// [FlagOptionDescriptor] and [NullableFlagOptionDescriptor].
abstract base class _FlagOptionDescriptorBase<R> extends OptionDescriptor<R> {
  const _FlagOptionDescriptorBase({
    required super.name,
    required super.help,
    super.abbr,
    super.aliases = const <String>[],
    super.defaultsTo,
    this.negatable = true,
    super.scope = OptionScope.local,
    super.hide = false,
    super.verboseOnly = false,
  });

  /// Whether the flag can be negated with `--no-$name`.
  final bool negatable;

  @override
  OptionType get _optionType => OptionType.flag;

  @override
  void addTo(
    ArgParser parser, {
    bool verboseHelp = false,
    bool? hide,
    String? help,
  }) {
    if (_isAlreadyRegistered(parser)) {
      return;
    }

    parser.addFlag(
      name,
      abbr: abbr,
      aliases: aliases,
      help: help ?? this.help,
      defaultsTo: defaultsTo as bool?,
      negatable: negatable,
      hide: _effectiveHide(verboseHelp: verboseHelp, hide: hide),
    );
    _attachDescriptor(parser);
  }
}

/// A descriptor for boolean flags.
final class FlagOptionDescriptor extends _FlagOptionDescriptorBase<bool> {
  const FlagOptionDescriptor({
    required super.name,
    required super.help,
    super.abbr,
    super.aliases = const <String>[],
    super.defaultsTo = false,
    super.negatable = true,
    super.scope,
    super.hide,
    super.verboseOnly,
  });

  @override
  bool getValue(ArgResults? results) {
    final target = _resolveTargetResults(results);
    if (target != null && _isRegisteredIn(target)) {
      return (target[name] as bool?) ?? defaultsTo ?? false;
    }
    return defaultsTo ?? false;
  }
}

/// A descriptor for tri-state (nullable) boolean flags.
final class NullableFlagOptionDescriptor
    extends _FlagOptionDescriptorBase<bool?> {
  const NullableFlagOptionDescriptor({
    required super.name,
    required super.help,
    super.abbr,
    super.aliases = const <String>[],
    super.negatable = true,
    super.scope,
    super.hide,
    super.verboseOnly,
  }) : super(defaultsTo: null);

  @override
  bool? getValue(ArgResults? results) {
    final target = _resolveTargetResults(results);
    if (target != null && _isRegisteredIn(target)) {
      return target[name] as bool?;
    }
    return null;
  }
}

/// A descriptor for multi-value options (lists of strings).
final class MultiOptionDescriptor extends OptionDescriptor<List<String>> {
  const MultiOptionDescriptor({
    required super.name,
    required super.help,
    super.abbr,
    super.aliases = const <String>[],
    super.valueHelp,
    super.defaultsTo = const <String>[],
    this.splitCommas = true,
    super.allowed,
    super.allowedHelp,
    super.scope,
    super.hide,
    super.verboseOnly,
  });

  /// Whether multiple values can be passed separated by commas.
  final bool splitCommas;

  @override
  OptionType get _optionType => OptionType.multiple;

  @override
  void addTo(
    ArgParser parser, {
    bool verboseHelp = false,
    bool? hide,
    String? help,
  }) {
    if (_isAlreadyRegistered(parser)) {
      return;
    }

    parser.addMultiOption(
      name,
      abbr: abbr,
      aliases: aliases,
      help: help ?? this.help,
      valueHelp: valueHelp,
      defaultsTo: defaultsTo,
      allowed: allowed,
      allowedHelp: allowedHelp,
      splitCommas: splitCommas,
      hide: _effectiveHide(verboseHelp: verboseHelp, hide: hide),
    );
    _attachDescriptor(parser);
  }

  @override
  List<String> getValue(ArgResults? results) {
    final target = _resolveTargetResults(results);
    if (target != null && _isRegisteredIn(target)) {
      final raw = (target[name] as List<dynamic>?)?.cast<String>();
      return raw != null ? List<String>.unmodifiable(raw) : const <String>[];
    }
    return defaultsTo != null
        ? List<String>.unmodifiable(defaultsTo!)
        : const <String>[];
  }
}
