extension MinExtension<T> on Iterable<T> {
  /// Returns the minimum value in the iterable.
  ///
  /// Iterates over the iterable and applies the [comparer] to each element
  /// in order to find the minimum value. Once iteration is complete, [min]
  /// will return the smallest element found.
  ///
  /// When the type of the iterable is one of the below types, the
  /// [comparer] can be omitted. In this case, the function defaults to
  /// predefined minimum functions depending on the type:
  ///
  /// - Numeric types (`num`, `int`, `double`) return the minimum of all elements
  /// as defined by the `min` function in `dart:math`.
  ///
  /// - `String` types return the alphabetic minimum of all elements.
  ///
  /// If the iterable type is not one of these types, the [comparer]
  /// must be provided. Otherwise, an [ArgumentError] will be thrown.
  ///
  /// If the iterable is empty, a [StateError] will be thrown.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1, 2, 3];
  ///       final result = list.min();
  ///
  ///       // Result: 0
  ///     }
  T min([int Function(T, T) comparer]) {
    if (comparer == null) {
      if (T == num) {
        comparer = (T a, T b) => (a as num).compareTo(b as num);
      } else if (T == int) {
        comparer = (T a, T b) => (a as int).compareTo(b as int);
      } else if (T == double) {
        comparer = (T a, T b) => (a as double).compareTo(b as double);
      } else if (T == String) {
        comparer = (T a, T b) => (a as String).compareTo(b as String);
      }
    }

    if (isEmpty) {
      throw StateError('Iterable must not be empty.');
    }

    if (comparer == null) {
      throw ArgumentError('comparer must not be null');
    }

    T min;
    for (var v in this) {
      if (min == null) {
        min = v;
      } else if (comparer(v, min) < 0) {
        min = v;
      }
    }

    return min;
  }
}
