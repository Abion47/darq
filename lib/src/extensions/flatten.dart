extension FlattenExtension<T> on Iterable<Iterable<T>> {
  /// Flattens this iterable of iterables into a single iterable.
  ///
  /// Flattens each iterable element contained in this iterable into a single
  /// iterable. The resulting iterable will contain all the elements if each
  /// inner iterable in a single iterable, maintaining iteration order.
  ///
  /// (This is a convenience method that is equivalent to calling `iterable.expand((e) => e))`.)
  Iterable<T> flatten() {
    return expand((e) => e);
  }
}
