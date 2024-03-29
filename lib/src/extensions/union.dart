extension UnionExtension<T> on Iterable<T> {
  /// Returns the set union between the iterable and the given
  /// collection.
  ///
  /// After applying the [union] method to an iterable, the resulting
  /// iterable will consist of all the distinct elements in the source
  /// iterable as well as the distinct elements in the given [other]
  /// collection. This is equivalent to taking the set union of the two
  /// sequences. (The "uniqueness" of each element is determined by calling
  /// `hashCode` on each element.)
  ///
  /// Optionally, a [selector] can be supplied to refine the comparison. If
  /// one is provided, the [union] method will use the [selector] function in
  /// order to determine equivalency. If omitted, [union] will resort to the default
  /// hash code implementation for `T`;
  ///
  /// Due to the nature of set unions, the resulting iterable will be as though
  /// [distinct](https://pub.dev/documentation/darq/latest/darq/DistinctExtension/distinct.html) was applied to it, so duplicate elements
  /// will be discarded. If the intention is to combine elements of two iterables/collections,
  /// use [concat](https://pub.dev/documentation/darq/latest/darq/ConcatExtension/concat.html) instead.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final listA = [1, 2, 3, 4];
  ///       final listB = [3, 4, 5, 6];
  ///       final result = listA.union(listB);
  ///
  ///       // Result: [1, 2, 3, 4, 5, 6]
  ///     }
  Iterable<T> union(Iterable<T> other,
      [Object Function(T element)? selector]) sync* {
    selector ??= (T v) => v as Object;

    final set = <dynamic>{};

    for (var v in this) {
      if (set.add(selector(v))) {
        yield v;
      }
    }

    for (var v in other) {
      if (set.add(selector(v))) {
        yield v;
      }
    }
  }
}
