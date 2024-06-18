// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../proto/usages.pb.dart' as pb;
import 'definition.dart';
import 'reference.dart';

class Usage<T extends Reference> {
  final pb.Usage _usage;
  final List<pb.Identifier> _ids;
  final List<String> _uris;
  late final Definition definition = Definition(_usage.definition, _ids, _uris);
  late final List<T> references = _usage.references
      .map(
        (e) => switch (e.whichReference()) {
          pb.Reference_Reference.arguments => CallReference(e, _uris),
          pb.Reference_Reference.fields => InstanceReference(e, _uris),
          pb.Reference_Reference.notSet => throw UnimplementedError(),
        },
      )
      .whereType<T>()
      .toList();

  Usage({
    required pb.Usage usage,
    required List<pb.Identifier> ids,
    required List<String> uris,
  })  : _usage = usage,
        _ids = ids,
        _uris = uris;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Usage && other._usage == _usage;
  }

  @override
  int get hashCode => _usage.hashCode;
}
