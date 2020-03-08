import '../utility/error.dart';

extension DistinctExtension<T> on Iterable<T> {
  /// Returns an iterable representing the distinct values of this iterable.
  ///
  /// After applying the [distinct] method to an iterable, the resulting
  /// iterable will consist of distinct values in the source iterable.
  ///
  /// Optionally, a [keySelector] can be supplied to handle comparisons. If
  /// one is provided, the [distinct] method will use the [comparer] property in
  /// order to determine equivalency. If omitted, [distinct] will resort to strict
  /// equivalency (i.e. checking `if (value == element)`).
  ///
  /// Each element will be the first element found in the source iterable,
  /// meaning elements with unique data that are deemed non-distinct by the
  /// [keySelector] will be dropped.
  ///
  /// If none of the elements in the iterable match any other element in the
  /// iterable, the iterable will be unchanged.\
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 0, 0, 1, 1, 2, 3, 3, 3];
  ///       final result = list.distinct();
  ///
  ///       // Result: [0, 1, 2, 3]
  ///     }
  Iterable<T> distinct<TKey>([TKey Function(T) keySelector]) sync* {
    checkNullError(this);

    keySelector ??= (T v) => v as TKey;
    final set = <TKey>{};

    for (var t in this) {
      if (set.add(keySelector(t))) yield t;
    }
  }
}
