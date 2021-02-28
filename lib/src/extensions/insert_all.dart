extension InsertAllExtension<T> on Iterable<T> {
  /// Inserts all elements from another iterable into this iterable at the specified index.
  ///
  /// Takes the all elements from another iterable and inserts them into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, a [RangeError] is thrown.
  Iterable<T> insertAll(int index, Iterable<T> other) sync* {
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
      if (i == index) {
        yield* other;
      }
      yield iterator.current;
      i++;
    }

    if (index >= i) {
      throw RangeError.index(index, this, null, null, i);
    }
  }
}
