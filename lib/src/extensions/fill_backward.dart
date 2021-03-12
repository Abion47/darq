extension FillBackwardExtension<T> on Iterable<T?> {
  /// Returns this iterable with all null values replaced with the next non-null
  /// element following it.
  ///
  /// If the null value appears at the end of the iterable, it will be filled
  /// forward instead.
  ///
  /// If this iterable doesn't contain any null values, the iterable will be
  /// unaffected.
  ///
  /// If this iterable contains only null values, a [StateError] will be thrown.
  Iterable<T> fillBackward() sync* {
    final iterator = this.iterator;
    T? lastValue;

    var nullCount = 0;

    while (iterator.moveNext()) {
      while (iterator.current == null) {
        nullCount++;
        if (!iterator.moveNext()) {
          if (lastValue == null) {
            throw StateError(
                'Cannot perform fillBackward on an iterable that contains only null values.');
          }
          for (var i = 0; i < nullCount; i++) {
            yield lastValue;
          }
          return;
        }
      }

      if (nullCount > 0) {
        for (var i = 0; i < nullCount; i++) {
          yield iterator.current!;
        }
        nullCount = 0;
      }

      yield iterator.current!;
      lastValue = iterator.current;
    }
  }
}
