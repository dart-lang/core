// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:args/args.dart';
import 'package:args/src/typed/cli_enum.dart';
import 'package:args/src/typed/option_descriptor.dart';
import 'package:args/src/typed/typed_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('StringDescriptor & DefaultedStringDescriptor', () {
    const nullableDescriptor = StringDescriptor(
      name: 'config',
      abbr: 'c',
      aliases: ['cfg'],
      help: 'Configuration file path',
      valueHelp: 'FILE',
      allowed: ['dev.yaml', 'prod.yaml'],
    );

    const defaultedDescriptor = DefaultedStringDescriptor(
      name: 'output',
      abbr: 'o',
      aliases: ['out'],
      defaultsTo: 'build/output',
      help: 'Output directory',
      valueHelp: 'DIR',
      allowed: ['build/output', 'dist/output'],
    );

    test('StringDescriptor returns null when omitted and isRegistered is true',
        () {
      final parser = ArgParser()..addDescriptor(nullableDescriptor);
      final results = parser.parse([]);

      expect(results.options.contains('config'), isFalse);
      expect(nullableDescriptor.isRegistered(results), isTrue);
      expect(nullableDescriptor.wasParsed(results), isFalse);
      expect(nullableDescriptor.value(results), isNull);
      expect(nullableDescriptor.flag, equals('--config'));
      expect(parser.options['config']!.descriptor, same(nullableDescriptor));
    });

    test('DefaultedStringDescriptor returns non-null default and parsed value',
        () {
      final parser = ArgParser()..addDescriptor(defaultedDescriptor);

      final defaultResults = parser.parse([]);
      final defaultOut = defaultedDescriptor.value(defaultResults);
      expect(defaultOut.isNotEmpty, isTrue);
      expect(defaultOut, equals('build/output'));
      expect(defaultedDescriptor.wasParsed(defaultResults), isFalse);
      expect(defaultedDescriptor.isRegistered(defaultResults), isTrue);

      final providedResults = parser.parse(['--output', 'dist/output']);
      expect(defaultedDescriptor.value(providedResults), equals('dist/output'));
      expect(defaultedDescriptor.wasParsed(providedResults), isTrue);
    });

    test('respects aliases and abbreviations', () {
      final parser = ArgParser()..addDescriptor(nullableDescriptor);

      final abbrResults = parser.parse(['-c', 'dev.yaml']);
      expect(nullableDescriptor.value(abbrResults), equals('dev.yaml'));
      expect(nullableDescriptor.wasParsed(abbrResults), isTrue);

      final aliasResults = parser.parse(['--cfg', 'prod.yaml']);
      expect(nullableDescriptor.value(aliasResults), equals('prod.yaml'));
      expect(nullableDescriptor.wasParsed(aliasResults), isTrue);
    });

    test('identical descriptor registration is idempotent', () {
      final parser = ArgParser();
      defaultedDescriptor.addTo(parser);
      defaultedDescriptor.addTo(parser);
      expect(parser.options.containsKey('output'), isTrue);
    });

    test('conflicting descriptor throws ArgumentError', () {
      final parser = ArgParser()..addDescriptor(defaultedDescriptor);

      const conflicting = StringDescriptor(
        name: 'output',
        help: 'Different help',
      );
      expect(() => conflicting.addTo(parser), throwsArgumentError);
    });

    test('conflicting with imperative option throws ArgumentError', () {
      final parser = ArgParser()..addOption('output', help: 'Imperative');
      expect(parser.options['output']!.descriptor, isNull);
      expect(() => defaultedDescriptor.addTo(parser), throwsArgumentError);
    });

    test('supports verboseOnly, verboseHelp, hide, and help overrides', () {
      const verboseOpt = FlagDescriptor(
        name: 'experimental-flag',
        help: 'Experimental flag',
        verboseOnly: true,
      );

      final normalParser = ArgParser()..addDescriptor(verboseOpt);
      expect(normalParser.options['experimental-flag']!.hide, isTrue);

      final verboseParser = ArgParser()
        ..addDescriptor(verboseOpt, verboseHelp: true);
      expect(verboseParser.options['experimental-flag']!.hide, isFalse);

      final overrideParser = ArgParser()
        ..addDescriptor(
          defaultedDescriptor,
          hide: true,
          help: 'Output directory (default mode)',
        );
      expect(overrideParser.options['output']!.hide, isTrue);
      expect(
        overrideParser.options['output']!.help,
        equals('Output directory (default mode)'),
      );
      expect(
        overrideParser.options['output']!.descriptor,
        same(defaultedDescriptor),
      );

      final overrideResults = overrideParser.parse(['--output=dist/output']);
      expect(defaultedDescriptor.wasParsed(overrideResults), isTrue);
      expect(defaultedDescriptor.value(overrideResults), equals('dist/output'));
    });
  });

  group('FlagDescriptor & NullableFlagDescriptor', () {
    const flag = FlagDescriptor(
      name: 'verbose',
      abbr: 'v',
      defaultsTo: false,
      help: 'Enable verbose logging',
    );

    const nullFlag = NullableFlagDescriptor(
      name: 'tree-shake',
      help: 'Whether to enable tree shaking',
    );

    test('FlagDescriptor defaults and overrides work', () {
      final parser = ArgParser()..addDescriptor(flag);

      final defaultResults = parser.parse([]);
      expect(flag.value(defaultResults), isFalse);
      expect(flag.wasParsed(defaultResults), isFalse);

      final trueResults = parser.parse(['-v']);
      expect(flag.value(trueResults), isTrue);
      expect(flag.wasParsed(trueResults), isTrue);

      final falseResults = parser.parse(['--no-verbose']);
      expect(flag.value(falseResults), isFalse);
      expect(flag.wasParsed(falseResults), isTrue);
    });

    test('FlagDescriptor supports hideNegatedUsage', () {
      const quietNegation = FlagDescriptor(
        name: 'color',
        help: 'Use ANSI colors.',
        hideNegatedUsage: true,
      );
      final parser = ArgParser()..addDescriptor(quietNegation);

      expect(parser.usage, contains('--color'));
      expect(parser.usage, isNot(contains('--[no-]color')));
      expect(quietNegation.value(parser.parse(['--no-color'])), isFalse);
    });

    test('NullableFlagDescriptor returns null when omitted, bool when passed',
        () {
      final parser = ArgParser()..addDescriptor(nullFlag);

      final defaultResults = parser.parse([]);
      expect(nullFlag.value(defaultResults), isNull);
      expect(nullFlag.wasParsed(defaultResults), isFalse);
      expect(nullFlag.isRegistered(defaultResults), isTrue);

      final trueResults = parser.parse(['--tree-shake']);
      expect(nullFlag.value(trueResults), isTrue);
      expect(nullFlag.wasParsed(trueResults), isTrue);

      final falseResults = parser.parse(['--no-tree-shake']);
      expect(nullFlag.value(falseResults), isFalse);
      expect(nullFlag.wasParsed(falseResults), isTrue);
    });

    test('NullableFlagDescriptor respects negatable: false', () {
      const nonNegatable = NullableFlagDescriptor(
        name: 'only-enable',
        help: 'Cannot be negated',
        negatable: false,
      );
      final parser = ArgParser()..addDescriptor(nonNegatable);

      expect(parser.options['only-enable']!.negatable, isFalse);
      expect(
        () => parser.parse(['--no-only-enable']),
        throwsA(isA<ArgParserException>()),
      );
    });
  });

  group('MultiStringDescriptor', () {
    const multi = MultiStringDescriptor(
      name: 'define',
      abbr: 'D',
      help: 'Key-value defines',
      defaultsTo: ['k=v'],
    );

    test('defaults and multiple values work', () {
      final parser = ArgParser()..addDescriptor(multi);

      final defaultResults = parser.parse([]);
      expect(multi.value(defaultResults), equals(['k=v']));
      expect(multi.wasParsed(defaultResults), isFalse);

      final parsedResults = parser.parse(['-D', 'foo=bar', '-D', 'baz=qux']);
      expect(multi.value(parsedResults), equals(['foo=bar', 'baz=qux']));
      expect(multi.wasParsed(parsedResults), isTrue);
    });

    test('defaultsTo defaults to empty list when omitted in constructor', () {
      const bareMulti = MultiStringDescriptor(
        name: 'tag',
        help: 'Tags',
      );
      expect(bareMulti.defaultsTo, isEmpty);

      final parser = ArgParser()..addDescriptor(bareMulti);
      final results = parser.parse([]);
      expect(bareMulti.value(results), isEmpty);
    });

    test('returns unmodifiable list on value and valueOrDefault', () {
      const noSplitMulti = MultiStringDescriptor(
        name: 'header',
        help: 'HTTP headers',
        splitCommas: false,
      );
      final mutableDefaults = ['initial'];
      final runtimeMulti = MultiStringDescriptor(
        name: 'unregistered-multi',
        help: 'Unregistered multi option',
        defaultsTo: mutableDefaults,
      );

      final parser = ArgParser()..addDescriptors(const [multi, noSplitMulti]);
      final results = parser.parse(['-D', 'a=1,b=2', '--header=Accept: a,b']);

      final defines = multi.value(results);
      expect(defines, equals(['a=1', 'b=2']));
      expect(() => defines.add('c=3'), throwsUnsupportedError);

      final headers = noSplitMulti.value(results);
      expect(headers, equals(['Accept: a,b']));
      expect(headers.clear, throwsUnsupportedError);

      final fallback = runtimeMulti.valueOrDefault(results);
      expect(fallback, equals(['initial']));
      expect(() => fallback.add('mutated'), throwsUnsupportedError);
    });
  });

  group('Registration enforcement & descriptor identity', () {
    const commonFatalWarnings = FlagDescriptor(
      name: 'fatal-warnings',
      help: 'Common logger fatal warnings',
      defaultsTo: false,
    );
    const analyzeFatalWarnings = FlagDescriptor(
      name: 'fatal-warnings',
      help: 'Analyze exit code fatal warnings',
      defaultsTo: true,
    );
    const stringCollision = StringDescriptor(
      name: 'fatal-warnings',
      help: 'Colliding string option',
    );
    const unregisteredOpt = DefaultedStringDescriptor(
      name: 'missing',
      help: 'Never registered',
      defaultsTo: 'fallback',
    );

    test(
      'unregistered option throws on value/wasParsed and falls back on '
      'valueOrDefault',
      () {
        final results = ArgParser().parse([]);
        expect(unregisteredOpt.isRegistered(results), isFalse);
        expect(
          () => unregisteredOpt.value(results),
          throwsA(
            isA<ArgumentError>().having(
              (e) => e.message,
              'message',
              contains('Could not find an option named "--missing"'),
            ),
          ),
        );
        expect(() => unregisteredOpt.wasParsed(results), throwsArgumentError);
        expect(unregisteredOpt.valueOrDefault(results), equals('fallback'));
        expect(stringCollision.valueOrDefault(results), isNull);
      },
    );

    test(
      'imperative option with same name throws ArgumentError on descriptor '
      'value/wasParsed and uses descriptor default on valueOrDefault',
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
        expect(
          () => commonFatalWarnings.value(results),
          throwsA(
            isA<ArgumentError>().having(
              (e) => e.message,
              'message',
              contains('was not registered using this OptionDescriptor'),
            ),
          ),
        );
        expect(
          () => commonFatalWarnings.wasParsed(results),
          throwsArgumentError,
        );
        expect(commonFatalWarnings.valueOrDefault(results), isFalse);
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
        expect(analyzeFatalWarnings.isRegistered(results), isTrue);
        expect(commonFatalWarnings.isRegistered(results), isFalse);
        expect(stringCollision.isRegistered(results), isFalse);

        expect(analyzeFatalWarnings.value(results), isTrue);
        expect(() => commonFatalWarnings.value(results), throwsArgumentError);
        expect(() => stringCollision.value(results), throwsArgumentError);
        expect(commonFatalWarnings.valueOrDefault(results), isFalse);
        expect(stringCollision.valueOrDefault(results), isNull);

        final parsedResults = parser.parse(['--no-fatal-warnings']);
        expect(analyzeFatalWarnings.wasParsed(parsedResults), isTrue);
        expect(analyzeFatalWarnings.value(parsedResults), isFalse);
        expect(
          () => commonFatalWarnings.wasParsed(parsedResults),
          throwsArgumentError,
        );
      },
    );

    test(
      'wholesale imperative ArgParser clones and FakeArgResults preserve '
      'typed lookup',
      () {
        const targetOpt = DefaultedStringDescriptor(
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
        expect(targetOpt.value(cloneResults), equals('lib/other.dart'));
        expect(targetOpt.wasParsed(cloneResults), isTrue);

        final fakeResults = _FakeArgResults({'target': 'lib/fake.dart'});
        expect(targetOpt.isRegistered(fakeResults), isTrue);
        expect(targetOpt.wasParsed(fakeResults), isTrue);
        expect(targetOpt.value(fakeResults), equals('lib/fake.dart'));
      },
    );
  });

  group('EnumDescriptor & DefaultedEnumDescriptor', () {
    const modeOpt = EnumDescriptor<TestMode>(
      name: 'mode',
      abbr: 'm',
      help: 'Execution mode',
      values: TestMode.values,
    );

    const priorityOpt = DefaultedEnumDescriptor<TestPriority>(
      name: 'priority',
      abbr: 'p',
      help: 'Priority tier',
      values: TestPriority.values,
      nameMapper: _priorityLabel,
      defaultsTo: TestPriority.p1,
    );

    test('derives allowed values automatically and returns null when omitted',
        () {
      final parser = ArgParser()..addDescriptor(modeOpt);

      expect(
        parser.options['mode']?.allowed,
        equals(['fast', 'slow', 'balanced']),
      );
      expect(parser.options['mode']?.defaultsTo, isNull);

      final defaultResults = parser.parse([]);
      expect(modeOpt.value(defaultResults), isNull);
      expect(modeOpt.wasParsed(defaultResults), isFalse);
      expect(modeOpt.isRegistered(defaultResults), isTrue);

      final customResults = parser.parse(['--mode=fast']);
      expect(modeOpt.value(customResults), equals(TestMode.fast));
      expect(modeOpt.wasParsed(customResults), isTrue);
    });

    test(
      'respects custom nameMapper, returns non-nullable Enum T, and rejects '
      'unmapped enum identifier names',
      () {
        final parser = ArgParser()..addDescriptor(priorityOpt);

        expect(parser.options['priority']?.allowed, equals(['P0', 'P1', 'P2']));
        expect(parser.options['priority']?.defaultsTo, equals('P1'));

        final defaultResults = parser.parse([]);
        final defaultPri = priorityOpt.value(defaultResults);
        expect(defaultPri.label, equals('P1'));
        expect(defaultPri, equals(TestPriority.p1));

        final customResults = parser.parse(['-p', 'P0']);
        expect(priorityOpt.value(customResults), equals(TestPriority.p0));

        expect(
          () => parser.parse(['-p', 'p0']),
          throwsA(isA<ArgParserException>()),
        );

        final fakeRawNameResults = _FakeArgResults({'priority': 'p0'});
        expect(
          () => priorityOpt.value(fakeRawNameResults),
          throwsA(
            isA<FormatException>()
                .having((e) => e.source, 'source', equals('p0'))
                .having(
                  (e) => e.message,
                  'message',
                  contains('Invalid enum value for option "--priority"'),
                ),
          ),
        );
      },
    );

    test(
      'auto-derives allowed and allowedHelp when T implements CliEnum and '
      'rejects Dart identifier names',
      () {
        const descriptor = DefaultedEnumDescriptor<TestCliStrategy>(
          name: 'strategy',
          help: 'Strategy option',
          values: TestCliStrategy.values,
          defaultsTo: TestCliStrategy.alpha,
        );
        final parser = ArgParser()..addDescriptor(descriptor);

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
        expect(descriptor.value(parsedResults), equals(TestCliStrategy.beta));
        expect(descriptor.wasParsed(parsedResults), isTrue);

        expect(
          () => parser.parse(['--strategy=alpha']),
          throwsA(isA<ArgParserException>()),
        );
      },
    );
  });

  group('IntDescriptor & DefaultedIntDescriptor', () {
    const portOpt = IntDescriptor(name: 'port', help: 'Port number');
    const timeoutOpt = DefaultedIntDescriptor(
      name: 'timeout',
      help: 'Timeout in seconds',
      defaultsTo: 30,
    );

    test('parses valid integer and defaults', () {
      final parser = ArgParser()..addDescriptors(const [portOpt, timeoutOpt]);

      final defaultResults = parser.parse([]);
      expect(portOpt.value(defaultResults), isNull);
      expect(timeoutOpt.value(defaultResults), equals(30));

      final customResults = parser.parse(['--port=8080', '--timeout=120']);
      expect(portOpt.value(customResults), equals(8080));
      expect(timeoutOpt.value(customResults), equals(120));
    });

    test(
      'throws ArgParserException at parse time and FormatException with source '
      'on unvalidated ArgResults',
      () {
        final parser = ArgParser()..addDescriptor(portOpt);
        expect(
          () => parser.parse(['--port=not-a-number']),
          throwsA(isA<ArgParserException>()),
        );

        final fakeBadInt = _FakeArgResults({'port': 'not-a-number'});
        expect(
          () => portOpt.value(fakeBadInt),
          throwsA(
            isA<FormatException>()
                .having((e) => e.source, 'source', equals('not-a-number'))
                .having(
                  (e) => e.message,
                  'message',
                  contains('Invalid integer value for option "--port"'),
                ),
          ),
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
