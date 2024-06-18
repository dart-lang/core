//
//  Generated code. Do not modify.
//  source: usages_storage.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use usagesDescriptor instead')
const Usages$json = {
  '1': 'Usages',
  '2': [
    {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.usages.Metadata', '10': 'metadata'},
    {'1': 'uris', '3': 2, '4': 3, '5': 11, '6': '.usages.Uri', '10': 'uris'},
    {'1': 'ids', '3': 3, '4': 3, '5': 11, '6': '.usages.Identifier', '10': 'ids'},
    {'1': 'calls', '3': 4, '4': 3, '5': 11, '6': '.usages.Usage', '10': 'calls'},
    {'1': 'instances', '3': 5, '4': 3, '5': 11, '6': '.usages.Usage', '10': 'instances'},
  ],
};

/// Descriptor for `Usages`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usagesDescriptor = $convert.base64Decode(
    'CgZVc2FnZXMSLAoIbWV0YWRhdGEYASABKAsyEC51c2FnZXMuTWV0YWRhdGFSCG1ldGFkYXRhEh'
    '8KBHVyaXMYAiADKAsyCy51c2FnZXMuVXJpUgR1cmlzEiQKA2lkcxgDIAMoCzISLnVzYWdlcy5J'
    'ZGVudGlmaWVyUgNpZHMSIwoFY2FsbHMYBCADKAsyDS51c2FnZXMuVXNhZ2VSBWNhbGxzEisKCW'
    'luc3RhbmNlcxgFIAMoCzINLnVzYWdlcy5Vc2FnZVIJaW5zdGFuY2Vz');

@$core.Deprecated('Use metadataDescriptor instead')
const Metadata$json = {
  '1': 'Metadata',
  '2': [
    {'1': 'comment', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'comment', '17': true},
    {'1': 'version', '3': 2, '4': 1, '5': 9, '10': 'version'},
  ],
  '8': [
    {'1': '_comment'},
  ],
};

/// Descriptor for `Metadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List metadataDescriptor = $convert.base64Decode(
    'CghNZXRhZGF0YRIdCgdjb21tZW50GAEgASgJSABSB2NvbW1lbnSIAQESGAoHdmVyc2lvbhgCIA'
    'EoCVIHdmVyc2lvbkIKCghfY29tbWVudA==');

@$core.Deprecated('Use uriDescriptor instead')
const Uri$json = {
  '1': 'Uri',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `Uri`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uriDescriptor = $convert.base64Decode(
    'CgNVcmkSFAoFdmFsdWUYASABKAlSBXZhbHVl');

@$core.Deprecated('Use identifierDescriptor instead')
const Identifier$json = {
  '1': 'Identifier',
  '2': [
    {'1': 'uri', '3': 1, '4': 1, '5': 13, '10': 'uri'},
    {'1': 'parent', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'parent', '17': true},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
  '8': [
    {'1': '_parent'},
  ],
};

/// Descriptor for `Identifier`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List identifierDescriptor = $convert.base64Decode(
    'CgpJZGVudGlmaWVyEhAKA3VyaRgBIAEoDVIDdXJpEhsKBnBhcmVudBgCIAEoCUgAUgZwYXJlbn'
    'SIAQESEgoEbmFtZRgDIAEoCVIEbmFtZUIJCgdfcGFyZW50');

@$core.Deprecated('Use usageDescriptor instead')
const Usage$json = {
  '1': 'Usage',
  '2': [
    {'1': 'definition', '3': 1, '4': 1, '5': 11, '6': '.usages.Definition', '10': 'definition'},
    {'1': 'references', '3': 2, '4': 3, '5': 11, '6': '.usages.Reference', '10': 'references'},
  ],
};

/// Descriptor for `Usage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usageDescriptor = $convert.base64Decode(
    'CgVVc2FnZRIyCgpkZWZpbml0aW9uGAEgASgLMhIudXNhZ2VzLkRlZmluaXRpb25SCmRlZmluaX'
    'Rpb24SMQoKcmVmZXJlbmNlcxgCIAMoCzIRLnVzYWdlcy5SZWZlcmVuY2VSCnJlZmVyZW5jZXM=');

@$core.Deprecated('Use definitionDescriptor instead')
const Definition$json = {
  '1': 'Definition',
  '2': [
    {'1': 'identifier', '3': 1, '4': 1, '5': 13, '10': 'identifier'},
    {'1': 'location', '3': 2, '4': 1, '5': 11, '6': '.usages.Location', '10': 'location'},
    {'1': 'loading_unit', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'loadingUnit', '17': true},
  ],
  '8': [
    {'1': '_loading_unit'},
  ],
};

/// Descriptor for `Definition`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List definitionDescriptor = $convert.base64Decode(
    'CgpEZWZpbml0aW9uEh4KCmlkZW50aWZpZXIYASABKA1SCmlkZW50aWZpZXISLAoIbG9jYXRpb2'
    '4YAiABKAsyEC51c2FnZXMuTG9jYXRpb25SCGxvY2F0aW9uEiYKDGxvYWRpbmdfdW5pdBgDIAEo'
    'CUgAUgtsb2FkaW5nVW5pdIgBAUIPCg1fbG9hZGluZ191bml0');

@$core.Deprecated('Use locationDescriptor instead')
const Location$json = {
  '1': 'Location',
  '2': [
    {'1': 'uri', '3': 1, '4': 1, '5': 13, '10': 'uri'},
    {'1': 'line', '3': 2, '4': 1, '5': 13, '10': 'line'},
    {'1': 'column', '3': 3, '4': 1, '5': 13, '10': 'column'},
  ],
};

/// Descriptor for `Location`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locationDescriptor = $convert.base64Decode(
    'CghMb2NhdGlvbhIQCgN1cmkYASABKA1SA3VyaRISCgRsaW5lGAIgASgNUgRsaW5lEhYKBmNvbH'
    'VtbhgDIAEoDVIGY29sdW1u');

@$core.Deprecated('Use referenceDescriptor instead')
const Reference$json = {
  '1': 'Reference',
  '2': [
    {'1': 'location', '3': 1, '4': 1, '5': 11, '6': '.usages.Location', '10': 'location'},
    {'1': 'loading_unit', '3': 2, '4': 1, '5': 9, '10': 'loadingUnit'},
    {'1': 'arguments', '3': 3, '4': 1, '5': 11, '6': '.usages.Arguments', '9': 0, '10': 'arguments'},
    {'1': 'fields', '3': 4, '4': 1, '5': 11, '6': '.usages.Fields', '9': 0, '10': 'fields'},
  ],
  '8': [
    {'1': 'reference'},
  ],
};

/// Descriptor for `Reference`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List referenceDescriptor = $convert.base64Decode(
    'CglSZWZlcmVuY2USLAoIbG9jYXRpb24YASABKAsyEC51c2FnZXMuTG9jYXRpb25SCGxvY2F0aW'
    '9uEiEKDGxvYWRpbmdfdW5pdBgCIAEoCVILbG9hZGluZ1VuaXQSMQoJYXJndW1lbnRzGAMgASgL'
    'MhEudXNhZ2VzLkFyZ3VtZW50c0gAUglhcmd1bWVudHMSKAoGZmllbGRzGAQgASgLMg4udXNhZ2'
    'VzLkZpZWxkc0gAUgZmaWVsZHNCCwoJcmVmZXJlbmNl');

@$core.Deprecated('Use fieldsDescriptor instead')
const Fields$json = {
  '1': 'Fields',
  '2': [
    {'1': 'fields', '3': 1, '4': 3, '5': 11, '6': '.usages.Field', '10': 'fields'},
  ],
};

/// Descriptor for `Fields`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fieldsDescriptor = $convert.base64Decode(
    'CgZGaWVsZHMSJQoGZmllbGRzGAEgAygLMg0udXNhZ2VzLkZpZWxkUgZmaWVsZHM=');

@$core.Deprecated('Use argumentsDescriptor instead')
const Arguments$json = {
  '1': 'Arguments',
  '2': [
    {'1': 'const', '3': 1, '4': 1, '5': 11, '6': '.usages.ConstArguments', '9': 0, '10': 'const'},
    {'1': 'non_const', '3': 2, '4': 1, '5': 11, '6': '.usages.NonConstArguments', '9': 0, '10': 'nonConst'},
  ],
  '8': [
    {'1': 'kind'},
  ],
};

/// Descriptor for `Arguments`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List argumentsDescriptor = $convert.base64Decode(
    'CglBcmd1bWVudHMSLgoFY29uc3QYASABKAsyFi51c2FnZXMuQ29uc3RBcmd1bWVudHNIAFIFY2'
    '9uc3QSOAoJbm9uX2NvbnN0GAIgASgLMhkudXNhZ2VzLk5vbkNvbnN0QXJndW1lbnRzSABSCG5v'
    'bkNvbnN0QgYKBGtpbmQ=');

@$core.Deprecated('Use constArgumentsDescriptor instead')
const ConstArguments$json = {
  '1': 'ConstArguments',
  '2': [
    {'1': 'positional', '3': 1, '4': 3, '5': 11, '6': '.usages.ConstArguments.PositionalEntry', '10': 'positional'},
    {'1': 'named', '3': 2, '4': 3, '5': 11, '6': '.usages.ConstArguments.NamedEntry', '10': 'named'},
  ],
  '3': [ConstArguments_PositionalEntry$json, ConstArguments_NamedEntry$json],
};

@$core.Deprecated('Use constArgumentsDescriptor instead')
const ConstArguments_PositionalEntry$json = {
  '1': 'PositionalEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 13, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use constArgumentsDescriptor instead')
const ConstArguments_NamedEntry$json = {
  '1': 'NamedEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ConstArguments`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List constArgumentsDescriptor = $convert.base64Decode(
    'Cg5Db25zdEFyZ3VtZW50cxJGCgpwb3NpdGlvbmFsGAEgAygLMiYudXNhZ2VzLkNvbnN0QXJndW'
    '1lbnRzLlBvc2l0aW9uYWxFbnRyeVIKcG9zaXRpb25hbBI3CgVuYW1lZBgCIAMoCzIhLnVzYWdl'
    'cy5Db25zdEFyZ3VtZW50cy5OYW1lZEVudHJ5UgVuYW1lZBo9Cg9Qb3NpdGlvbmFsRW50cnkSEA'
    'oDa2V5GAEgASgNUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4ARo4CgpOYW1lZEVudHJ5'
    'EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use nonConstArgumentsDescriptor instead')
const NonConstArguments$json = {
  '1': 'NonConstArguments',
  '2': [
    {'1': 'positional', '3': 1, '4': 3, '5': 13, '10': 'positional'},
    {'1': 'named', '3': 2, '4': 3, '5': 9, '10': 'named'},
  ],
};

/// Descriptor for `NonConstArguments`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nonConstArgumentsDescriptor = $convert.base64Decode(
    'ChFOb25Db25zdEFyZ3VtZW50cxIeCgpwb3NpdGlvbmFsGAEgAygNUgpwb3NpdGlvbmFsEhQKBW'
    '5hbWVkGAIgAygJUgVuYW1lZA==');

@$core.Deprecated('Use fieldDescriptor instead')
const Field$json = {
  '1': 'Field',
  '2': [
    {'1': 'class_name', '3': 1, '4': 1, '5': 9, '10': 'className'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'value', '3': 3, '4': 1, '5': 11, '6': '.usages.FieldValue', '10': 'value'},
  ],
};

/// Descriptor for `Field`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fieldDescriptor = $convert.base64Decode(
    'CgVGaWVsZBIdCgpjbGFzc19uYW1lGAEgASgJUgljbGFzc05hbWUSEgoEbmFtZRgCIAEoCVIEbm'
    'FtZRIoCgV2YWx1ZRgDIAEoCzISLnVzYWdlcy5GaWVsZFZhbHVlUgV2YWx1ZQ==');

@$core.Deprecated('Use fieldValueDescriptor instead')
const FieldValue$json = {
  '1': 'FieldValue',
  '2': [
    {'1': 'int_value', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'intValue'},
    {'1': 'double_value', '3': 2, '4': 1, '5': 1, '9': 0, '10': 'doubleValue'},
    {'1': 'bool_value', '3': 3, '4': 1, '5': 8, '9': 0, '10': 'boolValue'},
    {'1': 'string_value', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'stringValue'},
  ],
  '8': [
    {'1': 'value'},
  ],
};

/// Descriptor for `FieldValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fieldValueDescriptor = $convert.base64Decode(
    'CgpGaWVsZFZhbHVlEh0KCWludF92YWx1ZRgBIAEoBUgAUghpbnRWYWx1ZRIjCgxkb3VibGVfdm'
    'FsdWUYAiABKAFIAFILZG91YmxlVmFsdWUSHwoKYm9vbF92YWx1ZRgDIAEoCEgAUglib29sVmFs'
    'dWUSIwoMc3RyaW5nX3ZhbHVlGAQgASgJSABSC3N0cmluZ1ZhbHVlQgcKBXZhbHVl');

