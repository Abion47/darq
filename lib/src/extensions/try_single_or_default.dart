extension TrySingleOrDefaultExtension<T> on Iterable<T> {
  /// Returns the single element in the iterable, or a [defaultValue] if no
  /// such element exists.
  ///
  /// Returns the single value in this iterable, assuming the iterable has a
  /// length of one. If the iterable is empty or contains more than one element,
  /// the value specified by [defaultValue] is returned instead.
  ///
  /// This method function will short-circuit after reaching the second
  /// element of the iteration, if one exists. In the worst-case scenario,
  /// this method will iterate over two elements of the iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 2];
  ///       final result = list.singleOrDefault(defaultValue: -1);
  ///
  ///       // Result: -1
  ///     }
  T? trySingleOrDefault({T? defaultValue}) {
    final iter = iterator;
    if (!iter.moveNext()) return defaultValue;

    var val = iter.current;
    if (iter.moveNext()) {
      return defaultValue;
    }

    return val;
  }
}
