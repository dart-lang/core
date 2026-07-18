// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// This file contains code snippets for logging/README.md.

// ignore_for_file: unused_local_variable, invalid_return_type_for_catch_error
// ignore_for_file: unreachable_from_main, prefer_final_locals, lines_longer_than_80_chars, prefer_single_quotes

import 'package:logging/logging.dart';

void main() {
  // #docregion init-root
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  // #enddocregion init-root

  // #docregion on-level-changed
  Logger.root.onLevelChanged.listen((level) {
    print('The new log level is $level');
  });
  // #enddocregion on-level-changed

  // #docregion create-logger
  final log = Logger('MyClassName');
  // #enddocregion create-logger

  // #docregion complex-message
  log.fine(() => [1, 2, 3, 4, 5].map((e) => e * 4).join("-"));
  // #enddocregion complex-message
}

Future<dynamic> doSomethingAsync() async {}
dynamic processResult(dynamic result) {}

void logError(Logger log) {
  // #docregion log-error
  var future = doSomethingAsync().then((result) {
    log.fine('Got the result: $result');
    processResult(result);
  }).catchError((Object e, StackTrace stackTrace) =>
      log.severe('Oh noes!', e, stackTrace));
  // #enddocregion log-error
}

void setupHierarchical() {
  // #docregion hierarchical
  hierarchicalLoggingEnabled = true;
  Logger.root.level = Level.WARNING;
  Logger.root.onRecord.listen((record) {
    print('[ROOT][WARNING+] ${record.message}');
  });

  final log1 = Logger('FINE+');
  log1.level = Level.FINE;
  log1.onRecord.listen((record) {
    print('[LOG1][FINE+] ${record.message}');
  });

  // log2 inherits LEVEL value of WARNING from `Logger.root`
  final log2 = Logger('WARNING+');
  log2.onRecord.listen((record) {
    print('[LOG2][WARNING+] ${record.message}');
  });

  // Will NOT print because FINER is too low level for `Logger.root`.
  log1.finer('LOG_01 FINER (X)');

  // Will print twice ([LOG1] & [ROOT])
  log1.fine('LOG_01 FINE (√√)');

  // Will print ONCE because `log1` only uses root listener.
  log1.warning('LOG_01 WARNING (√)');

  // Will never print because FINE is too low level.
  log2.fine('LOG_02 FINE (X)');

  // Will print twice ([LOG2] & [ROOT]) because warning is sufficient for all
  // loggers' levels.
  log2.warning('LOG_02 WARNING (√√)');

  // Will never print because `info` is filtered by `Logger.root.level` of
  // `Level.WARNING`.
  log2.info('INFO (X)');
  // #enddocregion hierarchical
}
