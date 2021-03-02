extension PreScanExtension<T> on Iterable<T> {
  /// Returns the pre-scan (exclusive prefix sum) of this iterable.
  ///
  /// The first element of the returned iterable will be [initialValue]. Each
  /// subsequent element is the [aggregator] function applied to the previous
  /// value and the corresponding element in this iterable. Put another way,
  /// the N-th element of the returned iterable will be the sum of the first
  /// N-1 elements in this iterable.
  ///
  /// The resulting iterable will have the same length as this iterable. As such,
  /// the final element in this iterable is ignored.
  ///
  /// This method is guaranteed to at least contain [initialValue].
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 2, 3, 4];
  ///       final result = list.prescan(0, (a, b) => a + b);
  ///
  ///       // Result: [0, 1, 3, 6]
  ///     }
  Iterable<T> preScan(
      T initialValue, T Function(T value, T element) aggregator) sync* {
    var value = initialValue;
    final iterator = this.iterator;

    if (iterator.moveNext()) {
      yield value;
      var current = iterator.current;

      while (iterator.moveNext()) {
        value = aggregator(value, current);
        yield value;
        current = iterator.current;
      }
    }
  }
}
