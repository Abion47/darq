extension TakeEveryExtension<T> on Iterable<T> {
  /// Takes every N-th element in this iterable.
  ///
  /// If the value of [step] is greater than the length of the iterable,
  /// the resulting iterable will be empty. If it is less than or
  /// equal to zero, a [RangeError] will be thrown.
  Iterable<T> takeEvery(int step) sync* {
    if (step <= 0) {
      throw RangeError.value(
          step, 'step', 'The value of "step" must be a positive integer.');
    }

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
