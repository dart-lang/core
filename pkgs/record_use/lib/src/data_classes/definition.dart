// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../proto/usages.pb.dart' as pb;
import 'identifier.dart';
import 'location.dart';

class Definition {
  final pb.Definition _definition;
  final List<pb.Identifier> _identifiers;
  final List<String> _uris;

  late final Identifier identifier =
      Identifier.fromPb(_identifiers[_definition.identifier], _uris);

  /// Represents the '@' field in the JSON
  late final Location location =
      Location(_definition.location, identifier.uri, null);

  late final String? loadingUnit =
      _definition.hasLoadingUnit() ? _definition.loadingUnit : null;

  Definition(this._definition, this._identifiers, this._uris);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Definition && other._definition == _definition;
  }

  @override
  int get hashCode => _definition.hashCode;
}
