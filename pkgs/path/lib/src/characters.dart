// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Character-code constants.

const hash = 0x23;
const plus = 0x2b;
const minus = 0x2d;
const period = 0x2e;
const slash = 0x2f;
const zero = 0x30;
const nine = 0x39;
const colon = 0x3a;
const question = 0x3f;
const upperA = 0x41;
const upperZ = 0x5a;
const lowerA = 0x61;
const lowerZ = 0x7a;
const backslash = 0x5c;

bool isLetter(int char) => lowerA <= (char |= 0x20) && char <= lowerZ;

bool isDigit(int char) => char ^ zero <= 9;
