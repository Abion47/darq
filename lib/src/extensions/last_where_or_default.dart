extension LastWhereOrDefaultExtension<T> on Iterable<T> {
  /// Returns the last element in the iterable matching a specified condition,
  /// or a default value if none is found.
  ///
  /// Iterates over the entire iterable and returns last value that matched the
  /// [condition].
  ///
  /// If the iterable is empty, or if no value was found that matched the [condition],
  /// the value specified by [defaultValue] will be returned instead. If [defaultValue]
  /// is omitted, the returned value will be `null`.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 3, 5];
  ///       final result = list.lastWhereOrDefault((x) => x.isEven, defaultValue: -1);
  ///
  ///       // Result: -1
  ///     }
  T lastWhereOrDefault(bool Function(T element) condition,
      {required T defaultValue}) {
    if (isEmpty) return defaultValue;

    var found = false;
    T? val;

    for (var v in this) {
      if (condition(v)) {
        val = v;
        found = true;
      }
    }

    if (found) {
      return val as T;
    }

    return defaultValue;
  }
}
