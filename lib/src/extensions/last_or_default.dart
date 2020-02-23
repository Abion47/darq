extension LastOrDefaultExtension<T> on Iterable<T> {
  /// Returns the last element in the iterable.
  ///
  /// If the iterable is empty, the value specified by [defaultValue] will be
  /// returned instead. If [defaultValue] is omitted, the returned value will be
  /// `null`.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = <int>[];
  ///       final result = list.lastOrDefault(defaultValue: -1);
  ///
  ///       // Result: -1
  ///     }
  T lastOrDefault({T defaultValue}) {
    if (isEmpty) return defaultValue;
    return last;
  }
}
