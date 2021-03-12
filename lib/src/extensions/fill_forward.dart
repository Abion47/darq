extension FillForwardExtension<T> on Iterable<T?> {
  /// Returns this iterable with all null values replaced with the
  /// first non-null element preceeding it.
  ///
  /// If the null value appears at the start of the iterable, it will be filled
  /// backward instead.
  ///
  /// If this iterable doesn't contain any null values, the
  /// iterable will be unaffected.
  ///
  /// If this iterable contains only null values, a [StateError] will be thrown.
  Iterable<T> fillForward() sync* {
    final iterator = this.iterator;
    if (!iterator.moveNext()) return;

    var nullCount = 0;
    while (iterator.current == null) {
      nullCount++;
      if (!iterator.moveNext()) {
        throw StateError(
            'Cannot perform fillForward on an iterable that contains only null values.');
      }
    }

    var lastValue = iterator.current!;
    for (var i = 0; i < nullCount; i++) {
      yield lastValue;
    }

    do {
      if (iterator.current != null) {
        yield iterator.current!;
        lastValue = iterator.current!;
      } else {
        yield lastValue;
      }
    } while (iterator.moveNext());
  }
}
