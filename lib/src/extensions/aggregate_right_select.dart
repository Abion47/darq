import 'dart:collection';

import '../utility/error.dart';

extension AggregateRightSelectExtension<T> on Iterable<T> {
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
  /// The [initialValue] parameter determines the starting value of the
  /// aggregation and will be the first value passed as the `accumulator`
  /// parameter. If the iterable is empty, [initialValue] will be returned.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = ['a', 'b', 'c'];
  ///       final result = list.aggregate('d', (prev, elem) => '($elem, $prev)');
  ///
  ///       // Result: (a, (b, (c, d)))
  ///     }
  TResult aggregateRightSelect<TResult>(
    TResult initialValue,
    TResult Function(TResult aggregate, T element) aggregator,
  ) {
    checkNullError(this);
    ArgumentError.checkNotNull(aggregator, 'aggregator');

    final stack = Queue<T>();
    for (var obj in this) {
      stack.add(obj);
    }

    if (stack.isEmpty) {
      return initialValue;
    }

    var value = initialValue;
    if (stack.isEmpty) {
      return value;
    }

    while (stack.isNotEmpty) {
      value = aggregator(value, stack.removeLast());
    }

    return value;
  }
}
