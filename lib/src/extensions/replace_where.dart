extension ReplaceWhereExtension<T> on Iterable<T> {
  /// Replaces every element that matches the [where] condition with [value].
  Iterable<T> replaceWhere(T value, bool Function(T) where) sync* {
    final iterator = this.iterator;

    while (iterator.moveNext()) {
      if (where(iterator.current)) {
        yield value;
      } else {
        yield iterator.current;
      }
    }
  }
}
