extension DistinctExtension<T> on Iterable<T> {
  /// Returns an iterable representing the distinct values of this iterable.
  ///
  /// After applying the [distinct] method to an iterable, the resulting
  /// iterable will consist of distinct values in the source iterable.
  /// (Distinctness is determined by calling `hashCode` on each value.)
  ///
  /// Optionally, a [keySelector] can be supplied to handle comparisons. If
  /// one is provided, the [distinct] method will pass each element in the
  /// iterable to the [keySelector] callback and use the returned value to
  /// determine equivalency. Otherwise, the [distinct] method will use the
  /// element itself.
  ///
  /// Each element will be the first element found in the source iterable in
  /// iteration order, meaning subsequent elements with unique data that are
  /// deemed non-distinct by their hash code (or by the [keySelector]) will be
  /// dropped.
  ///
  /// If none of the elements in the iterable match any other element in the
  /// iterable, the iterable will be unchanged.\
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 0, 0, 1, 1, 2, 3, 3, 3];
  ///       final result = list.distinct();
  ///
  ///       // Result: [0, 1, 2, 3]
  ///     }
  Iterable<T> distinct([Object Function(T element)? keySelector]) sync* {
    keySelector ??= (T v) => v as Object;
    final set = <dynamic>{};

    for (var t in this) {
      if (set.add(keySelector(t))) yield t;
    }
  }
}
