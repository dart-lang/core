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
      expect(descriptor.aliases, equals(['out']));
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

    test('supports verboseOnly, verboseHelp, hide, and help overrides', () {
      const verboseOpt = FlagOptionDescriptor(
        name: 'experimental-flag',
        help: 'Experimental flag',
        verboseOnly: true,
      );

      final normalParser = ArgParser()..addOptionDescriptor(verboseOpt);
      expect(normalParser.options['experimental-flag']!.hide, isTrue);

      final verboseParser = ArgParser()
        ..addOptionDescriptor(verboseOpt, verboseHelp: true);
      expect(verboseParser.options['experimental-flag']!.hide, isFalse);

      final overrideParser = ArgParser()
        ..addDescriptor(
          descriptor,
          hide: true,
          help: 'Output directory (default mode)',
        );
      expect(overrideParser.options['output']!.hide, isTrue);
      expect(
        overrideParser.options['output']!.help,
        equals('Output directory (default mode)'),
      );
      expect(overrideParser.options['output']!.descriptor, same(descriptor));

      final overrideResults = overrideParser.parse(['--output=dist/output']);
      expect(overrideResults.wasProvided(descriptor), isTrue);
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

    test('defaultsTo defaults to empty list when omitted in constructor', () {
      const bareMulti = MultiOptionDescriptor(
        name: 'tag',
        help: 'Tags',
      );
      expect(bareMulti.defaultsTo, equals(const <String>[]));

      final parser = ArgParser()..addOptionDescriptor(bareMulti);
      final results = parser.parse([]);
      expect(bareMulti.getValue(results), isEmpty);
    });

    test('returns unmodifiable list and respects splitCommas: false', () {
      const noSplitMulti = MultiOptionDescriptor(
        name: 'header',
        help: 'HTTP headers',
        splitCommas: false,
      );
      final parser = ArgParser()..addDescriptors(const [multi, noSplitMulti]);
      final results = parser.parse(['-D', 'a=1,b=2', '--header=Accept: a,b']);

      final defines = results.getValue(multi);
      expect(defines, equals(['a=1', 'b=2']));
      expect(() => defines.add('c=3'), throwsUnsupportedError);

      final headers = results.getValue(noSplitMulti);
      expect(headers, equals(['Accept: a,b']));
      expect(headers.clear, throwsUnsupportedError);
    });
  });

  group('Descriptor identity in isRegistered, isRegisteredOnParser & getValue',
      () {
    const commonFatalWarnings = FlagOptionDescriptor(
      name: 'fatal-warnings',
      help: 'Common logger fatal warnings',
      defaultsTo: false,
    );
    const analyzeFatalWarnings = FlagOptionDescriptor(
      name: 'fatal-warnings',
      help: 'Analyze exit code fatal warnings',
      defaultsTo: true,
    );
    const stringCollision = StringOptionDescriptor(
      name: 'fatal-warnings',
      help: 'Colliding string option',
    );

    test(
      'imperative option with same name does not match descriptor identity',
      () {
        final parser = ArgParser()
          ..addFlag(
            'fatal-warnings',
            defaultsTo: true,
            help: 'Imperative flag',
          );
        expect(commonFatalWarnings.isRegisteredOnParser(parser), isFalse);

        final results = parser.parse(['--fatal-warnings']);
        expect(commonFatalWarnings.isRegistered(results), isFalse);
        expect(results.hasOption(commonFatalWarnings), isFalse);
        expect(commonFatalWarnings.wasProvided(results), isFalse);
        expect(commonFatalWarnings.wasParsed(results), isFalse);
        expect(commonFatalWarnings.getValue(results), isFalse);
      },
    );

    test(
      'distinct descriptor with same name does not match other descriptor',
      () {
        final parser = ArgParser()..addDescriptor(analyzeFatalWarnings);
        expect(analyzeFatalWarnings.isRegisteredOnParser(parser), isTrue);
        expect(commonFatalWarnings.isRegisteredOnParser(parser), isFalse);
        expect(stringCollision.isRegisteredOnParser(parser), isFalse);

        final results = parser.parse([]);
        expect(results.hasOption(analyzeFatalWarnings), isTrue);
        expect(results.hasOption(commonFatalWarnings), isFalse);
        expect(results.hasOption(stringCollision), isFalse);
        expect(results.getValue(analyzeFatalWarnings), isTrue);
        expect(results.getValue(commonFatalWarnings), isFalse);
        expect(results.getValue(stringCollision), isNull);

        final parsedResults = parser.parse(['--no-fatal-warnings']);
        expect(parsedResults.wasProvided(analyzeFatalWarnings), isTrue);
        expect(parsedResults.wasProvided(commonFatalWarnings), isFalse);
        expect(parsedResults.getValue(analyzeFatalWarnings), isFalse);
      },
    );
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

    test(
      'OptionScope.any prefers local registration when same descriptor is on '
      'both parsers and neither is parsed',
      () {
        const sharedDescriptor = DefaultedStringOptionDescriptor(
          name: 'shared-opt',
          help: 'Shared option',
          defaultsTo: 'shared_default',
          scope: OptionScope.any,
        );

        final rootParser = ArgParser()..addOptionDescriptor(sharedDescriptor);
        final subParser = rootParser.addCommand('sub')
          ..addOptionDescriptor(sharedDescriptor);

        final rootResults = rootParser.parse(['sub']);
        final subResults = rootResults.command!;

        expect(subParser.options.containsKey('shared-opt'), isTrue);
        expect(subResults.hasOption(sharedDescriptor), isTrue);
        expect(subResults.getValue(sharedDescriptor), equals('shared_default'));
      },
    );

    test(
      'OptionScope.any falls back to global when subcommand shadows option '
      'name with a different descriptor or imperative option',
      () {
        const globalShared = DefaultedStringOptionDescriptor(
          name: 'shared-opt',
          help: 'Global shared option',
          defaultsTo: 'global_default',
          scope: OptionScope.any,
        );
        const localShadow = DefaultedStringOptionDescriptor(
          name: 'shared-opt',
          help: 'Local shadow option',
          defaultsTo: 'local_default',
          scope: OptionScope.any,
        );

        final rootParser = ArgParser()..addOptionDescriptor(globalShared);
        final subParser = rootParser.addCommand('sub')
          ..addOptionDescriptor(localShadow);

        // Neither passed: each descriptor resolves against the parser where
        // that specific descriptor instance was registered.
        final defaultRootResults = rootParser.parse(['sub']);
        final defaultSubResults = defaultRootResults.command!;
        expect(defaultSubResults.hasOption(globalShared), isTrue);
        expect(defaultSubResults.hasOption(localShadow), isTrue);
        expect(defaultSubResults.getValue(globalShared), 'global_default');
        expect(defaultSubResults.getValue(localShadow), 'local_default');
        expect(globalShared.isRegisteredOnParser(subParser), isFalse);
        expect(localShadow.isRegisteredOnParser(subParser), isTrue);

        // Passed on subcommand only: localShadow sees it, globalShared does
        // not get hijacked by subResults and still returns global_default.
        final subPassedRoot = rootParser.parse([
          'sub',
          '--shared-opt=sub_custom',
        ]);
        final subPassedSub = subPassedRoot.command!;
        expect(subPassedSub.wasProvided(localShadow), isTrue);
        expect(subPassedSub.getValue(localShadow), 'sub_custom');
        expect(subPassedSub.wasProvided(globalShared), isFalse);
        expect(subPassedSub.getValue(globalShared), 'global_default');

        // Passed globally AND locally: each descriptor sees its own value.
        final bothPassedRoot = rootParser.parse([
          '--shared-opt=glob_custom',
          'sub',
          '--shared-opt=sub_custom',
        ]);
        final bothPassedSub = bothPassedRoot.command!;
        expect(bothPassedSub.wasProvided(globalShared), isTrue);
        expect(bothPassedSub.getValue(globalShared), 'glob_custom');
        expect(bothPassedSub.wasProvided(localShadow), isTrue);
        expect(bothPassedSub.getValue(localShadow), 'sub_custom');
      },
    );
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

    test('throws FormatException when custom valueParser returns null', () {
      final strictEnum = EnumOptionDescriptor<TestMode>(
        name: 'mode',
        help: 'Execution mode',
        values: TestMode.values,
        valueParser: (raw) => raw == 'fast' ? TestMode.fast : null,
      );
      final parser = ArgParser()..addDescriptor(strictEnum);
      final validResults = parser.parse(['--mode=fast']);
      expect(validResults.getValue(strictEnum), equals(TestMode.fast));

      final rejectedResults = parser.parse(['--mode=slow']);
      expect(
        () => rejectedResults.getValue(strictEnum),
        throwsA(isA<FormatException>()),
      );
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

    test('throws ArgParserException at parse time on invalid integer string',
        () {
      final parser = ArgParser()..addOptionDescriptor(portOpt);
      expect(
        () => parser.parse(['--port=not-a-number']),
        throwsA(isA<ArgParserException>()),
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
      'CommandRunner.run throws UsageException at parse time on invalid int',
      () {
        final runner = CommandRunner<void>('test', 'test');
        final command = SafeTestCommand();
        runner.addCommand(command);

        expect(
          () => runner.run(['safe-test', '--port=not-an-int']),
          throwsA(isA<UsageException>()),
        );
      },
    );

    test(
      'Command.hasOption works pre-parse and post-parse across local, global, '
      'and any scopes while enforcing descriptor identity',
      () async {
        const globalDescriptor = FlagOptionDescriptor(
          name: 'global-flag',
          help: 'Global flag',
          scope: OptionScope.global,
        );
        const collidingGlobalDescriptor = FlagOptionDescriptor(
          name: 'global-flag',
          help: 'Colliding global flag',
          scope: OptionScope.global,
        );
        const anyGlobalOnly = StringOptionDescriptor(
          name: 'any-global',
          help: 'Any option registered globally',
          scope: OptionScope.any,
        );
        const anyLocalShadowed = StringOptionDescriptor(
          name: 'any-global',
          help: 'Local shadow of any-global',
          scope: OptionScope.any,
        );
        const localCollisionDescriptor = FlagOptionDescriptor(
          name: 'fatal-warnings',
          help: 'Common fatal warnings',
        );

        final runner = CommandRunner<void>('test', 'test');
        runner.argParser
          ..addDescriptor(globalDescriptor)
          ..addDescriptor(anyGlobalOnly);

        final command = SafeTestCommand();
        command.argParser
          ..addDescriptor(anyLocalShadowed)
          ..addFlag(
            'fatal-warnings',
            defaultsTo: true,
            help: 'Imperative analyze fatal warnings',
          );

        // Pre-parse before adding to runner: local & local-any work; global is
        // false because runner is still null.
        expect(command.argResults, isNull);
        expect(command.hasOption(SafeTestCommand.opt), isTrue);
        expect(command.hasOption(SafeTestCommand.unadded), isFalse);
        expect(command.hasOption(localCollisionDescriptor), isFalse);
        expect(command.hasOption(anyLocalShadowed), isTrue);
        expect(command.hasOption(globalDescriptor), isFalse);
        expect(command.hasOption(anyGlobalOnly), isFalse);

        // Pre-parse after adding to runner: global and global-registered any
        // descriptors now resolve via runner.argParser.
        runner.addCommand(command);
        expect(command.argResults, isNull);
        expect(command.hasOption(globalDescriptor), isTrue);
        expect(command.hasOption(collidingGlobalDescriptor), isFalse);
        expect(command.hasOption(anyGlobalOnly), isTrue);
        expect(command.hasOption(anyLocalShadowed), isTrue);
        expect(command.hasOption(localCollisionDescriptor), isFalse);

        // Post-parse after runner.run: all scopes continue to resolve with
        // strict descriptor identity.
        await runner.run([
          '--global-flag',
          '--any-global=from-root',
          'safe-test',
          '--any-global=from-sub',
          '--fatal-warnings',
        ]);
        expect(command.argResults, isNotNull);
        expect(command.hasOption(SafeTestCommand.opt), isTrue);
        expect(command.hasOption(SafeTestCommand.unadded), isFalse);
        expect(command.hasOption(localCollisionDescriptor), isFalse);
        expect(command.getValue(localCollisionDescriptor), isFalse);
        expect(command.hasOption(globalDescriptor), isTrue);
        expect(command.hasOption(collidingGlobalDescriptor), isFalse);
        expect(command.getValue(globalDescriptor), isTrue);
        expect(command.hasOption(anyGlobalOnly), isTrue);
        expect(command.hasOption(anyLocalShadowed), isTrue);
        expect(command.getValue(anyGlobalOnly), equals('from-root'));
        expect(command.getValue(anyLocalShadowed), equals('from-sub'));
      },
    );

    test(
      'OptionBundle hide override works across register, registerOnCommand, '
      'registerOptionBundle, registerOptionBundles, and registerBundle',
      () {
        const bundle = VisibilityTestBundle();

        // Default registration: hiddenOpt is hidden, visibleOpt is visible,
        // verboseOpt is hidden unless verboseHelp: true.
        final defaultParser = ArgParser()..registerBundle(bundle);
        expect(defaultParser.options['visible-opt']!.hide, isFalse);
        expect(defaultParser.options['hidden-opt']!.hide, isTrue);
        expect(defaultParser.options['verbose-opt']!.hide, isTrue);
        expect(defaultParser.options['sub-hidden-opt']!.hide, isTrue);

        // Force hide: false across bundle and subBundles.
        final unhiddenParser = ArgParser()..registerBundle(bundle, hide: false);
        expect(unhiddenParser.options['visible-opt']!.hide, isFalse);
        expect(unhiddenParser.options['hidden-opt']!.hide, isFalse);
        expect(unhiddenParser.options['verbose-opt']!.hide, isFalse);
        expect(unhiddenParser.options['sub-hidden-opt']!.hide, isFalse);

        // Force hide: true even when verboseHelp: true via registerBundles.
        final forcedHiddenParser = ArgParser()
          ..registerBundles(const [bundle], verboseHelp: true, hide: true);
        expect(forcedHiddenParser.options['visible-opt']!.hide, isTrue);
        expect(forcedHiddenParser.options['hidden-opt']!.hide, isTrue);
        expect(forcedHiddenParser.options['verbose-opt']!.hide, isTrue);
        expect(forcedHiddenParser.options['sub-hidden-opt']!.hide, isTrue);

        // Command.registerOptionBundle & registerOptionBundles with hide.
        final cmdUnhidden = EmptyTestCommand()
          ..registerOptionBundle(bundle, hide: false);
        expect(cmdUnhidden.argParser.options['hidden-opt']!.hide, isFalse);
        expect(cmdUnhidden.argParser.options['sub-hidden-opt']!.hide, isFalse);

        final cmdHidden = EmptyTestCommand()
          ..registerOptionBundles(
            const [bundle],
            verboseHelp: true,
            hide: true,
          );
        expect(cmdHidden.argParser.options['visible-opt']!.hide, isTrue);
        expect(cmdHidden.argParser.options['verbose-opt']!.hide, isTrue);

        final cmdDirect = EmptyTestCommand();
        bundle.registerOnCommand(cmdDirect, hide: false);
        expect(cmdDirect.argParser.options['hidden-opt']!.hide, isFalse);
      },
    );

    test(
      'OptionBundle.title adds separator once even on repeated registration '
      'and Command.wasParsed matches wasProvided',
      () async {
        const bundle = TitledTestBundle();
        final parser = ArgParser()
          ..registerBundle(bundle)
          ..registerBundle(bundle);
        final matches = '=== Build Options ==='.allMatches(parser.usage).length;
        expect(matches, equals(1));

        final runner = CommandRunner<void>('test', 'test');
        final command = SafeTestCommand();
        runner.addCommand(command);
        expect(command.wasParsed(SafeTestCommand.opt), isFalse);
        expect(command.getValue(SafeTestCommand.flag), isTrue);

        await runner.run(['safe-test', '--opt=val']);
        expect(command.wasParsed(SafeTestCommand.opt), isTrue);
        expect(command.wasParsed(SafeTestCommand.flag), isFalse);
      },
    );

    test(
      'Option.copyTo and wholesale imperative ArgParser clones preserve '
      'typed lookup, and FakeArgResults works without NoSuchMethodError',
      () {
        const portOpt = IntOptionDescriptor(
          name: 'port',
          help: 'Port number',
          defaultsTo: 8080,
        );
        const targetOpt = DefaultedStringOptionDescriptor(
          name: 'target',
          help: 'Target file',
          defaultsTo: 'lib/main.dart',
        );

        final sourceParser = ArgParser()
          ..addDescriptors(const [portOpt, targetOpt]);

        // 1. Lossless copy via Option.copyTo preserves descriptor & validator.
        final copiedParser = ArgParser();
        for (final option in sourceParser.options.values) {
          option.copyTo(copiedParser, hide: true);
        }
        expect(copiedParser.options['port']!.hide, isTrue);
        expect(copiedParser.options['port']!.descriptor, same(portOpt));
        expect(portOpt.isRegisteredOnParser(copiedParser), isTrue);
        expect(
          () => copiedParser.parse(['--port=invalid']),
          throwsA(isA<ArgParserException>()),
        );
        final copiedResults = copiedParser.parse(['--port=9090']);
        expect(copiedResults.getValue(portOpt), equals(9090));
        expect(copiedResults.wasProvided(portOpt), isTrue);

        // 2. Wholesale imperative clone (e.g. HasOverriddenArgParser) fallback.
        final imperativeClone = ArgParser();
        for (final option in sourceParser.options.values) {
          imperativeClone.addOption(
            option.name,
            help: option.help,
            defaultsTo: option.defaultsTo as String?,
          );
        }
        expect(portOpt.isRegisteredOnParser(imperativeClone), isTrue);
        expect(targetOpt.isRegisteredOnParser(imperativeClone), isTrue);
        final cloneResults = imperativeClone.parse(['--target=lib/other.dart']);
        expect(cloneResults.getValue(targetOpt), equals('lib/other.dart'));
        expect(cloneResults.wasProvided(targetOpt), isTrue);

        // 3. Custom FakeArgResults implementing ArgResults works cleanly.
        final fakeResults = _FakeArgResults({'target': 'lib/fake.dart'});
        expect(fakeResults.hasOption(targetOpt), isTrue);
        expect(fakeResults.wasProvided(targetOpt), isTrue);
        expect(fakeResults.getValue(targetOpt), equals('lib/fake.dart'));
        expect(fakeResults.getValue(portOpt), equals(8080));
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
  (bool, String?, int?) parse(ArgResults? results) => (
        SafeTestCommand.flag.getValue(results),
        SafeTestCommand.opt.getValue(results),
        SafeTestCommand.port.getValue(results),
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

class EmptyTestCommand extends Command<void> {
  @override
  String get name => 'empty-test';

  @override
  String get description => 'Empty test command';

  @override
  void run() {}
}

class VisibilityTestBundle extends OptionBundle {
  const VisibilityTestBundle();

  static const visibleOpt = FlagOptionDescriptor(
    name: 'visible-opt',
    help: 'Visible option',
  );
  static const hiddenOpt = FlagOptionDescriptor(
    name: 'hidden-opt',
    help: 'Hidden option',
    hide: true,
  );
  static const verboseOpt = FlagOptionDescriptor(
    name: 'verbose-opt',
    help: 'Verbose-only option',
    verboseOnly: true,
  );

  @override
  List<OptionDescriptor<Object?>> get descriptors => const [
        visibleOpt,
        hiddenOpt,
        verboseOpt,
      ];

  @override
  List<OptionBundle> get subBundles => const [_SubVisibilityTestBundle()];
}

class _SubVisibilityTestBundle extends OptionBundle {
  const _SubVisibilityTestBundle();

  static const subHiddenOpt = FlagOptionDescriptor(
    name: 'sub-hidden-opt',
    help: 'Sub-bundle hidden option',
    hide: true,
  );

  @override
  List<OptionDescriptor<Object?>> get descriptors => const [subHiddenOpt];
}

class TitledTestBundle extends OptionBundle {
  const TitledTestBundle();

  @override
  String get title => '=== Build Options ===';

  @override
  List<OptionDescriptor<Object?>> get descriptors => const [
        VisibilityTestBundle.visibleOpt,
      ];
}

class _FakeArgResults implements ArgResults {
  _FakeArgResults(this._values);

  final Map<String, Object?> _values;

  @override
  dynamic operator [](String name) => _values[name];

  @override
  bool wasParsed(String name) => _values.containsKey(name);

  @override
  Iterable<String> get options => _values.keys;

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError(invocation.memberName.toString());
}
