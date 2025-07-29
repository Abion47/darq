extension ReplaceEveryExtension<T> on Iterable<T> {
  /// Replaces every [count]th element with [value].
  ///
  /// If [count] is greater than the length of the iterable, the iterable is
  /// unchanged. If [count] is less than one, an [ArgumentError] is thrown.
  Iterable<T> replaceEvery(T value, {required int count}) sync* {
    if (count < 1) {
      throw ArgumentError.value(
          count, 'count', 'The value of "count" must be greater than one.');
    }

    final iterator = this.iterator;
    var i = 1;

    while (iterator.moveNext()) {
      if (i == count) {
        yield value;
        i = 1;
      } else {
        yield iterator.current;
        i++;
      }
    }
  }
}
