extension AllExtension<T> on Iterable<T> {
  /// Returns `true` if all elements match a condition and `false` otherwise.
  ///
  /// Applies the specified [condition] function to each element in the
  /// iterable. The [condition] function is given each element to process and
  /// should return `true` if the element matches a condition and `false` if
  /// not.
  ///
  /// If the [condition] function returns `true` for all elements in the
  /// iterable, the [all] method returns `true` as well. Otherwise, if the
  /// [condition] function returns `false` even once during the iteration, the
  /// [all] method will return `false` as well.
  ///
  /// If the type of the iterable is `bool`, the condition argument is optional.
  ///
  /// The [all] method will short-circuit after receiving a `false` from calling
  /// [condition] and will not iterate further over the iterable. In the worst
  /// case, it will iterate over the entire iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [2, 4, 6, 8];
  ///       final result = list.all((x) => x.isEven);
  ///
  ///       // Result: true
  ///     }
  ///
  /// (This is a convenience method to maintain naming-consistency with its .NET LINQ equivalent.
  /// Internally it functions identically to [every].)
  bool all([bool Function(T element)? condition]) {
    if (condition == null) {
      if (T == bool) {
        condition = (T b) => b as bool;
      } else {
        throw ArgumentError('If T isn\t bool, condition must not be null.');
      }
    }

    return every(condition);
  }
}
