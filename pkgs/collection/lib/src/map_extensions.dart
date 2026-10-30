// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

extension MapExtensions<K, V> on Map<K, V> {
  /// The key and value pairs of this map.
  ///
  /// Contains `(key, value)` for each key and its associated value, in key
  /// iteration order.
  ///
  /// NOTE: Unlike built-in members like [keys] and [entries], which are direct
  /// views of this map, this extension produces an unindexed iterable.
  /// Operations like [Iterable.contains] perform a linear scan rather than an
  /// efficient map lookup.
  Iterable<(K, V)> get pairs =>
      entries.map((entry) => (entry.key, entry.value));
}
