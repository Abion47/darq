extension InsertWhereExtension<T> on Iterable<T> {
  /// Inserts an element into the iterable at the first index found where the
  /// existing element satisfies a predicate.
  ///
  /// Takes the specified [value] and inserts it into the iterable at the
  /// position of the first element found in the iterable that causes [where]
  /// to return true, causing the satisfying element to be shifted. The
  /// value will only be inserted once, so any elements following the
  /// first will be returned without being evaluated.
  ///
  /// If iteration of the underlying iterable is exausted before a satisfying
  /// element is found, the resulting iterable is unchanged.
  Iterable<T> insertWhere(
    T value,
    bool Function(T element) where,
  ) sync* {
    final iterator = this.iterator;

    bool indexFound = false;

    while (iterator.moveNext()) {
      if (!indexFound && where(iterator.current)) {
        yield value;
        indexFound = true;
      }

      yield iterator.current;
    }
  }
}
