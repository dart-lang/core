// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Implementation of the *current* platform,
/// and abstract interfaces for the rest.
library;

export 'platform_specific/unknown_platform.dart'
    if (dart.library.js_interop) 'platform_specific/web_platform.dart'
    if (dart.library.io) 'platform_specific/io_platform.dart'
    show
        BrowserPlatform,
        BrowserPlatformTestBase,
        NativePlatform,
        NativePlatformTestBase,
        Platform,
        PlatformTestBase;
