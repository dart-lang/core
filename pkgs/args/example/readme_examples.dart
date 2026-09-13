// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// This file contains all source code snippets displayed in args/README.md
// so that they can be programmatically updated and validated via excerpter.

// ignore_for_file: unreachable_from_main,
// ignore_for_file: inference_failure_on_instance_creation
// ignore_for_file: unused_local_variable,unused_element

import 'dart:io';
import 'package:args/args.dart';
import 'package:args/command_runner.dart';

void main(List<String> args) {
  // #docregion parser-init
  var parser = ArgParser();
  // #enddocregion parser-init

  // #docregion parser-add-option
  parser.addOption('name');
  // #enddocregion parser-add-option

  // #docregion parser-add-flag
  parser.addFlag('name');
  // #enddocregion parser-add-flag

  // #docregion parser-add-flag-no-negatable
  parser.addFlag('name', negatable: false);
  // #enddocregion parser-add-flag-no-negatable

  // #docregion parser-abbr
  parser.addOption('mode', abbr: 'm');
  parser.addFlag('verbose', abbr: 'v');
  // #enddocregion parser-abbr

  // #docregion parser-defaultsTo
  parser.addOption('mode', defaultsTo: 'debug');
  parser.addFlag('verbose', defaultsTo: false);
  // #enddocregion parser-defaultsTo

  // #docregion parser-allowed
  parser.addOption('mode', allowed: ['debug', 'release']);
  // #enddocregion parser-allowed

  // #docregion parser-callbacks
  parser.addOption('mode', callback: (mode) => print('Got mode $mode'));
  parser.addFlag('verbose', callback: (verbose) {
    if (verbose) print('Verbose');
  });
  // #enddocregion parser-callbacks

  // #docregion parser-mandatory
  parser.addOption('mode', mandatory: true);
  // #enddocregion parser-mandatory

  // #docregion parser-parse
  var results = parser.parse(['some', 'command', 'line', 'args']);
  // #enddocregion parser-parse

  // #docregion parser-results-example
  var resultsExampleParser = ArgParser();
  resultsExampleParser.addOption('mode');
  resultsExampleParser.addFlag('verbose', defaultsTo: true);
  var resultsExample =
      resultsExampleParser.parse(['--mode', 'debug', 'something', 'else']);

  print(resultsExample.option('mode')); // debug
  print(resultsExample.flag('verbose')); // true
  // #enddocregion parser-results-example

  // #docregion parser-rest
  print(resultsExample.rest); // ['something', 'else']
  // #enddocregion parser-rest

  // #docregion parser-spec-option
  parser.addOption('name', abbr: 'n');
  // #enddocregion parser-spec-option

  // #docregion parser-spec-flag
  parser.addFlag('name', abbr: 'n');
  // #enddocregion parser-spec-flag

  // #docregion parser-multiple-abbr
  parser
    ..addFlag('verbose', abbr: 'v')
    ..addFlag('french', abbr: 'f')
    ..addFlag('iambic-pentameter', abbr: 'i');
  // #enddocregion parser-multiple-abbr

  // #docregion parser-override
  var overrideParser = ArgParser();
  overrideParser.addOption('mode');
  var overrideResults = overrideParser.parse(['--mode', 'on', '--mode', 'off']);
  print(overrideResults.option('mode')); // prints 'off'
  // #enddocregion parser-override

  // #docregion parser-multi-option
  var multiParser = ArgParser();
  multiParser.addMultiOption('mode');
  var multiResults = multiParser.parse(['--mode', 'on', '--mode', 'off']);
  print(multiResults.multiOption('mode')); // prints '[on, off]'
  // #enddocregion parser-multi-option

  // #docregion parser-multi-option-commas
  var multiCommaParser = ArgParser();
  multiCommaParser.addMultiOption('mode');
  var multiCommaResults = multiCommaParser.parse(['--mode', 'on,off']);
  print(multiCommaResults.multiOption('mode')); // prints '[on, off]'
  // #enddocregion parser-multi-option-commas

  // #docregion parser-command-init
  var commandParser = ArgParser();
  var command = commandParser.addCommand('commit');
  // #enddocregion parser-command-init

  // #docregion parser-command-add
  var commandParser2 = ArgParser();
  var command2 = ArgParser();
  commandParser2.addCommand('commit', command2);
  // #enddocregion parser-command-add

  // #docregion parser-command-flag
  command2.addFlag('all', abbr: 'a');
  // #enddocregion parser-command-flag

  // #docregion parser-command-results
  var commandResults = commandParser.parse(['commit', '-a']);
  print(commandResults.command?.name); // "commit"
  print(commandResults.command?['all']); // true
  // #enddocregion parser-command-results

  // #docregion parser-command-ambiguity
  var commandAmbiguityParser = ArgParser();
  commandAmbiguityParser.addFlag('all', abbr: 'a');
  var commandAmbiguitySub = commandAmbiguityParser.addCommand('commit');
  commandAmbiguitySub.addFlag('all', abbr: 'a');

  var commandAmbiguityResults = commandAmbiguityParser.parse(['commit', '-a']);
  print(commandAmbiguityResults.command?['all']); // true
  // #enddocregion parser-command-ambiguity

  // #docregion parser-usage-example
  parser.addOption('mode',
      help: 'The compiler configuration', allowed: ['debug', 'release']);
  parser.addFlag('verbose', help: 'Show additional diagnostic info');
  // #enddocregion parser-usage-example

  // #docregion parser-usage-out
  parser.addOption('out',
      help: 'The output path',
      valueHelp: 'path',
      allowed: ['debug', 'release']);
  // #enddocregion parser-usage-out

  // #docregion parser-usage-arch
  parser.addOption('arch',
      help: 'The architecture to compile for',
      allowedHelp: {'ia32': 'Intel x86', 'arm': 'ARM Holding 32-bit chip'});
  // #enddocregion parser-usage-arch

  // #docregion parser-usage-print
  print(parser.usage);
  // #enddocregion parser-usage-print
}

// #docregion runner-command
class CommitCommand extends Command {
  // The [name] and [description] properties must be defined by every
  // subclass.
  @override
  final name = 'commit';
  @override
  final description = 'Record changes to the repository.';

  CommitCommand() {
    // we can add command specific arguments here.
    // [argParser] is automatically created by the parent class.
    argParser.addFlag('all', abbr: 'a');
  }

  // [run] may also return a Future.
  @override
  void run() {
    // [argResults] is set before [run()] is called and contains the flags/options
    // passed to this command.
    print(argResults?.flag('all'));
  }
}
// #enddocregion runner-command

class StashCommand extends Command {
  @override
  final String name = 'stash';
  @override
  final String description = 'Stash changes in the working directory.';

  StashCommand() {
    addSubcommand(StashSaveCommand());
    addSubcommand(StashListCommand());
  }
}

class StashSaveCommand extends Command {
  @override
  final name = 'save';
  @override
  final description = 'Save stash';
  @override
  void run() {}
}

class StashListCommand extends Command {
  @override
  final name = 'list';
  @override
  final description = 'List stash';
  @override
  void run() {}
}

void runnerExample(List<String> args) {
  // #docregion runner-main
  void main(List<String> args) {
    var runner = CommandRunner(
        'dgit', 'A dart implementation of distributed version control.')
      ..addCommand(CommitCommand())
      ..addCommand(StashCommand())
      ..run(args);
  }
  // #enddocregion runner-main

  // #docregion runner-global-args
  var runner = CommandRunner(
      'dgit', 'A dart implementation of distributed version control.');
  // add global flag
  runner.argParser.addFlag('verbose', abbr: 'v', help: 'increase logging');
  // #enddocregion runner-global-args

  // #docregion runner-run-catch
  runner.run(args).catchError((Object error) {
    if (error is! UsageException) throw Exception(error.toString());
    print(error);
    exit(64); // Exit code 64 indicates a usage error.
  });
  // #enddocregion runner-run-catch
}

// #docregion parser-main-args
void mainExample(List<String> args) {
  final parser = ArgParser();
  // ...
  var results = parser.parse(args);
}
// #enddocregion parser-main-args
