extension FillMissingExtension<T> on Iterable<T?> {
  /// Returns this iterable with all null values replaced with the specified value.
  ///
  /// If this iterable doesn't contain any null values, the iterable will be unaffected.
  Iterable<T> fillMissing(T value) sync* {
    for (var o in this) {
      yield o ?? value;
    }
  }
}
