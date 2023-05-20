extension MathConsumerExtensions<T> on Iterable<T> {
  /// Returns the number of elements in the iterable.
  ///
  /// Optionally, a [condition] can be specified. If so, the total count
  /// will be the number of elements for which the [condition] function
  /// returned `true`.
  ///
  /// If the [condition] parameter is omitted, the [count] method will call the
  /// `length` property of the iterable. This will either be an O(1) operation or an
  /// O(n) operation, depending on the runtime type of the iterable. (e.g. If the iterable
  /// is a [List], calling [count] will be an O(1) operation.)
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
