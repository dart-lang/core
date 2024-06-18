//
//  Generated code. Do not modify.
//  source: usages_storage.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Usages extends $pb.GeneratedMessage {
  factory Usages({
    Metadata? metadata,
    $core.Iterable<Uri>? uris,
    $core.Iterable<Identifier>? ids,
    $core.Iterable<Usage>? calls,
    $core.Iterable<Usage>? instances,
  }) {
    final $result = create();
    if (metadata != null) {
      $result.metadata = metadata;
    }
    if (uris != null) {
      $result.uris.addAll(uris);
    }
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    if (calls != null) {
      $result.calls.addAll(calls);
    }
    if (instances != null) {
      $result.instances.addAll(instances);
    }
    return $result;
  }
  Usages._() : super();
  factory Usages.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Usages.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Usages', package: const $pb.PackageName(_omitMessageNames ? '' : 'usages'), createEmptyInstance: create)
    ..aOM<Metadata>(1, _omitFieldNames ? '' : 'metadata', subBuilder: Metadata.create)
    ..pc<Uri>(2, _omitFieldNames ? '' : 'uris', $pb.PbFieldType.PM, subBuilder: Uri.create)
    ..pc<Identifier>(3, _omitFieldNames ? '' : 'ids', $pb.PbFieldType.PM, subBuilder: Identifier.create)
    ..pc<Usage>(4, _omitFieldNames ? '' : 'calls', $pb.PbFieldType.PM, subBuilder: Usage.create)
    ..pc<Usage>(5, _omitFieldNames ? '' : 'instances', $pb.PbFieldType.PM, subBuilder: Usage.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Usages clone() => Usages()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Usages copyWith(void Function(Usages) updates) => super.copyWith((message) => updates(message as Usages)) as Usages;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Usages create() => Usages._();
  Usages createEmptyInstance() => create();
  static $pb.PbList<Usages> createRepeated() => $pb.PbList<Usages>();
  @$core.pragma('dart2js:noInline')
  static Usages getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Usages>(create);
  static Usages? _defaultInstance;

  @$pb.TagNumber(1)
  Metadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(Metadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  Metadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<Uri> get uris => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<Identifier> get ids => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<Usage> get calls => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<Usage> get instances => $_getList(4);
}

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
  factory Metadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Metadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Metadata', package: const $pb.PackageName(_omitMessageNames ? '' : 'usages'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'comment')
    ..aOS(2, _omitFieldNames ? '' : 'version')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Metadata clone() => Metadata()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Metadata copyWith(void Function(Metadata) updates) => super.copyWith((message) => updates(message as Metadata)) as Metadata;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Metadata create() => Metadata._();
  Metadata createEmptyInstance() => create();
  static $pb.PbList<Metadata> createRepeated() => $pb.PbList<Metadata>();
  @$core.pragma('dart2js:noInline')
  static Metadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Metadata>(create);
  static Metadata? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get comment => $_getSZ(0);
  @$pb.TagNumber(1)
  set comment($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasComment() => $_has(0);
  @$pb.TagNumber(1)
  void clearComment() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get version => $_getSZ(1);
  @$pb.TagNumber(2)
  set version($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => clearField(2);
}

class Uri extends $pb.GeneratedMessage {
  factory Uri({
    $core.String? value,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  Uri._() : super();
  factory Uri.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Uri.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Uri', package: const $pb.PackageName(_omitMessageNames ? '' : 'usages'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Uri clone() => Uri()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Uri copyWith(void Function(Uri) updates) => super.copyWith((message) => updates(message as Uri)) as Uri;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Uri create() => Uri._();
  Uri createEmptyInstance() => create();
  static $pb.PbList<Uri> createRepeated() => $pb.PbList<Uri>();
  @$core.pragma('dart2js:noInline')
  static Uri getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Uri>(create);
  static Uri? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class Identifier extends $pb.GeneratedMessage {
  factory Identifier({
    $core.int? uri,
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
  factory Identifier.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Identifier.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Identifier', package: const $pb.PackageName(_omitMessageNames ? '' : 'usages'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'uri', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'parent')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Identifier clone() => Identifier()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Identifier copyWith(void Function(Identifier) updates) => super.copyWith((message) => updates(message as Identifier)) as Identifier;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Identifier create() => Identifier._();
  Identifier createEmptyInstance() => create();
  static $pb.PbList<Identifier> createRepeated() => $pb.PbList<Identifier>();
  @$core.pragma('dart2js:noInline')
  static Identifier getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Identifier>(create);
  static Identifier? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uri => $_getIZ(0);
  @$pb.TagNumber(1)
  set uri($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUri() => $_has(0);
  @$pb.TagNumber(1)
  void clearUri() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get parent => $_getSZ(1);
  @$pb.TagNumber(2)
  set parent($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasParent() => $_has(1);
  @$pb.TagNumber(2)
  void clearParent() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);
}

class Usage extends $pb.GeneratedMessage {
  factory Usage({
    Definition? definition,
    $core.Iterable<Reference>? references,
  }) {
    final $result = create();
    if (definition != null) {
      $result.definition = definition;
    }
    if (references != null) {
      $result.references.addAll(references);
    }
    return $result;
  }
  Usage._() : super();
  factory Usage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Usage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Usage', package: const $pb.PackageName(_omitMessageNames ? '' : 'usages'), createEmptyInstance: create)
    ..aOM<Definition>(1, _omitFieldNames ? '' : 'definition', subBuilder: Definition.create)
    ..pc<Reference>(2, _omitFieldNames ? '' : 'references', $pb.PbFieldType.PM, subBuilder: Reference.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Usage clone() => Usage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Usage copyWith(void Function(Usage) updates) => super.copyWith((message) => updates(message as Usage)) as Usage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Usage create() => Usage._();
  Usage createEmptyInstance() => create();
  static $pb.PbList<Usage> createRepeated() => $pb.PbList<Usage>();
  @$core.pragma('dart2js:noInline')
  static Usage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Usage>(create);
  static Usage? _defaultInstance;

  @$pb.TagNumber(1)
  Definition get definition => $_getN(0);
  @$pb.TagNumber(1)
  set definition(Definition v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDefinition() => $_has(0);
  @$pb.TagNumber(1)
  void clearDefinition() => clearField(1);
  @$pb.TagNumber(1)
  Definition ensureDefinition() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<Reference> get references => $_getList(1);
}

class Definition extends $pb.GeneratedMessage {
  factory Definition({
    $core.int? identifier,
    Location? location,
    $core.String? loadingUnit,
  }) {
    final $result = create();
    if (identifier != null) {
      $result.identifier = identifier;
    }
    if (location != null) {
      $result.location = location;
    }
    if (loadingUnit != null) {
      $result.loadingUnit = loadingUnit;
    }
    return $result;
  }
  Definition._() : super();
  factory Definition.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Definition.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Definition', package: const $pb.PackageName(_omitMessageNames ? '' : 'usages'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'identifier', $pb.PbFieldType.OU3)
    ..aOM<Location>(2, _omitFieldNames ? '' : 'location', subBuilder: Location.create)
    ..aOS(3, _omitFieldNames ? '' : 'loadingUnit')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Definition clone() => Definition()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Definition copyWith(void Function(Definition) updates) => super.copyWith((message) => updates(message as Definition)) as Definition;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Definition create() => Definition._();
  Definition createEmptyInstance() => create();
  static $pb.PbList<Definition> createRepeated() => $pb.PbList<Definition>();
  @$core.pragma('dart2js:noInline')
  static Definition getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Definition>(create);
  static Definition? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get identifier => $_getIZ(0);
  @$pb.TagNumber(1)
  set identifier($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentifier() => clearField(1);

  @$pb.TagNumber(2)
  Location get location => $_getN(1);
  @$pb.TagNumber(2)
  set location(Location v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocation() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocation() => clearField(2);
  @$pb.TagNumber(2)
  Location ensureLocation() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get loadingUnit => $_getSZ(2);
  @$pb.TagNumber(3)
  set loadingUnit($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLoadingUnit() => $_has(2);
  @$pb.TagNumber(3)
  void clearLoadingUnit() => clearField(3);
}

class Location extends $pb.GeneratedMessage {
  factory Location({
    $core.int? uri,
    $core.int? line,
    $core.int? column,
  }) {
    final $result = create();
    if (uri != null) {
      $result.uri = uri;
    }
    if (line != null) {
      $result.line = line;
    }
    if (column != null) {
      $result.column = column;
    }
    return $result;
  }
  Location._() : super();
  factory Location.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Location.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Location', package: const $pb.PackageName(_omitMessageNames ? '' : 'usages'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'uri', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'line', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'column', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Location clone() => Location()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Location copyWith(void Function(Location) updates) => super.copyWith((message) => updates(message as Location)) as Location;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Location create() => Location._();
  Location createEmptyInstance() => create();
  static $pb.PbList<Location> createRepeated() => $pb.PbList<Location>();
  @$core.pragma('dart2js:noInline')
  static Location getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Location>(create);
  static Location? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uri => $_getIZ(0);
  @$pb.TagNumber(1)
  set uri($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUri() => $_has(0);
  @$pb.TagNumber(1)
  void clearUri() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get line => $_getIZ(1);
  @$pb.TagNumber(2)
  set line($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLine() => $_has(1);
  @$pb.TagNumber(2)
  void clearLine() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get column => $_getIZ(2);
  @$pb.TagNumber(3)
  set column($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasColumn() => $_has(2);
  @$pb.TagNumber(3)
  void clearColumn() => clearField(3);
}

enum Reference_Reference {
  arguments, 
  fields, 
  notSet
}

class Reference extends $pb.GeneratedMessage {
  factory Reference({
    Location? location,
    $core.String? loadingUnit,
    Arguments? arguments,
    Fields? fields,
  }) {
    final $result = create();
    if (location != null) {
      $result.location = location;
    }
    if (loadingUnit != null) {
      $result.loadingUnit = loadingUnit;
    }
    if (arguments != null) {
      $result.arguments = arguments;
    }
    if (fields != null) {
      $result.fields = fields;
    }
    return $result;
  }
  Reference._() : super();
  factory Reference.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Reference.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Reference_Reference> _Reference_ReferenceByTag = {
    3 : Reference_Reference.arguments,
    4 : Reference_Reference.fields,
    0 : Reference_Reference.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Reference', package: const $pb.PackageName(_omitMessageNames ? '' : 'usages'), createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..aOM<Location>(1, _omitFieldNames ? '' : 'location', subBuilder: Location.create)
    ..aOS(2, _omitFieldNames ? '' : 'loadingUnit')
    ..aOM<Arguments>(3, _omitFieldNames ? '' : 'arguments', subBuilder: Arguments.create)
    ..aOM<Fields>(4, _omitFieldNames ? '' : 'fields', subBuilder: Fields.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Reference clone() => Reference()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Reference copyWith(void Function(Reference) updates) => super.copyWith((message) => updates(message as Reference)) as Reference;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Reference create() => Reference._();
  Reference createEmptyInstance() => create();
  static $pb.PbList<Reference> createRepeated() => $pb.PbList<Reference>();
  @$core.pragma('dart2js:noInline')
  static Reference getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reference>(create);
  static Reference? _defaultInstance;

  Reference_Reference whichReference() => _Reference_ReferenceByTag[$_whichOneof(0)]!;
  void clearReference() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Location get location => $_getN(0);
  @$pb.TagNumber(1)
  set location(Location v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocation() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocation() => clearField(1);
  @$pb.TagNumber(1)
  Location ensureLocation() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get loadingUnit => $_getSZ(1);
  @$pb.TagNumber(2)
  set loadingUnit($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLoadingUnit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLoadingUnit() => clearField(2);

  @$pb.TagNumber(3)
  Arguments get arguments => $_getN(2);
  @$pb.TagNumber(3)
  set arguments(Arguments v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasArguments() => $_has(2);
  @$pb.TagNumber(3)
  void clearArguments() => clearField(3);
  @$pb.TagNumber(3)
  Arguments ensureArguments() => $_ensure(2);

  @$pb.TagNumber(4)
  Fields get fields => $_getN(3);
  @$pb.TagNumber(4)
  set fields(Fields v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasFields() => $_has(3);
  @$pb.TagNumber(4)
  void clearFields() => clearField(4);
  @$pb.TagNumber(4)
  Fields ensureFields() => $_ensure(3);
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
  factory Fields.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Fields.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Fields', package: const $pb.PackageName(_omitMessageNames ? '' : 'usages'), createEmptyInstance: create)
    ..pc<Field>(1, _omitFieldNames ? '' : 'fields', $pb.PbFieldType.PM, subBuilder: Field.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Fields clone() => Fields()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Fields copyWith(void Function(Fields) updates) => super.copyWith((message) => updates(message as Fields)) as Fields;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Fields create() => Fields._();
  Fields createEmptyInstance() => create();
  static $pb.PbList<Fields> createRepeated() => $pb.PbList<Fields>();
  @$core.pragma('dart2js:noInline')
  static Fields getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Fields>(create);
  static Fields? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Field> get fields => $_getList(0);
}

enum Arguments_Kind {
  const_1, 
  nonConst, 
  notSet
}

class Arguments extends $pb.GeneratedMessage {
  factory Arguments({
    ConstArguments? const_1,
    NonConstArguments? nonConst,
  }) {
    final $result = create();
    if (const_1 != null) {
      $result.const_1 = const_1;
    }
    if (nonConst != null) {
      $result.nonConst = nonConst;
    }
    return $result;
  }
  Arguments._() : super();
  factory Arguments.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Arguments.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Arguments_Kind> _Arguments_KindByTag = {
    1 : Arguments_Kind.const_1,
    2 : Arguments_Kind.nonConst,
    0 : Arguments_Kind.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Arguments', package: const $pb.PackageName(_omitMessageNames ? '' : 'usages'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<ConstArguments>(1, _omitFieldNames ? '' : 'const', subBuilder: ConstArguments.create)
    ..aOM<NonConstArguments>(2, _omitFieldNames ? '' : 'nonConst', subBuilder: NonConstArguments.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Arguments clone() => Arguments()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Arguments copyWith(void Function(Arguments) updates) => super.copyWith((message) => updates(message as Arguments)) as Arguments;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Arguments create() => Arguments._();
  Arguments createEmptyInstance() => create();
  static $pb.PbList<Arguments> createRepeated() => $pb.PbList<Arguments>();
  @$core.pragma('dart2js:noInline')
  static Arguments getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Arguments>(create);
  static Arguments? _defaultInstance;

  Arguments_Kind whichKind() => _Arguments_KindByTag[$_whichOneof(0)]!;
  void clearKind() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ConstArguments get const_1 => $_getN(0);
  @$pb.TagNumber(1)
  set const_1(ConstArguments v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasConst_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearConst_1() => clearField(1);
  @$pb.TagNumber(1)
  ConstArguments ensureConst_1() => $_ensure(0);

  @$pb.TagNumber(2)
  NonConstArguments get nonConst => $_getN(1);
  @$pb.TagNumber(2)
  set nonConst(NonConstArguments v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNonConst() => $_has(1);
  @$pb.TagNumber(2)
  void clearNonConst() => clearField(2);
  @$pb.TagNumber(2)
  NonConstArguments ensureNonConst() => $_ensure(1);
}

class ConstArguments extends $pb.GeneratedMessage {
  factory ConstArguments({
    $core.Map<$core.int, $core.String>? positional,
    $core.Map<$core.String, $core.String>? named,
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
  factory ConstArguments.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConstArguments.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConstArguments', package: const $pb.PackageName(_omitMessageNames ? '' : 'usages'), createEmptyInstance: create)
    ..m<$core.int, $core.String>(1, _omitFieldNames ? '' : 'positional', entryClassName: 'ConstArguments.PositionalEntry', keyFieldType: $pb.PbFieldType.OU3, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('usages'))
    ..m<$core.String, $core.String>(2, _omitFieldNames ? '' : 'named', entryClassName: 'ConstArguments.NamedEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('usages'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConstArguments clone() => ConstArguments()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConstArguments copyWith(void Function(ConstArguments) updates) => super.copyWith((message) => updates(message as ConstArguments)) as ConstArguments;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConstArguments create() => ConstArguments._();
  ConstArguments createEmptyInstance() => create();
  static $pb.PbList<ConstArguments> createRepeated() => $pb.PbList<ConstArguments>();
  @$core.pragma('dart2js:noInline')
  static ConstArguments getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConstArguments>(create);
  static ConstArguments? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.int, $core.String> get positional => $_getMap(0);

  @$pb.TagNumber(2)
  $core.Map<$core.String, $core.String> get named => $_getMap(1);
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
  factory NonConstArguments.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NonConstArguments.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NonConstArguments', package: const $pb.PackageName(_omitMessageNames ? '' : 'usages'), createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'positional', $pb.PbFieldType.KU3)
    ..pPS(2, _omitFieldNames ? '' : 'named')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NonConstArguments clone() => NonConstArguments()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NonConstArguments copyWith(void Function(NonConstArguments) updates) => super.copyWith((message) => updates(message as NonConstArguments)) as NonConstArguments;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NonConstArguments create() => NonConstArguments._();
  NonConstArguments createEmptyInstance() => create();
  static $pb.PbList<NonConstArguments> createRepeated() => $pb.PbList<NonConstArguments>();
  @$core.pragma('dart2js:noInline')
  static NonConstArguments getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NonConstArguments>(create);
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
  factory Field.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Field.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Field', package: const $pb.PackageName(_omitMessageNames ? '' : 'usages'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'className')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOM<FieldValue>(3, _omitFieldNames ? '' : 'value', subBuilder: FieldValue.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Field clone() => Field()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Field copyWith(void Function(Field) updates) => super.copyWith((message) => updates(message as Field)) as Field;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Field create() => Field._();
  Field createEmptyInstance() => create();
  static $pb.PbList<Field> createRepeated() => $pb.PbList<Field>();
  @$core.pragma('dart2js:noInline')
  static Field getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Field>(create);
  static Field? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get className => $_getSZ(0);
  @$pb.TagNumber(1)
  set className($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClassName() => $_has(0);
  @$pb.TagNumber(1)
  void clearClassName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  FieldValue get value => $_getN(2);
  @$pb.TagNumber(3)
  set value(FieldValue v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => clearField(3);
  @$pb.TagNumber(3)
  FieldValue ensureValue() => $_ensure(2);
}

enum FieldValue_Value {
  intValue, 
  doubleValue, 
  boolValue, 
  stringValue, 
  notSet
}

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
  factory FieldValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FieldValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, FieldValue_Value> _FieldValue_ValueByTag = {
    1 : FieldValue_Value.intValue,
    2 : FieldValue_Value.doubleValue,
    3 : FieldValue_Value.boolValue,
    4 : FieldValue_Value.stringValue,
    0 : FieldValue_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FieldValue', package: const $pb.PackageName(_omitMessageNames ? '' : 'usages'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4])
    ..a<$core.int>(1, _omitFieldNames ? '' : 'intValue', $pb.PbFieldType.O3)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'doubleValue', $pb.PbFieldType.OD)
    ..aOB(3, _omitFieldNames ? '' : 'boolValue')
    ..aOS(4, _omitFieldNames ? '' : 'stringValue')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FieldValue clone() => FieldValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FieldValue copyWith(void Function(FieldValue) updates) => super.copyWith((message) => updates(message as FieldValue)) as FieldValue;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FieldValue create() => FieldValue._();
  FieldValue createEmptyInstance() => create();
  static $pb.PbList<FieldValue> createRepeated() => $pb.PbList<FieldValue>();
  @$core.pragma('dart2js:noInline')
  static FieldValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FieldValue>(create);
  static FieldValue? _defaultInstance;

  FieldValue_Value whichValue() => _FieldValue_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get intValue => $_getIZ(0);
  @$pb.TagNumber(1)
  set intValue($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIntValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearIntValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get doubleValue => $_getN(1);
  @$pb.TagNumber(2)
  set doubleValue($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDoubleValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearDoubleValue() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get boolValue => $_getBF(2);
  @$pb.TagNumber(3)
  set boolValue($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBoolValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearBoolValue() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get stringValue => $_getSZ(3);
  @$pb.TagNumber(4)
  set stringValue($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStringValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearStringValue() => clearField(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
