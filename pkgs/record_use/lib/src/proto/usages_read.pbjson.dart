//
//  Generated code. Do not modify.
//  source: usages_read.proto
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
    {
      '1': 'metadata',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.usages_shared.Metadata',
      '10': 'metadata'
    },
    {
      '1': 'calls',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.usages.Usage',
      '10': 'calls'
    },
    {
      '1': 'instances',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.usages.Usage',
      '10': 'instances'
    },
  ],
};

/// Descriptor for `Usages`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usagesDescriptor = $convert.base64Decode(
    'CgZVc2FnZXMSMwoIbWV0YWRhdGEYASABKAsyFy51c2FnZXNfc2hhcmVkLk1ldGFkYXRhUghtZX'
    'RhZGF0YRIjCgVjYWxscxgEIAMoCzINLnVzYWdlcy5Vc2FnZVIFY2FsbHMSKwoJaW5zdGFuY2Vz'
    'GAUgAygLMg0udXNhZ2VzLlVzYWdlUglpbnN0YW5jZXM=');

@$core.Deprecated('Use usageDescriptor instead')
const Usage$json = {
  '1': 'Usage',
  '2': [
    {
      '1': 'definition',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.usages_shared.Definition',
      '10': 'definition'
    },
    {
      '1': 'references',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.usages.Reference',
      '10': 'references'
    },
  ],
};

/// Descriptor for `Usage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usageDescriptor = $convert.base64Decode(
    'CgVVc2FnZRI5CgpkZWZpbml0aW9uGAEgASgLMhkudXNhZ2VzX3NoYXJlZC5EZWZpbml0aW9uUg'
    'pkZWZpbml0aW9uEjEKCnJlZmVyZW5jZXMYAiADKAsyES51c2FnZXMuUmVmZXJlbmNlUgpyZWZl'
    'cmVuY2Vz');

@$core.Deprecated('Use locationDescriptor instead')
const Location$json = {
  '1': 'Location',
  '2': [
    {'1': 'uri', '3': 1, '4': 1, '5': 9, '10': 'uri'},
    {'1': 'line', '3': 2, '4': 1, '5': 13, '10': 'line'},
    {'1': 'column', '3': 3, '4': 1, '5': 13, '10': 'column'},
  ],
};

/// Descriptor for `Location`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locationDescriptor = $convert.base64Decode(
    'CghMb2NhdGlvbhIQCgN1cmkYASABKAlSA3VyaRISCgRsaW5lGAIgASgNUgRsaW5lEhYKBmNvbH'
    'VtbhgDIAEoDVIGY29sdW1u');

@$core.Deprecated('Use referenceDescriptor instead')
const Reference$json = {
  '1': 'Reference',
  '2': [
    {
      '1': 'location',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.usages.Location',
      '10': 'location'
    },
    {'1': 'loading_unit', '3': 2, '4': 1, '5': 9, '10': 'loadingUnit'},
    {
      '1': 'arguments',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.usages_shared.Arguments',
      '9': 0,
      '10': 'arguments'
    },
    {
      '1': 'fields',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.usages_shared.Fields',
      '9': 0,
      '10': 'fields'
    },
  ],
  '8': [
    {'1': 'reference'},
  ],
};

/// Descriptor for `Reference`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List referenceDescriptor = $convert.base64Decode(
    'CglSZWZlcmVuY2USLAoIbG9jYXRpb24YASABKAsyEC51c2FnZXMuTG9jYXRpb25SCGxvY2F0aW'
    '9uEiEKDGxvYWRpbmdfdW5pdBgCIAEoCVILbG9hZGluZ1VuaXQSOAoJYXJndW1lbnRzGAMgASgL'
    'MhgudXNhZ2VzX3NoYXJlZC5Bcmd1bWVudHNIAFIJYXJndW1lbnRzEi8KBmZpZWxkcxgEIAEoCz'
    'IVLnVzYWdlc19zaGFyZWQuRmllbGRzSABSBmZpZWxkc0ILCglyZWZlcmVuY2U=');
