// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:logging/logging.dart' show Logger;
import 'package:native_assets_cli/data_assets.dart';

import '../assets.dart';

class AssetBuilder {
  final Map<String, Uri> stringFiles;
  final Map<String, Uri> byteFiles;

  const AssetBuilder({required this.stringFiles, required this.byteFiles});

  AssetBuilder.byteFile(String name, Uri file)
    : byteFiles = {name: file},
      stringFiles = {};

  AssetBuilder.stringFile(String name, Uri file)
    : byteFiles = {},
      stringFiles = {name: file};

  AssetBuilder.byteFiles(this.byteFiles) : stringFiles = {};

  AssetBuilder.stringFiles(this.stringFiles) : byteFiles = {};

  Future<void> run({
    required BuildInput input,
    required BuildOutputBuilder output,
    Logger? logger,
    String? linkInPackage = 'assets',
  }) async {
    output.assets.data.addAll(
      [
        ...stringFiles
            .map(
              (name, uri) => MapEntry(assetNameMangler<StringAsset>(name), uri),
            )
            .entries,
        ...byteFiles
            .map(
              (name, uri) => MapEntry(assetNameMangler<ByteAsset>(name), uri),
            )
            .entries,
      ].map(
        (file) => DataAsset(
          file: file.value,
          name: file.key,
          package: input.packageName,
        ),
      ),
      linkInPackage: linkInPackage,
    );
  }

  static String assetNameMangler<T extends Asset>(String name) => switch (T) {
    StringAsset() => '${StringAsset.uniquePrefix}/$name',
    ByteAsset() => '${ByteAsset.uniquePrefix}/$name',
    Type() => throw ArgumentError('Unknown type $T'),
  };
}
