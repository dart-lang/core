// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:args/typed.dart';
import 'package:test/test.dart';

void main() {
  group('StringOptionDescriptor', () {
    const descriptor = StringOptionDescriptor(
      name: 'output',
      abbr: 'o',
      aliases: ['out'],
      defaultsTo: 'build/output',
      help: 'Output directory',
      valueHelp: 'DIR',
      allowed: ['build/output', 'dist/output'],
    );

    test('registers on parser and parses default', () {
      final parser = ArgParser();
      descriptor.addTo(parser);

      final results = parser.parse([]);
      expect(descriptor.getValue(results), equals('build/output'));
      expect(descriptor.wasProvided(results), isFalse);
      expect(descriptor.isRegistered(results), isTrue);
      expect(parser.options['output']!.descriptor, same(descriptor));
    });

    test('isRegistered is true even when defaultsTo is null and omitted', () {
      const nullableStr = StringOptionDescriptor(
        name: 'nullable-str',
        help: 'Nullable string option',
      );
      final parser = ArgParser()..addOptionDescriptor(nullableStr);
      final results = parser.parse([]);

      expect(results.options.contains('nullable-str'), isFalse);
      expect(nullableStr.isRegistered(results), isTrue);
      expect(results.hasOption(nullableStr), isTrue);
      expect(results.getValue(nullableStr), isNull);
    });

    test('parses provided value', () {
      final parser = ArgParser();
      descriptor.addTo(parser);

      final results = parser.parse(['--output', 'dist/output']);
      expect(descriptor.getValue(results), equals('dist/output'));
      expect(descriptor.wasProvided(results), isTrue);
    });

    test('respects aliases and abbreviations', () {
      final parser = ArgParser();
      descriptor.addTo(parser);

      final results = parser.parse(['-o', 'dist/output']);
      expect(descriptor.getValue(results), equals('dist/output'));
      expect(descriptor.wasProvided(results), isTrue);

      final resultsAlias = parser.parse(['--out', 'dist/output']);
      expect(descriptor.getValue(resultsAlias), equals('dist/output'));
      expect(descriptor.wasProvided(resultsAlias), isTrue);
    });

    test('identical descriptor registration is idempotent', () {
      final parser = ArgParser();
      descriptor.addTo(parser);
      descriptor.addTo(parser);
      expect(parser.options.containsKey('output'), isTrue);
    });

    test('conflicting descriptor throws ArgumentError', () {
      final parser = ArgParser();
      descriptor.addTo(parser);

      const conflicting = StringOptionDescriptor(
        name: 'output',
        help: 'Different help',
      );
      expect(() => conflicting.addTo(parser), throwsA(isA<ArgumentError>()));
    });

    test('conflicting with imperative option throws ArgumentError', () {
      final parser = ArgParser()..addOption('output', help: 'Imperative');
      expect(parser.options['output']!.descriptor, isNull);
      expect(() => descriptor.addTo(parser), throwsA(isA<ArgumentError>()));
    });
  });

  group('FlagOptionDescriptor', () {
    const flag = FlagOptionDescriptor(
      name: 'verbose',
      abbr: 'v',
      defaultsTo: false,
      help: 'Enable verbose logging',
    );

    test('defaults and overrides work', () {
      final parser = ArgParser();
      flag.addTo(parser);

      final defaultResults = parser.parse([]);
      expect(flag.getValue(defaultResults), isFalse);
      expect(flag.wasProvided(defaultResults), isFalse);

      final trueResults = parser.parse(['-v']);
      expect(flag.getValue(trueResults), isTrue);
      expect(flag.wasProvided(trueResults), isTrue);

      final falseResults = parser.parse(['--no-verbose']);
      expect(flag.getValue(falseResults), isFalse);
      expect(flag.wasProvided(falseResults), isTrue);
    });
  });

  group('NullableFlagOptionDescriptor', () {
    const nullFlag = NullableFlagOptionDescriptor(
      name: 'tree-shake',
      help: 'Whether to enable tree shaking',
    );

    test('returns null when omitted, true/false when present', () {
      final parser = ArgParser();
      nullFlag.addTo(parser);

      final defaultResults = parser.parse([]);
      expect(nullFlag.getValue(defaultResults), isNull);
      expect(nullFlag.wasProvided(defaultResults), isFalse);
      expect(nullFlag.isRegistered(defaultResults), isTrue);
      expect(defaultResults.hasOption(nullFlag), isTrue);

      final trueResults = parser.parse(['--tree-shake']);
      expect(nullFlag.getValue(trueResults), isTrue);
      expect(nullFlag.wasProvided(trueResults), isTrue);

      final falseResults = parser.parse(['--no-tree-shake']);
      expect(nullFlag.getValue(falseResults), isFalse);
      expect(nullFlag.wasProvided(falseResults), isTrue);
    });

    test('respects negatable: false', () {
      const nonNegatable = NullableFlagOptionDescriptor(
        name: 'only-enable',
        help: 'Cannot be negated',
        negatable: false,
      );
      final parser = ArgParser();
      nonNegatable.addTo(parser);

      expect(parser.options['only-enable']!.negatable, isFalse);
      expect(
        () => parser.parse(['--no-only-enable']),
        throwsA(isA<ArgParserException>()),
      );
    });
  });

  group('MultiOptionDescriptor', () {
    const multi = MultiOptionDescriptor(
      name: 'define',
      abbr: 'D',
      help: 'Key-value defines',
      defaultsTo: ['k=v'],
    );

    test('defaults and multiple values work', () {
      final parser = ArgParser();
      multi.addTo(parser);

      final defaultResults = parser.parse([]);
      expect(multi.getValue(defaultResults), equals(['k=v']));
      expect(multi.wasProvided(defaultResults), isFalse);

      final parsedResults = parser.parse(['-D', 'foo=bar', '-D', 'baz=qux']);
      expect(multi.getValue(parsedResults), equals(['foo=bar', 'baz=qux']));
      expect(multi.wasProvided(parsedResults), isTrue);
    });
  });

  group('OptionScope & automatic root resolution', () {
    const globalOpt = StringOptionDescriptor(
      name: 'global-opt',
      help: 'Global option',
      scope: OptionScope.global,
    );
    const anyOpt = StringOptionDescriptor(
      name: 'any-opt',
      help: 'Any scope option',
      scope: OptionScope.any,
    );

    test('resolves from root automatically without passing globalResults', () {
      final rootParser = ArgParser();
      globalOpt.addTo(rootParser);
      anyOpt.addTo(rootParser);

      final branchParser = rootParser.addCommand('branch');
      branchParser.addCommand('leaf');

      final globalResults = rootParser.parse([
        '--global-opt',
        'glob_val',
        '--any-opt',
        'any_val',
        'branch',
        'leaf',
      ]);
      final branchResults = globalResults.command!;
      final leafResults = branchResults.command!;

      expect(branchResults.getValue(globalOpt), equals('glob_val'));
      expect(branchResults.wasProvided(globalOpt), isTrue);
      expect(leafResults.getValue(globalOpt), equals('glob_val'));
      expect(leafResults.wasProvided(globalOpt), isTrue);

      expect(leafResults.getValue(anyOpt), equals('any_val'));
      expect(leafResults.wasProvided(anyOpt), isTrue);
    });

    test('OptionScope.any prefers local registration when neither is parsed',
        () {
      const localDefault = DefaultedStringOptionDescriptor(
        name: 'shared-opt',
        help: 'Shared option',
        defaultsTo: 'local_default',
        scope: OptionScope.any,
      );
      const globalDefault = DefaultedStringOptionDescriptor(
        name: 'shared-opt',
        help: 'Shared option',
        defaultsTo: 'global_default',
        scope: OptionScope.any,
      );

      final rootParser = ArgParser()..addOptionDescriptor(globalDefault);
      final subParser = rootParser.addCommand('sub')
        ..addOptionDescriptor(localDefault);

      final rootResults = rootParser.parse(['sub']);
      final subResults = rootResults.command!;

      expect(subParser.options.containsKey('shared-opt'), isTrue);
      expect(subResults.getValue(localDefault), equals('local_default'));
    });
  });

  group('EnumOptionDescriptor & DefaultedEnumOptionDescriptor', () {
    const modeOpt = EnumOptionDescriptor<TestMode>(
      name: 'mode',
      abbr: 'm',
      help: 'Execution mode',
      values: TestMode.values,
      defaultsTo: TestMode.balanced,
    );

    const priorityOpt = DefaultedEnumOptionDescriptor<TestPriority>(
      name: 'priority',
      abbr: 'p',
      help: 'Priority tier',
      values: TestPriority.values,
      nameMapper: _priorityLabel,
      defaultsTo: TestPriority.p1,
    );

    test('derives allowed values automatically from enum', () {
      final parser = ArgParser();
      modeOpt.addTo(parser);

      expect(
        parser.options['mode']?.allowed,
        equals(['fast', 'slow', 'balanced']),
      );
      expect(parser.options['mode']?.defaultsTo, equals('balanced'));

      final defaultResults = parser.parse([]);
      expect(modeOpt.getValue(defaultResults), equals(TestMode.balanced));
      expect(modeOpt.wasProvided(defaultResults), isFalse);

      final customResults = parser.parse(['--mode=fast']);
      expect(modeOpt.getValue(customResults), equals(TestMode.fast));
      expect(modeOpt.wasProvided(customResults), isTrue);
    });

    test('respects custom nameMapper and returns non-nullable Enum T', () {
      final parser = ArgParser();
      priorityOpt.addTo(parser);

      expect(parser.options['priority']?.allowed, equals(['P0', 'P1', 'P2']));
      expect(parser.options['priority']?.defaultsTo, equals('P1'));

      final defaultResults = parser.parse([]);
      final defaultPri = priorityOpt.getValue(defaultResults);
      expect(defaultPri, equals(TestPriority.p1));

      final customResults = parser.parse(['-p', 'P0']);
      final customPri = priorityOpt.getValue(customResults);
      expect(customPri, equals(TestPriority.p0));
    });

    test('auto-derives allowed and allowedHelp when T implements CliEnum', () {
      const descriptor = DefaultedEnumOptionDescriptor<TestCliStrategy>(
        name: 'strategy',
        help: 'Strategy option',
        values: TestCliStrategy.values,
        defaultsTo: TestCliStrategy.alpha,
      );
      final parser = ArgParser();
      descriptor.addTo(parser);

      expect(
        parser.options['strategy']!.allowed,
        equals(['alpha-strategy', 'beta-strategy']),
      );
      expect(
        parser.options['strategy']!.allowedHelp,
        equals({
          'alpha-strategy': 'Primary alpha strategy',
          'beta-strategy': 'Secondary beta strategy',
        }),
      );

      final parsedResults = parser.parse(['--strategy=beta-strategy']);
      expect(descriptor.getValue(parsedResults), equals(TestCliStrategy.beta));
      expect(descriptor.wasProvided(parsedResults), isTrue);
    });
  });

  group('IntOptionDescriptor & DefaultedIntOptionDescriptor', () {
    const portOpt = IntOptionDescriptor(name: 'port', help: 'Port number');
    const timeoutOpt = DefaultedIntOptionDescriptor(
      name: 'timeout',
      help: 'Timeout in seconds',
      defaultsTo: 30,
    );

    test('parses valid integer and defaults', () {
      final parser = ArgParser()
        ..addOptionDescriptors(const [portOpt, timeoutOpt]);

      final defaultResults = parser.parse([]);
      expect(defaultResults.getValue(portOpt), isNull);
      expect(defaultResults.getValue(timeoutOpt), equals(30));

      final customResults = parser.parse(['--port=8080', '--timeout=120']);
      expect(customResults.getValue(portOpt), equals(8080));
      expect(customResults.getValue(timeoutOpt), equals(120));
    });

    test('throws FormatException on invalid integer string', () {
      final parser = ArgParser()..addOptionDescriptor(portOpt);
      final results = parser.parse(['--port=not-a-number']);
      expect(
        () => results.getValue(portOpt),
        throwsA(isA<FormatException>()),
      );
    });
  });

  group('OptionBundle, ValueOptionBundle & CommandSafeArgResults', () {
    test('registers diamond sub-bundles idempotently and parses bundles', () {
      final runner = CommandRunner<void>('test', 'test');
      final command = SafeTestCommand();
      runner.addCommand(command);

      runner.run(['safe-test', '--opt', 'hello']);

      expect(command.getValue(SafeTestCommand.opt), equals('hello'));
      expect(command.wasProvided(SafeTestCommand.opt), isTrue);
      expect(command.hasOption(SafeTestCommand.opt), isTrue);
      expect(command.hasOption(SafeTestCommand.unadded), isFalse);
      expect(
        command.getBundle(const SafeBundle()),
        equals((true, 'hello', null)),
      );
    });

    test(
      'Command.getValue and getBundle convert FormatException into '
      'UsageException',
      () {
        final runner = CommandRunner<void>('test', 'test');
        final command = SafeTestCommand();
        runner.addCommand(command);

        runner.run(['safe-test', '--port=not-an-int']);

        expect(
          () => command.getValue(SafeTestCommand.port),
          throwsA(isA<UsageException>()),
        );
        expect(
          () => command.getBundle(const SafeBundle()),
          throwsA(isA<UsageException>()),
        );
      },
    );
  });
}

enum TestMode { fast, slow, balanced }

enum TestPriority {
  p0('P0'),
  p1('P1'),
  p2('P2');

  final String label;
  const TestPriority(this.label);
}

String _priorityLabel(TestPriority p) => p.label;

enum TestCliStrategy implements CliEnum {
  alpha('alpha-strategy', 'Primary alpha strategy'),
  beta('beta-strategy', 'Secondary beta strategy');

  @override
  final String cliName;

  @override
  final String helpText;

  const TestCliStrategy(this.cliName, this.helpText);
}

class SafeBundle extends ValueOptionBundle<(bool, String?, int?)> {
  const SafeBundle();

  @override
  List<OptionDescriptor<Object?>> get descriptors => const [
        SafeTestCommand.flag,
        SafeTestCommand.opt,
        SafeTestCommand.port,
      ];

  @override
  (bool, String?, int?) parse(
    ArgResults? results, {
    ArgResults? globalResults,
  }) =>
      (
        SafeTestCommand.flag.getValue(results, globalResults: globalResults),
        SafeTestCommand.opt.getValue(results, globalResults: globalResults),
        SafeTestCommand.port.getValue(results, globalResults: globalResults),
      );
}

class SafeTestCommand extends Command<void> {
  SafeTestCommand() {
    registerOptionBundles(const [SafeBundle()]);
  }

  static const flag = FlagOptionDescriptor(
    name: 'flag',
    help: 'A test flag',
    defaultsTo: true,
  );

  static const opt = StringOptionDescriptor(name: 'opt', help: 'A test option');

  static const port = IntOptionDescriptor(name: 'port', help: 'A test port');

  static const unadded = FlagOptionDescriptor(
    name: 'unadded',
    help: 'Not added to parser',
  );

  @override
  String get name => 'safe-test';

  @override
  String get description => 'Safe test command';

  @override
  void run() {}
}
