import '../utility/equality_comparer.dart';

extension AtMostExtension<T> on Iterable<T> {
  /// Returns true if all elements in the iterable are equal to or less than [value].
  ///
  /// Iterates over the entire iterable and uses a sorting function to compare [value] to
  /// each element in the iterable. If any element is greater than [value], this method returns false.
  /// Otherwise, if every element is less than or equal to [value], this method returns true.
  ///
  /// If [sorter] is omitted, the method checks [EqualityComparer.forType] to see if a default
  /// sorting function exists. If one is found, it is used. If one is not found, this method
  /// throws an [ArgumentError].
  ///
  /// If the iterable is empty, a [StateError] will be thrown.
  bool atMost(
    T value, {
    int Function(T element, T value)? sorter,
  }) {
    final _sorter = sorter ?? EqualityComparer.tryForType<T>()?.sort;
    if (_sorter == null) {
      throw ArgumentError.notNull('sorter');
    }

    final iterator = this.iterator;
    if (!iterator.moveNext()) {
      throw StateError('Cannot call "atMost" on an empty iterable.');
    }

    do {
      if (_sorter(iterator.current, value) > 0) {
        return false;
      }
    } while (iterator.moveNext());

    return true;
  }
}
