import '../utility/equality_comparer.dart';
import '../utility/error.dart';
import '../utility/grouping.dart';

extension GroupByExtension<T> on Iterable<T> {
  /// Groups the elements in the iterable by a key.
  ///
  /// After applying the [groupBy] method to an iterable, the resulting
  /// iterable will be a series of groups of elements. Each group will consist
  /// of all elements in the source iterable that share a common key as defined
  /// by passing the element to the [keySelector] function.
  ///
  /// Optionally, an [EqualityComparer] can be supplied to handle key comparisons.
  /// If one is provided, the [groupBy] method will use the [comparer] and
  /// [hasher] properties in order to determine equivalency. If omitted,
  /// [groupBy] will resort to strict equivalency (i.e. checking `if (value == element)`).
  ///
  /// (For the [groupBy] method, only the [comparer] and [hasher] properties of
  /// the [EqualityComparer] need be supplied.)
  ///
  /// The resulting iterable will consist of a series of [Grouping] constructs
  /// that contain the elements. If no two elements in the iterable share a
  /// common key, the resulting iterable will consist of [Grouping] objects
  /// (each containing a single element) of the same length as the source
  /// iterable.
  ///
  /// Example:
  ///
  ///     class Pet {
  ///       Pet(this.name, this.age);
  ///
  ///       String name;
  ///       double age;
  ///     }
  ///
  ///     void main() {
  ///       final pets = [
  ///         Pet('Barley', 8),
  ///         Pet('Boots', 4),
  ///         Pet('Whiskers', 1),
  ///         Pet('Daisy', 4),
  ///       ];
  ///
  ///       final results = pets.groupBy((pet) => pet.age);
  ///
  ///       // Resulting Iterable:
  ///       // [
  ///       //   [ Pet('Barley', 8) ],
  ///       //   [ Pet('Boots', 4), Pet('Daisy', 4) ],
  ///       //   [ Pet('Whiskers', 1) ],
  ///       // ]
  ///     }
  GroupByIterable<T, TKey> groupBy<TKey>(
    TKey Function(T element) keySelector, {
    EqualityComparer<TKey> keyComparer,
  }) {
    checkNullError(this);

    keySelector ??= (T v) => v as TKey;
    keyComparer ??= EqualityComparer.forType<TKey>();

    return GroupByIterable<T, TKey>(this, keySelector, keyComparer);
  }
}
