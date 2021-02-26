import '../utility/equality_comparer.dart';
import '../utility/error.dart';
import '../utility/grouping.dart';

extension GroupSelectExtension<T> on Iterable<T> {
  /// Groups the elements in the iterable by a key and maps the groups to a new
  /// element.
  ///
  /// After applying the [groupSelect] method to an iterable, the resulting
  /// iterable will be a series of groups of elements. Each group will consist
  /// of all elements in the source iterable that share a common key as defined
  /// by passing the element to the [keySelector] function. Finally, each group
  /// will then be passed to the [resultSelector] function along with its
  /// associated key and the returned value of that function will be returned as
  /// an element of the resulting iterable.
  ///
  /// Optionally, an [EqualityComparer] can be supplied to handle key comparisons.
  /// If one is provided, the [groupSelect] method will use the [comparer] and
  /// [hasher] properties in order to determine equivalency. If omitted,
  /// [groupSelect] will resort to strict equivalency (i.e. checking `if
  /// (value == element)`).
  ///
  /// (For the [groupSelect] method, only the [comparer] and [hasher] properties of
  /// the [EqualityComparer] need be supplied.)
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
  ///         Pet('Barley', 8.3),
  ///         Pet('Boots', 4.9),
  ///         Pet('Whiskers', 1.5),
  ///         Pet('Daisy', 4.3),
  ///       ];
  ///
  ///       final ageComparer = (Pet p1, Pet p2) => p1.age.compareTo(p2.age);
  ///
  ///       final result = pets.groupSelect(
  ///         (age, pets) => {
  ///           'key': age,
  ///           'count': pets.length,
  ///           'min': pets.min(ageComparer),
  ///           'max': pets.max(ageComparer),
  ///         },
  ///         keySelector: (pet) => pet.age.floor(),
  ///       );
  ///
  ///       // Resulting Iterable:
  ///       // [
  ///       //   { 'key': 8, 'count': 1, 'min': Pet('Barley', 8.3), 'max': Pet('Barley', 8.3) },
  ///       //   { 'key': 4, 'count': 2, 'min': Pet('Daisy', 4.3), 'max': Pet('Boots', 4.9) },
  ///       //   { 'key': 1, 'count': 1, 'min': Pet('Whiskers', 1.5), 'max': Pet('Whiskers', 1.5) },
  ///       // ]
  ///     }
  ///

  ///
  GroupSelectIterable<T, TKey, TResult> groupSelect<TKey, TResult>(
    TResult Function(TKey key, Iterable<T> group) resultSelector, {
    TKey Function(T key) keySelector,
    EqualityComparer<TKey> keyComparer,
  }) {
    checkNullError(this);
    ArgumentError.checkNotNull(resultSelector, 'resultSelector');

    keySelector ??= (T v) => v as TKey;
    keyComparer ??= EqualityComparer.forType<TKey>();

    return GroupSelectIterable<T, TKey, TResult>(
        this, keySelector, resultSelector, keyComparer);
  }
}
