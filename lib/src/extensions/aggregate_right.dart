extension AggregateRightExtension<T> on Iterable<T> {
  /// Aggregates the iterable into a single value in a right-associative manner.
  ///
  /// Aggregates the source iterable by applying the [aggregator] function to
  /// each value in the collection in the order they appear in reverse order. The
  /// result is a single value that is the result of the aggregation.
  ///
  /// The [initialValue] parameter can be optionally applied, otherwise it
  /// defaults to a predefined value for primitive types and `null` for
  /// everything else.
  ///
  /// The [aggregator] function offers two parameters - the `accumulator` and
  /// the `value`. In each iteration, the `accumulator` represents the running
  /// result of the aggregation and the `value` represents the current element
  /// to process. The function should return what the next value of the
  /// aggregation should be, and that value will become the `accumulator` on the
  /// next iteration. Once the aggregation is complete, the last value to be
  /// returned is considered the result of the aggregation process.
  ///
  /// When the type of the iterable is one of the below types, the [aggregator]
  /// function can be omitted. In this case, the function defaults to predefined
  /// aggregator functions depending on the type:
  ///
  /// - Numeric types (`num`, `int`, `double`) return the sum of all elements.
  /// The initial value is set to the zero equivalent of the type.
  /// - `String` types return all the elements concatenated into a single
  /// string. The initial value is an empty string.
  ///
  /// If the iterable type is not one of these types, the [aggregator] function
  /// must be provided. Otherwise, an [ArgumentError] will be thrown.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = ['a', 'b', 'c'];
  ///       final result = list.aggregate('d', (prev, elem) => '($elem, $prev)');
  ///
  ///       // Result: (a, (b, (c, d)))
  ///     }
  TResult aggregateRight<TResult>(
    TResult initialValue,
    TResult Function(TResult, T) aggregator,
  ) {
    // TODO
  }
}
