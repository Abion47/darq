import 'package:darq/src/utility/equality_comparer.dart';

extension BetweenExtension<T> on Iterable<T> {
  /// Returns true if all elements in the iterable are between [minimum] and [maximum].
  ///
  /// Iterates over the entire iterable and uses a sorting function to compare [value] to
  /// each element in the iterable. If any element is not between [minimum] and [maximum], this
  /// method returns false. Otherwise, if every element is less than or equal to [value], this
  /// method returns true.
  ///
  /// Exclusivity on this method is controlled by the [minimumInclusive] and [maximumInclusive]
  /// parameters. These parameters default to true.
  ///
  /// If [sorter] is omitted, the method checks [EqualityComparer.forType] to see if a default
  /// sorting function exists. If one is found, it is used. If one is not found, this method
  /// throws an [ArgumentError].
  bool between(
    T minimum,
    T maximum, {
    int Function(T, T) sorter,
    bool minimumInclusive = true,
    bool maximumInclusive = true,
  }) {
    sorter ??= EqualityComparer.forType<T>().sort;
    if (sorter == null) {
      throw ArgumentError.notNull('sorter');
    }

    for (var elem in this) {
      final minCompare = sorter(minimum, elem);
      final maxCompare = sorter(maximum, elem);
      if (minCompare > 0 ||
          (!minimumInclusive && minCompare == 0) ||
          maxCompare < 0 ||
          (!maximumInclusive && maxCompare == 0)) {
        return false;
      }
    }

    return true;
  }
}
