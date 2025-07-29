extension ReplaceRangeExtension<T> on Iterable<T> {
  /// Replaces the elements in the range [start] (inclusive) to [start] + [count]
  /// (exclusive) with the elements from [source]. If the range is longer
  /// than the length of [source], the elements will be repeated until the
  /// end of the range is reached.
  ///
  /// If [start] is greater than the length of the iterable, or if [count]
  /// is zero, the iterable is unchanged. If [start] + [count] is greater
  /// than the length of the iterable, the elements from [start] to the end
  /// of the iterable will be replaced.
  ///
  /// If [start] or [count] is less than zero, an [RangeError] is thrown.
  Iterable<T> replaceRange(
    Iterable<T> source, {
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
    var srcIterator = source.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      if (i >= start && i < start + count) {
        if (!srcIterator.moveNext()) {
          srcIterator = source.iterator;
          if (!srcIterator.moveNext()) {
            throw ArgumentError('"srcIterator" must not be empty.');
          }
        }
        yield srcIterator.current;
      } else {
        yield iterator.current;
      }

      i++;
    }
  }
}
