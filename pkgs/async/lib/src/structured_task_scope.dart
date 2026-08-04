// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'cancelable_operation.dart';
import 'disposable.dart';

/// A scope for structured concurrency that manages concurrent tasks and
/// resources.
///
/// A [StructuredTaskScope] coordinates the lifecycles of child operations
/// ([CancelableOperation]) and resources ([Disposable]).
///
/// Tasks are added to the scope via [fork] or [forkOperation]. Resources can
/// be attached via [attachDisposable].
///
/// If any task fails and [shutdownOnFailure] is `true` (the default), the scope
/// automatically cancels all remaining active tasks and disposes attached
/// resources.
///
/// Calling [dispose] (or using [StructuredTaskScope.run]) guarantees that all
/// child tasks and attached resources are cleanly shut down and awaited before
/// the scope finishes.
class StructuredTaskScope implements Disposable {
  /// Whether an error in a child task automatically triggers scope shutdown.
  final bool shutdownOnFailure;

  final Set<CancelableOperation<dynamic>> _operations = {};
  final Set<Disposable> _disposables = {};

  bool _closed = false;
  bool _disposed = false;
  bool _isShuttingDown = false;

  Object? _firstError;
  StackTrace? _firstStackTrace;

  /// Creates a new [StructuredTaskScope].
  ///
  /// If [shutdownOnFailure] is `true` (the default), an error in any child
  /// operation will trigger automatic cancellation of all sibling operations
  /// and attached disposables.
  StructuredTaskScope({this.shutdownOnFailure = true});

  /// Whether the scope is closed for adding new tasks.
  bool get isClosed => _closed;

  /// Whether the scope has been disposed.
  bool get isDisposed => _disposed;

  /// Whether the scope is currently shutting down due to an error or
  /// cancellation.
  bool get isShuttingDown => _isShuttingDown;

  /// The first error that triggered scope shutdown, if any.
  Object? get error => _firstError;

  /// The stack trace for [error], if any.
  StackTrace? get stackTrace => _firstStackTrace;

  /// Runs [computation] within a new [StructuredTaskScope].
  ///
  /// Automatically disposes the scope when [computation] completes or throws,
  /// guaranteeing that all spawned operations are cancelled and awaited.
  static Future<R> run<R>(
    FutureOr<R> Function(StructuredTaskScope scope) computation, {
    bool shutdownOnFailure = true,
  }) async {
    final scope = StructuredTaskScope(shutdownOnFailure: shutdownOnFailure);
    try {
      final result = await computation(scope);
      await scope.join();
      return result;
    } catch (error, stackTrace) {
      await scope._shutdown(error, stackTrace);
      scope.throwIfFailed();
      rethrow;
    } finally {
      await scope.dispose();
    }
  }

  /// Forks a new task in this scope.
  ///
  /// The task executes [computation]. If [onCancel] is provided, it will be
  /// invoked if the operation is cancelled before it completes.
  ///
  /// Throws [StateError] if the scope is closed, disposed, or shutting down.
  CancelableOperation<T> fork<T>(
    FutureOr<T> Function() computation, {
    FutureOr<void> Function()? onCancel,
  }) {
    if (_closed || _disposed || _isShuttingDown) {
      throw StateError('Cannot fork tasks in a closed, disposed, '
          'or shutting down StructuredTaskScope.');
    }

    final completer = CancelableCompleter<T>(onCancel: onCancel);
    final operation = forkOperation(completer.operation);

    Future.sync(computation).then(
      (value) {
        if (!completer.isCanceled && !completer.isCompleted) {
          completer.complete(value);
        }
      },
      onError: (Object error, StackTrace stackTrace) {
        if (!completer.isCanceled && !completer.isCompleted) {
          completer.completeError(error, stackTrace);
        }
      },
    );

    return operation;
  }

  /// Forks an existing [CancelableOperation] into this scope.
  ///
  /// If [shutdownOnFailure] is `true` and the operation completes with an
  /// error, the scope will shut down and cancel all sibling tasks.
  CancelableOperation<T> forkOperation<T>(CancelableOperation<T> operation) {
    if (_closed || _disposed || _isShuttingDown) {
      throw StateError('Cannot fork tasks in a closed, disposed, '
          'or shutting down StructuredTaskScope.');
    }

    _operations.add(operation);

    operation.valueOrCancellation().then(
      (_) {
        _operations.remove(operation);
      },
      onError: (Object error, StackTrace stackTrace) {
        _operations.remove(operation);
        if (shutdownOnFailure && !operation.isCanceled) {
          _shutdown(error, stackTrace);
        }
      },
    );

    return operation;
  }

  /// Attaches a [Disposable] resource to this scope.
  ///
  /// When the scope is shut down or disposed, [disposable.dispose()] will be
  /// called and awaited.
  ///
  /// Throws [StateError] if the scope is closed, disposed, or shutting down.
  void attachDisposable(Disposable disposable) {
    if (_closed || _disposed || _isShuttingDown) {
      throw StateError('Cannot attach disposables to a closed, disposed, '
          'or shutting down StructuredTaskScope.');
    }
    _disposables.add(disposable);
  }

  /// Detaches a previously attached [Disposable] resource from this scope.
  bool detachDisposable(Disposable disposable) {
    return _disposables.remove(disposable);
  }

  /// Closes the scope so that no new tasks or disposables can be added.
  void close() {
    _closed = true;
  }

  /// Waits for all active tasks in the scope to settle.
  ///
  /// If [shutdownOnFailure] is `true` and any task failed, this will throw the
  /// error after active tasks have settled.
  Future<void> join() async {
    _closed = true;
    while (_operations.isNotEmpty) {
      final futures = _operations
          .map((op) => op.valueOrCancellation().catchError((_, __) => null))
          .toList();
      await Future.wait(futures);
    }
    throwIfFailed();
  }

  /// Throws the first error that occurred in a child task if the scope failed.
  void throwIfFailed() {
    final err = _firstError;
    if (err != null) {
      Error.throwWithStackTrace(err, _firstStackTrace ?? StackTrace.current);
    }
  }

  /// Initiates shutdown of the scope due to an error or cancellation signal.
  Future<void> _shutdown([Object? error, StackTrace? stackTrace]) async {
    if (_firstError == null && error != null) {
      _firstError = error;
      _firstStackTrace = stackTrace;
    }

    if (_isShuttingDown) return;
    _isShuttingDown = true;
    _closed = true;

    // Phase 1: Cancel all active operations and await their cancellation hooks.
    final opCancelFutures = <Future<void>>[];
    for (final op in List.of(_operations)) {
      if (!op.isCompleted) {
        final cancelResult = op.cancel();
        opCancelFutures
            .add(cancelResult.catchError((Object error, StackTrace stackTrace) {
          if (_firstError == null) {
            _firstError = error;
            _firstStackTrace = stackTrace;
          }
        }));
      }
    }
    if (opCancelFutures.isNotEmpty) {
      await Future.wait(opCancelFutures);
    }

    // Phase 2: Now that child tasks are stopped, dispose attached resources.
    final disposeFutures = <Future<void>>[];
    for (final disposable in List.of(_disposables)) {
      try {
        final disposeResult = disposable.dispose();
        if (disposeResult is Future<void>) {
          disposeFutures.add(
              disposeResult.catchError((Object error, StackTrace stackTrace) {
            if (_firstError == null) {
              _firstError = error;
              _firstStackTrace = stackTrace;
            }
          }));
        }
      } catch (error, stackTrace) {
        if (_firstError == null) {
          _firstError = error;
          _firstStackTrace = stackTrace;
        }
      }
    }
    if (disposeFutures.isNotEmpty) {
      await Future.wait(disposeFutures);
    }
  }

  /// Disposes this scope, cancelling all active tasks and disposing all
  /// attached resources.
  @override
  FutureOr<void> dispose() async {
    if (_disposed) return;
    await _shutdown();
    _disposed = true;
    _operations.clear();
    _disposables.clear();
  }
}
