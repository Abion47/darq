extension ExceptExtension<T> on Iterable<T> {
  /// Returns the set difference between the iterable and the given
  /// collection.
  ///
  /// After applying the [except] method to an iterable, the resulting
  /// iterable will consist of all the elements in the source iterable that
  /// are not present in the given [other] collection. This is equivalent to
  /// taking the set difference of the two sequences. (The "uniqueness" of each
  /// element is determined by calling `hashCode` on each element.)
  ///
  /// Optionally, a [selector] can be supplied to handle comparisons. If
  /// one is provided, the [except] method will use the [selector] function in
  /// order to determine equivalency.  If omitted, [except] will resort to the default
  /// hash code implementation for `T`;
  ///
  /// If none of the elements in the source iterable match any element in the
  /// given [other] collection, the iterable will be unchanged.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final listA = [1, 2, 3, 4];
  ///       final listB = [3, 4, 5, 6];
  ///       final result = listA.except(listB);
  ///
  ///       // Result: [1, 2]
  ///     }
  Iterable<T> except(
    Iterable<T> other, [
    Object Function(T element)? selector,
  ]) sync* {
    selector ??= (T v) => v as Object;

    final set = Set<dynamic>.from(other.map<dynamic>(selector));
    for (var v in this) {
      if (!set.contains(selector(v))) yield v;
    }
  }
}
