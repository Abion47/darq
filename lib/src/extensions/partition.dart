import '../utility/tuple.dart';

extension PartitionExtension<T> on Iterable<T> {
  /// Returns a [Tuple2] dividing this iterable into two iterables, one iterable
  /// containing elements that match the condition and one containing elements
  /// that do not.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 2, 3, 4];
  ///       final result = list.partition((x) => x % 2 == 0);
  ///
  ///       // Result: ([2, 4], [1, 3])
  ///     }
  Tuple2<Iterable<T>, Iterable<T>> partition(bool Function(T) condition) {
    return Tuple2(
      where((o) => condition(o)),
      where((o) => !condition(o)),
    );
  }
}
