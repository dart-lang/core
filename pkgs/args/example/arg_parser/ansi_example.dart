// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This is an example of converting the args in test.dart to use this API.
/// It shows what it looks like to build an [ArgParser] and then, when the code
/// is run, demonstrates what the generated usage text looks like.
library;

import 'dart:io';

import 'package:args/args.dart';
import 'package:io/ansi.dart';

void main() {
  var parser = ArgParser();

  parser.addSeparator('===== Platform');

  final javaScriptStyled = styleItalic.wrap(lightGreen.wrap('JavaScript'));

  parser.addOption('compiler',
      abbr: 'c',
      defaultsTo: 'none',
      help: blue.wrap('Specify any compilation step (if needed).'),
      allowed: [
        'none',
        'dart2js',
        'dartc'
      ],
      allowedHelp: {
        'none':
            red.wrap('Do not compile the Dart code (run native Dart code on the'
                ' VM).\n(only valid with the following runtimes: vm, drt)')!,
        'dart2js': green
            .wrap('Compile dart code to $javaScriptStyled by running dart2js.\n'
                '(only valid with the following runtimes: d8, drt, chrome\n'
                'safari, ie, firefox, opera, none (compile only))')!,
        'dartc': lightBlue
            .wrap('Perform static analysis on Dart code by running dartc.\n'
                '(only valid with the following runtimes: none)')!,
      });

  parser.addOption('runtime',
      abbr: 'r',
      defaultsTo: 'vm',
      help: magenta.wrap('Where the tests should be run.'),
      allowed: [
        'vm',
        'd8',
        'drt',
        'dartium',
        'ff',
        'firefox',
        'chrome',
        'safari',
        'ie',
        'opera',
        'none'
      ],
      allowedHelp: {
        'vm': cyan.wrap('Run Dart code on the standalone dart vm.')!,
        'd8': yellow
            .wrap('Run $javaScriptStyled from the command line using v8.')!,
        'drt': lightGreen.wrap(
            'Run Dart or $javaScriptStyled in the headless version of Chrome,\n'
            'content shell.')!,
        'dartium': lightBlue.wrap('Run Dart or $javaScriptStyled in Dartium.')!,
        'ff': lightRed.wrap('Run $javaScriptStyled in Firefox')!,
        'chrome': yellow.wrap('Run $javaScriptStyled in Chrome')!,
        'safari': magenta.wrap('Run $javaScriptStyled in Safari')!,
        'ie': cyan.wrap('Run $javaScriptStyled in Internet Explorer')!,
        'opera': lightYellow.wrap('Run $javaScriptStyled in Opera')!,
        'none': darkGray.wrap(
            'No runtime, compile only (for example, used for dartc static\n'
            'analysis tests).')!,
      });

  parser.addOption('arch',
      abbr: 'a',
      defaultsTo: 'ia32',
      help: cyan.wrap('The architecture to run tests for'),
      allowed: ['all', 'ia32', 'x64', 'simarm']);

  parser.addOption('system',
      abbr: 's',
      defaultsTo: Platform.operatingSystem,
      help: yellow.wrap('The operating system to run tests on'),
      allowed: ['linux', 'macos', 'windows']);

  parser.addSeparator('===== Runtime');

  parser.addOption('mode',
      abbr: 'm',
      defaultsTo: 'debug',
      help: lightMagenta.wrap('Mode in which to run the tests'),
      allowed: ['all', 'debug', 'release']);

  parser.addFlag('checked',
      defaultsTo: false, help: lightGreen.wrap('Run tests in checked mode'));

  parser.addFlag('host-checked',
      defaultsTo: false, help: red.wrap('Run compiler in checked mode'));

  parser.addOption('timeout',
      abbr: 't', help: white.wrap('Timeout in seconds'));

  parser.addOption('tasks',
      abbr: 'j',
      defaultsTo: Platform.numberOfProcessors.toString(),
      help: backgroundWhite
          .wrap(blue.wrap('The number of parallel tasks to run')));

  parser.addOption('shards',
      defaultsTo: '1',
      help: green
          .wrap('The number of instances that the tests will be sharded over'));

  parser.addOption('shard',
      defaultsTo: '1',
      help: lightYellow
          .wrap('The index of this instance when running in sharded mode'));

  parser.addFlag('valgrind',
      defaultsTo: false, help: lightRed.wrap('Run tests through valgrind'));

  parser.addSeparator('===== Output');

  parser.addOption('progress',
      abbr: 'p',
      defaultsTo: 'compact',
      help: lightBlue.wrap('Progress indication mode'),
      allowed: [
        'compact',
        'color',
        'line',
        'verbose',
        'silent',
        'status',
        'buildbot'
      ]);

  parser.addFlag('report',
      defaultsTo: false,
      help: lightMagenta.wrap(
          'Print a summary report of the number of tests, by expectation'));

  parser.addFlag('verbose',
      abbr: 'v', defaultsTo: false, help: red.wrap('Verbose output'));

  parser.addFlag('list',
      defaultsTo: false, help: blue.wrap('List tests only, do not run them'));

  parser.addFlag('time',
      help: green.wrap('Print timings information after running tests'),
      defaultsTo: false);

  parser.addFlag('batch',
      abbr: 'b',
      help: blue.wrap('Run browser tests in batch mode'),
      defaultsTo: true);

  parser.addSeparator('===== Miscellaneous');

  parser.addFlag('keep-generated-tests',
      defaultsTo: false,
      help: lightBlue
          .wrap('Keep the generated files in the temporary directory'));

  parser.addOption('special-command', help: lightMagenta.wrap("""
Special command support. Wraps the command line in
a special command. The special command should contain
an '@' character which will be replaced by the normal
command.

For example if the normal command that will be executed
is 'dart file.dart' and you specify special command
'python -u valgrind.py @ suffix' the final command will be
'python -u valgrind.py dart file.dart suffix'"""));

  parser.addOption('dart', help: yellow.wrap('Path to dart executable'));
  parser.addOption('drt',
      help: lightMagenta.wrap('Path to content shell executable'));
  parser.addOption('dartium',
      help: lightCyan.wrap('Path to Dartium Chrome executable'));
  parser.addOption('mandatory',
      help: magenta.wrap('A mandatory option'), mandatory: true);

  print(parser.usage);
}
