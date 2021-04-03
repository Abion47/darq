extension MathConsumerExtensions<T> on Iterable<T> {
  /// Returns the number of elements in the iterable.
  ///
  /// Optionally, a [condition] can be specified. If so, the total count
  /// will be the number of elements for which the [condition] function
  /// returned `true`.
  ///
  /// If the [condition] parameter is omitted and the underlying collection extends
  /// or implements [EfficientLengthIterable], the [count] method will call the
  /// `length` property of the iterable as an O(1) operation. Otherwise, the
  /// [count] function will iterate over every element in the iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1, 2, 3];
  ///       final resultA = list.count();
  ///       final resultB = list.count((x) => x.isEven);
  ///
  ///       // ResultA: 4
  ///       // ResultB: 2
  ///     }
  int count([bool Function(T element)? condition]) {
    if (condition == null) return length;

    var count = 0;
    for (var v in this) {
      if (condition(v)) {
        count++;
      }
    }

    return count;
  }
}
