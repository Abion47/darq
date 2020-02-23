extension DefaultIfEmptyExtension<T> on Iterable<T> {
  /// Returns a new iterable containing [value] if this iterable is empty. Otherwise,
  /// the source iterable will be unaffected.
  ///
  /// If the number of elements in this iterable is zero, [defaultIfEmpty] will
  /// return a new iterable that consists of a single element specified by
  /// the given [value].
  ///
  /// If this iterable has one or more elements, the iterable is returned
  /// without modification.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = <int>[];
  ///       final result = list.defaultIfEmpty(-1);
  ///
  ///       // Result: [-1]
  ///     }
  Iterable<T> defaultIfEmpty(T defaultVal) sync* {
    var hasValues = false;
    for (var v in this) {
      yield v;
      hasValues = true;
    }

    if (!hasValues) {
      yield defaultVal;
    }
  }
}
