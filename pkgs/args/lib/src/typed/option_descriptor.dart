// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../arg_parser.dart';
import '../arg_results.dart';
import '../option.dart';
import 'cli_enum.dart';

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
    this.valueHelp,
    this.defaultsTo,
    this.allowed,
    this.allowedHelp,
    this.mandatory = false,
    this.scope = OptionScope.local,
    this.hide = false,
  });

  /// The CLI option name (without leading dashes).
  final String name;

  /// The help string displayed in usage output.
  final String help;

  /// An optional single-character abbreviation.
  final String? abbr;

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

  /// The CLI flag representation (e.g., `--target`).
  String get flag => '--$name';

  /// Registers this option with [parser], retaining descriptor identity on the
  /// created [Option] so duplicate registrations of the same descriptor
  /// instance are idempotent and conflicting descriptors throw an
  /// [ArgumentError].
  void addTo(ArgParser parser);

  /// Checks if this option was explicitly provided on the command line.
  bool wasProvided(ArgResults? results, {ArgResults? globalResults}) {
    final target = _resolveTargetResults(results, globalResults);
    return target != null &&
        isOptionRegistered(target, name) &&
        target.wasParsed(name);
  }

  /// Checks if this option was explicitly parsed (alias for [wasProvided]).
  bool wasParsed(ArgResults? results, {ArgResults? globalResults}) =>
      wasProvided(results, globalResults: globalResults);

  /// Checks if this option was registered in [results] or [globalResults].
  bool isRegistered(ArgResults? results, {ArgResults? globalResults}) {
    final target = _resolveTargetResults(results, globalResults);
    return target != null && isOptionRegistered(target, name);
  }

  /// Returns the resolved value for this option.
  T getValue(ArgResults? results, {ArgResults? globalResults});

  ArgResults? _resolveTargetResults(
    ArgResults? results,
    ArgResults? globalResults,
  ) {
    final effectiveGlobal =
        globalResults ?? (results != null ? rootOf(results) : null);
    return switch (scope) {
      OptionScope.local => results,
      OptionScope.global => effectiveGlobal,
      OptionScope.any
          when results != null &&
              isOptionRegistered(results, name) &&
              results.wasParsed(name) =>
        results,
      OptionScope.any
          when effectiveGlobal != null &&
              isOptionRegistered(effectiveGlobal, name) &&
              effectiveGlobal.wasParsed(name) =>
        effectiveGlobal,
      OptionScope.any
          when results != null && isOptionRegistered(results, name) =>
        results,
      OptionScope.any => effectiveGlobal ?? results,
    };
  }

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

/// A descriptor for single-value string options.
final class StringOptionDescriptor extends OptionDescriptor<String?> {
  const StringOptionDescriptor({
    required super.name,
    required super.help,
    super.abbr,
    super.valueHelp,
    super.defaultsTo,
    this.aliases = const <String>[],
    super.allowed,
    super.allowedHelp,
    super.mandatory,
    super.scope,
    super.hide,
  });

  /// Alternative names for this option.
  final List<String> aliases;

  @override
  void addTo(ArgParser parser) {
    if (_isAlreadyRegistered(parser)) {
      return;
    }

    parser.addOption(
      name,
      abbr: abbr,
      aliases: aliases,
      help: help,
      valueHelp: valueHelp,
      defaultsTo: defaultsTo,
      allowed: allowed,
      allowedHelp: allowedHelp,
      mandatory: mandatory,
      hide: hide,
    );
    _attachDescriptor(parser);
  }

  @override
  String? getValue(ArgResults? results, {ArgResults? globalResults}) {
    final target = _resolveTargetResults(results, globalResults);
    if (target != null && isOptionRegistered(target, name)) {
      return target[name] as String? ?? defaultsTo;
    }
    return defaultsTo;
  }
}

/// A descriptor for single-value string options that have a non-null default
/// value.
final class DefaultedStringOptionDescriptor extends OptionDescriptor<String> {
  const DefaultedStringOptionDescriptor({
    required super.name,
    required super.help,
    required String super.defaultsTo,
    super.abbr,
    super.valueHelp,
    this.aliases = const <String>[],
    super.allowed,
    super.allowedHelp,
    super.scope,
    super.hide,
  });

  /// Alternative names for this option.
  final List<String> aliases;

  @override
  void addTo(ArgParser parser) {
    if (_isAlreadyRegistered(parser)) {
      return;
    }

    parser.addOption(
      name,
      abbr: abbr,
      aliases: aliases,
      help: help,
      valueHelp: valueHelp,
      defaultsTo: defaultsTo,
      allowed: allowed,
      allowedHelp: allowedHelp,
      mandatory: false,
      hide: hide,
    );
    _attachDescriptor(parser);
  }

  @override
  String getValue(ArgResults? results, {ArgResults? globalResults}) {
    final target = _resolveTargetResults(results, globalResults);
    if (target != null && isOptionRegistered(target, name)) {
      return (target[name] as String?) ?? defaultsTo!;
    }
    return defaultsTo!;
  }
}

/// A private base class providing shared integer parsing and registration
/// infrastructure for [IntOptionDescriptor] and [DefaultedIntOptionDescriptor].
abstract base class _IntOptionDescriptorBase<R> extends OptionDescriptor<R> {
  const _IntOptionDescriptorBase({
    required super.name,
    required super.help,
    super.abbr,
    super.valueHelp,
    super.defaultsTo,
    this.aliases = const <String>[],
    super.allowed,
    super.allowedHelp,
    super.mandatory = false,
    super.scope = OptionScope.local,
    super.hide = false,
  });

  /// Alternative names for this option.
  final List<String> aliases;

  @override
  void addTo(ArgParser parser) {
    if (_isAlreadyRegistered(parser)) {
      return;
    }

    parser.addOption(
      name,
      abbr: abbr,
      aliases: aliases,
      help: help,
      valueHelp: valueHelp,
      defaultsTo: defaultsTo?.toString(),
      allowed: allowed,
      allowedHelp: allowedHelp,
      mandatory: mandatory,
      hide: hide,
    );
    _attachDescriptor(parser);
  }

  int? _parseIntOption(ArgResults target) {
    final raw = target[name] as String?;
    if (raw == null) {
      return null;
    }
    final parsed = int.tryParse(raw);
    if (parsed == null) {
      throw FormatException(
        'Invalid integer value "$raw" for option "--$name".',
      );
    }
    return parsed;
  }
}

/// A descriptor for single-value integer options.
final class IntOptionDescriptor extends _IntOptionDescriptorBase<int?> {
  const IntOptionDescriptor({
    required super.name,
    required super.help,
    super.abbr,
    super.valueHelp,
    super.defaultsTo,
    super.aliases = const <String>[],
    super.allowed,
    super.allowedHelp,
    super.mandatory = false,
    super.scope = OptionScope.local,
    super.hide = false,
  });

  @override
  int? getValue(ArgResults? results, {ArgResults? globalResults}) {
    final target = _resolveTargetResults(results, globalResults);
    if (target != null && isOptionRegistered(target, name)) {
      return _parseIntOption(target) ?? defaultsTo;
    }
    return defaultsTo;
  }
}

/// A descriptor for single-value integer options that have a non-null default
/// value.
final class DefaultedIntOptionDescriptor extends _IntOptionDescriptorBase<int> {
  const DefaultedIntOptionDescriptor({
    required super.name,
    required super.help,
    required int super.defaultsTo,
    super.abbr,
    super.valueHelp,
    super.aliases = const <String>[],
    super.allowed,
    super.allowedHelp,
    super.scope = OptionScope.local,
    super.hide = false,
  });

  @override
  int getValue(ArgResults? results, {ArgResults? globalResults}) {
    final target = _resolveTargetResults(results, globalResults);
    if (target != null && isOptionRegistered(target, name)) {
      return _parseIntOption(target) ?? defaultsTo!;
    }
    return defaultsTo!;
  }
}

/// A descriptor for boolean flags.
final class FlagOptionDescriptor extends OptionDescriptor<bool> {
  const FlagOptionDescriptor({
    required super.name,
    required super.help,
    super.abbr,
    super.defaultsTo = false,
    this.negatable = true,
    this.aliases = const <String>[],
    super.scope,
    super.hide,
  });

  /// Whether the flag can be negated with `--no-$name`.
  final bool negatable;

  /// Alternative names for this flag.
  final List<String> aliases;

  @override
  void addTo(ArgParser parser) {
    if (_isAlreadyRegistered(parser)) {
      return;
    }

    parser.addFlag(
      name,
      abbr: abbr,
      aliases: aliases,
      help: help,
      defaultsTo: defaultsTo ?? false,
      negatable: negatable,
      hide: hide,
    );
    _attachDescriptor(parser);
  }

  @override
  bool getValue(ArgResults? results, {ArgResults? globalResults}) {
    final target = _resolveTargetResults(results, globalResults);
    if (target != null && isOptionRegistered(target, name)) {
      return (target[name] as bool?) ?? defaultsTo ?? false;
    }
    return defaultsTo ?? false;
  }
}

/// A descriptor for tri-state (nullable) boolean flags.
final class NullableFlagOptionDescriptor extends OptionDescriptor<bool?> {
  const NullableFlagOptionDescriptor({
    required super.name,
    required super.help,
    super.abbr,
    this.negatable = true,
    this.aliases = const <String>[],
    super.scope,
    super.hide,
  }) : super(defaultsTo: null);

  /// Whether the flag can be negated with `--no-$name`.
  final bool negatable;

  /// Alternative names for this flag.
  final List<String> aliases;

  @override
  void addTo(ArgParser parser) {
    if (_isAlreadyRegistered(parser)) {
      return;
    }

    parser.addFlag(
      name,
      abbr: abbr,
      aliases: aliases,
      help: help,
      defaultsTo: null,
      negatable: negatable,
      hide: hide,
    );
    _attachDescriptor(parser);
  }

  @override
  bool? getValue(ArgResults? results, {ArgResults? globalResults}) {
    final target = _resolveTargetResults(results, globalResults);
    if (target != null && isOptionRegistered(target, name)) {
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
    super.valueHelp,
    super.defaultsTo,
    this.aliases = const <String>[],
    this.splitCommas = true,
    super.allowed,
    super.allowedHelp,
    super.scope,
    super.hide,
  });

  /// Alternative names for this option.
  final List<String> aliases;

  /// Whether multiple values can be passed separated by commas.
  final bool splitCommas;

  @override
  void addTo(ArgParser parser) {
    if (_isAlreadyRegistered(parser)) {
      return;
    }

    parser.addMultiOption(
      name,
      abbr: abbr,
      aliases: aliases,
      help: help,
      valueHelp: valueHelp,
      defaultsTo: defaultsTo,
      allowed: allowed,
      allowedHelp: allowedHelp,
      splitCommas: splitCommas,
      hide: hide,
    );
    _attachDescriptor(parser);
  }

  @override
  List<String> getValue(ArgResults? results, {ArgResults? globalResults}) {
    final target = _resolveTargetResults(results, globalResults);
    if (target != null && isOptionRegistered(target, name)) {
      return (target[name] as List<dynamic>?)?.cast<String>() ??
          const <String>[];
    }
    return defaultsTo ?? const <String>[];
  }
}

/// A private base class providing shared enum parsing and registration
/// infrastructure for [EnumOptionDescriptor] and
/// [DefaultedEnumOptionDescriptor].
abstract base class _EnumOptionDescriptorBase<T extends Enum, R>
    extends OptionDescriptor<R> {
  const _EnumOptionDescriptorBase({
    required super.name,
    required super.help,
    required this.values,
    this.nameMapper,
    this.valueParser,
    super.abbr,
    super.valueHelp,
    super.defaultsTo,
    this.aliases = const <String>[],
    super.allowedHelp,
    super.mandatory = false,
    super.scope = OptionScope.local,
    super.hide = false,
  });

  /// The list of enum values allowed for this option.
  final List<T> values;

  /// Optional function to map an enum value to its CLI string representation.
  /// Defaults to `(value) => (value is CliEnum) ? value.cliName : value.name`.
  final String Function(T value)? nameMapper;

  /// Optional function to parse a string into an enum value.
  /// Defaults to matching against [nameMapper] or `value.name`.
  final T? Function(String name)? valueParser;

  /// Alternative names for this option.
  final List<String> aliases;

  String _formatName(T value) {
    if (nameMapper != null) {
      return nameMapper!(value);
    }
    if (value is CliEnum) {
      return (value as CliEnum).cliName;
    }
    return value.name;
  }

  @override
  List<String> get allowed => values.map(_formatName).toList();

  Map<String, String>? _computeAllowedHelp() {
    if (allowedHelp != null) {
      return allowedHelp;
    }
    if (values.isNotEmpty && values.first is CliEnum) {
      return <String, String>{
        for (final T val in values) _formatName(val): (val as CliEnum).helpText,
      };
    }
    return null;
  }

  @override
  void addTo(ArgParser parser) {
    if (_isAlreadyRegistered(parser)) {
      return;
    }

    final defaultString =
        defaultsTo != null ? _formatName(defaultsTo! as T) : null;

    final effectiveAllowedHelp = _computeAllowedHelp();

    parser.addOption(
      name,
      abbr: abbr,
      aliases: aliases,
      help: help,
      valueHelp: valueHelp,
      defaultsTo: defaultString,
      allowed: allowed,
      allowedHelp: effectiveAllowedHelp,
      mandatory: mandatory,
      hide: hide,
    );
    _attachDescriptor(parser);
  }

  T? _parse(String? raw) {
    if (raw == null) {
      return null;
    }
    if (valueParser != null) {
      return valueParser!(raw);
    }
    for (final val in values) {
      if (_formatName(val) == raw || val.name == raw) {
        return val;
      }
    }
    return null;
  }
}

/// A descriptor for enum-based options that automatically validates allowed
/// values and parses CLI string arguments directly into typed enum values [T].
final class EnumOptionDescriptor<T extends Enum>
    extends _EnumOptionDescriptorBase<T, T?> {
  const EnumOptionDescriptor({
    required super.name,
    required super.help,
    required super.values,
    super.nameMapper,
    super.valueParser,
    super.abbr,
    super.valueHelp,
    super.defaultsTo,
    super.aliases = const <String>[],
    super.allowedHelp,
    super.mandatory = false,
    super.scope = OptionScope.local,
    super.hide = false,
  });

  @override
  T? getValue(ArgResults? results, {ArgResults? globalResults}) {
    final target = _resolveTargetResults(results, globalResults);
    if (target != null && isOptionRegistered(target, name)) {
      final raw = target[name] as String?;
      return _parse(raw) ?? defaultsTo;
    }
    return defaultsTo;
  }
}

/// A descriptor for enum-based options that have a non-null default value.
final class DefaultedEnumOptionDescriptor<T extends Enum>
    extends _EnumOptionDescriptorBase<T, T> {
  const DefaultedEnumOptionDescriptor({
    required super.name,
    required super.help,
    required super.values,
    required T super.defaultsTo,
    super.nameMapper,
    super.valueParser,
    super.abbr,
    super.valueHelp,
    super.aliases = const <String>[],
    super.allowedHelp,
    super.scope = OptionScope.local,
    super.hide = false,
  });

  @override
  T getValue(ArgResults? results, {ArgResults? globalResults}) {
    final target = _resolveTargetResults(results, globalResults);
    if (target != null && isOptionRegistered(target, name)) {
      final raw = target[name] as String?;
      return _parse(raw) ?? defaultsTo!;
    }
    return defaultsTo!;
  }
}
