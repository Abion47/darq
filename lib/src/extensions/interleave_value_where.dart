extension InterleaveValueWhereExtension<T> on Iterable<T> {
  /// Returns the elements of this iterable interleaved with [value] for every
  /// pair of elements that satisfies the predicate [where].
  ///
  /// The elements of the resulting iterable will consist of the elements of
  /// this iterable with [value] inserted between each pair of elements that
  /// return true when passed to the [where] predicate. The inserted
  /// value will be the same instance of [value], so if [value] is a reference type,
  /// each element will refer to the same object.
  ///
  /// If no pairs of elements satisfies the predicate, or if there are zero or one
  /// elements in this iterable, the resulting iterable will be unchanged.
  Iterable<T> interleaveValueWhere(
    T value,
    bool Function(T left, T right) where,
  ) sync* {
    final iterator = this.iterator;
    if (!iterator.moveNext()) return;

    T lastElement = iterator.current;
    yield lastElement;

    while (iterator.moveNext()) {
      if (where(lastElement, iterator.current)) {
        yield value;
      }

      yield iterator.current;
      lastElement = iterator.current;
    }
  }
}
