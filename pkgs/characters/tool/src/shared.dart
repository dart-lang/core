// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'data_files.dart';

// Shared tools used by other libraries.

/// Quick and dirty caching URI loader.
///
/// Reads from [targetFile] if it exists and [forceLoad] is not `true`.
/// Otherwise fetches from [location] URI and stores in [targetFile].
///
/// If [targetFile] is omitted, a file in the system temporary directory
/// is used instead.
Future<String> fetch(String location,
    {File? targetFile, bool forceLoad = false}) async {
  if (targetFile == null) {
    var safeLocation = safePath(location);
    targetFile = File(path(Directory.systemTemp.path, safeLocation));
  }
  if (!forceLoad && targetFile.existsSync()) {
    return targetFile.readAsString();
  }
  var uri = Uri.parse(location);
  String contents;
  if (uri.isScheme('file')) {
    contents = File.fromUri(uri).readAsStringSync();
  } else {
    var client = HttpClient();
    var request = await client.getUrl(uri);
    var response = await request.close();
    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(response.reasonPhrase, uri: uri);
    }
    contents = await utf8.decoder.bind(response).join();
    client.close();
  }
  writeToPath(targetFile, contents);
  return contents;
}

/// Writes string to file.
///
/// Ensures directory of file exits.
void writeToPath(File targetFile, String contents) {
  var parentDir = Directory(parentPath(targetFile.path));
  parentDir.createSync(recursive: true);
  targetFile.writeAsStringSync(contents);
}

// Parent directory path of file or directory path.
String parentPath(String path) {
  var end = path.length;
  if (path.endsWith('/')) end -= 1;
  var lastSlash = path.lastIndexOf('/', end);
  if (lastSlash >= 0) {
    return path.substring(0, lastSlash + 1);
  }
  if (path == '/') return path;
  return './'; // Empty relative path.
}

Future<bool> checkLicense(bool acceptLicenseChange) async {
  if (await licenseFile.checkChange() case var changedLicensePath?) {
    if (!acceptLicenseChange) {
      stderr.writeln(
          licenseChangeWarning(licenseFile.targetLocation, changedLicensePath));
      return false;
    }
    stderr.writeln('LICENSE CHANGE ACCEPTED!');
    licenseFile.copyFrom(changedLicensePath);
  } else if (acceptLicenseChange) {
    stderr.writeln('Accepting license change with no change.');
    stderr.writeln('DO NOT AUTOMATE LICENSE ACCEPTANCE!');
    return false;
  }
  return true;
}

/// Warning shown if the license has changed.
String licenseChangeWarning(String originalPath, String newPath) => '''
**NOTICE**
The license file has changed. Check that it has not changed meaning.
See changes using:
  git diff ${_windowize(originalPath)} ${_windowize(newPath)}
''';

const copyright = '''
// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

''';

// Generated file header:
void writeHeader(StringSink output, List<DataFile> dependencies) {
  output
    ..write(copyright)
    ..writeln('// Generated code. Do not edit.')
    ..writeln('// Generated from:');
  for (var sourceFile in dependencies) {
    output
      ..write('// - [')
      ..write(sourceFile.sourceLocation)
      ..write('](../../')
      ..write(sourceFile.targetLocation)
      ..writeln(')');
  }
  output
    ..writeln('// Licensed under the Unicode Inc. License Agreement')
    ..writeln('// (${licenseFile.sourceLocation}, '
        '../../third_party/${licenseFile.targetLocation})');
}

/// Temporary directory. Created once and for all.
Directory get tmpDirectory => _tmpDirectory ??=
    Directory.systemTemp.createTempSync('dart_pkg_characters');

Directory? _tmpDirectory;

/// Combines file paths into one path.
///
/// No fancy stuff, just adds path separator between parts,
/// if previous part doesn't end with one.
/// (Don't let later parts start with a path separator!)
/// Converts forward slashes to backwards slashes in Windows.
///
/// Empty parts are ignored.
String path(String path, [String path2 = '', String path3 = '']) {
  var separator = Platform.pathSeparator;
  path = _windowize(path);
  if (path2.isEmpty && path3.isEmpty) return path;
  var buffer = StringBuffer(path);
  var prev = path;
  for (var part in [path2, path3]) {
    if (part.isEmpty) continue;
    part = _windowize(part);
    if (!prev.endsWith(separator)) {
      buffer.write(separator);
    }
    buffer.write(part);
    prev = part;
  }
  return buffer.toString();
}

/// Converts path to Windows path if on Windows (`/` to `\`).
///
/// Returns original path if not on Windows.
String _windowize(String path) =>
    Platform.isWindows ? path.replaceAll('/', r'') : path;

/// Package root directory.
String packageRoot = _findRootDir().path;

/// A path relative to the [packageRoot].
String packagePath(String path2, [String path3 = '']) =>
    path(packageRoot, path2, path3);

/// A path relative to a temporary directory.
String tmpPath(String path2, [String path3 = '']) =>
    path(tmpDirectory.path, path2, path3);

/// Finds package root in the parent chain of the current directory.
///
/// Recognizes package root by `pubspec.yaml` file.
Directory _findRootDir() {
  var dir = Directory.current;
  while (true) {
    var pubspec = File('${dir.path}${Platform.pathSeparator}pubspec.yaml');
    if (pubspec.existsSync()) return dir;
    var parent = dir.parent;
    if (dir.path == parent.path) {
      throw UnsupportedError(
          'Cannot find package root directory. Run tools from inside package!');
    }
  }
}

/// Leading-zero padding.
String lz(int n, [int length = 2]) => n.toString().padLeft(length, '0');

final _unsafeCharsRE = RegExp(r'\W+');
// Convert URI path to safe file path.
String safePath(String uriPath) => uriPath.replaceAll(_unsafeCharsRE, '-');
