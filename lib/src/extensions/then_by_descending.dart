import '../utility/equality_comparer.dart';
import '../utility/error.dart';
import '../utility/ordered.dart';

extension OrderedIterableExtensions<T> on Iterable<T> {
  /// Adds a secondary sorting pass to iteration in ascending
  /// (least-to-greatest) order.
  ///
  /// [thenByDescending] applies to an iterable that has been sorted by [orderBy] or
  /// [orderByDescending] (or another [thenBy] or [thenByDescending]). Once the
  /// previous sorting mechanism is processed, the keys are then sorted again
  /// using the [EqualityComparer] given to this method. (The process of sorting
  /// is identical to [groupBy].)
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
  ///       var list = ['ab', 'a', 'c', 'aa', ''];
  ///       // Sort by string length followed by reverse alphabetical order
  ///       var result = list.orderBy((c) => c.length)
  ///                        .thenByDescending((c) => c);
  ///
  ///       // Result: ['', 'c', 'a', 'ab', 'aa']
  ///     }
  Iterable<T> thenByDescending<TKey>(
    TKey Function(T element) keySelector, {
    EqualityComparer<TKey> keyComparer,
  }) {
    checkNullError(this);
    ArgumentError.checkNotNull(keySelector, 'keySelector');

    if (this is! InternalOrderedIterable) {
      throw UnsupportedError(
          'thenByDescending must be called immediately following a call to orderBy, orderByDescending, thenBy, or thenByDescending.');
    }
    return (this as dynamic)
        .createOrderedIterable<TKey>(keySelector, keyComparer, true);
  }
}
