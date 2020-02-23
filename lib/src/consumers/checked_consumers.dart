extension CheckedConsumerExtensions<T> on Iterable<T> {
  /// Returns a new iterable containing [value] if this iterable is empty. Otherwise,
  /// the source iterable will be unaffected.
  ///
  /// If the number of elements in this iterable is zero, [defaultIfEmpty] will
  /// return a new iterable that consists of a single element specified by
  /// the given [value].
  ///
  /// If this iterable has one or more elements, the iterable is returned
  /// without modification.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = <int>[];
  ///       final result = list.defaultIfEmpty(-1);
  ///
  ///       // Result: [-1]
  ///     }
  Iterable<T> defaultIfEmpty(T defaultVal) sync* {
    var hasValues = false;
    for (var v in this) {
      yield v;
      hasValues = true;
    }

    if (!hasValues) {
      yield defaultVal;
    }
  }

  /// Returns this iterable, or [defaultVal] if this iterable is empty.
  ///
  /// If the number of elements in this iterable is zero, [defaultIfEmpty] will
  /// return [defaultVal] instead.
  ///
  /// If this iterable has one or more elements, the iterable is returned
  /// without modification.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = <int>[];
  ///       final result = list.defaultIfEmpty([1, 2, 3]);
  ///
  ///       // Result: [1, 2, 3]
  ///     }
  Iterable<T> defaultRangeIfEmpty(Iterable<T> defaultVal) sync* {
    var hasValues = false;
    for (var v in this) {
      yield v;
      hasValues = true;
    }

    if (!hasValues) {
      yield* defaultVal;
    }
  }

  /// Returns the element at the specified index or a default value of one is
  /// not found.
  ///
  /// Iterates over the entire iterable until it reaches the element on the
  /// iteration matching the given [index]. [elementAt] will then return that
  /// value. If the iteration reaches the end of the iterable before arriving
  /// at [index], the value of [defaultValue] will be returned instead. If
  /// [defaultValue] is not supplied, the returned value will be `null`.
  ///
  /// The [elementAtOrDefault] method will short-circuit after reaching the
  /// element at [index] and will not iterate further over the iterable. In
  /// the worst case, it will iterate over the entire iterable.
  ///
  /// If the underlying iterable is a [List], this method will instead
  /// utilize an indexer call to the [List] as an O(1) operation. If
  /// [index] is greater than or equal to the length of the list, `defaultValue`
  /// will be returned instead.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 2, 3, 4];
  ///       final result = list.elementAtOrDefault(4, defaultValue: -1);
  ///
  ///       // Result: -1
  ///     }
  ///

  ///
  T elementAtOrDefault(int index, {T defaultValue}) {
    if (index < 0) {
      throw RangeError.index(index, this, 'The index must not be negative.');
    }

    if (this is List) {
      final asList = this as List;
      if (index >= asList.length) return defaultValue;
      return asList[index];
    }

    var i = 0;
    for (var v in this) {
      if (index == i) return v;
      i++;
    }

    return defaultValue;
  }

  /// Returns the first element in the iterable.
  ///
  /// If the iterable is empty, the value specified by [defaultValue] will be
  /// returned instead. If [defaultValue] is omitted, the returned value will be
  /// `null`.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = <int>[];
  ///       final result = list.firstOrDefault(defaultValue: -1);
  ///
  ///       // Result: -1
  ///     }
  ///

  ///
  T firstOrDefault({T defaultValue}) {
    if (isEmpty) return defaultValue;
    return first;
  }

  /// Returns the first element in the iterable matching a specified condition,
  /// or a default value if none is found.
  ///
  /// Begins iteration of the iterable, but then returns the first element
  /// found that matches the specified [condition].
  ///
  /// If the iterable is empty, or if [condition] is provided but iteration
  /// reaches the end of the iterable before an element is found, the value
  /// specified by [defaultValue] will be returned instead. If [defaultValue] is
  /// omitted, the returned value will be `null`.
  ///
  /// The [firstWhereOrDefault] method begins iteration, but short-circuits
  /// the first time [condition] returns `true` and will not iterate further. In
  /// the worst case, it will iterate over the entire iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 3, 5];
  ///       final result = list.firstWhereOrDefault((x) => x.isEven, defaultValue: -1);
  ///
  ///       // Result: -1
  ///     }
  ///

  ///
  T firstWhereOrDefault(bool Function(T) condition, {T defaultValue}) {
    if (isEmpty) return defaultValue;

    for (var v in this) {
      if (condition(v)) {
        return v;
      }
    }

    return defaultValue;
  }

  /// Returns the last element in the iterable.
  ///
  /// If the iterable is empty, the value specified by [defaultValue] will be
  /// returned instead. If [defaultValue] is omitted, the returned value will be
  /// `null`.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = <int>[];
  ///       final result = list.lastOrDefault(defaultValue: -1);
  ///
  ///       // Result: -1
  ///     }
  ///

  ///
  T lastOrDefault({T defaultValue}) {
    if (isEmpty) return defaultValue;
    return last;
  }

  /// Returns the last element in the iterable matching a specified condition,
  /// or a default value if none is found.
  ///
  /// Iterates over the entire iterable and returns last value that matched the
  /// [condition].
  ///
  /// If the iterable is empty, or if no value was found that matched the [condition],
  /// the value specified by [defaultValue] will be returned instead. If [defaultValue]
  /// is omitted, the returned value will be `null`.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 3, 5];
  ///       final result = list.lastWhereOrDefault((x) => x.isEven, defaultValue: -1);
  ///
  ///       // Result: -1
  ///     }
  ///

  ///
  T lastWhereOrDefault(bool Function(T) condition, [T defaultValue]) {
    if (isEmpty) return defaultValue;

    var found = false;
    T val;

    for (var v in this) {
      if (condition(v)) {
        val = v;
        found = true;
      }
    }

    if (found) {
      return val;
    }

    return defaultValue;
  }

  /// Returns the single element in the iterable, or a [defaultValue] if no
  /// such element exists.
  ///
  /// Returns the single value in this iterable, assuming the iterable has a
  /// length of one. If the iterable is empty, the value specified by
  /// [defaultValue] is returned instead. If the iterable contains more than
  /// one element, a [StateError] is thrown.
  ///
  /// The [singleOrDefault] function will short-circuit after reaching the second
  /// element of the iteration, if one exists. In the worst-case scenario,
  /// [singleOrDefault] will iterate over two elements of the iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 2];
  ///       final result = list.singleOrDefault(defaultValue: -1);
  ///
  ///       // Result: -1
  ///     }
  ///

  ///
  T singleOrDefault({T defaultValue}) {
    final iter = iterator;
    if (!iter.moveNext()) return defaultValue;

    var val = iter.current;
    if (iter.moveNext()) {
      throw StateError('The iterable has more than one element.');
    }

    return val;
  }

  /// Returns the single element in the iterable matching a
  /// [condition], or a [defaultValue] if no such element exists.
  ///
  /// Iterates over the entire iterable, applying the [condition] function to
  /// each element. At the end of the iteration, if only a single element matches
  /// the [condition], that element is returned. If no elements match the [condition],
  /// the value specified by [defaultValue] is returned instead. If more than
  /// one element matches the [condition], a [StateError] is thrown.
  ///
  /// The [singleOrDefault] function will short-circuit after finding a second element
  /// that matches the [condition]. In the worst-case scenario, [singleOrDefault]
  /// will iterate over the entire iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 2, 3];
  ///       final result = list.singleWhereOrDefault((x) => x.isOdd, defaultValue: -1);
  ///
  ///       // Result: -1
  ///     }
  ///
  ///

  ///
  T singleWhereOrDefault(bool Function(T) condition, {T defaultValue}) {
    final iter = iterator;
    if (!iter.moveNext()) return defaultValue;

    T val;
    var found = false;
    do {
      if (condition(iter.current)) {
        if (!found) {
          val = iter.current;
          found = true;
        } else {
          throw StateError(
              'The iterable has more than one element matching the condition.');
        }
      }
    } while (iter.moveNext());

    if (!found) return defaultValue;
    return val;
  }
}
