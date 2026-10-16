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
  bool isRegisteredOnParser(ArgParser parser) => switch (parser.options[name]) {
        final option? => identical(descriptorOf(option), this),
        null => false,
      };

  /// Returns the resolved value for this option.
  T getValue(ArgResults? results);

  bool _isRegisteredIn(ArgResults results) =>
      isRegisteredOnParser(parserOf(results));

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

  void _attachDescriptor(
    ArgParser parser, {
    String? Function(String value, String arg)? validator,
  }) {
    if (parser.options[name] case final option?) {
      setDescriptorOf(option, this, validator: validator);
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

/// A private base class providing shared integer parsing and registration
/// infrastructure for [IntOptionDescriptor] and [DefaultedIntOptionDescriptor].
abstract base class _IntOptionDescriptorBase<R> extends OptionDescriptor<R> {
  const _IntOptionDescriptorBase({
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
      defaultsTo: defaultsTo?.toString(),
      allowed: allowed,
      allowedHelp: allowedHelp,
      mandatory: mandatory,
      hide: _effectiveHide(verboseHelp: verboseHelp, hide: hide),
    );
    _attachDescriptor(
      parser,
      validator: (value, arg) => int.tryParse(value) == null
          ? 'Invalid integer value "$value" for option "$arg".'
          : null,
    );
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
  int? getValue(ArgResults? results) {
    final target = _resolveTargetResults(results);
    if (target != null && _isRegisteredIn(target)) {
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
    super.aliases = const <String>[],
    super.valueHelp,
    super.allowed,
    super.allowedHelp,
    super.scope = OptionScope.local,
    super.hide = false,
    super.verboseOnly = false,
  });

  @override
  int getValue(ArgResults? results) {
    final target = _resolveTargetResults(results);
    if (target != null && _isRegisteredIn(target)) {
      return _parseIntOption(target) ?? defaultsTo!;
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
    super.aliases = const <String>[],
    super.valueHelp,
    super.defaultsTo,
    super.allowedHelp,
    super.mandatory = false,
    super.scope = OptionScope.local,
    super.hide = false,
    super.verboseOnly = false,
  });

  /// The list of enum values allowed for this option.
  final List<T> values;

  /// Optional function to map an enum value to its CLI string representation.
  /// Defaults to `(value) => (value is CliEnum) ? value.cliName : value.name`.
  final String Function(T value)? nameMapper;

  /// Optional function to parse a string into an enum value.
  /// Defaults to matching against [nameMapper] or `value.name`.
  final T? Function(String name)? valueParser;

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
  void addTo(
    ArgParser parser, {
    bool verboseHelp = false,
    bool? hide,
    String? help,
  }) {
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
      help: help ?? this.help,
      valueHelp: valueHelp,
      defaultsTo: defaultString,
      allowed: allowed,
      allowedHelp: effectiveAllowedHelp,
      mandatory: mandatory,
      hide: _effectiveHide(verboseHelp: verboseHelp, hide: hide),
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
    super.verboseOnly = false,
  });

  @override
  T? getValue(ArgResults? results) {
    final target = _resolveTargetResults(results);
    if (target != null && _isRegisteredIn(target)) {
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
    super.verboseOnly = false,
  });

  @override
  T getValue(ArgResults? results) {
    final target = _resolveTargetResults(results);
    if (target != null && _isRegisteredIn(target)) {
      final raw = target[name] as String?;
      return _parse(raw) ?? defaultsTo!;
    }
    return defaultsTo!;
  }
}
