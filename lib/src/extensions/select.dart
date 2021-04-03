extension SelectExtension<T> on Iterable<T> {
  /// Applies a mapping function to the elements in the iterable, including the index
  /// where each element is found.
  ///
  /// During iteration, the [selector] function is provided each value in the iterable
  /// along with the index of the value in the iteration. The returned value of that
  /// function is then provided as the next element of the resulting iterable.
  ///
  ///     void main() {
  ///       final list = ['a', 'b', 'c', 'd'];
  ///       final result = list.select((c, i) => '$i_$c');
  ///
  ///       // Result: ['0_a', '1_b', '2_c', '3_d']
  ///     }
  Iterable<TResult> select<TResult>(
      TResult Function(T element, int index) selector) sync* {
    var index = 0;
    for (var v in this) {
      yield selector(v, index++);
    }
  }
}
