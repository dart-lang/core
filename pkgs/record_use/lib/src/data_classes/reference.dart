// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../proto/usages.pb.dart' as pb;
import 'arguments.dart';
import 'field.dart';
import 'location.dart';

sealed class Reference {
  final String? loadingUnit;
  // Represents the "@" field in the JSON

  final Location location;

  const Reference({this.loadingUnit, required this.location});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Reference &&
        other.loadingUnit == loadingUnit &&
        other.location == location;
  }

  @override
  int get hashCode => loadingUnit.hashCode ^ location.hashCode;
}

final class CallReference extends Reference {
  final pb.Reference _reference;

  late final Arguments? arguments =
      _reference.hasArguments() ? Arguments(_reference.arguments) : null;

  CallReference(this._reference, List<String> uris)
      : super(
          location: Location(_reference.location, null, uris),
          loadingUnit:
              _reference.hasLoadingUnit() ? _reference.loadingUnit : null,
        );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CallReference && other._reference == _reference;
  }

  @override
  int get hashCode => _reference.hashCode;
}

final class InstanceReference extends Reference {
  final pb.Reference _reference;

  late final Iterable<Field> fields =
      _reference.hasFields() ? _reference.fields.fields.map(Field.new) : [];

  InstanceReference(this._reference, List<String> uris)
      : super(
          location: Location(_reference.location, null, uris),
          loadingUnit:
              _reference.hasLoadingUnit() ? _reference.loadingUnit : null,
        );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CallReference && other._reference == _reference;
  }

  @override
  int get hashCode => _reference.hashCode;
}
