extension TryInsertAllExtension<T> on Iterable<T> {
  /// Inserts an element into the iterable at the specified index.
  ///
  /// Takes the specified element and inserts it into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, the elements in [other] are not inserted and this iterable is unchanged.
  Iterable<T> tryInsertAll(int index, Iterable<T> other) sync* {
    if (index == 0) {
      yield* other.followedBy(this);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield* other;
      }
      i++;
    }
  }
}
