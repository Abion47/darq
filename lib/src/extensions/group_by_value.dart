import '../utility/equality_comparer.dart';
import '../utility/grouping.dart';

extension GroupByValueExtension<T> on Iterable<T> {
  /// Groups the elements in the iterable by a key and maps the elements to
  /// a new value.
  ///
  /// After applying the [groupByValue] method to an iterable, the resulting
  /// iterable will be a series of groups of elements. Each group will consist
  /// of all elements in the source iterable that share a common key as defined
  /// by passing the element to the [keySelector] function with those elements
  /// passed to the [valueSelector] to retrieve the value stored under the key.
  ///
  /// Optionally, an [EqualityComparer] can be supplied to handle key comparisons.
  /// If one is provided, the [groupByValue] method will use the [compare](https://pub.dev/documentation/darq/latest/darq/EqualityComparer/compare.html) and
  /// [hash](https://pub.dev/documentation/darq/latest/darq/EqualityComparer/hash.html) properties in order to determine equivalency. If omitted,
  /// [groupByValue] will resort to strict equivalency (i.e. checking `if (value == element)`).
  ///
  /// (For the [groupByValue] method, only the [compare](https://pub.dev/documentation/darq/latest/darq/EqualityComparer/compare.html)
  /// and [hash](https://pub.dev/documentation/darq/latest/darq/EqualityComparer/hash.html)
  /// properties of the [EqualityComparer] need be supplied.)
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
  ///       final results = pets.groupByValue(
  ///         keySelector: (pet) => pet.age),
  ///         valueSelector: (pet) => pet.name),
  ///       );
  ///
  ///       // Resulting Iterable:
  ///       // [
  ///       //   [ 'Barley' ],
  ///       //   [ 'Boots', 'Daisy' ],
  ///       //   [ 'Whiskers' ],
  ///       // ]
  ///     }
  GroupByValueIterable<T, TKey, TValue> groupByValue<TKey, TValue>({
    TKey Function(T element)? keySelector,
    TValue Function(T element)? valueSelector,
    EqualityComparer<TKey>? keyComparer,
  }) {
    keySelector ??= (T v) => v as TKey;
    valueSelector ??= (T v) => v as TValue;
    keyComparer ??= EqualityComparer.forType<TKey>();

    return GroupByValueIterable<T, TKey, TValue>(
        this, keySelector, valueSelector, keyComparer);
  }
}
