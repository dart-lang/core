// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:pub_semver/pub_semver.dart';
import 'package:record_use/record_use_internal.dart' as pb;

final pb.Usages recordedUses = pb.Usages(
  metadata: pb.Metadata(
    version: Version(1, 6, 2, pre: 'wip', build: '5.-.2.z').toString(),
    comment:
        'Recorded references at compile time and their argument values, as far'
        ' as known, to definitions annotated with @RecordReference',
  ),
  instances: [
    pb.Usage(
      definition: pb.Definition(
        identifier: pb.Identifier(
          uri: Uri.parse('file://lib/_internal/js_runtime/lib/js_helper.dart')
              .toString(),
          name: 'MyAnnotation',
        ),
        line: 15,
        column: 30,
      ),
      references: [
        pb.Reference(
          location: pb.Location(
            uri: Uri.parse('file://lib/_internal/js_runtime/lib/js_helper.dart')
                .toString(),
            line: 40,
            column: 30,
          ),
          fields: pb.Fields(fields: [
            pb.Field(
              className: 'className',
              name: 'a',
              value: pb.FieldValue(intValue: 42),
            ),
          ]),
          loadingUnit: '3',
        ),
      ],
    ),
  ],
  calls: [
    pb.Usage(
      definition: pb.Definition(
        identifier: pb.Identifier(
          uri: Uri.parse('file://lib/_internal/js_runtime/lib/js_helper.dart')
              .toString(),
          parent: 'MyClass',
          name: 'get:loadDeferredLibrary',
        ),
        line: 12,
        column: 67,
        loadingUnit: 'part_15.js',
      ),
      references: [
        pb.Reference(
          arguments: pb.Arguments(
            constArguments: pb.ConstArguments(
              positional: {
                0: pb.FieldValue(stringValue: 'lib_SHA1'),
                1: pb.FieldValue(boolValue: false),
                2: pb.FieldValue(intValue: 1),
              },
              named: {
                'leroy': pb.FieldValue(stringValue: 'jenkins'),
                'freddy': pb.FieldValue(stringValue: 'mercury'),
              },
            ),
          ),
          location: pb.Location(
            uri: Uri.parse(
                    'file://benchmarks/OmnibusDeferred/dart/OmnibusDeferred.dart')
                .toString(),
            line: 14,
            column: 49,
          ),
          loadingUnit: 'o.js',
        ),
        pb.Reference(
          arguments: pb.Arguments(
            constArguments: pb.ConstArguments(
              positional: {
                0: pb.FieldValue(stringValue: 'lib_SHA1'),
                2: pb.FieldValue(intValue: 0),
              },
              named: {
                'leroy': pb.FieldValue(stringValue: 'jenkins'),
              },
            ),
            nonConstArguments: pb.NonConstArguments(
              positional: [1],
              named: ['freddy'],
            ),
          ),
          location: pb.Location(
            uri: Uri.parse(
                    'file://benchmarks/OmnibusDeferred/dart/OmnibusDeferred.dart')
                .toString(),
            line: 14,
            column: 48,
          ),
          loadingUnit: 'o.js',
        ),
      ],
    ),
  ],
);
