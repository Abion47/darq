extension ElementAtOrDefaultExtension<T> on Iterable<T> {
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
  T elementAtOrDefault(int index, {required T defaultValue}) {
    if (index < 0) {
      throw ArgumentError.value(
          index, 'index', 'The index must not be negative.');
    }

    if (this is List) {
      final asList = this as List<T>;
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
}
