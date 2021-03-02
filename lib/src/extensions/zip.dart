extension ZipExtension<T> on Iterable<T> {
  /// Combines the values of the iterable and another collection into an
  /// iterable of new values.
  ///
  /// During iteration, each element in the iterable is passed to the [selector]
  /// function along with the element in the given [other] collection at the
  /// corresponding position. The returned value of the [selector] function is
  /// then returned. If either the iterable's or the [other]
  /// collection's iteration reaches the end of its elements, iteration is stopped.
  ///
  /// The length of the resulting iterable will be equal to the lesser of the
  /// lengths of the source iterable or the given [other] collection.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       var listA = [1, 2, 3, 4];
  ///       var listB = [5.0, 6.0, 7.0];
  ///       var result = listA.zip(listB, (a, b) => '$a: $b');
  ///
  ///       // Result: [ '1: 5.0', '2: 6.0', '7: 7.0' ]
  ///     }
  Iterable<TResult> zip<TOther, TResult>(
    Iterable<TOther> other,
    TResult Function(T element, TOther otherElement) selector,
  ) sync* {
    final sourceIterator = iterator;
    final otherIterator = other.iterator;

    while (sourceIterator.moveNext() && otherIterator.moveNext()) {
      yield selector(sourceIterator.current, otherIterator.current);
    }
  }
}
