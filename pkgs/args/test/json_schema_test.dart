// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:args/args.dart';
import 'package:test/test.dart';

void main() {
  group('ArgParser.jsonSchema', () {
    test('returns a schema for a flag and an option', () {
      final parser = ArgParser()
        ..addFlag('foo', help: 'a foo flag')
        ..addOption('bar', help: 'a bar option');
      expect(parser.jsonSchema, {
        'type': 'object',
        'properties': {
          'foo': {
            'type': 'boolean',
            'description': 'a foo flag\n' 'defaults to "false"',
          },
          'bar': {
            'type': 'string',
            'description': 'a bar option',
          },
        },
        'required': <String>[],
      });
    });

    test('a multi option', () {
      final parser = ArgParser()
        ..addMultiOption('foo', help: 'a foo option', defaultsTo: ['a', 'b']);
      expect(parser.jsonSchema, {
        'type': 'object',
        'properties': {
          'foo': {
            'type': 'array',
            'description': 'a foo option\ndefaults to "[a, b]"',
            'items': {'type': 'string'},
          },
        },
        'required': <String>[],
      });
    });

    test('a mandatory option', () {
      final parser = ArgParser()..addOption('foo', mandatory: true);
      expect(parser.jsonSchema, {
        'type': 'object',
        'properties': {
          'foo': {
            'type': 'string',
          },
        },
        'required': ['foo'],
      });
    });

    test('an option with allowed values', () {
      final parser = ArgParser()
        ..addOption('foo', allowed: ['a', 'b'], help: 'a foo option');
      expect(parser.jsonSchema, {
        'type': 'object',
        'properties': {
          'foo': {
            'type': 'string',
            'description': 'a foo option\nallowed values: a, b',
          },
        },
        'required': <String>[],
      });
    });

    test('a hidden option is not included', () {
      final parser = ArgParser()..addOption('foo', hide: true);
      expect(parser.jsonSchema, {
        'type': 'object',
        'properties': <String, Object?>{},
        'required': <String>[],
      });
    });
  });
}
