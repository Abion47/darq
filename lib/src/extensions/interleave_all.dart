extension InterleaveAllExtension<T> on Iterable<T> {
  /// Returns the elements of this iterable interleaved with the elements of every iterable in
  /// [others].
  ///
  /// The elements of the resulting iterable will consist of the first element of
  /// this iterable followed by the first element of each iterable in [others], followed by the second
  /// element of this iterable, and so on until all iterables are fully consumed.
  ///
  /// If the iterables are not the same length, any iterable which is consumed before iteration is
  /// complete will be skipped for the remainder of iteration.
  Iterable<T> interleaveAll(Iterable<Iterable<T>> others) sync* {
    final iterators = [
      iterator,
      ...others.map((i) => i.iterator),
    ];

    final isOpenMap = List.filled(iterators.length, true);
    void refreshMap() {
      for (var i = 0; i < isOpenMap.length; i++) {
        isOpenMap[i] = iterators[i].moveNext();
      }
    }

    do {
      refreshMap();
      for (var i = 0; i < iterators.length; i++) {
        if (isOpenMap[i]) yield iterators[i].current;
      }
    } while (isOpenMap.any((b) => b));
  }
}
