extension SingleWhereOrDefaultExtension<T> on Iterable<T> {
  /// Returns the single element in the iterable matching a
  /// [condition], or a [defaultValue] if no such element exists.
  ///
  /// Iterates over the entire iterable, applying the [condition] function to
  /// each element. At the end of the iteration, if only a single element matches
  /// the [condition], that element is returned. If no elements match the [condition],
  /// the value specified by [defaultValue] is returned instead. If more than
  /// one element matches the [condition], a [StateError] is thrown.
  ///
  /// This method will short-circuit after finding a second element
  /// that matches the [condition]. In the worst-case scenario, this method
  /// will iterate over the entire iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 2, 3];
  ///       final result = list.singleWhereOrDefault((x) => x == 4, defaultValue: -1);
  ///
  ///       // Result: -1
  ///     }
  T singleWhereOrDefault(bool Function(T element) condition,
      {required T defaultValue}) {
    final iter = iterator;
    if (!iter.moveNext()) return defaultValue;

    T? val;
    var found = false;
    do {
      if (condition(iter.current)) {
        if (!found) {
          val = iter.current;
          found = true;
        } else {
          throw StateError(
              'The iterable has more than one element matching the condition.');
        }
      }
    } while (iter.moveNext());

    if (!found) return defaultValue;
    return val!;
  }
}
