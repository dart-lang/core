# Golden files for `lib/fix_data.yaml`

This directory holds the tests for the [data-driven fixes][] declared in
[`../lib/fix_data.yaml`](../lib/fix_data.yaml), which migrate users of the
deprecated `package:os_detect` API to `package:platform` 3.2 or later.

Each `<name>.dart` file contains uses of the deprecated API, and the matching
`<name>.dart.expect` file contains the same code after `dart fix` has been
applied to it.

## Running the tests

```console
$ dart pub get
$ dart fix --compare-to-golden
```

Or, from the package root, `dart test test/fix_data_test.dart`, which does the
same thing.

To regenerate the golden files after changing `fix_data.yaml`, copy the inputs
aside, run `dart fix --apply`, rename the results to `.expect`, and restore the
inputs. **Always review the regenerated output** — see the limitations below.

## Why this is a separate package

`dart fix` only offers a data-driven fix where the analyzer reports a
diagnostic. Deprecation of a member is *not* reported within the package that
declares it, so these files cannot be part of `package:os_detect` itself; they
live in a tiny path-dependency package instead
([`pubspec.yaml`](pubspec.yaml)).

For the same reason there is a local [`analysis_options.yaml`](analysis_options.yaml):
`../analysis_options.yaml` excludes `test_fixes/**` so that `dart analyze
--fatal-infos` stays green at the package root, and that exclusion would
otherwise also apply here and hide the diagnostics the fixes depend on.

## Known limitations

These are limitations of the data-driven fix framework, not of the data in
`fix_data.yaml`. Every transform replaces a bare identifier (for example
`isLinux`) with a member access (`Platform.current.isLinux`), and that runs into
two problems:

1. **String interpolation.** `'$operatingSystem'` becomes
   `'$NativePlatform.current!.operatingSystem'`, which does not compile —
   the analyzer does not add the required `{}`. This is pinned by
   [`os_detect_known_limitations.dart`](os_detect_known_limitations.dart) so
   that the golden test notices if the analyzer ever improves.

2. **A prefix named `Platform`.** The migration guide for `package:platform`
   suggests `import 'package:os_detect/os_detect.dart' as Platform;`. For that
   import, `Platform.isLinux` is rewritten to `Platform.current.isLinux`, which
   now resolves against the *prefix* rather than against `Platform` from
   `package:platform`, and the old import is not removed because it still looks
   used. Any other prefix (see
   [`os_detect_prefixed.dart`](os_detect_prefixed.dart)) migrates cleanly.

A third case worth knowing about: in a library that imports both
`package:os_detect` and `package:platform`, `operatingSystem` may be matched by
`package:platform`'s own `fix_data.yaml` (which renames the deprecated
`LocalPlatform.operatingSystem` to `nativePlatform!.operatingSystem`) instead of
by this package's transform. Element matching is name-based, so overlapping
transforms in two imported packages are ambiguous.

[data-driven fixes]: https://github.com/flutter/flutter/blob/master/docs/contributing/Data-driven-Fixes.md
