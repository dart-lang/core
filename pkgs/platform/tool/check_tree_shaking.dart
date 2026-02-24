#! /bin/env dart
// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Internal script for checking that tree-shaking works.
///
/// Run this script as
/// ```console
/// dart check_tree_shaking.dart
/// ```
/// or
/// ```console
/// dart tool/check_tree_shaking.dart
/// ```
/// from the package root directory.
///
/// *MUST* be run with the `dart` executable.
/// The script uses `Platform.executable` from `dart:io` as the compiler.
///
/// It will compile each example in `../example/bin/` to both `.exe` and `.js`,
/// then check which of the source program strings are retained in the
/// executable.
///
/// Accepts the following flags (mainly useful while debugging the script
/// or package):
/// * `-n`: Only compile to native `.exe`.
/// * `-j`: Only compile to "web" `.js`. (Don't pass both `-j` and `-n`).
/// * `-e`: If tree-shaking appears to fail, try running the program as well,
///         so you can check what it actually prints.
///         *MUST* have `d8` in the path to run compiled JS programs.
/// * `-r`: Retain the compiled files where tree-shaking fails.
/// * `-R`: Retain all compiled files.
///         Otherwise the compiled files are deleted before exiting.
/// * `-v`: More verbose output while running.
///
/// When tree-shaking works optimally, there should be precisely one
/// 'RUNNING ...' string in the generated executable.
library;


import 'dart:convert';
import 'dart:io';

import 'src/dart_sdk.dart';
import 'src/path.dart' as path;

void main(List<String> args) {
  // Keep the files after running.
  var retain = false;
  var retainOnError = false;
  var executeOnError = false;
  var verbose = 0;
  var nativeOnly = false;
  var jsOnly = false;
  var files = <String>[];
  for (var arg in args) {
    if (arg == '-n') {
      nativeOnly = true;
    } else if (arg == '-j') {
      jsOnly = true;
    } else if (arg == '-e') {
      executeOnError = true;
    } else if (arg == '-r') {
      retainOnError = true;
    } else if (arg == '-R') {
      retain = retainOnError = true;
    } else if (arg == '-v') {
      verbose++;
    } else {
      files.add(arg);
    }
  }
  if (nativeOnly && jsOnly) {
    stderr.writeln('Use only one of -j (JS only) or -n (native only).');
    exit(1);
  }

  // Only works on Linux, MacOS or Windows, since those are the platforms
  // the examples check for. (Others can be added, but this should be sufficient
  // for checking the general approach.)
  var platform = Platform.isLinux
      ? 'linux'
      : Platform.isMacOS
      ? 'macos'
      : Platform.isWindows
      ? 'windows'
      : null;
  if (platform == null) {
    print('Test only works on Linux, MacOS or Windows.');
    exit(1);
  }

  var selfPath = File.fromUri(Platform.script).path;
  var rootPath = path.parentDirectory(selfPath);

  // Try to detect whether this script was run by the `dart` CLI.
  //
  // Currently it assumes so if the executable exists and is named `dart`
  // or `dart.exe`.
  var dartExe = findDartExe();
  if (dartExe == null) {
    print('Must be run with the Dart CLI executable.');
    exit(1);
  }
  if (verbose > 1) {
    print('Executable: ${dartExe.path}');
  }

  // Where compiled executables are written.
  var outputDir = Directory(
    path.join(path.parentDirectory(selfPath), 'out', 'tree_shaking_examples'),
  );
  outputDir.createSync(recursive: true);
  if (verbose > 1) {
    print('Output: ${outputDir.path}');
  }

  if (files.isEmpty) {
    files.addAll(defaultExampleFiles(rootPath));
  }

  var failures = <String>[];

  for (var examplePath in files) {
    var exampleDartFile = File(examplePath);
    var exampleFileName = path.basename(examplePath);
    var exampleName = clipEnd(exampleFileName, '.dart');
    if (!jsOnly) {
      var exeFileName = '$exampleName.exe';
      var exeFilePath = path.join(outputDir.path, exeFileName);
      var result = run(dartExe, [
        'compile',
        'exe',
        '--target-os',
        platform,
        '-o',
        exeFilePath,
        exampleDartFile.path,
      ]);
      if (!checkCompiled(exampleDartFile, File(exeFilePath), verbose)) {
        printProcessOutput(result);
        continue;
      }

      if (!check(exeFilePath, exeFileName)) {
        failures.add(exeFileName);
        if (executeOnError) {
          var result = Process.runSync(
            exeFilePath,
            stdoutEncoding: utf8,
            stderrEncoding: utf8,
            [],
          );
          print(
            'Running program $exeFileName:'
            ' Exit code = ${result.exitCode}',
          );
          printProcessOutput(result);
        }
      }
    }

    if (!nativeOnly) {
      var jsFileName = '$exampleName.js';
      var jsFilePath = path.join(outputDir.path, jsFileName);
      var result = Process.runSync(
        dartExe.path,
        stdoutEncoding: utf8,
        stderrEncoding: utf8,
        ['compile', 'js', '-o', jsFilePath, exampleDartFile.path],
      );
      if (!checkCompiled(exampleDartFile, File(jsFilePath), verbose)) {
        printProcessOutput(result);
        continue;
      }
      if (!check(jsFilePath, jsFileName)) {
        failures.add(jsFileName);
        // TODO: Try finding `d8` in path, and d8.js preamble in SDK.
        // Until then, make sure the scripts can run without the preamble.
        if (executeOnError) {
          var result = Process.runSync(
            'd8',
            stdoutEncoding: utf8,
            stderrEncoding: utf8,
            [jsFilePath],
          );
          print(
            'Running program $jsFileName:'
            ' Exit code = ${result.exitCode}',
          );
          printProcessOutput(result);
        }
      }
    }
  }

  // And clean-up.
  if (retain || (retainOnError && failures.isNotEmpty)) {
    print('Executables written to: ${outputDir.path}');
  } else {
    if (verbose > 0) {
      stderr.writeln('Deleting ${outputDir.path}');
    }
    outputDir.deleteSync(recursive: true);
  }
  if (verbose > 0) {
    print('Failures:');
    for (var failure in failures) {
      print('- $failure');
    }
  }
}

bool check(String path, String name) {
  print('Checking $name:');
  var file = File(path);

  var content = file.readAsBytesSync();
  const needle = 'RUNNING';
  var matchCount = 0;
  // Find "RUNNING" as a string in the file.
  // (The compilers will not store an ASCII-only string as UTF-16,
  // so looking for bytes is sufficient. If they start doing that,
  // the check will start failing.)
  outer:
  for (var i = 0; i < content.length - needle.length; i++) {
    var j = 0;
    for (; j < needle.length; j++) {
      if (content[i + j] != needle.codeUnitAt(j)) continue outer;
    }
    // Needle found. Find end of text (spaces and upper-case letters).
    for (; i + j < content.length; j++) {
      var byte = content[i + j];
      if (byte != 0x20 && byte < 0x41 || byte > 0x5A) {
        break;
      }
    }
    var printableText = String.fromCharCodes(content, i, i + j);
    print('Found: $printableText');
    matchCount++;
    i += j;
  }
  if (matchCount == 0) {
    print('No matches found?');
    return false;
  } else if (matchCount > 1) {
    print('Too many matches found: $matchCount');
    return false;
  }
  return true;
}

String clipEnd(String text, String end) {
  if (text.endsWith(end)) return text.substring(0, text.length - end.length);
  return text;
}

bool checkCompiled(File source, File output, int verbose) {
  if (output.existsSync()) {
    if (verbose > 0) {
      var stat = output.statSync();
      stderr.writeln(
        'Compiled: ${source.path} to ${output.path}: ${stat.size} bytes',
      );
    }
    return true;
  }
  stderr.writeln('FILE NOT COMPILED: ${source.path} to ${output.path}');
  return false;
}

List<String> defaultExampleFiles(String packageRoot) {
  var exampleDir = Directory(path.join(packageRoot, 'example', 'bin'));
  return [
    for (var example in exampleDir.listSync())
      if (path.basename(example.path) case var filename
          when example is File &&
              filename.startsWith('tree_shake_') &&
              filename.endsWith('.dart'))
        example.path,
  ];
}
