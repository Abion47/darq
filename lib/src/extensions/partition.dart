extension PartitionExtension<T> on Iterable<T> {
  /// Returns an iterable containing two iterables, one containing the
  /// elements that match the condition and one containing those that
  /// do not.
  ///
  /// The first iterable returned contains all the elements in this
  /// iterable that returns true when passed to [condition]. The
  /// second iterable returned contains all the elements in this iterable
  /// that returns false when passed to [condition].
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 2, 3, 4];
  ///       final result = list.partition((x) => x % 2 == 0);
  ///
  ///       // Result: ([2, 4], [1, 3])
  ///     }
  Iterable<Iterable<T>> partition(bool Function(T element) condition) {
    return [
      where((o) => condition(o)),
      where((o) => !condition(o)),
    ];
  }
}
