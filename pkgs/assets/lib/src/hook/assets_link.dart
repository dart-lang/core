// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert' show jsonDecode;
import 'dart:io' show File;

import 'package:logging/logging.dart' show Logger;
import 'package:native_assets_cli/data_assets.dart';
import 'package:record_use/record_use.dart' as record_use;

import '../assets.dart';
import 'assets_build.dart';

const stringAssetId = record_use.Identifier(
  importUri: 'package:assets/src/assets.dart',
  name: 'StringAsset',
);

const byteAssetId = record_use.Identifier(
  importUri: 'package:assets/src/assets.dart',
  name: 'ByteAsset',
);

class AssetLinker {
  Future<void> run({
    required LinkInput input,
    required LinkOutputBuilder output,
    Logger? logger,
  }) async {
    final usages = input.usages;
    final usedStringSymbols = usages.symbolsFor(stringAssetId);
    final usedByteSymbols = usages.symbolsFor(byteAssetId);
    final assets = input.assets.data.where(
      (asset) =>
          usedStringSymbols.contains(
            AssetBuilder.assetNameMangler<StringAsset>(asset.name),
          ) ||
          usedByteSymbols.contains(
            AssetBuilder.assetNameMangler<ByteAsset>(asset.name),
          ),
    );
    output.assets.data.addAll(assets);
  }
}

extension on LinkInput {
  record_use.RecordedUsages get usages {
    final usagesFile = recordedUsagesFile;
    final usagesContent = File.fromUri(usagesFile!).readAsStringSync();
    final usagesJson = jsonDecode(usagesContent) as Map<String, dynamic>;
    return record_use.RecordedUsages.fromJson(usagesJson);
  }
}

extension on record_use.RecordedUsages {
  Set<String> symbolsFor(record_use.Identifier identifier) =>
      (instancesOf(identifier) ?? [])
          .map(
            (instance) =>
                // Get the "name" field value from the String/ByteAsset class
                (instance.instanceConstant.fields['name']
                        as record_use.StringConstant)
                    .value,
          )
          .toSet();
}
