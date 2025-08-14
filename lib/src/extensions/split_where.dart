extension SplitWhereExtension<T> on Iterable<T> {
  /// Splits the is iterable into multiple iterables on elements that satisfy
  /// the given [predicate].
  ///
  /// If [keepSeparator] is true, the returned iterables will be interleaved with
  /// the value of the separator. Otherwise, the separator elements will be omitted
  /// from the output.
  Iterable<Iterable<T>> splitWhere(
    bool Function(T) predicate, {
    bool keepSeparator = false,
  }) sync* {
    var buffer = <T>[];

    for (var o in this) {
      if (predicate(o)) {
        yield List.unmodifiable(buffer);
        if (keepSeparator) yield [o];
        buffer = <T>[];
      } else {
        buffer.add(o);
      }
    }

    if (buffer.isNotEmpty) {
      yield List.unmodifiable(buffer);
    }
  }
}
