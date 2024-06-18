// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../proto/usages.pb.dart' as pb;

class Arguments {
  final pb.Arguments _arguments;

  late final ConstArguments constArguments = _arguments.hasConst_1()
      ? ConstArguments(_arguments.const_1)
      : ConstArguments();
  late final NonConstArguments nonConstArguments = _arguments.hasNonConst()
      ? NonConstArguments(_arguments.nonConst)
      : NonConstArguments();

  Arguments(this._arguments);

  @override
  int get hashCode => _arguments.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Arguments && other._arguments == _arguments;
  }
}

class ConstArguments {
  final pb.ConstArguments? _arguments;

  late final Map<int, dynamic> positional = _arguments?.positional ?? {};
  late final Map<String, dynamic> named = _arguments?.named ?? {};

  ConstArguments([this._arguments]);

  @override
  int get hashCode => positional.hashCode ^ named.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ConstArguments && other._arguments == _arguments;
  }
}

class NonConstArguments {
  final pb.NonConstArguments? _arguments;
  late final List<int> positional = _arguments?.positional ?? [];

  /// Assuming named arguments are strings (keys)
  late final List<String> named = _arguments?.named ?? [];

  NonConstArguments([this._arguments]);

  @override
  int get hashCode => _arguments.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NonConstArguments && other._arguments == _arguments;
  }
}
