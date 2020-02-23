extension IndexExtension<T> on Iterable<T> {
  /// Returns an iterable of [MapEntry] representing the elements in this iterable combined with
  /// the zero-based index where the element was found.
  ///
  /// The returned iterable will consist of a sequence of [MapEntry] elements. For each entry,
  /// the key will be the index and the value will be the element itself.
  ///
  /// Optionally a [startIndex] value can be provided. The first element in the resulting
  /// iterable will begin with that value. (Defaults to 0)
  ///
  /// A value can be provided for [descending] as well. If true, the indices in the returned
  /// iterable will count down from the starting index. (Defaults to false)
  Iterable<MapEntry<int, T>> index(
      [int startIndex = 0, bool descending = false]) sync* {
    var index = startIndex;
    for (var o in this) {
      yield MapEntry(index, o);
      index += descending ? -1 : 1;
    }
  }
}
