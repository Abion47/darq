extension RepeatExtension<T> on Iterable<T> {
  /// Repeats this iterable a specified number of times.
  ///
  /// If [count] is zero, this method returns an empty iterable.
  ///
  /// If count is less than zero, an [ArgumentError] is thrown.
  Iterable<T> repeat(int count) sync* {
    if (count < 0) {
      throw ArgumentError.value(
          count, 'count', 'The value of "count" must be greater than zero.');
    }

    for (var i = 0; i < count; i++) {
      yield* this;
    }
  }
}
