extension IntersectExtension<T> on Iterable<T> {
  /// Returns the set intersection between the iterable and the given
  /// collection.
  ///
  /// After applying the [intersect] method to an iterable, the resulting
  /// iterable will consist of all the elements in the source iterable that
  /// are also present in the given [other] collection. This is equivalent to
  /// taking the set intersection of the two sequences.
  ///
  /// Optionally, a [selector] can be supplied to refine the comparison. If
  /// one is provided, the [intersect] method will use the [selector] function in
  /// order to determine equivalency.  If omitted, [intersect] will resort to the default
  /// hash code implementation for `T`;
  ///
  /// If all of the elements in the source iterable match an element in the
  /// given [other] collection, the iterable will be unchanged.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final listA = [1, 2, 3, 4];
  ///       final listB = [3, 4, 5, 6];
  ///       final result = listA.intersect(listB);
  ///
  ///       // Result: [3, 4]
  ///     }
  Iterable<T> intersect<TKey>(
    Iterable<T> other, [
    TKey Function(T element)? selector,
  ]) sync* {
    selector ??= (T v) => v as TKey;

    final set = Set<TKey>.from(other.map(selector));
    for (var v in this) {
      if (set.contains(selector(v))) yield v;
    }
  }
}
