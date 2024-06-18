// Copyright (c) 2024, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:typed_data';

import 'package:collection/collection.dart';

import '../proto/usages.pb.dart' as pb;
import 'metadata.dart';
import 'reference.dart';
import 'usage.dart';

class UsageRecord {
  final Metadata metadata;
  final Iterable<Usage<CallReference>> calls;
  final Iterable<Usage<InstanceReference>> instances;

  UsageRecord({
    required this.metadata,
    required this.calls,
    required this.instances,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is UsageRecord &&
        other.metadata == metadata &&
        listEquals(other.calls, calls) &&
        listEquals(other.instances, instances);
  }

  @override
  int get hashCode => metadata.hashCode ^ calls.hashCode ^ instances.hashCode;

  factory UsageRecord.fromFile(Uint8List fileContents) {
    final usages = pb.Usages.fromBuffer(fileContents);
    final ids = usages.ids;
    final uris = usages.uris.map((e) => e.value).toList();
    return UsageRecord(
      metadata: Metadata(protoMetadata: usages.metadata),
      calls: usages.calls.map((e) => Usage<CallReference>(
            usage: e,
            ids: ids,
            uris: uris,
          )),
      instances: usages.calls.map((e) => Usage<InstanceReference>(
            usage: e,
            ids: ids,
            uris: uris,
          )),
    );
  }

  Uint8List serialize() {
    return pb.Usages().writeToBuffer();
  }
}
