import 'reverse.dart';

extension AggregateRightExtension<T> on Iterable<T> {
  /// Aggregates the iterable into a single value in a right-associative manner.
  ///
  /// Aggregates the source iterable by applying the [aggregator] function to
  /// each value in the collection in the order they appear, starting from the last
  /// element and working backwards. The result is a single value that is the result
  /// of the aggregation.
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
  ///       final list = ['a', 'b', 'c'];
  ///       final result = list.aggregate('d', (prev, elem) => '($elem, $prev)');
  ///
  ///       // Result: (a, (b, (c, d)))
  ///     }
  T aggregateRight<TResult>(
    T Function(T aggregate, T element) aggregator,
  ) {
    var reversed = reverse().iterator;
    if (!reversed.moveNext()) {
      throw StateError('Cannot call "aggregateRight" on an empty iterable.');
    }

    var result = reversed.current;
    while (reversed.moveNext()) {
      result = aggregator(result, reversed.current);
    }
    return result;
  }
}
