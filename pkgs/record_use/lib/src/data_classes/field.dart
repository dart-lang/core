// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../proto/usages.pb.dart' as pb;

class Field {
  final pb.Field _field;

  late final String className = _field.className;
  late final String name = _field.name;
  late final Object? value = switch (_field.value.whichValue()) {
    pb.FieldValue_Value.intValue => _field.value.intValue,
    pb.FieldValue_Value.doubleValue => _field.value.doubleValue,
    pb.FieldValue_Value.boolValue => _field.value.boolValue,
    pb.FieldValue_Value.stringValue => _field.value.stringValue,
    pb.FieldValue_Value.notSet => throw UnimplementedError(),
  };

  Field(this._field);

  @override
  int get hashCode => _field.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Field && other._field == _field;
  }
}
