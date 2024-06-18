// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../proto/usages.pb.dart' as pb;

class Identifier {
  final pb.Identifier _identifier;

  final String uri;

  /// Optional since not all elements have parents
  late final String? parent =
      _identifier.hasParent() ? _identifier.parent : null;
  late final String name = _identifier.name;

  Identifier.fromPb(this._identifier, List<String> uris)
      : uri = uris[_identifier.uri];

  Identifier(this.uri, String? parent, String name)
      : _identifier = pb.Identifier(
          name: name,
          parent: parent,
          uri: uri,
        );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Identifier && other._identifier == _identifier;
  }

  @override
  int get hashCode => _identifier.hashCode;
}
