extension ExcludeAtExtension<T> on Iterable<T> {
  /// Returns all elements in this iterable except the element at [index].
  ///
  /// If [index] is greater than the length of the iterable, the iterable is
  /// unchanged. If [index] is less than zero, a [RangeException] is thrown.
  Iterable<T> excludeAt(int index) sync* {
    if (index < 0) {
      throw RangeError.index(index, this, 'index',
          'The value of "index" must be greater than zero.');
    }
    if (index == 0) {
      yield* skip(0);
      return;
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      if (i == index) {
        iterator.moveNext();
      }
      yield iterator.current;
      i++;
    }
  }
}
