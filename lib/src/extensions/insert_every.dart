extension InsertEveryExtension<T> on Iterable<T> {
  /// Inserts an element into the iterable after every N elements.
  ///
  /// Iterates over the iterable, and every [step] elements, inserts the
  /// given [value]. A [value] will also be inserted at the end if the length
  /// of this iterable is divisible by [step]. If [step] is less than one,
  /// an [ArgumentError] is thrown.
  ///
  /// If [skip] is provided, this will skip that many elements before it
  /// starts counting elements for replacing. if [skip] is less than zero,
  /// an [ArgumentError] is thrown.
  ///
  /// If the length of this iterable is less than [step], the resulting
  /// iterable is unchanged.
  Iterable<T> insertEvery(T value, {required int step, int skip = 0}) sync* {
    if (step < 1) {
      throw ArgumentError.value(
          step, 'step', 'The value of "step" must be greater than one.');
    }

    if (skip < 0) {
      throw ArgumentError.value(
          skip, 'offset', 'Negative values for "offset" aren\'t permitted.');
    }

    final iterator = this.iterator;
    var i = 0 - skip;

    while (iterator.moveNext()) {
      if (i == step) {
        yield value;
        i = 1;
      } else {
        i++;
      }

      yield iterator.current;
    }

    if (i == step) yield value;
  }
}
