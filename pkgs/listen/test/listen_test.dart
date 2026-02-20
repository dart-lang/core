// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:listen/listen.dart';
import 'package:test/test.dart';

import 'test_listenable.dart';

void main() {
  test('Listenable.merge', () {
    final listenableA = TestListenable();
    final listenableB = TestListenable();

    final merged = Listenable.merge([listenableA, listenableB]);

    var callCount = 0;

    void testListener() {
      callCount++;
    }

    merged.addListener(testListener);

    expect(callCount, 0);

    listenableA.notify();
    expect(callCount, 1);

    listenableB.notify();
    expect(callCount, 2);

    merged.removeListener(testListener);

    listenableA.notify();
    expect(callCount, 2);

    listenableB.notify();
    expect(callCount, 2);
  });
}
