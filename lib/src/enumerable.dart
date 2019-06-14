import 'errors.dart';
import 'grouping.dart';
import 'ordered_enumerable.dart';
import 'typedefs.dart';
import 'equality_comparer.dart';
import 'reducers.dart';

import 'enumerables/append_enumerable.dart';
import 'enumerables/cast_enumerable.dart';
import 'enumerables/concat_enumerable.dart';
import 'enumerables/default_if_empty_enumerable.dart';
import 'enumerables/distinct_enumerable.dart';
import 'enumerables/except_enumerable.dart';
import 'enumerables/generated_enumerable.dart';
import 'enumerables/group_by_enumerable.dart';
import 'enumerables/group_by_value_enumerable.dart';
import 'enumerables/group_join_enumerable.dart';
import 'enumerables/group_select_enumerable.dart';
import 'enumerables/group_select_value_enumerable.dart';
import 'enumerables/intersect_enumerable.dart';
import 'enumerables/join_enumerable.dart';
import 'enumerables/of_type_enumerable.dart';
import 'enumerables/prepend_enumerable.dart';
import 'enumerables/range_enumerable.dart';
import 'enumerables/repeat_enumerable.dart';
import 'enumerables/reverse_enumerable.dart';
import 'enumerables/select_enumerable.dart';
import 'enumerables/select_many_enumerable.dart';
import 'enumerables/skip_enumerable.dart';
import 'enumerables/skip_while_enumerator.dart';
import 'enumerables/string_enumerable.dart';
import 'enumerables/take_enumerable.dart';
import 'enumerables/take_while_enumerable.dart';
import 'enumerables/union_enumerable.dart';
import 'enumerables/value_enumerable.dart';
import 'enumerables/where_enumerable.dart';
import 'enumerables/zip_enumerable.dart';

/// A convenience method to transform an Iterable into an Enumerable.
Enumerable<T> E<T>(Iterable<T> iterable) => Enumerable<T>.from(iterable);

/// The base class for all enumerables. Allows advanced enumeration methods
/// to be performed on the underlying collection.
///
/// Enumeration methods are separated into two categories: value methods and
/// lazy-execution methods.
///
/// Value methods are methods that condense the enumerable into a single static
/// value. These methods will iterate over the enumerable when the method is
/// called, and may iterate over the entire enumerable (possibly more than once)
/// or may short-circuit the iteration after certain conditions have been met.
/// Examples of value methods include [aggregateE], [maxE], and [countE].
///
/// Lazy-execution methods are methods that modify the enumeration using a
/// particular tactic. These methods do not execute until the enumeration is
/// iterated over, which can drastically improve performance when dealing with
/// large collections of data. These methods will themselves return an instance
/// of [Enumerable], so they can be chained together to perform multiple
/// transformations at once, further improving performance. Examples of
/// lazy-execution methods include [selectE], [groupByE], and [distinctE].
///
/// (Note: as part of their iteration, some deferred-execution methods must
/// first iterate over the entire underlying collection before they can begin
/// their own iteration. Take caution when applying these methods to large
/// collections as they can block the thread while the initial computation
/// takes place. Examples of this are [reverseE] and [orderByE].)
///
/// To create an [Enumerable] out of a [List], [Set], or any other [Iterable],
/// use the [Enumerable.from] factory method or use the [E] convenience global
/// function:
///
/// ```dart
/// final list = [0, 1, 2, 3, 4];
///
/// // This works
/// final first = Enumerable.from(list);
///
/// // This also works
/// final second = E(list);
/// ```
///
/// [Enumerable] extends [Iterable], so any instance of [Enumerable] can be
/// iterated over using a traditional for loop:
///
/// ```dart
/// final list = [0, 1, 2, 3, 4];
/// for (var element in E(list).Select((i) => i * 2)) {
///   print(element);
/// }
///
/// // Output:
/// // 0
/// // 2
/// // 4
/// // 6
/// // 8
/// ```
///
/// [Enumerable] objects can be converted back into Dart collections by utilizing
/// the [Enumerable.toListE], [Enumerable.toMapE], or [Enumerable.toSetE] methods.
///
/// ```dart
/// final list = [0, 1, 2, 3, 4];
/// final result = E(list).Select((i) => i * 2).ToList();
/// print(result);
///
/// // Output:
/// // [0, 2, 4, 6, 8]
/// ```
abstract class Enumerable<T> extends Iterable<T> {
  Enumerable();

  /// Creates an enumerable from an [Iterable].
  ///
  /// Creates an enumerable that wraps around an [Iterable] with existing values.
  /// This is usually unnecessary to call, as calling the global function [E]
  /// achieves the same thing more concisely.
  factory Enumerable.from(Iterable<T> iterable) {
    return ValueEnumerable<T>(iterable);
  }

  /// Creates an enumerable from a [String].
  ///
  /// Converts a String into its character components and creates an enumerable
  /// out of the resulting collection. (As [String] doesn't extend [Iterable],
  /// this is a convenience method to iterate over every character in the [String]
  /// as well as make it compatable with other enumerable methods.)
  static Enumerable<String> fromString(String s) {
    return StringEnumerable(s);
  }

  /// Creates an empty enumerable.
  ///
  /// A convenience factory to create an enumerable that has no values. Its
  /// length will always be zero.
  factory Enumerable.empty() {
    return ValueEnumerable<T>(<T>[]);
  }

  /// Creates an enumerable
  ///
  /// A convenience factory to create an enumerable by repeating [value] [count]
  /// number of times.
  ///
  /// [count] must be a non-negative number.
  factory Enumerable.repeat(T value, int count) {
    if (count < 0) {
      throw ArgumentError('`count` must be a non-negative integer.');
    }
    if (count == 0) return Enumerable<T>.empty();
    return RepeatEnumerable<T>(value, count);
  }

  factory Enumerable.generate(int count, Generator<T> generator) {
    if (count < 0) {
      throw ArgumentError('`count` must be a non-negative integer.');
    }
    if (count == 0) return Enumerable<T>.empty();
    return GeneratedEnumerable(count, generator);
  }

  /// Creates an enumerable containing values composed of the specified range.
  ///
  /// A convenience factory to create an enumerable from the integer range
  /// starting from [start] and incrementing [count] times, offsetting each value by
  /// [increment] value. If [increment] is omitted, it defaults to 1.
  ///
  /// [count] must be a non-negative number.
  ///
  /// [increment] must be a non-zero number.
  static Enumerable<int> range(int start, int count, {int increment = 1}) {
    if (count < 0) {
      throw ArgumentError('`count` must be a non-negative integer.');
    }
    if (increment == 0) {
      throw ArgumentError('`increment` must be a non-zero integer.');
    }
    if (count == 0) return Enumerable<int>.empty();
    return RangeEnumerable(start, count, increment);
  }

  /// Aggregates the enumerable into a single value.
  ///
  /// Aggregates the source enumerable by applying the [aggregator] function to
  /// each value in the collection in the order they appear. The result is a
  /// single value that is the result of the aggregation.
  ///
  /// The [initialValue] parameter can be optionally applied, otherwise it
  /// defaults to a predefined value for primitive types and `null` for
  /// everything else.
  ///
  /// The [aggregator] function offers two parameters - the `accumulator` and
  /// the `value`. In each iteration, the `accumulator` represents the running
  /// result of the aggregation and the `value` represents the current element
  /// to process. The function should return what the next value of the
  /// aggregation should be, and that value will become the `accumulator` on the
  /// next iteration. Once the aggregation is complete, the last value to be
  /// returned is considered the result of the aggregation process.
  ///
  /// When the type of the enumerable is one of the below types, the [aggregator]
  /// function can be omitted. In this case, the function defaults to predefined
  /// aggregator functions depending on the type:
  ///
  /// - Numeric types (`num`, `int`, `double`) return the sum of all elements.
  /// The initial value is set to the zero equivalent of the type.
  /// - `String` types return all the elements concatenated into a single
  /// string. The initial value is an empty string.
  ///
  /// If the enumerable type is not one of these types, the [aggregator] function
  /// must be provided. Otherwise, an [ArgumentError] will be thrown.
  ///
  /// The [aggregateE] function will iterate over every element in the enumerable.
  T aggregateE([Aggregator<T> aggregator, T initialValue]) {
    if (aggregator == null &&
        T != num &&
        T != int &&
        T != double &&
        T != String) {
      throw ArgumentError(
          '`aggregator` must not be null or the type of this enumerable must be one of the following: ${[
        num,
        int,
        double,
        String
      ]}');
    }

    if (aggregator == null) {
      if (T == num) {
        return EnumerableReducers.SumNum(this as Enumerable<num>) as T;
      }
      if (T == int) {
        return EnumerableReducers.SumInt(this as Enumerable<int>) as T;
      }
      if (T == double) {
        return EnumerableReducers.SumDouble(this as Enumerable<double>) as T;
      }
      if (T == String) {
        return EnumerableReducers.SumString(this as Enumerable<String>) as T;
      }
      throw UnexpectedStateError();
    }

    dynamic result = initialValue;
    if (result == null) {
      if (T == int)
        result = 0;
      else if (T == double || T == num)
        result = 0.0;
      else if (T == bool)
        result = false;
      else if (T == String) result = '';
    }

    final iterator = this.iterator;
    if (!iterator.moveNext()) return result;

    result = aggregator(result, iterator.current);
    while (iterator.moveNext()) {
      result = aggregator(result, iterator.current);
    }

    return result;
  }

  /// Returns `true` if all elements match a condition and `false` otherwise.
  ///
  /// Applies the specified [condition] function to each element in the
  /// enumerable. The [condition] function is given each element to process and
  /// should return `true` if the element matches a condition and `false` if
  /// not.
  ///
  /// If the [condition] function returns `true` for all elements in the
  /// enumerable, the [allE] method returns `true` as well. Otherwise, if the
  /// [condition] function returns `false` even once during the iteration, the
  /// [allE] method will return `false` as well.
  ///
  /// The [allE] method will short-circuit after receiving a `false` from calling
  /// [condition] and will not iterate further over the enumerable. In the worst
  /// case, it will iterate over the entire enumerable.
  bool allE([Condition<T> condition]) {
    assert(condition != null || T == bool);

    if (condition == null) {
      if (T == bool) {
        return EnumerableReducers.AllBool(this as Enumerable<bool>);
      }
      throw UnexpectedStateError();
    }

    final iterator = this.iterator;
    while (iterator.moveNext()) {
      if (!condition(iterator.current)) return false;
    }

    return true;
  }

  /// Returns `true` if any one element matches a condition and `false` otherwise.
  ///
  /// Applies the specified [condition] function to each element in the
  /// enumerable. The [condition] function is given each element to process and
  /// should return `true` if the element matches a condition and `false` if
  /// not.
  ///
  /// If the [condition] function returns `true` for any element in the
  /// enumerable, the [anyE] method returns `true` as well. Otherwise, if the
  /// [condition] function returns `false` for every element, the [anyE] method
  /// will return `false` as well.
  ///
  /// The [anyE] method will short-circuit after receiving a `true` from calling
  /// [condition] and will not iterate further over the enumerable. In the worst
  /// case, it will iterate over the entire enumerable.
  bool anyE([Condition<T> condition]) {
    assert(condition != null || T == bool);

    if (condition == null) {
      if (T == bool) {
        return EnumerableReducers.AnyBool(this as Enumerable<bool>);
      }
      throw UnexpectedStateError();
    }

    final iterator = this.iterator;
    while (iterator.moveNext()) {
      if (condition(iterator.current)) return true;
    }

    return false;
  }

  /// Inserts an element to the end of the enumerable.
  ///
  /// Takes the specified element and inserts it at the end of the enumerable.
  Enumerable<T> appendE(T newElement) {
    return AppendEnumerable<T>(this, newElement);
  }

  /// Calculates the average of all numerical values in the enumerable.
  ///
  /// Applies a predefined averaging function to all values in the enumerable.
  /// This method can only be called on an enumerable of a numerical type (`num`,
  /// `int`, or `double`). Otherwise an [IncompatibleTypeError] will be thrown.
  ///
  /// For `int` enumerables, the result will be an `int` as well (the result of
  /// an integer division between the sum and the number of elements). For `num`
  /// and `double` enumerables, the result will be a `double`.
  ///
  /// The [averageE] function will iterate over every element in the enumerable.
  T averageE() {
    if (T != num && T != int && T != double) {
      throw IncompatibleTypeError([num, int, double]);
    }

    if (T == num) {
      return EnumerableReducers.AverageNum(this as Enumerable<num>) as T;
    }
    if (T == int) {
      return EnumerableReducers.AverageInt(this as Enumerable<int>) as T;
    }
    if (T == double) {
      return EnumerableReducers.AverageDouble(this as Enumerable<double>) as T;
    }
    throw UnexpectedStateError();
  }

  /// Casts each element in the enumerable from one type to another.
  ///
  /// Performs a transformation on every element in the enumerable,
  /// casting from [T] to [TResult]. The [transformer] function can optionally
  /// be given to specify the manner of the cast.
  ///
  /// If [T] is directly compatible with [TResult], the [transformer] function
  /// can be omitted and the casting will be performed using a `value as TResult`
  /// transformation.
  ///
  /// If [T] and [TResult] are unrelated, the [transformer] function must be
  /// provided to facilitate the transformation. Otherwise, a [ConversionError]
  /// will be thrown.
  Enumerable<TResult> castE<TResult>(
      [CastTransformer<T, TResult> transformer]) {
    return CastEnumerable<T, TResult>(this, transformer);
  }

  /// Concatenates this enumerable and another collection.
  ///
  /// Appends the values of a given [Iterable] to the end of this enumerable,
  /// resulting in an enumerable that is the concatenation of both.
  Enumerable<T> concatE(Iterable<T> other) {
    assert(other != null);
    return ConcatEnumerable<T>(this, other);
  }

  /// Returns `true` if the specified element exists in the enumerable and `false` otherwise.
  ///
  /// Iterates over the entire enumerable and compares each element to the
  /// specified value. If the two are deemed to be equivalent, [containsE] returns
  /// `true`. If the iteration reaches the end of the enumerable without finding a
  /// match, [containsE] returns `false`.
  ///
  /// Optionally, an [EqualityComparer] can be supplied to handle comparisons. If
  /// one is provided, the [containsE] method will use the [comparer] property in
  /// order to determine equivalency. If omitted, [containsE] will resort to strict
  /// equivalency (i.e. checking `if (value == element)`).
  ///
  /// (For the [containsE] method, only the [comparer] property of the
  /// [EqualityComparer] need be supplied.)
  ///
  /// The [containsE] method will short-circuit after receiving a `true` from any
  /// comparison and will not iterate further over the enumerable. In the worst
  /// case, it will iterate over the entire enumerable.
  bool containsE(T value, {EqualityComparer<T> comparer}) {
    if (comparer == null) comparer = EqualityComparer.forType<T>();

    final iterator = this.iterator;
    while (iterator.moveNext()) {
      if (comparer.compare(value, iterator.current)) return true;
    }
    return false;
  }

  /// Returns the number of elements in the enumerable.
  ///
  /// Iterates over the entire enumerable and returns the number of elements
  /// that were iterated over.
  ///
  /// Optionally, a [condition] can be specified. If so, the total count
  /// will be the number of elements for which the [condition] function
  /// returned `true`.
  ///
  /// The [countE] function will iterate over every element in the enumerable.
  int countE([Condition<T> condition]) {
    final iterator = this.iterator;
    int count = 0;
    if (condition == null) {
      while (iterator.moveNext()) {
        count++;
      }
    } else {
      while (iterator.moveNext()) {
        if (condition(iterator.current)) count++;
      }
    }
    return count;
  }

  /// Returns either this enumerable or a new enumerable containing [value] if
  /// this enumerable is empty.
  ///
  /// If the number of elements in this enumerable is zero, [defaultIfEmptyE] will
  /// return a new enumerable that consists of a single element specified by
  /// the given [value].
  ///
  /// If this enumerable has one or more elements, the enumerable is returned
  /// without modification.
  Enumerable<T> defaultIfEmptyE(T value) {
    return DefaultIfEmptyEnumerable<T>(this, value);
  }

  /// Returns an enumerable representing the distinct values of this enumerable.
  ///
  /// After applying the [distinctE] method to an enumerable, the resulting
  /// enumerable will consist of distinct values in the source enumerable.
  ///
  /// Optionally, an [EqualityComparer] can be supplied to handle comparisons. If
  /// one is provided, the [distinctE] method will use the [comparer] property in
  /// order to determine equivalency. If omitted, [distinctE] will resort to strict
  /// equivalency (i.e. checking `if (value == element)`).
  ///
  /// (For the [distinctE] method, only the [comparer] property of the
  /// [EqualityComparer] need be supplied.)
  ///
  /// Each element will be the first element found in the source enumerable,
  /// meaning elements with unique data that are deemed non-distinct by the
  /// [comparer] will be dropped.
  ///
  /// If none of the elements in the enumerable match any other element in the
  /// enumerable, the enumerable will be unchanged.
  Enumerable<T> distinctE({EqualityComparer<T> comparer}) {
    return DistinctEnumerable<T>(this, comparer);
  }

  /// Returns the element at the specified index.
  ///
  /// Iterates over the entire enumerable until it reaches the element on the
  /// iteration matching the given [index]. [elementAtE] will then return that
  /// value. If the iteration reaches the end of the enumerable before arriving
  /// at [index], an [ElementNotFoundError] will be thrown.
  ///
  /// The value of [index] must be a non-negative integer.
  ///
  /// The [elementAtE] method will short-circuit after reaching the element at
  /// [index] and will not iterate further over the enumerable. In the worst
  /// case, it will iterate over the entire enumerable.
  T elementAtE(int index) {
    assert(index >= 0);

    final iterator = this.iterator;
    int currentIndex = 0;
    while (iterator.moveNext()) {
      if (currentIndex == index) return iterator.current;
      currentIndex++;
    }

    throw ElementNotFoundError();
  }

  /// Returns the element at the specified index or a default value of one is
  /// not found.
  ///
  /// Iterates over the entire enumerable until it reaches the element on the
  /// iteration matching the given [index]. [elementAtE] will then return that
  /// value. If the iteration reaches the end of the enumerable before arriving
  /// at [index], the value of [defaultValue] will be returned instead. If
  /// [defaultValue] is not supplied, the returned value will be `null`.
  ///
  /// The [elementAtOrDefaultE] method will short-circuit after reaching the
  /// element at [index] and will not iterate further over the enumerable. In
  /// the worst case, it will iterate over the entire enumerable.
  T elementAtOrDefaultE(int index, {T defaultValue}) {
    assert(index >= 0);

    final iterator = this.iterator;
    int currentIndex = 0;
    while (iterator.moveNext()) {
      if (currentIndex == index) return iterator.current;
      currentIndex++;
    }

    return defaultValue;
  }

  /// Returns the set difference between the enumerable and the given
  /// collection.
  ///
  /// After applying the [exceptE] method to an enumerable, the resulting
  /// enumerable will consist of all the elements in the source enumerable that
  /// are not present in the given [other] collection. This is equivalent to
  /// taking the set difference of the two sequences.
  ///
  /// Optionally, an [EqualityComparer] can be supplied to handle comparisons. If
  /// one is provided, the [exceptE] method will use the [comparer] and [hasher] properties in
  /// order to determine equivalency. If omitted, [exceptE] will resort to strict
  /// equivalency (i.e. checking `if (value == element)`).
  ///
  /// (For the [exceptE] method, only the [comparer] and [hasher] properties of the
  /// [EqualityComparer] need be supplied.)
  ///
  /// If none of the elements in the source enumerable match any element in the
  /// given [other] collection, the enumerable will be unchanged.
  Enumerable<T> exceptE(Iterable<T> other, {EqualityComparer<T> comparer}) {
    assert(other != null);
    return ExceptEnumerable<T>(this, other, comparer);
  }

  /// Returns the first element in the enumerable, optionally matching a
  /// specified condition.
  ///
  /// Begins iteration of the enumerable, but then returns the first element
  /// found that matches the specified [condition]. If [condition] is omitted,
  /// [firstE] will return the first element of the enumerable.
  ///
  /// If the enumerable is empty, an [EmptyEnumerableError] will be thrown. If
  /// [condition] is provided but iteration reaches the end of the enumerable
  /// before an element is found, an [ElementNotFoundError] will be thrown.
  ///
  /// If [condition] is provided, the [firstE] method short-circuits the first
  /// time [condition] returns `true` and will not iterate further over the
  /// enumerable. In the worst case, it will iterate over the entire enumerable.
  ///
  /// If [condition] is omitted, the [firstE] method will always only visit the
  /// first element in the enumerable, making it run in constant time
  /// regardless of iteration length.
  T firstE({Condition<T> condition}) {
    final iterator = this.iterator;
    if (!iterator.moveNext()) throw EmptyEnumerableError();
    if (condition == null) return iterator.current;

    do {
      if (condition(iterator.current)) return iterator.current;
    } while (iterator.moveNext());

    throw ElementNotFoundError();
  }

  /// Returns the first element in the enumerable or a default value if there
  /// is none, optionally matching a specified condition.
  ///
  /// Begins iteration of the enumerable, but then returns the first element
  /// found that matches the specified [condition]. If [condition] is omitted,
  /// [firstOrDefaultE] will return the first element of the enumerable.
  ///
  /// If the enumerable is empty, or if [condition] is provided but iteration
  /// reaches the end of the enumerable before an element is found, the value
  /// specified by [defaultValue] will be returned instead. If [defaultValue] is
  /// omitted, the returned value will be `null`.
  ///
  /// If [condition] is provided, the [firstOrDefaultE] method short-circuits the
  /// first time [condition] returns `true` and will not iterate further over the
  /// enumerable. In the worst case, it will iterate over the entire enumerable.
  ///
  /// If [condition] is omitted, the [firstOrDefaultE] method will always only
  /// visit the first element in the enumerable, making it run in constant time
  /// regardless of iteration length.
  /// Returns the first element in the enumerable or a default value if there
  /// is none.
  T firstOrDefaultE({Condition<T> condition, T defaultValue}) {
    final iterator = this.iterator;
    if (!iterator.moveNext()) return defaultValue;
    if (condition == null) return iterator.current;

    do {
      if (condition(iterator.current)) return iterator.current;
    } while (iterator.moveNext());

    return defaultValue;
  }

  /// Groups the elements in the enumerable by a key.
  ///
  /// After applying the [groupByE] method to an enumerable, the resulting
  /// enumerable will be a series of groups of elements. Each group will consist
  /// of all elements in the source enumerable that share a common key as defined
  /// by passing the element to the [keySelector] function.
  ///
  /// Optionally, an [EqualityComparer] can be supplied to handle key comparisons.
  /// If one is provided, the [groupByE] method will use the [comparer] and
  /// [hasher] properties in order to determine equivalency. If omitted,
  /// [groupByE] will resort to strict equivalency (i.e. checking `if (value == element)`).
  ///
  /// (For the [groupByE] method, only the [comparer] and [hasher] properties of
  /// the [EqualityComparer] need be supplied.)
  ///
  /// The resulting enumerable will consist of a series of [IGrouping] constructs
  /// that contain the elements. If no two elements in the enumerable share a
  /// common key, the resulting enumerable will consist of [IGrouping] objects
  /// (each containing a single element) of the same length as the source
  /// enumerable.
  Enumerable<Grouping<TKey, T>> groupByE<TKey>(Selector<T, TKey> keySelector,
      {EqualityComparer<TKey> keyComparer}) {
    assert(keySelector != null);
    return GroupByEnumerable<T, TKey>(this, keySelector, keyComparer);
  }

  /// Groups the elements in the enumerable by a key and maps the elements to
  /// a new value.
  ///
  /// After applying the [groupByValueE] method to an enumerable, the resulting
  /// enumerable will be a series of groups of elements. Each group will consist
  /// of all elements in the source enumerable that share a common key as defined
  /// by passing the element to the [keySelector] function with those elements
  /// passed to the [valueSelector] to retrieve the value stored under the key.
  ///
  /// Optionally, an [EqualityComparer] can be supplied to handle key comparisons.
  /// If one is provided, the [groupByValueE] method will use the [comparer] and
  /// [hasher] properties in order to determine equivalency. If omitted,
  /// [groupByValueE] will resort to strict equivalency (i.e. checking `if (value == element)`).
  ///
  /// (For the [groupByValueE] method, only the [comparer] and [hasher] properties of
  /// the [EqualityComparer] need be supplied.)
  ///
  /// The resulting enumerable will consist of a series of [IGrouping] constructs
  /// that contain the elements. If no two elements in the enumerable share a
  /// common key, the resulting enumerable will consist of [IGrouping] objects
  /// (each containing a single element) of the same length as the source
  /// enumerable.
  Enumerable<Grouping<TKey, TValue>> groupByValueE<TKey, TValue>(
      Selector<T, TKey> keySelector, Selector<T, TValue> valueSelector,
      {EqualityComparer<TKey> keyComparer}) {
    assert(keySelector != null && valueSelector != null);
    return GroupByValueEnumerable<T, TKey, TValue>(
        this, keySelector, valueSelector, keyComparer);
  }

  /// Joins elements in the enumerable with a group of all elements in the
  /// [inner] collection that match the generated key.
  ///
  /// First, [groupJoinE] will iterate over the [other] collection and make a
  /// lookup table of its elements, referenceable by a key generated by
  /// [innerKeySelector]. Then [groupJoinE] will iterate over the source
  /// enumeration, generating keys via the [outerKeySelector]. If a generated
  /// outer key matches an inner key in the collection lookup, the enumerable
  /// element is passed to the [selector] with all elements from the [other]
  /// collection that match that key. The returned value of [selector] is then
  /// added to the resulting enumerable.
  ///
  /// Elements in the source enumerable that doesn't share a key in the
  /// lookup table are passed to the [selector] function with an empty
  /// collection as the second parameter. Elements in [other] that don't share
  /// a key with a source enumerable element are discarded.
  ///
  /// [groupJoinE] is different from [joinE] in that, where [joinE] will produce a
  /// new resulting element for each key match between the source enumerable and
  /// the [inner] collection, [groupJoinE] will produce a new element from an
  /// element in the source enumerable and all elements in the [inner]
  /// collection that match on the key.
  Enumerable<TResult> groupJoinE<TInner, TKey, TResult>(
      Iterable<TInner> inner,
      Selector<T, TKey> outerKeySelector,
      Selector<TInner, TKey> innerKeySelector,
      GroupSelector<T, Iterable<TInner>, TResult> resultSelector,
      {EqualityComparer<TKey> keyComparer}) {
    assert(inner != null &&
        outerKeySelector != null &&
        innerKeySelector != null &&
        resultSelector != null);
    return GroupJoinEnumerable<T, TInner, TKey, TResult>(this, inner,
        outerKeySelector, innerKeySelector, resultSelector, keyComparer);
  }

  /// Groups the elements in the enumerable by a key and maps the groups to a new
  /// element.
  ///
  /// After applying the [groupSelectE] method to an enumerable, the resulting
  /// enumerable will be a series of groups of elements. Each group will consist
  /// of all elements in the source enumerable that share a common key as defined
  /// by passing the element to the [keySelector] function. Finally, each group
  /// will then be passed to the [resultSelector] function along with its
  /// associated key and the returned value of that function will be returned as
  /// an element of the resulting enumerable.
  ///
  /// Optionally, an [EqualityComparer] can be supplied to handle key comparisons.
  /// If one is provided, the [groupSelectE] method will use the [comparer] and
  /// [hasher] properties in order to determine equivalency. If omitted,
  /// [groupSelectE] will resort to strict equivalency (i.e. checking `if
  /// (value == element)`).
  ///
  /// (For the [groupSelectE] method, only the [comparer] and [hasher] properties of
  /// the [EqualityComparer] need be supplied.)
  Enumerable<TResult> groupSelectE<TKey, TResult>(Selector<T, TKey> keySelector,
      GroupSelector<TKey, Iterable<T>, TResult> resultSelector,
      {EqualityComparer<TKey> keyComparer}) {
    assert(keySelector != null && resultSelector != null);
    return GroupSelectEnumerable<T, TKey, TResult>(
        this, keySelector, resultSelector, keyComparer);
  }

  /// Groups the elements in the enumerable by a key, maps the elements to
  /// a new value, and maps the groups to a new element.
  ///
  /// After applying the [groupSelectValueE] method to an enumerable, the resulting
  /// enumerable will be a series of groups of elements. Each group will consist
  /// of all elements in the source enumerable that share a common key as defined
  /// by passing the element to the [keySelector] function stored as a value
  /// obtained by passing the elements to the [valueSelector] function. Finally,
  /// each group will then be passed to the [resultSelector] function along with
  /// its associated key and the returned value of that function will be returned
  /// as an element of the resulting enumerable.
  ///
  /// Optionally, an [EqualityComparer] can be supplied to handle key comparisons.
  /// If one is provided, the [groupSelectValueE] method will use the [comparer] and
  /// [hasher] properties in order to determine equivalency. If omitted,
  /// [groupSelectValueE] will resort to strict equivalency (i.e. checking `if
  /// (value == element)`).
  ///
  /// (For the [groupSelectValueE] method, only the [comparer] and [hasher]
  /// properties of the [EqualityComparer] need be supplied.)
  Enumerable<TResult> groupSelectValueE<TKey, TValue, TResult>(
      Selector<T, TKey> keySelector,
      Selector<T, TValue> valueSelector,
      GroupSelector<TKey, Iterable<TValue>, TResult> resultSelector,
      {EqualityComparer<TKey> keyComparer}) {
    assert(
        keySelector != null && valueSelector != null && resultSelector != null);
    return GroupSelectValueEnumerable<T, TKey, TValue, TResult>(
        this, keySelector, valueSelector, resultSelector, keyComparer);
  }

  /// Returns the set intersection between the enumerable and the given
  /// collection.
  ///
  /// After applying the [intersectE] method to an enumerable, the resulting
  /// enumerable will consist of all the elements in the source enumerable that
  /// are also present in the given [other] collection. This is equivalent to
  /// taking the set intersection of the two sequences.
  ///
  /// Optionally, an [EqualityComparer] can be supplied to handle comparisons. If
  /// one is provided, the [intersectE] method will use the [comparer] and [hasher] properties in
  /// order to determine equivalency. If omitted, [intersectE] will resort to strict
  /// equivalency (i.e. checking `if (value == element)`).
  ///
  /// (For the [intersectE] method, only the [comparer] and [hasher] properties of the
  /// [EqualityComparer] need be supplied.)
  ///
  /// If all of the elements in the source enumerable match an element in the
  /// given [other] collection, the enumerable will be unchanged.
  Enumerable<T> intersectE(Iterable<T> other, {EqualityComparer<T> comparer}) {
    assert(other != null);
    return IntersectEnumerable<T>(this, other, comparer);
  }

  /// Finds keys in this enumerable with matching keys in the [other] collection
  /// and returns a value that is the result of the corresponding elements being
  /// merged.
  ///
  /// First, [joinE] will iterate over the [other] collection and make a lookup
  /// table of its elements, referenceable by a key generated by
  /// [innerKeySelector]. Then [joinE] will iterate over the source enumeration,
  /// generating keys via the [outerKeySelector]. If a generated key matches a
  /// key in the collection lookup, the collection element and the enumerable
  /// element are passed through the [selector]. The returned value of
  /// [selector] is then added to the resulting enumerable.
  ///
  /// Elements in the source enumerable that doesn't share a key in the
  /// lookup table as well as elements in [other] that don't share a key with a
  /// source enumerable element are discarded.
  Enumerable<TResult> joinE<TSecond, TKey, TResult>(
    Iterable<TSecond> other,
    Selector<T, TKey> outerKeySelector,
    Selector<TSecond, TKey> innerKeySelector,
    ZipSelector<T, TSecond, TResult> selector,
  ) {
    assert(other != null &&
        outerKeySelector != null &&
        innerKeySelector != null &&
        selector != null);
    return JoinEnumerable(
        this, other, outerKeySelector, innerKeySelector, selector);
  }

  /// Returns the last element in the enumerable, optionally matching a
  /// specified condition.
  ///
  /// Iterates through the enumerable a returns the last element found that
  /// matches the specified [condition]. If [condition] is omitted, [lastE] will
  /// return the last element of the enumerable.
  ///
  /// If the enumerable is empty, an [EmptyEnumerableError] will be thrown. If
  /// [condition] is provided but iteration reaches the end of the enumerable
  /// before an element is found, an [ElementNotFoundError] will be thrown.
  ///
  /// The [lastE] method will always iterate through the entire enumerable.
  T lastE({Condition<T> condition}) {
    final iterator = this.iterator;
    if (!iterator.moveNext()) throw EmptyEnumerableError();

    T value;
    bool valueFound = false;
    do {
      if (condition == null || condition(iterator.current)) {
        value = iterator.current;
        valueFound = true;
      }
    } while (iterator.moveNext());

    if (valueFound) return value;

    throw ElementNotFoundError();
  }

  /// Returns the last element in the enumerable, optionally matching a
  /// specified condition.
  ///
  /// Iterates through the enumerable a returns the last element found that
  /// matches the specified [condition]. If [condition] is omitted,
  /// [lastOrDefaultE] will return the last element of the enumerable.
  ///
  /// If the enumerable is empty, or if [condition] is provided but iteration
  /// reaches the end of the enumerable before an element is found, the value
  /// specified by [defaultValue] will be returned instead. If [defaultValue] is
  /// omitted, the returned value will be `null`.
  ///
  /// The [lastOrDefaultE] method will always iterate through the entire
  /// enumerable.
  T lastOrDefaultE({Condition<T> condition, T defaultValue}) {
    final iterator = this.iterator;
    if (!iterator.moveNext()) return defaultValue;

    T value;
    bool valueFound = false;
    do {
      if (condition == null || condition(iterator.current)) {
        value = iterator.current;
        valueFound = true;
      }
    } while (iterator.moveNext());

    if (valueFound) return value;

    return defaultValue;
  }

  /// Returns the maximum value in the enumerable.
  ///
  /// Iterates over the enumerable and applies the [sorter] property of the
  /// given [EqualityComparer] to each element in order to find the maximum
  /// value. Once iteration is complete, [maxE] will return the largest element
  /// found.
  ///
  /// When the type of the enumerable is one of the below types, the
  /// [EqualityComparer] can be omitted. In this case, the function defaults to
  /// predefined maximum functions depending on the type:
  ///
  /// - Numeric types (`num`, `int`, `double`) return the maximum of all elements as defined by the `max` function in `dart:math`.
  /// - `String` types return the alphabetic maximum of all elements.
  ///
  /// If the enumerable type is not one of these types, the [EqualityComparer]
  /// must be provided. Otherwise, an [ArgumentError] will be thrown.
  ///
  /// If the enumerable is empty, an [EmptyEnumerableError] will be thrown.
  ///
  /// The [maxE] function will iterate over every element in the enumerable.
  T maxE([EqualityComparer<T> comparer]) {
    if (comparer == null &&
        T != num &&
        T != int &&
        T != double &&
        T != String) {
      throw ArgumentError(
          '`comparer` must not be null or the type of this enumerable must be one of the following: ${[
        num,
        int,
        double,
        String
      ]}');
    }

    if (comparer == null) {
      if (T == num) {
        return EnumerableReducers.MaxNum(this as Enumerable<num>) as T;
      }
      if (T == int) {
        return EnumerableReducers.MaxInt(this as Enumerable<int>) as T;
      }
      if (T == double) {
        return EnumerableReducers.MaxDouble(this as Enumerable<double>) as T;
      }
      if (T == String) {
        return EnumerableReducers.MaxString(this as Enumerable<String>) as T;
      }
      throw UnexpectedStateError();
    }

    final iterator = this.iterator;
    if (!iterator.moveNext()) throw EmptyEnumerableError();

    T max;
    do {
      if (max == null)
        max = iterator.current;
      else if (comparer.sort(max, iterator.current) < 0) {
        max = iterator.current;
      }
    } while (iterator.moveNext());

    return max;
  }

  /// Returns the minimum value in the enumerable.
  ///
  /// Iterates over the enumerable and applies the [sorter] property of the
  /// given [EqualityComparer] to each element in order to find the maximum
  /// value. Once iteration is complete, [minE] will return the largest element
  /// found.
  ///
  /// When the type of the enumerable is one of the below types, the
  /// [EqualityComparer] can be omitted. In this case, the function defaults to
  /// predefined minimum functions depending on the type:
  ///
  /// - Numeric types (`num`, `int`, `double`) return the minimum of all elements as defined by the `min` function in `dart:math`.
  /// - `String` types return the alphabetic minimum of all elements.
  ///
  /// If the enumerable type is not one of these types, the [EqualityComparer]
  /// must be provided. Otherwise, an [ArgumentError] will be thrown.
  ///
  /// If the enumerable is empty, an [EmptyEnumerableError] will be thrown.
  ///
  /// The [minE] function will iterate over every element in the enumerable.
  T minE([EqualityComparer<T> comparer]) {
    if (comparer == null &&
        T != num &&
        T != int &&
        T != double &&
        T != String) {
      throw ArgumentError(
          '`comparer` must not be null or the type of this enumerable must be one of the following: ${[
        num,
        int,
        double,
        String
      ]}');
    }

    if (comparer == null) {
      if (T == num) {
        return EnumerableReducers.MinNum(this as Enumerable<num>) as T;
      }
      if (T == int) {
        return EnumerableReducers.MinInt(this as Enumerable<int>) as T;
      }
      if (T == double) {
        return EnumerableReducers.MinDouble(this as Enumerable<double>) as T;
      }
      if (T == String) {
        return EnumerableReducers.MinString(this as Enumerable<String>) as T;
      }
      throw UnexpectedStateError();
    }

    final iterator = this.iterator;
    if (!iterator.moveNext()) throw EmptyEnumerableError();

    T min;
    do {
      if (min == null)
        min = iterator.current;
      else if (comparer.sort(min, iterator.current) > 0) {
        min = iterator.current;
      }
    } while (iterator.moveNext());

    return min;
  }

  /// Returns all elements in the enumerable that are castable to the specified
  /// type.
  ///
  /// After applying [ofTypeE] to an enumerable, the resulting enumerable will
  /// consist of all elements in the source enumerable that can be safely cast
  /// to `TResult`.
  ///
  /// If all elements in the source enumerable can be safely cast to `TResult`,
  /// the resulting enumerable will be unchanged.
  Enumerable<TResult> ofTypeE<TResult>() {
    return OfTypeEnumerable<T, TResult>(this);
  }

  /// Sorts the enumeration in ascending (least-to-greatest) order.
  ///
  /// First, [orderByE] iterates over the entire enumerable, creating a list of
  /// keys generated by [keySelector] associated to their corresponding
  /// elements. Then a QuickSort algorithm is applied to the keys, using the
  /// [sorter] property in [keyComparer] to determine sort order. Afterwards,
  /// the resulting enumerable will consist of the elements in the source
  /// enumerable in the order determined by the sorted list of keys.
  ///
  /// When the type of the enumerable is one of the below types, the
  /// [EqualityComparer] can be omitted. In this case, the function defaults to
  /// predefined minimum functions depending on the type:
  ///
  /// - Numeric types (`num`, `int`, `double`) will be sorted by their values in ascending order.
  /// - `String` types will be sorted in alphabetic order.
  ///
  /// If the enumerable type is not one of these types and the [EqualityComparer]
  /// is not provided, the order of the resulting enumerable is unpredictable.
  ///
  /// If the enumerable is already sorted in ascending order, the resulting
  /// enumerable will be unchanged.
  Enumerable<T> orderByE<TKey>(Selector<T, TKey> keySelector,
      {EqualityComparer<TKey> keyComparer}) {
    assert(keySelector != null);
    return InternalOrderedEnumerable(this, keySelector, keyComparer, false);
  }

  /// Sorts the enumeration in descending (greatest-to-least) order.
  ///
  /// First, [orderByDescendingE] iterates over the entire enumerable, creating a
  /// list of keys generated by [keySelector] associated to their corresponding
  /// elements. Then a QuickSort algorithm is applied to the keys, using the
  /// [sorter] property in [keyComparer] to determine sort order. Afterwards,
  /// the resulting enumerable will consist of the elements in the source
  /// enumerable in the order determined by the sorted list of keys.
  ///
  /// When the type of the enumerable is one of the below types, the
  /// [EqualityComparer] can be omitted. In this case, the function defaults to
  /// predefined minimum functions depending on the type:
  ///
  /// - Numeric types (`num`, `int`, `double`) will be sorted by their values in descending order.
  /// - `String` types will be sorted in reverse-alphabetic order.
  ///
  /// If the enumerable type is not one of these types and the [EqualityComparer]
  /// is not provided, the order of the resulting enumerable is unpredictable.
  ///
  /// If the enumerable is already sorted in descending order, the resulting
  /// enumerable will be unchanged.
  Enumerable<T> orderByDescendingE<TKey>(Selector<T, TKey> keySelector,
      {EqualityComparer<TKey> keyComparer}) {
    assert(keySelector != null);
    return InternalOrderedEnumerable(this, keySelector, keyComparer, true);
  }

  /// Inserts an element at the beginning of the enumerable.
  ///
  /// Takes the specified element and inserts it at the beginning of the
  /// enumerable.
  Enumerable<T> prependE(T newElement) {
    return PrependEnumerable<T>(this, newElement);
  }

  /// Reverses the order of the enumerable.
  ///
  /// The enumerable is iterated over and stored in a list. The resulting
  /// enumerable is the product of then iterating over that list in reverse
  /// order.
  Enumerable<T> reverseE() {
    return ReverseEnumerable<T>(this);
  }

  /// Applies a mapping function to the elements in the enumerable.
  ///
  /// During iteration, the [selector] function is applied to each element. The
  /// returned value of that function is then provided as the next element of the
  /// resulting enumerable.
  Enumerable<TResult> selectE<TResult>(Selector<T, TResult> selector) {
    assert(selector != null);

    return SelectEnumerable<T, TResult>(this, selector);
  }

  /// Maps elements in an enumerable to collections and then flattens those
  /// collections into a single enumerable.
  ///
  /// During iteration, the [selector] function is applied to each element. The
  /// returned collection of that function is then iterated over, and each
  /// value in that iteration is provided as the next element of the
  /// resulting enumerable. The result is all the collections flattened so that
  /// their values become elements in a single enumerable.
  Enumerable<TResult> selectManyE<TResult>(ManySelector<T, TResult> selector) {
    assert(selector != null);

    return SelectManyEnumerable<T, TResult>(this, selector);
  }

  /// Returns `true` if this enumerable is equivalent to the given collection.
  ///
  /// Iterates over both this enumerable and the given [other] collection. The
  /// [comparer] property of the [EqualityComparer] is applied to elements in
  /// the same position of both collections. If the comparison returns false for
  /// any element pair, [sequenceEqualE] will return `false`.
  ///
  /// Furthermore, if either collections iteration ends before the other's does,
  /// the lengths of the collections is deemed unequal, and [sequenceEqualE] will
  /// return `false`.
  ///
  /// If the enumerable and the [other] collection are the same length and each
  /// element in the corresponsing positions of both are deemed equal by the
  /// [EqualityComparer], [sequenceEqualE] will return `true`.
  ///
  /// If the [EqualityComparer] is omitted, comparison will default to strict
  /// equivalency checking (i.e. `if (a == b)`).
  bool sequenceEqualE(Iterable<T> other, {EqualityComparer<T> comparer}) {
    assert(other != null);

    final _thisIterator = this.iterator;
    final _otherIterator = other.iterator;
    if (comparer == null) comparer = EqualityComparer.forType<T>();

    while (_thisIterator.moveNext()) {
      if (_otherIterator.moveNext()) {
        if (!comparer.compare(_thisIterator.current, _otherIterator.current)) {
          return false;
        }
      } else {
        return false;
      }
    }

    if (_otherIterator.moveNext()) return false;

    return true;
  }

  /// Returns the single element in the element, optionally matching a
  /// [condition].
  ///
  /// If [condition] is omitted, [singleE] will return the single value in this
  /// enumerable. If the enumerable is empty, a [EmptyEnumerableError] is thrown.
  /// If the enumerable contains more than one element, an [OperationError] is
  /// thrown.
  ///
  /// In this scenario, the [singleE] function will short-circuit after iterating
  /// a maximum of two elements into the enumerable.
  ///
  /// If [condition] is supplied, [singleE] will iterate over the entire
  /// enumerable, applying the [condition] function to each element. At the end
  /// of the iteration, if a single element matches the [condition], that element
  /// is returned. If no elements match the [condition], an [ElementNotFoundError]
  /// is thrown. If more than one element matches the [condition], an
  /// [OperationError] is thrown.
  ///
  /// In this scenario, the [singleE] function will short-circuit after finding a
  /// second element that matches the [condition]. In the worst-case scenario,
  /// [singleE] will iterate over the entire enumerable.
  T singleE([Condition<T> condition]) {
    final _iterator = this.iterator;

    if (!_iterator.moveNext()) {
      throw OperationError('The enumerable is empty.');
    }

    bool valueSet = false;
    T value;

    if (condition != null) {
      do {
        if (condition(_iterator.current)) {
          if (valueSet) {
            throw OperationError(
                'More than one element matches the condition.');
          }

          value = _iterator.current;
          valueSet = true;
        }
      } while (_iterator.moveNext());

      if (!valueSet) throw ElementNotFoundError();

      return value;
    }

    do {
      if (valueSet) {
        throw OperationError('More than one element exists in the enumerable.');
      }

      value = _iterator.current;
      valueSet = true;
    } while (_iterator.moveNext());

    if (!valueSet) throw UnexpectedStateError();

    return value;
  }

  /// Returns the single element in the element, optionally matching a
  /// [condition], or a [defaultValue] if no such element exists.
  ///
  /// If [condition] is omitted, [singleOrDefaultE] will return the single value
  /// in this enumerable. If the enumerable is empty, the value specified by
  /// [defaultValue] is returned instead. If the enumerable contains more than
  /// one element, an [OperationError] is thrown.
  ///
  /// In this scenario, the [singleOrDefaultE] function will short-circuit after
  /// iterating a maximum of two elements into the enumerable.
  ///
  /// If [condition] is supplied, [singleOrDefaultE] will iterate over the entire
  /// enumerable, applying the [condition] function to each element. At the end
  /// of the iteration, if a single element matches the [condition], that element
  /// is returned. If no elements match the [condition], the value specified by
  /// [defaultValue] is returned instead. If more than one element matches the
  /// [condition], an [OperationError] is thrown.
  ///
  /// In this scenario, the [singleOrDefaultE] function will short-circuit after
  /// finding a second element that matches the [condition]. In the worst-case
  /// scenario, [singleOrDefaultE] will iterate over the entire enumerable.
  T singleOrDefaultE(T defaultValue, [Condition<T> condition]) {
    final _iterator = this.iterator;

    if (!_iterator.moveNext()) return defaultValue;

    bool valueSet = false;
    T value;

    if (condition != null) {
      do {
        if (condition(_iterator.current)) {
          if (valueSet) {
            throw OperationError(
                'More than one element matches the condition.');
          }

          value = _iterator.current;
          valueSet = true;
        }
      } while (_iterator.moveNext());

      if (!valueSet) return defaultValue;

      return value;
    }

    do {
      if (valueSet) {
        throw OperationError('More than one element exists in the enumerable.');
      }

      value = _iterator.current;
      valueSet = true;
    } while (_iterator.moveNext());

    if (!valueSet) throw UnexpectedStateError();

    return value;
  }

  /// Skips the first [count] elements in the enumerable.
  ///
  /// During iteration, the first [count] number of elements are ignored. Once
  /// that number of elements has elapsed, iteration will continue as normal.
  ///
  /// If [count] is greater than the number of elements in the enumerable, the
  /// result is an empty enumerable.
  Enumerable<T> skipE(int count) {
    assert(count >= 0);

    if (count == 0) return this;

    return SkipEnumerable<T>(this, count);
  }

  /// Skips all the elements at the beginning of the enumerable that match the
  /// [condition].
  ///
  /// During iteration, each element is given to the [condition] function. If
  /// the [condition] returns `true`, that element is skipped. Once an element is
  /// processed where the [condition] returns `false`, that element is added to
  /// the resulting enumerable. After that, the [condition] is no longer checked
  /// and the iteration continues as normal.
  ///
  /// If all elements in the enumerable match the given [condition], the result
  /// is an empty enumerable.
  Enumerable<T> skipWhileE(Condition<T> condition) {
    assert(condition != null);

    return SkipWhileEnumerable<T>(this, condition);
  }

  /// Calculates the sum of the elements in an enumerable, optionally using
  /// [selector] to obtain the value to be summed.
  ///
  /// Iterates over the entire enumerable, passing each element to the
  /// [selector] function and adding its return value to a running total. Once
  /// iteration is complete, the total is returned.
  ///
  /// The type of the returned total is dependent on the value returned by the
  /// [selector] function. If all values are `int`, the return value of [sumE]
  /// will be `int`. If all values are `double`, the return value of [sumE] will
  /// be `double`. If all values are `num` or there is a combination of `int`
  /// and `double`, the return value of [sumE] will be `num`.
  ///
  /// When the type of the enumerable is a numeric primitive (e.g. `int`,
  /// `double`, or `num`), the [selector] function can be omitted. If so,
  /// the elements themselves are added to the running total.
  ///
  /// If the type of the enumerable is not a numeric primitive, the [selector]
  /// function must be provided. Otherwise, an [ArgumentError] is thrown.
  TResult sumE<TResult extends num>([Selector<T, TResult> selector]) {
    if (selector == null && T != num && T != int && T != double) {
      throw ArgumentError(
          '`selector` must not be null or the type of this enumerable must be one of the following: ${[
        num,
        int,
        double
      ]}');
    }

    if (selector == null) {
      if (T == num) return EnumerableReducers.SumNum(this as Enumerable<num>);
      if (T == int) {
        return EnumerableReducers.SumInt(this as Enumerable<int>) as TResult;
      }
      if (T == double) {
        return EnumerableReducers.SumDouble(this as Enumerable<double>)
            as TResult;
      }
      throw UnexpectedStateError();
    }

    num sum;

    if (TResult == int) {
      sum = 0;
    } else {
      sum = 0.0;
    }

    final _iterator = this.iterator;

    if (!_iterator.moveNext()) {
      throw EmptyEnumerableError();
    }

    do {
      sum += selector(_iterator.current);
    } while (_iterator.moveNext());

    return sum;
  }

  /// Takes the first [count] elements in the enumerable and discards the rest.
  ///
  /// During iteration, the first [count] number of elements are returned as
  /// normal. Once that number of elements has elapsed, iteration will end.
  ///
  /// If [count] is greater than the number of elements in the enumerable, the
  /// resulting enumerable is unchanged.
  Enumerable<T> takeE(int count) {
    assert(count >= 0);

    if (count == 0) return Enumerable<T>.empty();

    return TakeEnumerable<T>(this, count);
  }

  /// Takes all the elements at the beginning of the enumerable that match the
  /// [condition] and discards the rest.
  ///
  /// During iteration, each element is given to the [condition] function. If
  /// the [condition] returns `true`, that element is returned. Once an element
  /// is processed where the [condition] returns `false`, iteration ends.
  ///
  /// If all elements in the enumerable match the given [condition], the
  /// resulting enumerable is unchanged.
  Enumerable<T> takeWhileE(Condition<T> condition) {
    assert(condition != null);

    return TakeWhileEnumerable<T>(this, condition);
  }

  /// Adds a secondary sorting pass to enumeration in ascending
  /// (least-to-greatest) order.
  ///
  /// [thenByE] applies to an enumerable that has been sorted by [orderByE] or
  /// [orderByDescendingE] (or another [thenByE] or [thenByDescendingE]). Once the
  /// previous sorting mechanism is processed, the keys are then sorted again
  /// using the [EqualityComparer] given to this method. (The process of sorting
  /// is identical to [groupByE].)
  ///
  /// When the type of the enumerable is one of the below types, the
  /// [EqualityComparer] can be omitted. In this case, the function defaults to
  /// predefined minimum functions depending on the type:
  ///
  /// - Numeric types (`num`, `int`, `double`) will be sorted by their values in ascending order.
  /// - `String` types will be sorted in alphabetic order.
  ///
  /// If the enumerable type is not one of these types and the [EqualityComparer]
  /// is not provided, the order of the resulting enumerable is unpredictable.
  ///
  /// If the enumerable is already sorted in ascending order, the resulting
  /// enumerable will be unchanged.
  Enumerable<T> thenByE<TKey>(Selector<T, TKey> keySelector,
      {EqualityComparer<TKey> keyComparer}) {
    assert(keySelector != null);
    if (!(this is InternalOrderedEnumerable)) {
      throw OperationError(
          'ThenBy must be called immediately following a call to OrderBy, OrderByDescending, ThenBy, or ThenByDescending.');
    }
    return (this as dynamic)
        .createOrderedEnumerable<TKey>(keySelector, keyComparer, false);
  }

  /// Adds a secondary sorting pass to enumeration in descending
  /// (greatest-to-least) order.
  ///
  /// [thenByDescendingE] applies to an enumerable that has been sorted by
  /// [orderByE] or [orderByDescendingE] (or another [thenByE] or
  /// [thenByDescendingE]). Once the previous sorting mechanism is processed, the
  /// keys are then sorted again using the [EqualityComparer] given to this
  /// method. (The process of sorting is identical to [groupByE].)
  ///
  /// When the type of the enumerable is one of the below types, the
  /// [EqualityComparer] can be omitted. In this case, the function defaults to
  /// predefined minimum functions depending on the type:
  ///
  /// - Numeric types (`num`, `int`, `double`) will be sorted by their values in descending order.
  /// - `String` types will be sorted in reverse-alphabetic order.
  ///
  /// If the enumerable type is not one of these types and the [EqualityComparer]
  /// is not provided, the order of the resulting enumerable is unpredictable.
  ///
  /// If the enumerable is already sorted in descending order, the resulting
  /// enumerable will be unchanged.
  Enumerable<T> thenByDescendingE<TKey>(Selector<T, TKey> keySelector,
      {EqualityComparer<TKey> keyComparer}) {
    assert(keySelector != null);
    if (!(this is InternalOrderedEnumerable)) {
      throw OperationError(
          'ThenByDescending must be called immediately following a call to OrderBy, OrderByDescending, ThenBy, or ThenByDescending.');
    }
    return (this as dynamic)
        .createOrderedEnumerable<TKey>(keySelector, keyComparer, true);
  }

  /// Converts the enumerable to a Dart [List].
  ///
  /// Iterates over the entire enumerable, storing the elements in a list. Once
  /// iteration completes, this list is returned.
  ///
  /// By default, the returned list is fixed-length, but can be made growable by
  /// setting the [growable] parameter to `true`.
  ///
  /// The length of the resulting [List] is guaranteed to the the same length as
  /// the enumerable.
  List<T> toListE({bool growable = false}) {
    final list = <T>[];
    final iterator = this.iterator;
    while (iterator.moveNext()) {
      list.add(iterator.current);
    }

    return List.from(list, growable: growable);
  }

  /// Converts the enumerable to a Dart [Map].
  ///
  /// Iterates over the entire enumerable, generating keys with the
  /// [keySelector] function and values with the [valueSelector] function then
  /// saving each generated value in a [Map] under the generated key.
  ///
  /// If a duplicate key is produced, the value generated by a prior element is
  /// overwritten. As such, the length of the resulting [Map] is not guaranteed
  /// to be the same length as the enumerable.
  Map<TKey, TValue> toMapE<TKey, TValue>(
      Selector<T, TKey> keySelector, Selector<T, TValue> valueSelector) {
    assert(keySelector != null && valueSelector != null);
    final map = <TKey, TValue>{};
    final iterator = this.iterator;
    TKey key;
    TValue value;
    while (iterator.moveNext()) {
      key = keySelector(iterator.current);
      value = valueSelector(iterator.current);
      if (map.containsKey(key)) throw KeyExistsError(key);
      map[key] = value;
    }

    return map;
  }

  /// Converts the enumerable to a Dart [Set].
  ///
  /// Iterates over the entire enumerable, storing the elements in a set. Once
  /// iteration completes, this set is returned.
  ///
  /// Duplicate elements are determined by the default Dart [Set] behavior (i.e.
  /// by the [hashCode] property of `T`. In the event of a duplicate element,
  /// the previous element is preserved and the duplicate is discarded.
  Set<T> toSetE() {
    final hSet = Set<T>();
    final iterator = this.iterator;
    while (iterator.moveNext()) {
      hSet.add(iterator.current);
    }

    return hSet;
  }

  /// Returns the set union between the enumerable and the given
  /// collection.
  ///
  /// After applying the [unionE] method to an enumerable, the resulting
  /// enumerable will consist of all the distinct elements in the source
  /// enumerable as well as the distinct elements in the given [other]
  /// collection. This is equivalent to taking the set union of the two
  /// sequences.
  ///
  /// Optionally, an [EqualityComparer] can be supplied to handle comparisons. If
  /// one is provided, the [unionE] method will use the [comparer] and [hasher] properties in
  /// order to determine equivalency. If omitted, [unionE] will resort to strict
  /// equivalency (i.e. checking `if (value == element)`).
  ///
  /// (For the [unionE] method, only the [comparer] and [hasher] properties of the
  /// [EqualityComparer] need be supplied.)
  ///
  /// Due to the nature of set unions, the resulting enumerable will be as though
  /// [distinctE] was applied to it, so duplicate elements after the first found
  /// will be discarded. If the intention is to combine elements of two
  /// enumerables/collections, use [concatE] instead.
  Enumerable<T> unionE(Iterable<T> other, {EqualityComparer<T> comparer}) {
    assert(other != null);
    return UnionEnumerable<T>(this, other, comparer);
  }

  /// Filters the enumerable to elements that match the [condition].
  ///
  /// During iteration, elements are passed to the [condition] function. If the
  /// function returns true, the element is returned, and is discarded otherwise.
  ///
  /// If all elements in the enumerable match the [condition], the resulting
  /// enumerable will be unchanged.
  Enumerable<T> whereE(Condition<T> condition) {
    assert(condition != null);
    return WhereEnumerable<T>(this, condition);
  }

  /// Combines the values of the enumerable and another collection into an
  /// enumerable of new values.
  ///
  /// During iteration, each element in the enumerable is passed to the [selector]
  /// function along with the element in the given [other] collection at the
  /// corresponding position. The returned value of the [selector] function is
  /// then returned. If either the enumerable's or the [other]
  /// collection's iteration reaches the end of its elements, iteration is stopped.
  ///
  /// The length of the resulting enumerable will be equal to the lesser of the
  /// lengths of the source enumerable or the given [other] collection.
  Enumerable<TResult> zipE<TSecond, TResult>(
      Iterable<TSecond> other, ZipSelector<T, TSecond, TResult> selector) {
    assert(other != null && selector != null);
    return ZipEnumerable<T, TSecond, TResult>(this, other, selector);
  }
}
