// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

// TODO: Disposable and SyncDisposable should be moved to the SDK
// (e.g. dart:core or dart:async).

/// A resource or component that participates in cooperative shutdown.
///
/// A disposable must be registered after creation before any async yield point.
/// An isolate shutdown request (such as during Hot Restart) can arrive during
/// any asynchronous yield point. The disposable must be either registered
/// to the isolate or to an owner disposable already registered to an isolate.
///
/// If the [Disposable] is the outermost resource of an isolate (or the root
/// application service), register it upon creation:
/// ```dart
/// class AppService implements Disposable {
///   AppService() {
///     Isolate.registerShutdownDisposable(this);
///   }
/// }
/// ```
///
/// If the [Disposable] is created inside an enclosing parent that is already
/// registered, register it with that parent before any asynchronous yield
/// point occurs:
/// ```dart
/// Future<void> fetchData() async {
///   final client = IsolateHttpClient();
///   _children.add(client); // Register with outer parent before `await`
///   try {
///     await client.get(...); // Protected yield point
///   } finally {
///     await client.dispose();
///     _children.remove(client);
///   }
/// }
/// ```
///
/// If a short-lived [Disposable] is used inside a local [try]/[finally] block
/// and has no enclosing parent, register and unregister directly via `Isolate`:
/// ```dart
/// Future<void> runStandaloneTask() async {
///   final client = IsolateHttpClient();
///   Isolate.registerShutdownDisposable(client);
///   try {
///     await client.get(...); // Protected yield point
///   } finally {
///     await client.dispose();
///     Isolate.unregisterShutdownDisposable(client);
///   }
/// }
/// ```
abstract interface class Disposable {
  /// Disposes this resource.
  ///
  /// Implementations must be idempotent and safe to call more than once.
  /// Calling [dispose] on an already disposed object should return immediately
  /// (or return the pending [Future] if disposal is in progress).
  ///
  /// If disposal requires asynchronous work, this method returns a [Future]
  /// that completes when disposal is finished. If disposal is synchronous,
  /// this method returns `null` (or implements [SyncDisposable]).
  ///
  /// Disposables may throw errors or complete the returned future with an
  /// error. If this happens during cooperative isolate shutdown, it is an
  /// unrecoverable error.
  FutureOr<void> dispose();
}

/// A [Disposable] that can be disposed synchronously.
abstract interface class SyncDisposable implements Disposable {
  /// Disposes this resource synchronously.
  ///
  /// Implementations must be idempotent and safe to call more than once.
  ///
  /// Disposables may throw errors. If this happens during cooperative isolate
  /// shutdown, it is an unrecoverable error.
  @override
  void dispose();
}
