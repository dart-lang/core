// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../proto/usages.pb.dart' as pb;

class Location {
  late String uri;
  late int line;
  late int column;

  final pb.Location _protoLocation;
  Location(this._protoLocation, String? uri, List<String>? uris)
      : uri = uri ?? uris![_protoLocation.uri];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Location && other._protoLocation == _protoLocation;
  }

  @override
  int get hashCode => _protoLocation.hashCode;
}
