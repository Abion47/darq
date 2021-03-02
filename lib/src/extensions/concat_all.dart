extension ConcatAllExtension<T> on Iterable<T> {
  /// Concatenates this iterable and a provided iterable of iterables.
  ///
  /// Flattens the elements in [iterables] into a single iterable and then
  /// appends the elements of that iterable to the end of this iterable.
  Iterable<T> concatAll(Iterable<Iterable<T>> iterables) sync* {
    yield* this;
    for (var iterable in iterables) {
      yield* iterable;
    }
  }
}
