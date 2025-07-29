extension ReplaceAllExtension<T> on Iterable<T> {
  /// Replaces all elements in this iterable with [value].
  ///
  /// The resulting value is identical to calling `RepeatIterator(value, iterator.count())`.
  Iterable<T> replaceAll(T value) sync* {
    final iterator = this.iterator;
    while (iterator.moveNext()) {
      yield value;
    }
  }
}
