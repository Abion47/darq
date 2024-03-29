import '../utility/equality_comparer.dart';
import '../utility/ordered.dart';

extension OrderByExtension<T> on Iterable<T> {
  /// Sorts the iteration in ascending (least-to-greatest) order.
  ///
  /// First, [orderBy] iterates over the entire iterable, creating a list of
  /// keys generated by [keySelector] associated to their corresponding
  /// elements. Then a QuickSort algorithm is applied to the keys, using the
  /// [sort](https://pub.dev/documentation/darq/latest/darq/EqualityComparer/sort.html) property in [keyComparer] to determine sort order. Afterwards,
  /// the resulting iterable will consist of the elements in the source
  /// iterable in the order determined by the sorted list of keys.
  ///
  /// When the type of the iterable is one of the below types, the
  /// [EqualityComparer] can be omitted. In this case, the function defaults to
  /// predefined minimum functions depending on the type:
  ///
  /// - Numeric types (`num`, `int`, `double`) will be sorted by their values in ascending order.
  /// - `String` types will be sorted in alphabetic order.
  ///
  /// If the iterable type is not one of these types and the [EqualityComparer]
  /// is not provided, the order of the resulting iterable is unpredictable.
  ///
  /// If the iterable is already sorted in ascending order, the resulting
  /// iterable will be unchanged.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [4, 3, 5, 2, 1];
  ///       final result = list.orderBy((x) => x);
  ///
  ///       // Result: [1, 2, 3, 4, 5]
  ///     }
  Iterable<T> orderBy<TKey>(
    TKey Function(T element) keySelector, {
    EqualityComparer<TKey>? keyComparer,
  }) {
    keyComparer ??= EqualityComparer.forType<TKey>();
    return InternalOrderedIterable(this, keySelector, keyComparer, false);
  }
}
