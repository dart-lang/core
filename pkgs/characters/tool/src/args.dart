// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Very primitive arguments parser for the generator commands.

import "dart:io";

class Flags {
  final bool verbose;
  final bool update;
  final bool dryrun;
  final bool optimize;
  final File? targetFile;
  Flags(this.targetFile,
      {required this.update,
      required this.dryrun,
      required this.verbose,
      required this.optimize});
}

Flags parseArgs(List<String> args, String toolName,
    {bool allowOptimize = false, bool allowFile = true}) {
  var update = false;
  var dryrun = false;
  var verbose = false;
  var optimize = false;
  File? output;
  for (var arg in args) {
    if (arg == "-h" || arg == "--help") {
      stderr
        ..writeln(
            "Usage: $toolName.dart [-u] ${allowOptimize ? "[-i|-o] " : ""}[-n]"
            "${allowFile ? " <targetFile>" : ""}")
        ..writeln("-h | --help          : Print this help and exit")
        ..writeln("-u | --update        : Fetch new data files")
        ..writeln(
            "-n | --dryrun        : Write to stdout instead of target file");
      if (allowOptimize) {
        stderr.writeln(
            "-o | -i | --optimize : Optimize size parameters for tables");
      }
      stderr.writeln("-v | --verbose       : Print more information");
      if (allowFile) {
        stderr.writeln("If no target file is given, writes to stdout.");
      }
      exit(0);
    } else if (arg == "-u" || arg == "--update") {
      update = true;
    } else if (arg == "-n" || arg == "--dryrun") {
      dryrun = true;
    } else if (arg == "-v" || arg == "--verbose") {
      verbose = true;
    } else if (allowOptimize && arg == "-o" ||
        arg == "-i" ||
        arg.startsWith("--opt")) {
      // Try to find a better size for the table.
      // No need to do this unless the representation changes or
      // the input tables are updated.
      // The current value is optimal for the data and representation used.
      optimize = true;
    } else if (arg.startsWith("-") || !allowFile) {
      stderr.writeln("Unrecognized flag: $arg");
    } else {
      output = File(arg);
    }
  }
  return Flags(output,
      update: update, dryrun: dryrun, verbose: verbose, optimize: optimize);
}
