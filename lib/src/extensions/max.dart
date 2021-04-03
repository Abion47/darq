import '../utility/equality_comparer.dart';

extension MaxExtension<T> on Iterable<T> {
  /// Returns the maximum value in the iterable.
  ///
  /// Iterates over the iterable and applies the [comparer] to each element
  /// in order to find the maximum value. Once iteration is complete, [max]
  /// will return the largest element found.
  ///
  /// When the type of the iterable is one of the below types, the
  /// [comparer] can be omitted. In this case, the function defaults to
  /// predefined maximum functions depending on the type:
  ///
  /// - Numeric types (`num`, `int`, `double`) return the maximum of all elements
  /// as defined by the `max` function in `dart:math`.
  ///
  /// - `String` types return the alphabetic maximum of all elements.
  ///
  /// If the iterable type is not one of these types, the [EqualityComparer]
  /// must be provided. Otherwise, an [ArgumentError] will be thrown.
  ///
  /// If the iterable is empty, a [StateError] will be thrown.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1, 2, 3];
  ///       final result = list.max();
  ///
  ///       // Result: 3
  ///     }
  T max([int Function(T e1, T e2)? comparer]) {
    if (isEmpty) {
      throw StateError('Iterable must not be empty.');
    }

    comparer ??= EqualityComparer.tryForType<T>()?.sort;
    if (comparer == null) {
      throw ArgumentError.notNull('comparer');
    }

    final iter = iterator..moveNext();
    var max = iter.current;
    while (iter.moveNext()) {
      if (comparer(iter.current, max) > 0) {
        max = iter.current;
      }
    }

    return max;
  }
}
