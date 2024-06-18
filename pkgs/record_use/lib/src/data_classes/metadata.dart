// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:pub_semver/pub_semver.dart';

import '../proto/usages.pb.dart' as pb;

class Metadata {
  final pb.Metadata _protoMetadata;
  late final String? comment = _protoMetadata.comment;
  late final Version version = Version.parse(_protoMetadata.version);

  Metadata({required pb.Metadata protoMetadata})
      : _protoMetadata = protoMetadata;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Metadata && other._protoMetadata == _protoMetadata;
  }

  @override
  int get hashCode => _protoMetadata.hashCode;

  @override
  String toString() => _protoMetadata.toString();
}
