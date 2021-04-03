extension ScanExtension<T> on Iterable<T> {
  /// Returns the scan (inclusive prefix sum) of this iterable.
  ///
  /// The first element of the returned iterable is the first element of this
  /// iterable. Each subsequent element is the [aggregator] function applied
  /// to the previous value and the corresponding element in this iterable.
  /// Put another way, the N-th element of the returned iterable will be the
  /// sum of the first N elements in this iterable.
  ///
  /// The resulting iterable will have the same length as this iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 2, 3, 4];
  ///       final result = list.scan(0, (a, b) => a + b);
  ///
  ///       // Result: [1, 3, 6, 10]
  ///     }
  Iterable<T> scan(T Function(T previousElement, T element) aggregator) sync* {
    final iterator = this.iterator;
    if (!iterator.moveNext()) {
      return;
    }

    var sum = iterator.current;
    yield sum;

    while (iterator.moveNext()) {
      sum = aggregator(sum, iterator.current);
      yield sum;
    }
  }
}
