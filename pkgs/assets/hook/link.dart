// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:assets/src/hook/assets_link.dart';
import 'package:native_assets_cli/data_assets.dart';

void main(List<String> arguments) {
  link(arguments, (input, output) async {
    await AssetLinker().run(input: input, output: output);
  });
}
