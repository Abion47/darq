import '../utility/error.dart';

extension AggregateExtension<T> on Iterable<T> {
  /// Aggregates the iterable into a single value.
  ///
  /// Aggregates the source iterable by applying the [aggregator] function to
  /// each value in the collection in the order they appear. The result is a
  /// single value that is the result of the aggregation.
  ///
  /// The [aggregator] function offers two parameters - the `accumulator` and
  /// the `value`. In each iteration, the `accumulator` represents the running
  /// result of the aggregation and the `value` represents the current element
  /// to process. The function should return what the next value of the
  /// aggregation should be, and that value will become the `accumulator` on the
  /// next iteration. Once the aggregation is complete, the last value to be
  /// returned is considered the result of the aggregation process.
  ///
  /// If this method is called on an empty iterable, a `StateError` is thrown.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1, 2, 3, 4];
  ///       final result = list.aggregate(0, (a, b) => a + b);
  ///
  ///       // Result: 10
  ///     }
  T aggregate(
    T Function(T aggregate, T select) aggregator,
  ) {
    checkNullError(this);
    ArgumentError.checkNotNull(aggregator, 'aggregator');

    final iterator = this.iterator;
    if (!iterator.moveNext()) {
      throw StateError('Cannot call "aggregate" on an empty iterable.');
    }

    var result = iterator.current;

    while (iterator.moveNext()) {
      result = aggregator(result, iterator.current);
    }

    return result;
  }
}
