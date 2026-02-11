// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@TestOn('vm')
library;

import 'dart:io' as io;

import 'package:path/path.dart' as path;
import 'package:test/test.dart';

void main() {
  group('new Context()', () {
    test('uses the current directory if root and style are omitted', () {
      final context = path.Context();
      expect(context.current, io.Directory.current.path);
    });

    test('uses "." if root is omitted', () {
      final context = path.Context(style: path.Style.platform);
      expect(context.current, '.');
    });

    test('uses the host platform if style is omitted', () {
      final context = path.Context();
      expect(context.style, path.Style.platform);
    });
  });

  test('Style.platform returns the host platform style', () {
    if (io.Platform.operatingSystem == 'windows') {
      expect(path.Style.platform, path.Style.windows);
    } else {
      expect(path.Style.platform, path.Style.posix);
    }
  });

  group('current', () {
    test('returns the current working directory', () {
      expect(path.current, io.Directory.current.path);
    });

    test(
      'uses the previous working directory if deleted',
      withLocalCurrentDirectory(() {
        final temp = io.Directory.systemTemp.createTempSync('path_test');
        final tempPath = temp.resolveSymbolicLinksSync();
        io.Directory.current = temp;

        // Call "current" once so that it can be cached.
        expect(path.normalize(path.absolute(path.current)), equals(tempPath));

        temp.deleteSync();

        // Even though the directory no longer exists, no exception is thrown.
        expect(path.normalize(path.absolute(path.current)), equals(tempPath));
      }),
      //TODO: Figure out why this is failing on windows and fix!
      skip: io.Platform.isWindows ? 'Untriaged failure on Windows' : false,
    );
  });

  test(
    'registers changes to the working directory',
    withLocalCurrentDirectory(() {
      final dir = io.Directory.current.path;
      expect(path.absolute('foo/bar'), equals(path.join(dir, 'foo/bar')));
      expect(
        path.absolute('foo/bar'),
        equals(path.context.join(dir, 'foo/bar')),
      );

      io.Directory.current = path.dirname(dir);
      expect(
        path.normalize(path.absolute('foo/bar')),
        equals(path.normalize(path.join(dir, '../foo/bar'))),
      );
      expect(
        path.normalize(path.absolute('foo/bar')),
        equals(path.normalize(path.context.join(dir, '../foo/bar'))),
      );
    }),
  );

  // Regression test for #35. This tests against the *actual* working directory
  // rather than just a custom context because we do some processing in
  // [path.current] that has clobbered the root in the past.
  test(
    'absolute works on root working directory',
    withLocalCurrentDirectory(() {
      io.Directory.current = path.rootPrefix(path.current);

      expect(
        path.relative(path.absolute('foo/bar'), from: path.current),
        path.relative(path.absolute('foo/bar')),
      );

      expect(
        path.normalize(path.absolute('foo/bar')),
        equals(path.normalize(path.join(path.current, '../foo/bar'))),
      );

      expect(
        path.normalize(path.absolute('foo/bar')),
        equals(path.normalize(path.join(path.current, '../foo/bar'))),
      );
    }),
    //TODO(kevmoo): figure out why this is failing on windows and fix!
    skip: io.Platform.isWindows ? 'Untriaged failure on Windows' : null,
  );
}

/// Runs [body] in a zone with a local current working directory.
///
/// Avoids clobbering the current working directory of the entire process
/// when writing to it and reading it back through `dart:io` functions.
R Function() withLocalCurrentDirectory<R>(R Function() body) {
  var savedCurrentDirectory = io.Directory.current;
  return () => io.IOOverrides.runZoned(
    body,
    getCurrentDirectory: () => savedCurrentDirectory,
    setCurrentDirectory: (dir) {
      savedCurrentDirectory = io.Directory(dir);
    },
  );
}
