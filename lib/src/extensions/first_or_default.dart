import '../utility/error.dart';

extension FirstOrDefaultExtension<T> on Iterable<T> {
  /// Returns the first element in the iterable.
  ///
  /// If the iterable is empty, the value specified by [defaultValue] will be
  /// returned instead. If [defaultValue] is omitted, the returned value will be
  /// `null`.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = <int>[];
  ///       final result = list.firstOrDefault(defaultValue: -1);
  ///
  ///       // Result: -1
  ///     }
  T firstOrDefault({T defaultValue}) {
    checkNullError(this);
    if (isEmpty) return defaultValue;
    return first;
  }
}
