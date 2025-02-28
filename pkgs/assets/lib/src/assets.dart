// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:typed_data' show Uint8List;

import 'package:meta/meta.dart' show RecordUse, mustBeConst;

import 'assets_internal.dart';
import 'hook/assets_build.dart' show AssetBuilder;

abstract class Asset<T> {
  final String key;

  const Asset(this.key);

  /// Load the asset asynchronously.
  Future<T> load();
}

@RecordUse()
class StringAsset extends Asset<String> {
  static const uniquePrefix = 'StringAsset';

  const StringAsset(@mustBeConst super.key);

  @override
  Future<String> load() =>
      loadAssetString(AssetBuilder.assetNameMangler<StringAsset>(key));
}

@RecordUse()
class ByteAsset extends Asset<Uint8List> {
  static const uniquePrefix = 'ByteAsset';

  const ByteAsset(@mustBeConst super.key);

  @override
  Future<Uint8List> load() =>
      loadAssetBytes(AssetBuilder.assetNameMangler<ByteAsset>(key));
}
