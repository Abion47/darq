extension FirstWhereOrDefaultExtension<T> on Iterable<T> {
  /// Returns the first element in the iterable matching a specified condition,
  /// or a default value if none is found.
  ///
  /// Begins iteration of the iterable, but then returns the first element
  /// found that matches the specified [condition].
  ///
  /// If the iterable is empty, or if [condition] is provided but iteration
  /// reaches the end of the iterable before an element is found, the value
  /// specified by [defaultValue] will be returned instead. If [defaultValue] is
  /// omitted, the returned value will be `null`.
  ///
  /// The [firstWhereOrDefault] method begins iteration, but short-circuits
  /// the first time [condition] returns `true` and will not iterate further. In
  /// the worst case, it will iterate over the entire iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 3, 5];
  ///       final result = list.firstWhereOrDefault((x) => x.isEven, defaultValue: -1);
  ///
  ///       // Result: -1
  ///     }
  T? firstWhereOrDefault(bool Function(T value) condition, {T? defaultValue}) {
    if (isEmpty) return defaultValue;

    for (var v in this) {
      if (condition(v)) {
        return v;
      }
    }

    return defaultValue;
  }
}
