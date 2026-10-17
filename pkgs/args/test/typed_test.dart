// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:args/args.dart';
import 'package:args/src/typed/option_descriptor.dart';
import 'package:args/src/typed/safe_arg_results.dart';
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

    test(
      'wholesale imperative ArgParser clones and FakeArgResults preserve '
      'typed lookup',
      () {
        const targetOpt = DefaultedStringOptionDescriptor(
          name: 'target',
          help: 'Target file',
          defaultsTo: 'lib/main.dart',
        );
        final sourceParser = ArgParser()..addDescriptor(targetOpt);

        final imperativeClone = ArgParser();
        for (final option in sourceParser.options.values) {
          imperativeClone.addOption(
            option.name,
            help: option.help,
            defaultsTo: option.defaultsTo as String?,
          );
        }
        expect(targetOpt.isRegisteredOnParser(imperativeClone), isTrue);
        final cloneResults = imperativeClone.parse(['--target=lib/other.dart']);
        expect(cloneResults.getValue(targetOpt), equals('lib/other.dart'));
        expect(cloneResults.wasProvided(targetOpt), isTrue);

        final fakeResults = _FakeArgResults({'target': 'lib/fake.dart'});
        expect(fakeResults.hasOption(targetOpt), isTrue);
        expect(fakeResults.wasProvided(targetOpt), isTrue);
        expect(fakeResults.getValue(targetOpt), equals('lib/fake.dart'));
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

        final defaultRootResults = rootParser.parse(['sub']);
        final defaultSubResults = defaultRootResults.command!;
        expect(defaultSubResults.hasOption(globalShared), isTrue);
        expect(defaultSubResults.hasOption(localShadow), isTrue);
        expect(defaultSubResults.getValue(globalShared), 'global_default');
        expect(defaultSubResults.getValue(localShadow), 'local_default');
        expect(globalShared.isRegisteredOnParser(subParser), isFalse);
        expect(localShadow.isRegisteredOnParser(subParser), isTrue);

        final subPassedRoot = rootParser.parse([
          'sub',
          '--shared-opt=sub_custom',
        ]);
        final subPassedSub = subPassedRoot.command!;
        expect(subPassedSub.wasProvided(localShadow), isTrue);
        expect(subPassedSub.getValue(localShadow), 'sub_custom');
        expect(subPassedSub.wasProvided(globalShared), isFalse);
        expect(subPassedSub.getValue(globalShared), 'global_default');

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
