extension ReplaceRangeValueExtension<T> on Iterable<T> {
  /// Replaces the elements in the range [start] (inclusive) to [start] + [count]
  /// (exclusive) with [value].
  ///
  /// If [start] is greater than the length of the iterable, or if [start]
  /// is equal to [endIndex], the iterable is unchanged. If [endIndex] is greater
  /// than the length of the iterable, the elements from [start] to the end
  /// of the iterable will be replaced.
  ///
  /// If [start] or [endIndex] is less than zero, an [RangeError] is thrown.
  /// If [endIndex] is less than [start], an [ArgumentError] is thrown.
  Iterable<T> replaceRangeValue(
    T value, {
    required int start,
    required int count,
  }) sync* {
    if (start < 0) {
      throw RangeError.index(start, this, 'start',
          'The value of "start" must be greater than or equal to zero.');
    }
    if (count < 0) {
      throw RangeError.index(count, this, 'count',
          'The value of "count" must be greater than or equal to zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      if (i >= start && i < start + count) {
        yield value;
      } else {
        yield iterator.current;
      }

      i++;
    }
  }
}
