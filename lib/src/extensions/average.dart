extension AverageExtension<T> on Iterable<T> {
  /// Calculates the average of all numerical values in the iterable.
  ///
  /// Applies an averaging function to all values in the iterable. If the type
  /// of the iterable is a numerical type, the function will be the typical numerical
  /// averaging function. Otherwise, the function will use the [selector] averaging
  /// function supplied.
  ///
  /// If the type of the iterator is a numerical type and the [selector] function
  /// isn't supplied, an [ArgumentError] will be thrown.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 3, 5, 7, 9];
  ///       final result = list.average();
  ///
  ///       // Result: 5.0
  ///     }
  double average([num Function(T) selector]) {
    if (isEmpty) {
      throw StateError('Iterator must not be empty.');
    }

    if (selector == null) {
      if (T == num) {
        selector = (T n) => n as num;
      } else if (T == int) {
        selector = (T n) => n as int;
      } else if (T == double) {
        selector = (T n) => n as double;
      }
    }

    ArgumentError.checkNotNull(selector, 'selector');

    var total = 0.0;
    var count = 0;

    for (var n in this) {
      total += selector(n);
      count++;
    }

    return total / count;
  }
}
