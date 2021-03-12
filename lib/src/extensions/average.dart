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
  TNum average<TNum extends num>([TNum Function(T value)? selector]) {
    if (isEmpty) {
      throw StateError('Iterator must not be empty.');
    }

    var _selector = selector;
    var total = TNum == int ? 0 : 0.0;
    if (_selector == null) {
      if (T == num || T == int || T == double) {
        _selector = (n) => n as TNum;
        total = T == int ? 0 : 0.0;
      } else {
        throw ArgumentError(
            "If T isn't a subtype of num, selector must not be null.");
      }
    }

    var count = 0;

    for (var n in this) {
      total += _selector(n);
      count++;
    }

    if (TNum == int) {
      return total ~/ count as TNum;
    }

    return total / count as TNum;
  }
}
