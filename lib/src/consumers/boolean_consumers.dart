import '../equality_comparer.dart';
import '../iterables/other_extensions.dart';
import 'math_consumers.dart';

extension BooleanConsumerExtensions<T> on Iterable<T> {
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

  ///
  /// (This is a convenience method to maintain naming-consistency with its .NET LINQ equivalent.
  /// Internally it functions identically to [every].)
  bool all([bool Function(T) condition]) {
    if (condition == null) {
      if (T == bool) {
        condition = (T b) => b as bool;
      }
    }

    if (condition == null) {
      throw ArgumentError('If T isn\t bool, condition must not be null.');
    }

    return every(condition);
  }

  /// Asserts that all elements in this iterable meet a given condition. If not, an
  /// [AssertionError] is thrown.
  ///
  /// The iterable is consumed and all elements are passed to [condition]. If the result
  /// of all calls return true, this iterable is returned back. If any call returns false,
  /// an [AssertionError] is thrown.
  ///
  /// If [message] is provided and an error is thrown, the message will be provided with the
  /// error.
  Iterable<T> assertAll(bool Function(T) condition, [String message]) {
    assert(every(condition), message);
    return this;
  }

  /// Asserts that any elements in this iterable meet a given condition. If not, an
  /// [AssertionError] is thrown.
  ///
  /// The iterable is consumed and all elements are passed to [condition]. If the result
  /// of any call returns true, this iterable is returned back. If all such calls return false,
  /// an [AssertionError] is thrown.
  ///
  /// If [message] is provided and an error is thrown, the message will be provided with the
  /// error.
  Iterable<T> assertAny(bool Function(T) condition, [String message]) {
    assert(any(condition), message);
    return this;
  }

  /// Asserts that any elements in this iterable meet a given condition. If not, an
  /// [AssertionError] is thrown.
  ///
  /// The iterable is consumed and all elements are passed to [condition]. If the result
  /// of any call returns true, this iterable is returned back. If all such calls return false,
  /// an [AssertionError] is thrown.
  ///
  /// If [message] is provided and an error is thrown, the message will be provided with the
  /// error.
  Iterable<T> assertCount(int count, [String message]) {
    assert(count == this.count(), message);
    return this;
  }

  /// Returns true if all elements in the iterable are equal to or greater than [value].
  ///
  /// Iterates over the entire iterable and uses a sorting function to compare [value] to
  /// each element in the iterable. If any element is less than [value], this method returns false.
  /// Otherwise, if every element is greater than or equal to [value], this method returns true.
  ///
  /// If [sorter] is omitted, the method checks [EqualityComparer.forType] to see if a default
  /// sorting function exists. If one is found, it is used. If one is not found, this method
  /// throws an [ArgumentError].
  bool atLeast(
    T value, {
    int Function(T, T) sorter,
  }) {
    sorter ??= EqualityComparer.forType<T>().sort;
    if (sorter == null) {
      throw ArgumentError.notNull('sorter');
    }

    for (var elem in this) {
      if (sorter(value, elem) < 0) {
        return false;
      }
    }

    return true;
  }

  /// Returns true if all elements in the iterable are equal to or less than [value].
  ///
  /// Iterates over the entire iterable and uses a sorting function to compare [value] to
  /// each element in the iterable. If any element is greater than [value], this method returns false.
  /// Otherwise, if every element is less than or equal to [value], this method returns true.
  ///
  /// If [sorter] is omitted, the method checks [EqualityComparer.forType] to see if a default
  /// sorting function exists. If one is found, it is used. If one is not found, this method
  /// throws an [ArgumentError].
  bool atMost(
    T value, {
    int Function(T, T) sorter,
  }) {
    sorter ??= EqualityComparer.forType<T>().sort;
    if (sorter == null) {
      throw ArgumentError.notNull('sorter');
    }

    for (var elem in this) {
      if (sorter(value, elem) > 0) {
        return false;
      }
    }

    return true;
  }

  /// Returns true if all elements in the iterable are between [minimum] and [maximum].
  ///
  /// Iterates over the entire iterable and uses a sorting function to compare [value] to
  /// each element in the iterable. If any element is not between [minimum] and [maximum], this
  /// method returns false. Otherwise, if every element is less than or equal to [value], this
  /// method returns true.
  ///
  /// Exclusivity on this method is controlled by the [minimumInclusive] and [maximumInclusive]
  /// parameters. These parameters default to true.
  ///
  /// If [sorter] is omitted, the method checks [EqualityComparer.forType] to see if a default
  /// sorting function exists. If one is found, it is used. If one is not found, this method
  /// throws an [ArgumentError].
  bool between(
    T minimum,
    T maximum, {
    int Function(T, T) sorter,
    bool minimumInclusive = true,
    bool maximumInclusive = true,
  }) {
    sorter ??= EqualityComparer.forType<T>().sort;
    if (sorter == null) {
      throw ArgumentError.notNull('sorter');
    }

    for (var elem in this) {
      final minCompare = sorter(minimum, elem);
      final maxCompare = sorter(maximum, elem);
      if (minCompare > 0 ||
          (!minimumInclusive && minCompare == 0) ||
          maxCompare < 0 ||
          (!maximumInclusive && maxCompare == 0)) {
        return false;
      }
    }

    return true;
  }

  /// Returns true if this iterable ends with the same elements that are in
  /// [other].
  bool endsWith(
    Iterable<T> other, {
    bool Function(T, T) comparer,
  }) {
    if (other == null) {
      throw ArgumentError.notNull('other');
    }

    comparer ??= EqualityComparer.forType<T>().compare ?? (a, b) => a == b;

    final count = other.count();
    final tail = takeLast(count);

    return tail.sequenceEqual(other, comparer: comparer);
  }

  /// Returns `true` if this iterable is equivalent to the given collection.
  ///
  /// Iterates over both this iterable and the given [other] collection. The
  /// [outerSelector] function and the [innerSelector] is applied to elements in
  /// the same position of the source iterable and the [other] iterable, respectively.
  /// If the comparison returns false for any element pair, [sequenceEqual]
  /// will return `false`.
  ///
  /// Furthermore, if either collections iteration ends before the other's does,
  /// the lengths of the collections is deemed unequal, and [sequenceEqual] will
  /// return `false`.
  ///
  /// If the iterable and the [other] collection are the same length and each
  /// element in the corresponsing positions of both are deemed equal by the
  /// selector functions, [sequenceEqual] will return `true`.
  ///
  /// If either selector function is omitted, the omitted function will default to
  /// a selector that returns the value itself.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final listA = ['a', 'b', 'c'];
  ///       final listB = [97, 98, 99];
  ///       final result = listA.sequenceEqual(
  ///         listB,
  ///         outerSelector: (c) => c.codeUnitAt(0),
  ///       );
  ///
  ///       // Result: true
  ///     }
  ///

  ///
  bool sequenceEqual<TOther, TKey>(
    Iterable<TOther> other, {
    TKey Function(T) outerSelector,
    TKey Function(TOther) innerSelector,
    bool Function(TKey, TKey) comparer,
  }) {
    if (other == null) {
      return false;
    }

    final iterA = iterator;
    final iterB = other.iterator;

    bool aHasNext;
    bool bHasNext;

    outerSelector ??= (T v) => v as TKey;
    innerSelector ??= (TOther v) => v as TKey;
    comparer ??= EqualityComparer.forType<TKey>() ?? (a, b) => a == b;

    do {
      aHasNext = iterA.moveNext();
      bHasNext = iterB.moveNext();

      if (aHasNext && bHasNext) {
        if (comparer(
          outerSelector(iterA.current),
          innerSelector(iterB.current),
        )) {
          return false;
        }
      }
    } while (aHasNext && bHasNext);

    if (aHasNext != bHasNext) return false;

    return true;
  }

  /// Returns true if this iterable starts with the same elements that are in
  /// [other].
  bool startsWith(
    Iterable<T> other, {
    bool Function(T, T) comparer,
  }) {
    if (other == null) {
      throw ArgumentError.notNull('other');
    }

    comparer ??= EqualityComparer.forType<T>().compare ?? (a, b) => a == b;

    final iterator = this.iterator;

    for (var o in other) {
      if (!iterator.moveNext()) {
        return false;
      }
      if (!comparer(o, iterator.current)) {
        return false;
      }
    }

    return true;
  }
}
