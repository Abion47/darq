extension ReplaceAtExtension<T> on Iterable<T> {
  /// Replaces the element at [at] with [value].
  ///
  /// If [at] is greater than the length of the iterable, the iterable is
  /// unchanged. If [at] is less than zero, an [RangeError] is thrown.
  Iterable<T> replaceAt(T value, {required int at}) sync* {
    if (at < 0) {
      throw RangeError.index(
          at, this, 'at', 'The value of "at" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      if (i == at) {
        yield value;
      } else {
        yield iterator.current;
      }

      i++;
    }
  }
}
