extension DefaultRangeIfEmptyExtension<T> on Iterable<T> {
  /// Returns this iterable, or [defaultVal] if this iterable is empty.
  ///
  /// If the number of elements in this iterable is zero, [defaultIfEmpty] will
  /// return [defaultVal] instead.
  ///
  /// If this iterable has one or more elements, the iterable is returned
  /// without modification.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = <int>[];
  ///       final result = list.defaultIfEmpty([1, 2, 3]);
  ///
  ///       // Result: [1, 2, 3]
  ///     }
  Iterable<T> defaultRangeIfEmpty(Iterable<T> defaultVal) sync* {
    ArgumentError.checkNotNull(defaultVal, 'defaultVal');

    var hasValues = false;
    for (var v in this) {
      yield v;
      hasValues = true;
    }

    if (!hasValues) {
      yield* defaultVal;
    }
  }
}
