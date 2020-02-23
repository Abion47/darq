extension TakeEveryExtension<T> on Iterable<T> {
  /// Takes every N-th element in this iterable.
  Iterable<T> takeEvery(int step) sync* {
    var count = 0;
    for (var o in this) {
      count++;
      if (count == step) {
        yield o;
        count = 0;
      }
    }
  }
}
