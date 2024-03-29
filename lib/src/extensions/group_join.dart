import '../utility/equality_comparer.dart';
import '../utility/grouping.dart';

extension GroupJoinExtension<T> on Iterable<T> {
  /// Joins elements in the iterable with a group of all elements in the
  /// [inner] collection that match the generated key.
  ///
  /// First, [groupJoin] will iterate over the [inner] collection and make a
  /// lookup table of its elements, referenceable by a key generated by
  /// [innerKeySelector]. Then [groupJoin] will iterate over the source
  /// iteration, generating keys via the [outerKeySelector]. If a generated
  /// outer key matches an inner key in the collection lookup, the iterable
  /// element is passed to the [resultSelector] with all elements from the [inner]
  /// collection that match that key. The returned value of [resultSelector] is then
  /// added to the resulting iterable.
  ///
  /// Elements in the source iterable that doesn't share a key in the
  /// lookup table are passed to the [resultSelector] function with an empty
  /// collection as the second parameter. Elements in [inner] that don't share
  /// a key with a source iterable element are discarded.
  ///
  /// The [outerKeySelector], [innerKeySelector], and [keyComparer] parameters are
  /// optional. If omitted, the selectors revert to a default selector that returns
  /// the input directly, and [keyComparer] reverts to a comparer that checks for
  /// strict equivalency.
  ///
  /// [groupJoin] is different from [joinMap](https://pub.dev/documentation/darq/latest/darq/JoinMapExtension.html) in that, where [joinMap](https://pub.dev/documentation/darq/latest/darq/JoinMapExtension.html) will produce a
  /// new resulting element for each key match between the source iterable and
  /// the [inner] collection, [groupJoin] will produce a new element from an
  /// element in the source iterable and all elements in the [inner]
  /// collection that match on the key.
  ///
  /// Example:
  ///
  ///     class Person {
  ///       Person(this.name);
  ///
  ///       String name;
  ///     }
  ///
  ///     class Pet {
  ///       Pet(this.name, this.age, this.owner);
  ///
  ///       String name;
  ///       double age;
  ///       Person owner;
  ///     }
  ///
  ///     void main() {
  ///       final people = [
  ///         Person('Travis'),
  ///         Person('Terry'),
  ///         Person('Charlotte'),
  ///         Person('Benny'),
  ///       ];
  ///       final pets = [
  ///         Pet('Barley', 8, people[1]),   // owner: terry
  ///         Pet('Boots', 4, people[1]),    // owner: terry
  ///         Pet('Whiskers', 1, people[2]), // owner: charlotte
  ///         Pet('Daisy', 4, people[0]),    // owner: travis
  ///       ];
  ///
  ///       final result = people.groupJoin(
  ///         pets,
  ///         (person, pets) => <String, dynamic>{
  ///           'ownerName': person.name,
  ///           'pets': pets.select((pet, i) => pet.name)
  ///         },
  ///         outerKeySelector: (person) => person.name,
  ///         innerKeySelector: (pet) => pet.owner.name,
  ///       );
  ///
  ///       // Resulting Iterable:
  ///       // [
  ///       //   { 'ownerName': 'Travis', 'pets': ['Daisy'] },
  ///       //   { 'ownerName': 'Terry', 'pets': ['Barley', 'Boots'] },
  ///       //   { 'ownerName': 'Charlotte', 'pets': ['Whiskers'] },
  ///       //   { 'ownerName': 'Benny', 'pets': [] },
  ///       // ]
  ///     }
  GroupJoinIterable<T, TInner, TKey, TResult> groupJoin<TInner, TKey, TResult>(
    Iterable<TInner> inner,
    TResult Function(T element, Iterable<TInner> other) resultSelector, {
    TKey Function(T element)? outerKeySelector,
    TKey Function(TInner otherElement)? innerKeySelector,
    EqualityComparer<TKey>? keyComparer,
  }) {
    outerKeySelector ??= (T v) => v as TKey;
    innerKeySelector ??= (TInner v) => v as TKey;
    keyComparer ??= EqualityComparer.forType<TKey>();

    return GroupJoinIterable<T, TInner, TKey, TResult>(this, inner,
        outerKeySelector, innerKeySelector, resultSelector, keyComparer);
  }
}
