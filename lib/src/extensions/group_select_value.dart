import '../utility/equality_comparer.dart';
import '../utility/error.dart';
import '../utility/grouping.dart';

extension GroupSelectValueExtension<T> on Iterable<T> {
  /// Groups the elements in the iterable by a key, maps the elements to
  /// a new value, and maps the groups to a new element.
  ///
  /// After applying the [groupSelectValue] method to an iterable, the resulting
  /// iterable will be a series of groups of elements. Each group will consist
  /// of all elements in the source iterable that share a common key as defined
  /// by passing the element to the [keySelector] function stored as a value
  /// obtained by passing the elements to the [valueSelector] function. Finally,
  /// each group will then be passed to the [resultSelector] function along with
  /// its associated key and the returned value of that function will be returned
  /// as an element of the resulting iterable.
  ///
  /// Optionally, an [EqualityComparer] can be supplied to handle key comparisons.
  /// If one is provided, the [groupSelectValue] method will use the [comparer] and
  /// [hasher] properties in order to determine equivalency. If omitted,
  /// [groupSelectValue] will resort to strict equivalency (i.e. checking `if
  /// (value == element)`).
  ///
  /// (For the [groupSelectValue] method, only the [comparer] and [hasher]
  /// properties of the [EqualityComparer] need be supplied.)
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
  ///       final result = pets.groupSelectValue(
  ///         (age, pets) => {
  ///           'key': age,
  ///           'count': pets.length,
  ///           'names': pets,
  ///         },
  ///         keySelector: (pet) => pet.age.floor(),
  ///         valueSelector: (pet) => pet.name,
  ///       );
  ///
  ///       // Resulting Iterable:
  ///       // [
  ///       //   { 'key': 8, 'count': 1, 'names': ['Barley'] },
  ///       //   { 'key': 4, 'count': 2, 'names': ['Boots', 'Daisy'] },
  ///       //   { 'key': 1, 'count': 1, 'names': ['Whiskers'] },
  ///       // ]
  ///     }
  GroupSelectValueIterable<T, TKey, TValue, TResult>
      groupSelectValue<TKey, TValue, TResult>(
    TResult Function(TKey key, Iterable<TValue> group) resultSelector, {
    TKey Function(T element) keySelector,
    TValue Function(T element) valueSelector,
    EqualityComparer<TKey> keyComparer,
  }) {
    checkNullError(this);
    ArgumentError.checkNotNull(resultSelector, 'resultSelector');

    keySelector ??= (T v) => v as TKey;
    valueSelector ??= (T v) => v as TValue;
    keyComparer ??= EqualityComparer.forType<TKey>();

    return GroupSelectValueIterable(
        this, keySelector, valueSelector, resultSelector, keyComparer);
  }
}
