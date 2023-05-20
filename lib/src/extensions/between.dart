import '../utility/equality_comparer.dart';

extension BetweenExtension<T> on Iterable<T> {
  /// Returns true if all elements in the iterable are between [minimum] and [maximum].
  ///
  /// Consumes the iterable and examines each element. If any element is not between
  /// [minimum] and [maximum], this method returns false. Otherwise, this method returns true.
  ///
  /// Exclusivity on this method is controlled by the [minimumInclusive] and [maximumInclusive]
  /// parameters. These parameters default to false.
  ///
  /// If [sorter] is omitted, the method checks [EqualityComparer.forType] to see if a default
  /// sorting function exists. If one is found, it is used. If one is not found, this method
  /// throws an [ArgumentError].
  ///
  /// If this iterable is empty, a [StateError] is thrown.
  bool between(
    T minimum,
    T maximum, {
    int Function(T value, T element)? sorter,
    bool minimumInclusive = false,
    bool maximumInclusive = false,
  }) {
    sorter ??= EqualityComparer.tryForType<T>()?.sort;
    if (sorter == null) {
      throw ArgumentError.notNull('sorter');
    }

    final iterator = this.iterator;
    if (!iterator.moveNext()) {
      throw StateError('Cannot call "between" on an empty iterable.');
    }

    do {
      final minCompare = sorter(minimum, iterator.current);
      final maxCompare = sorter(maximum, iterator.current);
      if (minCompare > 0 ||
          (!minimumInclusive && minCompare == 0) ||
          maxCompare < 0 ||
          (!maximumInclusive && maxCompare == 0)) {
        return false;
      }
    } while (iterator.moveNext());

    return true;
  }
}
