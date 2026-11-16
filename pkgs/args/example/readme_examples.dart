// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';

// #region parser-main-args
void main(List<String> args) {
  final parser = ArgParser(); // #hide
  // ...
  var results = parser.parse(args);
  print(results.rest); // #hide
  _definingOptions(); // #hide
  _definingMoreOptions(); // #hide
  _resultsExample(); // #hide
  _specifyingOptions(); // #hide
  _overrideExample(); // #hide
  _multiOptionExample(); // #hide
  _multiOptionCommasExample(); // #hide
  _commandInitExample(); // #hide
  _commandAddExample(); // #hide
  _commandAmbiguityExample(); // #hide
  _usageExample(); // #hide
  _runnerMainExample(); // #hide
  _runnerExample(args); // #hide
}
// #endregion parser-main-args

void _definingOptions() {
  // #region parser-init
  var parser = ArgParser();
  // #endregion parser-init

  // #region parser-add-option
  parser.addOption('name');
  // #endregion parser-add-option

  // #region parser-abbr
  parser.addOption('mode', abbr: 'm');
  parser.addFlag('verbose', abbr: 'v');
  // #endregion parser-abbr

  // #region parser-parse
  var results = parser.parse(['some', 'command', 'line', 'args']);
  // #endregion parser-parse
  print(results.rest);
}

void _definingMoreOptions() {
  {
    final parser = ArgParser();
    // #region parser-add-flag
    parser.addFlag('name');
    // #endregion parser-add-flag
  }

  {
    final parser = ArgParser();
    // #region parser-add-flag-no-negatable
    parser.addFlag('name', negatable: false);
    // #endregion parser-add-flag-no-negatable
  }

  {
    final parser = ArgParser();
    // #region parser-defaultsTo
    parser.addOption('mode', defaultsTo: 'debug');
    parser.addFlag('verbose', defaultsTo: false);
    // #endregion parser-defaultsTo
  }

  {
    final parser = ArgParser();
    // #region parser-allowed
    parser.addOption('mode', allowed: ['debug', 'release']);
    // #endregion parser-allowed
  }

  {
    final parser = ArgParser();
    // #region parser-callbacks
    parser.addOption('mode', callback: (mode) => print('Got mode $mode'));
    parser.addFlag('verbose', callback: (verbose) {
      if (verbose) print('Verbose');
    });
    // #endregion parser-callbacks
  }

  {
    final parser = ArgParser();
    // #region parser-mandatory
    parser.addOption('mode', mandatory: true);
    // #endregion parser-mandatory
  }
}

void _resultsExample() {
  // #region parser-results-example
  var parser = ArgParser();
  parser.addOption('mode');
  parser.addFlag('verbose', defaultsTo: true);
  var results = parser.parse(['--mode', 'debug', 'something', 'else']);

  print(results.option('mode')); // debug
  print(results.flag('verbose')); // true
  // #endregion parser-results-example

  // #region parser-rest
  print(results.rest); // ['something', 'else']
  // #endregion parser-rest
}

void _specifyingOptions() {
  {
    final parser = ArgParser();
    // #region parser-spec-option
    parser.addOption('name', abbr: 'n');
    // #endregion parser-spec-option
  }

  {
    final parser = ArgParser();
    // #region parser-spec-flag
    parser.addFlag('name', abbr: 'n');
    // #endregion parser-spec-flag
  }

  {
    final parser = ArgParser();
    // #region parser-multiple-abbr
    parser
      ..addFlag('verbose', abbr: 'v')
      ..addFlag('french', abbr: 'f')
      ..addFlag('iambic-pentameter', abbr: 'i');
    // #endregion parser-multiple-abbr
  }
}

void _overrideExample() {
  // #region parser-override
  var parser = ArgParser();
  parser.addOption('mode');
  var results = parser.parse(['--mode', 'on', '--mode', 'off']);
  print(results.option('mode')); // prints 'off'
  // #endregion parser-override
}

void _multiOptionExample() {
  // #region parser-multi-option
  var parser = ArgParser();
  parser.addMultiOption('mode');
  var results = parser.parse(['--mode', 'on', '--mode', 'off']);
  print(results.multiOption('mode')); // prints '[on, off]'
  // #endregion parser-multi-option
}

void _multiOptionCommasExample() {
  // #region parser-multi-option-commas
  var parser = ArgParser();
  parser.addMultiOption('mode');
  var results = parser.parse(['--mode', 'on,off']);
  print(results.multiOption('mode')); // prints '[on, off]'
  // #endregion parser-multi-option-commas
}

void _commandInitExample() {
  // #region parser-command-init
  var parser = ArgParser();
  var command = parser.addCommand('commit');
  // #endregion parser-command-init
  print(command);
}

void _commandAddExample() {
  // #region parser-command-add
  var parser = ArgParser();
  var command = ArgParser();
  parser.addCommand('commit', command);
  // #endregion parser-command-add

  // #region parser-command-flag
  command.addFlag('all', abbr: 'a');
  // #endregion parser-command-flag

  // #region parser-command-results
  var results = parser.parse(['commit', '-a']);
  print(results.command?.name); // "commit"
  print(results.command?['all']); // true
  // #endregion parser-command-results
}

void _commandAmbiguityExample() {
  // #region parser-command-ambiguity
  var parser = ArgParser();
  parser.addFlag('all', abbr: 'a');
  var command = parser.addCommand('commit');
  command.addFlag('all', abbr: 'a');

  var results = parser.parse(['commit', '-a']);
  print(results.command?['all']); // true
  // #endregion parser-command-ambiguity
}

void _usageExample() {
  final parser = ArgParser();
  // #region parser-usage-example
  parser.addOption('mode',
      help: 'The compiler configuration', allowed: ['debug', 'release']);
  parser.addFlag('verbose', help: 'Show additional diagnostic info');
  // #endregion parser-usage-example

  // #region parser-usage-out
  parser.addOption('out',
      help: 'The output path',
      valueHelp: 'path',
      allowed: ['debug', 'release']);
  // #endregion parser-usage-out

  // #region parser-usage-arch
  parser.addOption('arch',
      help: 'The architecture to compile for',
      allowedHelp: {'ia32': 'Intel x86', 'arm': 'ARM Holding 32-bit chip'});
  // #endregion parser-usage-arch

  // #region parser-usage-print
  print(parser.usage);
  // #endregion parser-usage-print
}

// #region runner-command
class CommitCommand extends Command<void> {
  // The [name] and [description] properties must be defined by every
  // subclass.
  @override
  final name = 'commit';
  @override
  final description = 'Record changes to the repository.';

  // #region runner-command-args
  CommitCommand() {
    // we can add command specific arguments here.
    // [argParser] is automatically created by the parent class.
    argParser.addFlag('all', abbr: 'a');
  }
  // #endregion runner-command-args

  // [run] may also return a Future.
  @override
  void run() {
    // [argResults] is set before [run()] is called and contains the flags/options
    // passed to this command.
    print(argResults?.flag('all'));
  }
}
// #endregion runner-command

// #region runner-subcommand
class StashCommand extends Command<void> {
  @override
  final String name = 'stash';
  @override
  final String description = 'Stash changes in the working directory.';

  StashCommand() {
    addSubcommand(StashSaveCommand());
    addSubcommand(StashListCommand());
  }
}
// #endregion runner-subcommand

class StashSaveCommand extends Command<void> {
  @override
  final name = 'save';
  @override
  final description = 'Save stash';
  @override
  void run() {}
}

class StashListCommand extends Command<void> {
  @override
  final name = 'list';
  @override
  final description = 'List stash';
  @override
  void run() {}
}

void _runnerMainExample() {
  // #region runner-main
  // ignore: unused_element // #hide
  void main(List<String> args) {
    var runner = CommandRunner<void>(
        'dgit', 'A dart implementation of distributed version control.')
      ..addCommand(CommitCommand())
      ..addCommand(StashCommand())
      ..run(args);
    print(runner.executableName); // #hide
  }
  // #endregion runner-main
}

void _runnerExample(List<String> args) {
  // #region runner-global-args
  var runner = CommandRunner<void>(
      'dgit', 'A dart implementation of distributed version control.');
  // add global flag
  runner.argParser.addFlag('verbose', abbr: 'v', help: 'increase logging');
  // #endregion runner-global-args

  // #region runner-run-catch
  runner.run(args).catchError((Object error) {
    // ignore: only_throw_errors // #hide
    if (error is! UsageException) throw error;
    print(error);
    exit(64); // Exit code 64 indicates a usage error.
  });
  // #endregion runner-run-catch
}
