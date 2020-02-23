extension PrescanExtension<T> on Iterable<T> {
  /// Returns the exclusive prefix sum of this iterable.
  ///
  /// The first element of the returned iterable will be the initial value. Each
  /// subsequent element is the [aggregator] function applied to the previous
  /// value and the corresponding element in this iterable.
  ///
  /// The resulting iterable will have the same length as this iterable. As such,
  /// the final element in this iterable is ignored.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 2, 3, 4];
  ///       final result = list.prescan(0, (a, b) => a + b);
  ///
  ///       // Result: [0, 1, 3, 6]
  ///     }
  Iterable<T> prescan(T initialValue, T Function(T, T) aggregator) sync* {
    final iterator = this.iterator;
    if (!iterator.moveNext()) {
      return;
    }

    var lastValue = initialValue;
    var sum = aggregator(lastValue, iterator.current);
    yield sum;

    lastValue = iterator.current;

    do {
      sum = aggregator(sum, lastValue);
      lastValue = iterator.current;
      yield sum;
    } while (iterator.moveNext());
  }
}
