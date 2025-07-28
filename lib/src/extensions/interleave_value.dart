extension InterleaveValueExtension<T> on Iterable<T> {
  /// Returns the elements of this iterable interleaved with [value].
  ///
  /// The elements of the resulting iterable will consist of the elements of
  /// this iterable with [value] inserted between each element. The inserted
  /// value will be the same instance of [value], so if [value] is a reference type,
  /// each element will refer to the same object.
  ///
  /// If the length of this iterable is not greater than one, this method will be
  /// a no-op.
  Iterable<T> interleaveValue(T value) sync* {
    final iterator = this.iterator;

    bool iteratorOpen;
    bool isNotFirst = false;

    do {
      iteratorOpen = iterator.moveNext();
      if (iteratorOpen) {
        if (isNotFirst) {
          yield value;
        } else {
          isNotFirst = true;
        }
        yield iterator.current;
      }
    } while (iteratorOpen);
  }
}
