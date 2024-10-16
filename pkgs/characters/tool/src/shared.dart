// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import "dart:async";
import "dart:convert";
import "dart:io";

// Shared tools used by other libraries.

/// Quick and dirty URI loader.
///
/// Stashes copy in specified file, or in file in tmp directory.
Future<String> fetch(String location,
    {File? targetFile, bool forceLoad = false}) async {
  if (targetFile == null) {
    var safeLocation = location.replaceAll(RegExp(r'[^\w]+'), '-');
    targetFile = File(path(Directory.systemTemp.path, safeLocation));
  }
  if (!forceLoad && targetFile.existsSync()) {
    return targetFile.readAsString();
  }
  var uri = Uri.parse(location);
  String contents;
  if (uri.isScheme("file")) {
    contents = File.fromUri(uri).readAsStringSync();
  } else {
    var client = HttpClient();
    var request = await client.getUrl(uri);
    var response = await request.close();
    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(response.reasonPhrase, uri: uri);
    }
    contents = await utf8.decoder.bind(response).join("");
    client.close();
  }
  targetFile.writeAsStringSync(contents);
  return contents;
}

const copyright = """
// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

""";

/// Combines file paths into one path.
///
/// No fancy stuff, just adds path separator between parts,
/// if previous part doesn't end with one.
/// (Don't let later parts start with a path separator!)
/// Converts forward slashes to backwards slashes in Windows.
///
/// Empty parts are ignored.
String path(String path, [String path2 = "", String path3 = ""]) {
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

String _windowize(String path) =>
    Platform.isWindows ? path.replaceAll("/", r"\") : path;

/// Package root directory.
String packageRoot = _findRootDir().path;

/// Finds package root in the parent chain of the current directory.
///
/// Recognizes package root by `pubspec.yaml` file.
Directory _findRootDir() {
  var dir = Directory.current;
  while (true) {
    var pubspec = File("${dir.path}${Platform.pathSeparator}pubspec.yaml");
    if (pubspec.existsSync()) return dir;
    var parent = dir.parent;
    if (dir.path == parent.path) {
      throw UnsupportedError(
          "Cannot find package root directory. Run tools from inside package!");
    }
  }
}
