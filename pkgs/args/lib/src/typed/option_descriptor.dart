// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../arg_parser.dart';
import '../arg_results.dart';
import '../option.dart';
import 'cli_enum.dart';

/// Descriptor for a command-line option or flag whose parsed value has type
/// [T].
///
/// Concrete subclasses define the option kind and whether the value has a
/// non-`null` default:
/// - [FlagDescriptor] (`bool`) and [NullableFlagDescriptor] (`bool?`)
/// - [StringDescriptor] (`String?`) and [DefaultedStringDescriptor] (`String`)
/// - [IntDescriptor] (`int?`) and [DefaultedIntDescriptor] (`int`)
/// - [EnumDescriptor] (`T?`) and [DefaultedEnumDescriptor] (`T`)
/// - [MultiStringDescriptor] (`List<String>`)
abstract class OptionDescriptor<T> {
  const OptionDescriptor({
    required this.name,
    required this.help,
    required this.defaultsTo,
    this.abbr,
    this.aliases = const [],
    this.valueHelp,
    this.allowed,
    this.allowedHelp,
    this.mandatory = false,
    this.hide = false,
    this.verboseOnly = false,
  });

  /// The CLI option name without leading dashes.
  final String name;

  /// The help text displayed in usage output.
  final String help;

  /// An optional single-character abbreviation.
  final String? abbr;

  /// Alternative names for this option or flag.
  final List<String> aliases;

  /// An optional label displayed in usage output to represent the value.
  final String? valueHelp;

  /// The default value returned when this option is omitted on the command
  /// line.
  final T defaultsTo;

  /// An optional list of allowed CLI string values.
  final List<String>? allowed;

  /// An optional map from values in [allowed] to usage descriptions.
  final Map<String, String>? allowedHelp;

  /// Whether this option is required on the command line.
  final bool mandatory;

  /// Whether to hide this option from usage output by default.
  final bool hide;

  /// Whether to hide this option from usage output unless `verboseHelp: true`
  /// is passed to [addTo].
  final bool verboseOnly;

  /// The CLI long-option flag representation (for example, `--target`).
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

  /// The parsed or default value for this option in [results].
  ///
  /// Throws an [ArgumentError] if this descriptor was not registered on
  /// [results]'s parser.
  T value(ArgResults results) {
    _checkRegistered(results);
    return _readValue(results);
  }

  /// The parsed value for this option in [results], or [defaultsTo] if this
  /// descriptor was not registered on [results]'s parser.
  T valueOrDefault(ArgResults results) =>
      _isRegisteredIn(results) ? _readValue(results) : _defaultResult;

  /// Whether this option was explicitly parsed from an argument in [results].
  ///
  /// Throws an [ArgumentError] if this descriptor was not registered on
  /// [results]'s parser.
  bool wasParsed(ArgResults results) {
    _checkRegistered(results);
    return results.wasParsed(name);
  }

  /// Whether this descriptor is registered on [results]'s parser.
  bool isRegistered(ArgResults results) => _isRegisteredIn(results);

  /// Whether this descriptor is registered on [parser].
  bool isRegisteredOnParser(ArgParser parser) {
    final option = parser.options[name];
    if (option == null) return false;
    if (descriptorOf(option) case final existing?) {
      return identical(existing, this);
    }
    // Fallback for parsers cloned imperatively via addFlag/addOption/
    // addMultiOption (where no option on [parser] carries a descriptor) when
    // metadata matches.
    return option.type == _optionType &&
        option.help == help &&
        (option.isMultiple || option.defaultsTo == _parserDefaultsTo) &&
        parser.options.values.every((opt) => descriptorOf(opt) == null);
  }

  T _readValue(ArgResults results);

  T get _defaultResult => defaultsTo;

  OptionType get _optionType;

  Object? get _parserDefaultsTo => defaultsTo;

  bool _isRegisteredIn(ArgResults results) => switch (parserOf(results)) {
        final parser? => isRegisteredOnParser(parser),
        null => true,
      };

  void _checkRegistered(ArgResults results) {
    if (_isRegisteredIn(results)) return;
    final parser = parserOf(results);
    if (parser != null && parser.options.containsKey(name)) {
      throw ArgumentError(
        'Option "--$name" was not registered using this OptionDescriptor.',
      );
    }
    throw ArgumentError('Could not find an option named "--$name".');
  }

  bool _effectiveHide({required bool verboseHelp, bool? hide}) =>
      hide ?? (this.hide || (verboseOnly && !verboseHelp));

  bool _isAlreadyRegistered(ArgParser parser) {
    if (parser.options[name] case final existingOption?) {
      final existing = descriptorOf(existingOption);
      if (identical(existing, this)) return true;
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

/// Descriptor for a single-value string option whose parsed value has type [R].
abstract base class _StringDescriptorBase<R extends String?>
    extends OptionDescriptor<R> {
  const _StringDescriptorBase({
    required super.name,
    required super.help,
    required super.defaultsTo,
    super.abbr,
    super.aliases = const [],
    super.valueHelp,
    super.allowed,
    super.allowedHelp,
    super.mandatory = false,
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
    if (_isAlreadyRegistered(parser)) return;

    parser.addOption(
      name,
      abbr: abbr,
      aliases: aliases,
      help: help ?? this.help,
      valueHelp: valueHelp,
      defaultsTo: defaultsTo,
      allowed: allowed,
      allowedHelp: allowedHelp,
      mandatory: mandatory,
      hide: _effectiveHide(verboseHelp: verboseHelp, hide: hide),
    );
    _attachDescriptor(parser);
  }
}

/// Descriptor for a single-value string option without a default value.
final class StringDescriptor extends _StringDescriptorBase<String?> {
  const StringDescriptor({
    required super.name,
    required super.help,
    super.abbr,
    super.aliases = const [],
    super.valueHelp,
    super.allowed,
    super.allowedHelp,
    super.mandatory,
    super.hide,
    super.verboseOnly,
  }) : super(defaultsTo: null);

  @override
  String? _readValue(ArgResults results) => results[name] as String?;
}

/// Descriptor for a single-value string option with a non-`null` default value.
final class DefaultedStringDescriptor extends _StringDescriptorBase<String> {
  const DefaultedStringDescriptor({
    required super.name,
    required super.help,
    required super.defaultsTo,
    super.abbr,
    super.aliases = const [],
    super.valueHelp,
    super.allowed,
    super.allowedHelp,
    super.hide,
    super.verboseOnly,
  });

  @override
  String _readValue(ArgResults results) =>
      (results[name] as String?) ?? defaultsTo;
}

/// Descriptor for a single-value integer option whose parsed value has type
/// [R].
abstract base class _IntDescriptorBase<R extends int?>
    extends OptionDescriptor<R> {
  const _IntDescriptorBase({
    required super.name,
    required super.help,
    required super.defaultsTo,
    super.abbr,
    super.aliases = const [],
    super.valueHelp,
    super.allowed,
    super.allowedHelp,
    super.mandatory = false,
    super.hide = false,
    super.verboseOnly = false,
  });

  @override
  OptionType get _optionType => OptionType.single;

  @override
  Object? get _parserDefaultsTo => defaultsTo?.toString();

  @override
  void addTo(
    ArgParser parser, {
    bool verboseHelp = false,
    bool? hide,
    String? help,
  }) {
    if (_isAlreadyRegistered(parser)) return;

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

  int? _parseIntOption(ArgResults results) {
    final raw = results[name] as String?;
    if (raw == null) return null;
    return int.tryParse(raw) ??
        (throw FormatException(
          'Invalid integer value for option "--$name"',
          raw,
        ));
  }
}

/// Descriptor for a single-value integer option without a default value.
final class IntDescriptor extends _IntDescriptorBase<int?> {
  const IntDescriptor({
    required super.name,
    required super.help,
    super.abbr,
    super.aliases = const [],
    super.valueHelp,
    super.allowed,
    super.allowedHelp,
    super.mandatory = false,
    super.hide = false,
    super.verboseOnly = false,
  }) : super(defaultsTo: null);

  @override
  int? _readValue(ArgResults results) => _parseIntOption(results);
}

/// Descriptor for a single-value integer option with a non-`null` default
/// value.
final class DefaultedIntDescriptor extends _IntDescriptorBase<int> {
  const DefaultedIntDescriptor({
    required super.name,
    required super.help,
    required super.defaultsTo,
    super.abbr,
    super.aliases = const [],
    super.valueHelp,
    super.allowed,
    super.allowedHelp,
    super.hide = false,
    super.verboseOnly = false,
  });

  @override
  int _readValue(ArgResults results) => _parseIntOption(results) ?? defaultsTo;
}

/// Descriptor for a boolean flag whose parsed value has type [R].
abstract base class _FlagDescriptorBase<R extends bool?>
    extends OptionDescriptor<R> {
  const _FlagDescriptorBase({
    required super.name,
    required super.help,
    required super.defaultsTo,
    super.abbr,
    super.aliases = const [],
    this.negatable = true,
    this.hideNegatedUsage = false,
    super.hide = false,
    super.verboseOnly = false,
  });

  /// Whether this flag can be negated with a `--no-` prefix.
  final bool negatable;

  /// Whether to omit negation from usage documentation when [negatable] is
  /// `true`.
  final bool hideNegatedUsage;

  @override
  OptionType get _optionType => OptionType.flag;

  @override
  void addTo(
    ArgParser parser, {
    bool verboseHelp = false,
    bool? hide,
    String? help,
  }) {
    if (_isAlreadyRegistered(parser)) return;

    parser.addFlag(
      name,
      abbr: abbr,
      aliases: aliases,
      help: help ?? this.help,
      defaultsTo: defaultsTo,
      negatable: negatable,
      hideNegatedUsage: hideNegatedUsage,
      hide: _effectiveHide(verboseHelp: verboseHelp, hide: hide),
    );
    _attachDescriptor(parser);
  }
}

/// Descriptor for a boolean flag with a non-`null` default value.
final class FlagDescriptor extends _FlagDescriptorBase<bool> {
  const FlagDescriptor({
    required super.name,
    required super.help,
    super.abbr,
    super.aliases = const [],
    super.defaultsTo = false,
    super.negatable = true,
    super.hideNegatedUsage = false,
    super.hide,
    super.verboseOnly,
  });

  @override
  bool _readValue(ArgResults results) => (results[name] as bool?) ?? defaultsTo;
}

/// Descriptor for a tri-state (`bool?`) flag without a default value.
final class NullableFlagDescriptor extends _FlagDescriptorBase<bool?> {
  const NullableFlagDescriptor({
    required super.name,
    required super.help,
    super.abbr,
    super.aliases = const [],
    super.negatable = true,
    super.hideNegatedUsage = false,
    super.hide,
    super.verboseOnly,
  }) : super(defaultsTo: null);

  @override
  bool? _readValue(ArgResults results) => results[name] as bool?;
}

/// Descriptor for a multi-value string option.
final class MultiStringDescriptor extends OptionDescriptor<List<String>> {
  const MultiStringDescriptor({
    required super.name,
    required super.help,
    super.abbr,
    super.aliases = const [],
    super.valueHelp,
    super.defaultsTo = const [],
    this.splitCommas = true,
    super.allowed,
    super.allowedHelp,
    super.hide,
    super.verboseOnly,
  });

  /// Whether comma-separated values are split into multiple entries.
  final bool splitCommas;

  @override
  OptionType get _optionType => OptionType.multiple;

  @override
  List<String> get _defaultResult => List<String>.unmodifiable(defaultsTo);

  @override
  void addTo(
    ArgParser parser, {
    bool verboseHelp = false,
    bool? hide,
    String? help,
  }) {
    if (_isAlreadyRegistered(parser)) return;

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
  List<String> _readValue(ArgResults results) => switch (results[name]) {
        final List<String> values => List<String>.unmodifiable(values),
        final List<Object?> values =>
          List<String>.unmodifiable([for (final v in values) v as String]),
        _ => _defaultResult,
      };
}

/// Descriptor for a single-value enum option whose parsed value has type [R].
abstract base class _EnumDescriptorBase<T extends Enum, R extends T?>
    extends OptionDescriptor<R> {
  const _EnumDescriptorBase({
    required super.name,
    required super.help,
    required this.values,
    required super.defaultsTo,
    String Function(T value)? nameMapper,
    super.abbr,
    super.aliases = const [],
    super.valueHelp,
    super.allowedHelp,
    super.mandatory = false,
    super.hide = false,
    super.verboseOnly = false,
  }) : _nameMapper = nameMapper;

  /// The enum values allowed for this option.
  final List<T> values;

  final String Function(T value)? _nameMapper;

  String _formatName(T value) {
    if (_nameMapper case final mapper?) return mapper(value);
    if (value case final CliEnum cliEnum) return cliEnum.cliName;
    return value.name;
  }

  String? get _defaultString => switch (defaultsTo) {
        final T value => _formatName(value),
        null => null,
      };

  @override
  OptionType get _optionType => OptionType.single;

  @override
  Object? get _parserDefaultsTo => _defaultString;

  @override
  List<String> get allowed => [for (final v in values) _formatName(v)];

  Map<String, String>? _computeAllowedHelp() {
    if (allowedHelp != null) return allowedHelp;
    if (values is List<CliEnum> && values.isNotEmpty) {
      return {
        for (final val in values)
          if (val case final CliEnum cliVal) _formatName(val): cliVal.helpText,
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
    if (_isAlreadyRegistered(parser)) return;

    parser.addOption(
      name,
      abbr: abbr,
      aliases: aliases,
      help: help ?? this.help,
      valueHelp: valueHelp,
      defaultsTo: _defaultString,
      allowed: allowed,
      allowedHelp: _computeAllowedHelp(),
      mandatory: mandatory,
      hide: _effectiveHide(verboseHelp: verboseHelp, hide: hide),
    );
    _attachDescriptor(parser);
  }

  T? _parseEnumOption(ArgResults results) {
    final raw = results[name] as String?;
    if (raw == null) return null;
    return _parse(raw) ??
        (throw FormatException(
          'Invalid enum value for option "--$name"',
          raw,
        ));
  }

  T? _parse(String raw) {
    for (final val in values) {
      if (_formatName(val) == raw) return val;
    }
    return null;
  }
}

/// Descriptor for a single-value enum option without a default value.
final class EnumDescriptor<T extends Enum> extends _EnumDescriptorBase<T, T?> {
  const EnumDescriptor({
    required super.name,
    required super.help,
    required super.values,
    super.nameMapper,
    super.abbr,
    super.valueHelp,
    super.aliases = const [],
    super.allowedHelp,
    super.mandatory = false,
    super.hide = false,
    super.verboseOnly = false,
  }) : super(defaultsTo: null);

  @override
  T? _readValue(ArgResults results) => _parseEnumOption(results);
}

/// Descriptor for a single-value enum option with a non-`null` default value.
final class DefaultedEnumDescriptor<T extends Enum>
    extends _EnumDescriptorBase<T, T> {
  const DefaultedEnumDescriptor({
    required super.name,
    required super.help,
    required super.values,
    required super.defaultsTo,
    super.nameMapper,
    super.abbr,
    super.valueHelp,
    super.aliases = const [],
    super.allowedHelp,
    super.hide = false,
    super.verboseOnly = false,
  });

  @override
  T _readValue(ArgResults results) => _parseEnumOption(results) ?? defaultsTo;
}
