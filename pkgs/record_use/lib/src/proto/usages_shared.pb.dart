//
//  Generated code. Do not modify.
//  source: usages_shared.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Metadata extends $pb.GeneratedMessage {
  factory Metadata({
    $core.String? comment,
    $core.String? version,
  }) {
    final $result = create();
    if (comment != null) {
      $result.comment = comment;
    }
    if (version != null) {
      $result.version = version;
    }
    return $result;
  }
  Metadata._() : super();
  factory Metadata.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Metadata.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Metadata',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'usages_shared'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'comment')
    ..aOS(2, _omitFieldNames ? '' : 'version')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Metadata clone() => Metadata()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Metadata copyWith(void Function(Metadata) updates) =>
      super.copyWith((message) => updates(message as Metadata)) as Metadata;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Metadata create() => Metadata._();
  Metadata createEmptyInstance() => create();
  static $pb.PbList<Metadata> createRepeated() => $pb.PbList<Metadata>();
  @$core.pragma('dart2js:noInline')
  static Metadata getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Metadata>(create);
  static Metadata? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get comment => $_getSZ(0);
  @$pb.TagNumber(1)
  set comment($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasComment() => $_has(0);
  @$pb.TagNumber(1)
  void clearComment() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get version => $_getSZ(1);
  @$pb.TagNumber(2)
  set version($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => clearField(2);
}

class Definition extends $pb.GeneratedMessage {
  factory Definition({
    Identifier? identifier,
    $core.int? line,
    $core.int? column,
    $core.String? loadingUnit,
  }) {
    final $result = create();
    if (identifier != null) {
      $result.identifier = identifier;
    }
    if (line != null) {
      $result.line = line;
    }
    if (column != null) {
      $result.column = column;
    }
    if (loadingUnit != null) {
      $result.loadingUnit = loadingUnit;
    }
    return $result;
  }
  Definition._() : super();
  factory Definition.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Definition.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Definition',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'usages_shared'),
      createEmptyInstance: create)
    ..aOM<Identifier>(1, _omitFieldNames ? '' : 'identifier',
        subBuilder: Identifier.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'line', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'column', $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'loadingUnit')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Definition clone() => Definition()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Definition copyWith(void Function(Definition) updates) =>
      super.copyWith((message) => updates(message as Definition)) as Definition;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Definition create() => Definition._();
  Definition createEmptyInstance() => create();
  static $pb.PbList<Definition> createRepeated() => $pb.PbList<Definition>();
  @$core.pragma('dart2js:noInline')
  static Definition getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Definition>(create);
  static Definition? _defaultInstance;

  @$pb.TagNumber(1)
  Identifier get identifier => $_getN(0);
  @$pb.TagNumber(1)
  set identifier(Identifier v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentifier() => clearField(1);
  @$pb.TagNumber(1)
  Identifier ensureIdentifier() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get line => $_getIZ(1);
  @$pb.TagNumber(2)
  set line($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLine() => $_has(1);
  @$pb.TagNumber(2)
  void clearLine() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get column => $_getIZ(2);
  @$pb.TagNumber(3)
  set column($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasColumn() => $_has(2);
  @$pb.TagNumber(3)
  void clearColumn() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get loadingUnit => $_getSZ(3);
  @$pb.TagNumber(4)
  set loadingUnit($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLoadingUnit() => $_has(3);
  @$pb.TagNumber(4)
  void clearLoadingUnit() => clearField(4);
}

class Identifier extends $pb.GeneratedMessage {
  factory Identifier({
    $core.String? uri,
    $core.String? parent,
    $core.String? name,
  }) {
    final $result = create();
    if (uri != null) {
      $result.uri = uri;
    }
    if (parent != null) {
      $result.parent = parent;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  Identifier._() : super();
  factory Identifier.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Identifier.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Identifier',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'usages_shared'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uri')
    ..aOS(2, _omitFieldNames ? '' : 'parent')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Identifier clone() => Identifier()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Identifier copyWith(void Function(Identifier) updates) =>
      super.copyWith((message) => updates(message as Identifier)) as Identifier;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Identifier create() => Identifier._();
  Identifier createEmptyInstance() => create();
  static $pb.PbList<Identifier> createRepeated() => $pb.PbList<Identifier>();
  @$core.pragma('dart2js:noInline')
  static Identifier getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Identifier>(create);
  static Identifier? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uri => $_getSZ(0);
  @$pb.TagNumber(1)
  set uri($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUri() => $_has(0);
  @$pb.TagNumber(1)
  void clearUri() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get parent => $_getSZ(1);
  @$pb.TagNumber(2)
  set parent($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasParent() => $_has(1);
  @$pb.TagNumber(2)
  void clearParent() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);
}

class Fields extends $pb.GeneratedMessage {
  factory Fields({
    $core.Iterable<Field>? fields,
  }) {
    final $result = create();
    if (fields != null) {
      $result.fields.addAll(fields);
    }
    return $result;
  }
  Fields._() : super();
  factory Fields.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Fields.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Fields',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'usages_shared'),
      createEmptyInstance: create)
    ..pc<Field>(1, _omitFieldNames ? '' : 'fields', $pb.PbFieldType.PM,
        subBuilder: Field.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Fields clone() => Fields()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Fields copyWith(void Function(Fields) updates) =>
      super.copyWith((message) => updates(message as Fields)) as Fields;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Fields create() => Fields._();
  Fields createEmptyInstance() => create();
  static $pb.PbList<Fields> createRepeated() => $pb.PbList<Fields>();
  @$core.pragma('dart2js:noInline')
  static Fields getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Fields>(create);
  static Fields? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Field> get fields => $_getList(0);
}

enum Arguments_Kind { constArguments, nonConstArguments, notSet }

class Arguments extends $pb.GeneratedMessage {
  factory Arguments({
    ConstArguments? constArguments,
    NonConstArguments? nonConstArguments,
  }) {
    final $result = create();
    if (constArguments != null) {
      $result.constArguments = constArguments;
    }
    if (nonConstArguments != null) {
      $result.nonConstArguments = nonConstArguments;
    }
    return $result;
  }
  Arguments._() : super();
  factory Arguments.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Arguments.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Arguments_Kind> _Arguments_KindByTag = {
    1: Arguments_Kind.constArguments,
    2: Arguments_Kind.nonConstArguments,
    0: Arguments_Kind.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Arguments',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'usages_shared'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<ConstArguments>(1, _omitFieldNames ? '' : 'constArguments',
        subBuilder: ConstArguments.create)
    ..aOM<NonConstArguments>(2, _omitFieldNames ? '' : 'nonConstArguments',
        subBuilder: NonConstArguments.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Arguments clone() => Arguments()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Arguments copyWith(void Function(Arguments) updates) =>
      super.copyWith((message) => updates(message as Arguments)) as Arguments;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Arguments create() => Arguments._();
  Arguments createEmptyInstance() => create();
  static $pb.PbList<Arguments> createRepeated() => $pb.PbList<Arguments>();
  @$core.pragma('dart2js:noInline')
  static Arguments getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Arguments>(create);
  static Arguments? _defaultInstance;

  Arguments_Kind whichKind() => _Arguments_KindByTag[$_whichOneof(0)]!;
  void clearKind() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ConstArguments get constArguments => $_getN(0);
  @$pb.TagNumber(1)
  set constArguments(ConstArguments v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConstArguments() => $_has(0);
  @$pb.TagNumber(1)
  void clearConstArguments() => clearField(1);
  @$pb.TagNumber(1)
  ConstArguments ensureConstArguments() => $_ensure(0);

  @$pb.TagNumber(2)
  NonConstArguments get nonConstArguments => $_getN(1);
  @$pb.TagNumber(2)
  set nonConstArguments(NonConstArguments v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNonConstArguments() => $_has(1);
  @$pb.TagNumber(2)
  void clearNonConstArguments() => clearField(2);
  @$pb.TagNumber(2)
  NonConstArguments ensureNonConstArguments() => $_ensure(1);
}

class ConstArguments extends $pb.GeneratedMessage {
  factory ConstArguments({
    $core.Map<$core.int, FieldValue>? positional,
    $core.Map<$core.String, FieldValue>? named,
  }) {
    final $result = create();
    if (positional != null) {
      $result.positional.addAll(positional);
    }
    if (named != null) {
      $result.named.addAll(named);
    }
    return $result;
  }
  ConstArguments._() : super();
  factory ConstArguments.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConstArguments.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConstArguments',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'usages_shared'),
      createEmptyInstance: create)
    ..m<$core.int, FieldValue>(1, _omitFieldNames ? '' : 'positional',
        entryClassName: 'ConstArguments.PositionalEntry',
        keyFieldType: $pb.PbFieldType.OU3,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: FieldValue.create,
        valueDefaultOrMaker: FieldValue.getDefault,
        packageName: const $pb.PackageName('usages_shared'))
    ..m<$core.String, FieldValue>(2, _omitFieldNames ? '' : 'named',
        entryClassName: 'ConstArguments.NamedEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: FieldValue.create,
        valueDefaultOrMaker: FieldValue.getDefault,
        packageName: const $pb.PackageName('usages_shared'))
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConstArguments clone() => ConstArguments()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConstArguments copyWith(void Function(ConstArguments) updates) =>
      super.copyWith((message) => updates(message as ConstArguments))
          as ConstArguments;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConstArguments create() => ConstArguments._();
  ConstArguments createEmptyInstance() => create();
  static $pb.PbList<ConstArguments> createRepeated() =>
      $pb.PbList<ConstArguments>();
  @$core.pragma('dart2js:noInline')
  static ConstArguments getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConstArguments>(create);
  static ConstArguments? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.int, FieldValue> get positional => $_getMap(0);

  @$pb.TagNumber(2)
  $core.Map<$core.String, FieldValue> get named => $_getMap(1);
}

class NonConstArguments extends $pb.GeneratedMessage {
  factory NonConstArguments({
    $core.Iterable<$core.int>? positional,
    $core.Iterable<$core.String>? named,
  }) {
    final $result = create();
    if (positional != null) {
      $result.positional.addAll(positional);
    }
    if (named != null) {
      $result.named.addAll(named);
    }
    return $result;
  }
  NonConstArguments._() : super();
  factory NonConstArguments.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NonConstArguments.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NonConstArguments',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'usages_shared'),
      createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'positional', $pb.PbFieldType.KU3)
    ..pPS(2, _omitFieldNames ? '' : 'named')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NonConstArguments clone() => NonConstArguments()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NonConstArguments copyWith(void Function(NonConstArguments) updates) =>
      super.copyWith((message) => updates(message as NonConstArguments))
          as NonConstArguments;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NonConstArguments create() => NonConstArguments._();
  NonConstArguments createEmptyInstance() => create();
  static $pb.PbList<NonConstArguments> createRepeated() =>
      $pb.PbList<NonConstArguments>();
  @$core.pragma('dart2js:noInline')
  static NonConstArguments getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NonConstArguments>(create);
  static NonConstArguments? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get positional => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.String> get named => $_getList(1);
}

class Field extends $pb.GeneratedMessage {
  factory Field({
    $core.String? className,
    $core.String? name,
    FieldValue? value,
  }) {
    final $result = create();
    if (className != null) {
      $result.className = className;
    }
    if (name != null) {
      $result.name = name;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  Field._() : super();
  factory Field.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Field.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Field',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'usages_shared'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'className')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOM<FieldValue>(3, _omitFieldNames ? '' : 'value',
        subBuilder: FieldValue.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Field clone() => Field()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Field copyWith(void Function(Field) updates) =>
      super.copyWith((message) => updates(message as Field)) as Field;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Field create() => Field._();
  Field createEmptyInstance() => create();
  static $pb.PbList<Field> createRepeated() => $pb.PbList<Field>();
  @$core.pragma('dart2js:noInline')
  static Field getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Field>(create);
  static Field? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get className => $_getSZ(0);
  @$pb.TagNumber(1)
  set className($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasClassName() => $_has(0);
  @$pb.TagNumber(1)
  void clearClassName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  FieldValue get value => $_getN(2);
  @$pb.TagNumber(3)
  set value(FieldValue v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => clearField(3);
  @$pb.TagNumber(3)
  FieldValue ensureValue() => $_ensure(2);
}

enum FieldValue_Value { intValue, doubleValue, boolValue, stringValue, notSet }

class FieldValue extends $pb.GeneratedMessage {
  factory FieldValue({
    $core.int? intValue,
    $core.double? doubleValue,
    $core.bool? boolValue,
    $core.String? stringValue,
  }) {
    final $result = create();
    if (intValue != null) {
      $result.intValue = intValue;
    }
    if (doubleValue != null) {
      $result.doubleValue = doubleValue;
    }
    if (boolValue != null) {
      $result.boolValue = boolValue;
    }
    if (stringValue != null) {
      $result.stringValue = stringValue;
    }
    return $result;
  }
  FieldValue._() : super();
  factory FieldValue.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FieldValue.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, FieldValue_Value> _FieldValue_ValueByTag = {
    1: FieldValue_Value.intValue,
    2: FieldValue_Value.doubleValue,
    3: FieldValue_Value.boolValue,
    4: FieldValue_Value.stringValue,
    0: FieldValue_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FieldValue',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'usages_shared'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4])
    ..a<$core.int>(1, _omitFieldNames ? '' : 'intValue', $pb.PbFieldType.O3)
    ..a<$core.double>(
        2, _omitFieldNames ? '' : 'doubleValue', $pb.PbFieldType.OD)
    ..aOB(3, _omitFieldNames ? '' : 'boolValue')
    ..aOS(4, _omitFieldNames ? '' : 'stringValue')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FieldValue clone() => FieldValue()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FieldValue copyWith(void Function(FieldValue) updates) =>
      super.copyWith((message) => updates(message as FieldValue)) as FieldValue;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FieldValue create() => FieldValue._();
  FieldValue createEmptyInstance() => create();
  static $pb.PbList<FieldValue> createRepeated() => $pb.PbList<FieldValue>();
  @$core.pragma('dart2js:noInline')
  static FieldValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FieldValue>(create);
  static FieldValue? _defaultInstance;

  FieldValue_Value whichValue() => _FieldValue_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get intValue => $_getIZ(0);
  @$pb.TagNumber(1)
  set intValue($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIntValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearIntValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get doubleValue => $_getN(1);
  @$pb.TagNumber(2)
  set doubleValue($core.double v) {
    $_setDouble(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDoubleValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearDoubleValue() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get boolValue => $_getBF(2);
  @$pb.TagNumber(3)
  set boolValue($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBoolValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearBoolValue() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get stringValue => $_getSZ(3);
  @$pb.TagNumber(4)
  set stringValue($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStringValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearStringValue() => clearField(4);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
