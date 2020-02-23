import '../utility/equality_comparer.dart';

extension AtLeastExtension<T> on Iterable<T> {
  /// Returns true if all elements in the iterable are equal to or greater than [value].
  ///
  /// Iterates over the entire iterable and uses a sorting function to compare [value] to
  /// each element in the iterable. If any element is less than [value], this method returns false.
  /// Otherwise, if every element is greater than or equal to [value], this method returns true.
  ///
  /// If [sorter] is omitted, the method checks [EqualityComparer.forType] to see if a default
  /// sorting function exists. If one is found, it is used. If one is not found, this method
  /// throws an [ArgumentError].
  bool atLeast(
    T value, {
    int Function(T, T) sorter,
  }) {
    sorter ??= EqualityComparer.forType<T>().sort;
    if (sorter == null) {
      throw ArgumentError.notNull('sorter');
    }

    for (var elem in this) {
      if (sorter(value, elem) < 0) {
        return false;
      }
    }

    return true;
  }
}
