extension ExcludeRangeExtension<T> on Iterable<T> {
  /// Returns all elements in this iterable except those that are within the
  /// specified range.
  ///
  /// If [start] is greater than the length of the iterable or if [count] is zero,
  /// the iterable is unchanged. If [start] or [count] are less than zero, a
  /// [RangeException] is thrown.
  Iterable<T> excludeRange(int start, int count) sync* {
    if (start < 0) {
      throw RangeError.index(start, this, 'start',
          'The value of "start" must be greater than zero.');
    }
    if (count < 0) {
      throw RangeError.index(count, this, 'count',
          'The value of "count" must be greater than zero.');
    }
    if (start == 0) {
      yield* skip(count);
      return;
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      while (i >= start && i < start + count) {
        iterator.moveNext();
        i++;
      }
      yield iterator.current;
      i++;
    }
  }
}
