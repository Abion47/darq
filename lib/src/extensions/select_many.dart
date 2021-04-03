extension SelectManyExtension<T> on Iterable<T> {
  /// Maps elements in an iterable to collections and then flattens those
  /// collections into a single iterable.
  ///
  /// During iteration, the [selector] function is provided each value in the iterable
  /// along with the index of the value in the iteration. The
  /// returned collection of that function is then iterated over, and each
  /// value in that iteration is provided as the next element of the
  /// resulting iterable. The result is all of the collections flattened so that
  /// their values become elements in a single iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = ['abc', 'de', 'f', 'ghij'];
  ///       final result = list.selectMany((s, i) => s.iterable);
  ///
  ///       // Result: ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j']
  ///     }
  Iterable<TResult> selectMany<TResult>(
      Iterable<TResult> Function(T element, int index) selector) sync* {
    var index = 0;
    for (var v in this) {
      yield* selector(v, index++);
    }
  }
}
