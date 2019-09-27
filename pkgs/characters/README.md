[![Build Status](https://travis-ci.org/dart-lang/characters.svg?branch=master)](https://travis-ci.org/dart-lang/characters)

**NOTE**: This package is considered experimental, and breaking API changes are
to be expected.

`Characters` are strings viewed as sequences of *user-perceived character*s,
also know as [Unicode (extended) grapheme clusters](https://unicode.org/reports/tr29/#Grapheme_Cluster_Boundaries).

The `Characters` class allows access to the individual characters of a string,
and a way to navigate back and forth between them.
It also has a set of utility functions for inspecting and modifying strings
without breaking up graphemes clusters.
