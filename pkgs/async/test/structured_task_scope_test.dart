// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:async/async.dart';
import 'package:test/test.dart';

class _TestSyncDisposable implements SyncDisposable {
  bool isDisposed = false;

  @override
  void dispose() {
    isDisposed = true;
  }
}

class _TestAsyncDisposable implements Disposable {
  bool isDisposed = false;
  final Completer<void> completer = Completer<void>();

  @override
  Future<void> dispose() async {
    isDisposed = true;
    await completer.future;
  }
}

void main() {
  group('StructuredTaskScope', () {
    test('runs computation and returns result', () async {
      final result = await StructuredTaskScope.run((scope) async {
        final task1 = scope.fork(() async => 21);
        final task2 = scope.fork(() async => 21);
        return (await task1.value) + (await task2.value);
      });
      expect(result, equals(42));
    });

    test('cancels sibling tasks when a task fails with shutdownOnFailure',
        () async {
      var task2Cancelled = false;

      expect(
        StructuredTaskScope.run((scope) async {
          scope.fork(() async {
            await Future.delayed(const Duration(milliseconds: 10));
            throw StateError('Task 1 failed');
          });

          scope.fork(
            () async {
              await Future.delayed(const Duration(milliseconds: 200));
              return 42;
            },
            onCancel: () {
              task2Cancelled = true;
            },
          );

          await scope.join();
        }),
        throwsA(isA<StateError>()
            .having((e) => e.message, 'message', 'Task 1 failed')),
      );

      await Future.delayed(const Duration(milliseconds: 50));
      expect(task2Cancelled, isTrue);
    });

    test('attaches and disposes attached Disposable resources', () async {
      final syncDisposable = _TestSyncDisposable();
      final asyncDisposable = _TestAsyncDisposable();

      final scope = StructuredTaskScope();
      scope.attachDisposable(syncDisposable);
      scope.attachDisposable(asyncDisposable);

      expect(syncDisposable.isDisposed, isFalse);
      expect(asyncDisposable.isDisposed, isFalse);

      asyncDisposable.completer.complete();
      await scope.dispose();

      expect(syncDisposable.isDisposed, isTrue);
      expect(asyncDisposable.isDisposed, isTrue);
      expect(scope.isDisposed, isTrue);
    });

    test('throws StateError if fork or attachDisposable called when closed',
        () async {
      final scope = StructuredTaskScope();
      scope.close();

      expect(() => scope.fork(() => 42), throwsStateError);
      expect(() => scope.attachDisposable(_TestSyncDisposable()),
          throwsStateError);
    });

    test('detaches Disposable', () async {
      final syncDisposable = _TestSyncDisposable();
      final scope = StructuredTaskScope();
      scope.attachDisposable(syncDisposable);
      expect(scope.detachDisposable(syncDisposable), isTrue);

      await scope.dispose();
      expect(syncDisposable.isDisposed, isFalse);
    });

    test('awaits operation cancellation before disposing disposables',
        () async {
      final events = <String>[];
      final scope = StructuredTaskScope();

      final disposable = _TrackingDisposable(events);
      scope.attachDisposable(disposable);

      scope.fork(
        () async {
          await Completer<void>().future;
        },
        onCancel: () async {
          events.add('task_cancelling');
          await Future.delayed(const Duration(milliseconds: 10));
          events.add('task_cancelled');
        },
      );

      await scope.dispose();

      expect(events,
          equals(['task_cancelling', 'task_cancelled', 'disposable_disposed']));
    });

    test(
        'awaits ongoing cancellation for externally cancelled operation before '
        'disposing disposables', () async {
      final events = <String>[];
      final scope = StructuredTaskScope();

      final disposable = _TrackingDisposable(events);
      scope.attachDisposable(disposable);

      final completer = CancelableCompleter<void>(
        onCancel: () async {
          events.add('task_cancelling');
          await Future.delayed(const Duration(milliseconds: 50));
          events.add('task_cancelled');
        },
      );

      scope.forkOperation(completer.operation);

      // Cancel operation externally so operation.isCanceled becomes true
      completer.operation.cancel();

      // Immediately dispose scope
      await scope.dispose();

      expect(
        events,
        equals(['task_cancelling', 'task_cancelled', 'disposable_disposed']),
      );
    });

    test(
        'captures error thrown during cancellation callback during dispose '
        'shutdown', () async {
      final scope = StructuredTaskScope();

      final completer = CancelableCompleter<void>(
        onCancel: () async {
          throw StateError('Cancellation failed');
        },
      );

      scope.forkOperation(completer.operation);

      await scope.dispose();

      expect(scope.error, isA<StateError>());
    });

    test('handles forkOperation with already completed operation', () async {
      final scope = StructuredTaskScope();
      final op = CancelableOperation.fromValue(42);

      final forked = scope.forkOperation(op);
      expect(await forked.value, equals(42));

      await scope.dispose();
    });

    test('handles forkOperation with already cancelled operation', () async {
      final scope = StructuredTaskScope();
      final completer = CancelableCompleter<int>();
      completer.operation.cancel();

      final forked = scope.forkOperation(completer.operation);
      expect(forked.isCanceled, isTrue);

      await scope.dispose();
    });
  });
}

class _TrackingDisposable implements Disposable {
  final List<String> events;
  _TrackingDisposable(this.events);

  @override
  void dispose() {
    events.add('disposable_disposed');
  }
}
