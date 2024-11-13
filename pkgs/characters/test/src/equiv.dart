// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Equivalence class and equivalence builder.
///
/// Allows incrementally building equivalence classes by equating elements.
///
/// One way to use this class is to start with an empty `Equivalence`
class Equivalence<T> {
  /// Equivalence class IDs.
  ///
  /// Each entry is an index into this list.
  /// If the entry is the same as its index, it is the canonical
  /// ID for an equivalence class.
  /// If not, the entry points to an earlier entry which is in the same
  /// equivalence class.
  /// Every entry can be followed iteratively to a canonical equivalence
  /// class ID, and any two entries represent the same equivalence class
  /// if they point to the same canonical ID.
  final List<int> _equivalences;

  /// Mapping from element to equivalence class ID.
  ///
  /// Two elements are considered equivalent (by [eq]) if their
  /// IDs point to the same canonical equivalence class ID.
  ///
  /// When doing lookups, the map is updated with the canonical
  /// ID if it's not currently pointing directly to that.
  final Map<T, int> _class;

  /// Each element of [equivalenceClasses] is an equivalence by itself.
  ///
  /// If any element is in more than one equivalence class,
  /// if [allowCollapse] is `false` an error is raised, and
  /// If [allowCollapse] is `true` the equivalence classes are
  /// collapsed.
  Equivalence(Iterable<Iterable<T>> equivalenceClasses,
      {bool allowCollapse = false})
      : _equivalences = [],
        _class = {} {
    for (var eqClass in equivalenceClasses) {
      var newClass = _equivalences.length;
      _equivalences.add(newClass);
      for (var element in eqClass) {
        var existing = _class[element];
        if (existing == null) {
          _class[element] = newClass;
        } else if (existing != newClass) {
          if (!allowCollapse) {
            // Wasn't in the *same* iterable.
            throw ArgumentError.value(equivalenceClasses, 'equivalenceClasses',
                "Contains element '$element' more than once");
          }
          var c1 = _canonicalizeId(existing);
          var c2 = _canonicalizeId(newClass);
          if (c1 != c2) {
            c1 = _equate(c1, c2);
          }
          _class[element] = c1;
          newClass = c1;
        }
      }
    }
  }

  /// All [elements] as distinct equivalence classes.
  ///
  /// A starting point for building an equivalence from scratch.
  Equivalence.distinct(Iterable<T> elements)
      : _equivalences = [],
        _class = {} {
    for (var element in elements) {
      _add(element);
    }
  }

  List<List<T>> get classes {
    _optimize();
    var result = [for (var i = 0; i < _equivalences.length; i++) <T>[]];
    for (var MapEntry(:key, :value) in _class.entries) {
      result[value].add(key);
    }
    return result;
  }

  /// Makes all elements point directly to their canonical equivalence class
  /// ID, makes all canonical IDs be consecutive small integers, and
  /// truncates the `_equivalences` list to only those values that are needed.
  void _optimize() {
    // Ensure all elements point to canonical class.
    _canonicalize();
    var head = 0;
    var tail = _equivalences.length - 1;
    // Reuse unreachable early entries in `_equivalences` for later equivalence.
    // Invariant: 0..head-1 are canonical, tail=1..length are not.
    outer:
    while (head <= tail) {
      if (_equivalences[head] == head) {
        head++;
      } else {
        // _equivalences[head] is known not canonical.
        while (head < tail) {
          if (_equivalences[tail] != tail) {
            tail--;
          } else {
            _equivalences[head] = _equivalences[tail] = head;
            head++;
            tail--;
            continue outer;
          }
        }
        break;
      }
    }
    _canonicalize();
    _equivalences.length = head;
  }

  void _canonicalize() {
    _class.updateAll((_, id) => _canonicalizeId(id));
  }

  /// Adds element.
  ///
  /// If the element is already in the equivalence, nothing changes.
  /// If not, it is added in a new singleton equivalence class.
  void add(T element) {
    if (!_class.containsKey(element)) _add(element);
  }

  /// Adds new element to equivalence class, in an equivalence class of its own.
  int _add(T element) {
    assert(_class[element] == null);
    var newClass = _equivalences.length;
    _equivalences.add(newClass);
    _class[element] = newClass;
    return newClass;
  }

  /// The canonical equivalence class ID of the element.
  ///
  /// Is `null` if the element has not been added to the equivalence.
  int? _classOf(T element) {
    var c = _class[element];
    if (c != null) {
      var e = _equivalences[c];
      if (e == c) return e;
      return _equivalences[c] = _canonicalizeId(e);
    }
    return null;
  }

  int _canonicalizeId(int id) {
    while (true) {
      var nextId = _equivalences[id];
      if (nextId == id) return id;
      _equivalences[id] = nextId;
      id = nextId;
    }
  }

  bool eq(T v1, T v2) {
    var c1 = _classOf(v1);
    return c1 != null && c1 == _classOf(v2);
  }

  /// Make two elements equivalent.
  ///
  /// This merges the equivalence classes of the two elements.
  ///
  /// If either element is not already in the equivalence,
  /// it is added, as by [add].
  void equate(T v1, T v2) {
    var c1 = _classOf(v1);
    var c2 = _classOf(v2);
    if (c1 == null) {
      _class[v1] = c2 ?? _add(v2);
    } else if (c2 == null) {
      _class[v2] = c1;
    } else {
      var newId = _equate(c1, c2);
      if (c1 != newId) _class[v1] = newId;
      if (c2 != newId) _class[v2] = newId;
    }
  }

  /// Merge two equivalence classes.
  int _equate(int c1, int c2) {
    // Both must be canonical.
    assert(_equivalences[c1] == c1);
    assert(_equivalences[c2] == c2);
    if (c1 == c2) return c1;
    if (c1 < c2) {
      _equivalences[c2] = c1;
      return c1;
    }
    _equivalences[c1] = c2;
    return c2;
  }
}
