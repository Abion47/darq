import 'equality_comparer.dart';
import 'grouping.dart';
import 'iterables/group_by_iterable.dart';
import 'iterables/group_by_value_iterable.dart';
import 'iterables/group_join_iterable.dart';
import 'iterables/group_select_iterable.dart';
import 'iterables/group_select_value_iterable.dart';
import 'iterables/ordered_iterable.dart';
import 'lookup.dart';

extension IterableStaticExtensions on Iterable {
  static Iterable<int> range(int start, int length) sync* {
    for (var i = 0; i < length; i++) {
      yield start + i;
    }
  }
}

extension IterableExtensions<T> on Iterable<T> {
  /// Aggregates the iterable into a single value.
  ///
  /// Aggregates the source iterable by applying the [aggregator] function to
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
  /// When the type of the iterable is one of the below types, the [aggregator]
  /// function can be omitted. In this case, the function defaults to predefined
  /// aggregator functions depending on the type:
  ///
  /// - Numeric types (`num`, `int`, `double`) return the sum of all elements.
  /// The initial value is set to the zero equivalent of the type.
  /// - `String` types return all the elements concatenated into a single
  /// string. The initial value is an empty string.
  ///
  /// If the iterable type is not one of these types, the [aggregator] function
  /// must be provided. Otherwise, an [ArgumentError] will be thrown.
  ///
  /// <strong>The [aggregate] method is an iterable-consuming method. All lazy iterables
  /// will be iterated fully in the process of calculating the result.</strong>
  ///
  /// (This is a convenience method to maintain naming-consistency with its .NET LINQ equivalent.
  /// Internally it functions identically to [fold].)
  TResult aggregate<TResult>(
          TResult initialValue, TResult Function(TResult, T) aggregator) =>
      fold(initialValue, aggregator);

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
  /// <strong>The [all] method is an iterable-consuming method. All lazy iterables
  /// will be iterated fully in the process of calculating the result.</strong>
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

  /// Inserts an element to the end of the iterable.
  ///
  /// Takes the specified element and inserts it at the end of the iterable.
  Iterable<T> append(T value) sync* {
    yield* this;
    yield value;
  }

  /// Calculates the average of all numerical values in the iterable.
  ///
  /// Applies an averaging function to all values in the iterable. If the type
  /// of the iterable is a numerical type, the function will be the typical numerical
  /// averaging function. Otherwise, the function will use the [selector] averaging
  /// function supplied.
  ///
  /// If the type of the iterator is a numerical type and the [selector] function
  /// isn't supplied, an [ArgumentError] will be thrown.
  ///
  /// <strong>The [average] method is an iterable-consuming method. All lazy iterables
  /// will be iterated fully in the process of calculating the result.</strong>
  double average([num Function(T) selector]) {
    if (selector == null) {
      if (T == num) {
        selector = (T n) => n as num;
      } else if (T == int) {
        selector = (T n) => n as int;
      } else if (T == double) {
        selector = (T n) => n as double;
      }
    }

    if (isEmpty) {
      throw StateError('Iterator must not be empty.');
    }

    if (selector == null) {
      throw StateError(
          'If T isn\'t a subtype of num, selector must not be null.');
    }

    var total = 0.0;
    var count = 0;

    for (var n in this) {
      total += selector(n);
      count++;
    }

    return total / count;
  }

  /// Concatenates this iterable and another collection.
  ///
  /// Appends the values of a given [Iterable] to the end of this iterable,
  /// resulting in an iterable that is the concatenation of both.
  ///
  /// (This is a convenience method to maintain naming-consistency with its .NET LINQ equivalent.
  /// Internally it functions identically to [followedBy].)
  Iterable<T> concat(Iterable<T> other) => followedBy(other);

  /// Returns the number of elements in the iterable.
  ///
  /// Optionally, a [condition] can be specified. If so, the total count
  /// will be the number of elements for which the [condition] function
  /// returned `true`.
  ///
  /// If the [condition] parameter is omitted and the underlying collection extends
  /// or implements [EfficientLengthIterable], the [count] method will call the
  /// `length` property of the iterable as an O(1) operation. Otherwise, the
  /// [count] function will iterate over every element in the iterable.
  int count([bool Function(T) condition]) {
    if (condition == null) return length;

    var count = 0;
    for (var v in this) {
      if (condition(v)) {
        count++;
      }
    }

    return count;
  }

  /// Returns a new iterable containing [value] if this iterable is empty. Otherwise,
  /// the source iterable will be unaffected.
  ///
  /// If the number of elements in this iterable is zero, [defaultIfEmpty] will
  /// return a new iterable that consists of a single element specified by
  /// the given [value].
  ///
  /// If this iterable has one or more elements, the iterable is returned
  /// without modification.
  Iterable<T> defaultIfEmpty(T defaultVal) sync* {
    var hasValues = false;
    for (var v in this) {
      yield v;
      hasValues = true;
    }

    if (!hasValues) {
      yield defaultVal;
    }
  }

  /// Returns an iterable representing the distinct values of this iterable.
  ///
  /// After applying the [distinctE] method to an iterable, the resulting
  /// iterable will consist of distinct values in the source iterable.
  ///
  /// Optionally, a [keySelector] can be supplied to handle comparisons. If
  /// one is provided, the [distinct] method will use the [comparer] property in
  /// order to determine equivalency. If omitted, [distinct] will resort to strict
  /// equivalency (i.e. checking `if (value == element)`).
  ///
  /// Each element will be the first element found in the source iterable,
  /// meaning elements with unique data that are deemed non-distinct by the
  /// [keySelector] will be dropped.
  ///
  /// If none of the elements in the iterable match any other element in the
  /// iterable, the iterable will be unchanged.
  Iterable<T> distinct<TKey>([TKey Function(T) keySelector]) sync* {
    keySelector ??= (T v) => v as TKey;
    final set = <TKey>{};

    for (var t in this) {
      if (set.add(keySelector(t))) yield t;
    }
  }

  /// Returns the element at the specified index or a default value of one is
  /// not found.
  ///
  /// Iterates over the entire iterable until it reaches the element on the
  /// iteration matching the given [index]. [elementAt] will then return that
  /// value. If the iteration reaches the end of the iterable before arriving
  /// at [index], the value of [defaultValue] will be returned instead. If
  /// [defaultValue] is not supplied, the returned value will be `null`.
  ///
  /// The [elementAtOrDefault] method will short-circuit after reaching the
  /// element at [index] and will not iterate further over the iterable. In
  /// the worst case, it will iterate over the entire iterable.
  ///
  /// If the underlying iterable is a [List], this method will instead
  /// utilize an indexer call to the [List] as an O(1) operation. If
  /// [index] is greater than or equal to the length of the list, `defaultValue`
  /// will be returned instead.
  T elementAtOrDefault(int index, [T defaultVal]) {
    if (index < 0) {
      throw RangeError.index(index, this, 'The index must not be negative.');
    }

    if (this is List) {
      final asList = this as List;
      if (index >= asList.length) return defaultVal;
      return asList[index];
    }

    var i = 0;
    for (var v in this) {
      if (index == i) return v;
      i++;
    }

    return defaultVal;
  }

  /// Returns the set difference between the iterable and the given
  /// collection.
  ///
  /// After applying the [except] method to an iterable, the resulting
  /// iterable will consist of all the elements in the source iterable that
  /// are not present in the given [other] collection. This is equivalent to
  /// taking the set difference of the two sequences.
  ///
  /// Optionally, a [selector] can be supplied to handle comparisons. If
  /// one is provided, the [except] method will use the [selector] function in
  /// order to determine equivalency.  If omitted, [except] will resort to the default
  /// hash code implementation for `T`;
  ///
  /// If none of the elements in the source iterable match any element in the
  /// given [other] collection, the iterable will be unchanged.
  Iterable<T> except<TKey>(Iterable<T> other,
      [TKey Function(T) selector]) sync* {
    selector ??= (T v) => v as TKey;

    final set = Set<TKey>.from(other.map(selector));
    for (var v in this) {
      if (!set.contains(selector(v))) yield v;
    }
  }

  /// Returns the first element in the iterable.
  ///
  /// If the iterable is empty, the value specified by [defaultValue] will be
  /// returned instead. If [defaultValue] is omitted, the returned value will be
  /// `null`.
  T firstOrDefault([T defaultVal]) {
    if (isEmpty) return defaultVal;
    return first;
  }

  /// Returns the first element in the iterable matching a specified condition,
  /// or a default value if none is found.
  ///
  /// Begins iteration of the iterable, but then returns the first element
  /// found that matches the specified [condition].
  ///
  /// If the iterable is empty, or if [condition] is provided but iteration
  /// reaches the end of the iterable before an element is found, the value
  /// specified by [defaultValue] will be returned instead. If [defaultValue] is
  /// omitted, the returned value will be `null`.
  ///
  /// The [firstWhereOrDefault] method begins iteration, but short-circuits
  /// the first time [condition] returns `true` and will not iterate further. In
  /// the worst case, it will iterate over the entire iterable.
  T firstWhereOrDefault(bool Function(T) condition, [T defaultVal]) {
    if (isEmpty) return defaultVal;

    for (var v in this) {
      if (condition(v)) {
        return v;
      }
    }

    return defaultVal;
  }

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
  GroupByIterable<T, TKey> groupBy<TKey>(
    TKey Function(T) keySelector, {
    EqualityComparer<TKey> keyComparer,
  }) {
    keySelector ??= (T v) => v as TKey;
    keyComparer ??= EqualityComparer.forType<TKey>();

    return GroupByIterable<T, TKey>(this, keySelector, keyComparer);
  }

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
  /// If one is provided, the [groupByValue] method will use the [comparer] and
  /// [hasher] properties in order to determine equivalency. If omitted,
  /// [groupByValue] will resort to strict equivalency (i.e. checking `if (value == element)`).
  ///
  /// (For the [groupByValue] method, only the [comparer] and [hasher] properties of
  /// the [EqualityComparer] need be supplied.)
  ///
  /// The resulting iterable will consist of a series of [Grouping] constructs
  /// that contain the elements. If no two elements in the iterable share a
  /// common key, the resulting iterable will consist of [Grouping] objects
  /// (each containing a single element) of the same length as the source
  /// iterable.
  GroupByValueIterable<T, TKey, TValue> groupByValue<TKey, TValue>({
    TKey Function(T) keySelector,
    TValue Function(T) valueSelector,
    EqualityComparer<TKey> keyComparer,
  }) {
    keySelector ??= (T v) => v as TKey;
    valueSelector ??= (T v) => v as TValue;
    keyComparer ??= EqualityComparer.forType<TKey>();

    return GroupByValueIterable<T, TKey, TValue>(
        this, keySelector, valueSelector, keyComparer);
  }

  /// Joins elements in the iterable with a group of all elements in the
  /// [inner] collection that match the generated key.
  ///
  /// First, [groupJoin] will iterate over the [other] collection and make a
  /// lookup table of its elements, referenceable by a key generated by
  /// [innerKeySelector]. Then [groupJoin] will iterate over the source
  /// iteration, generating keys via the [outerKeySelector]. If a generated
  /// outer key matches an inner key in the collection lookup, the iterable
  /// element is passed to the [selector] with all elements from the [other]
  /// collection that match that key. The returned value of [selector] is then
  /// added to the resulting iterable.
  ///
  /// Elements in the source iterable that doesn't share a key in the
  /// lookup table are passed to the [selector] function with an empty
  /// collection as the second parameter. Elements in [other] that don't share
  /// a key with a source iterable element are discarded.
  ///
  /// The [outerKeySelector], [innerKeySelector], and [keyComparer] parameters are
  /// optional. If omitted, the selectors revert to a default selector that returns
  /// the input directly, and [keyComparer] reverts to a comparer that checks for
  /// strict equivalency.
  ///
  /// [groupJoin] is different from [joinMap] in that, where [joinMap] will produce a
  /// new resulting element for each key match between the source iterable and
  /// the [inner] collection, [groupJoin] will produce a new element from an
  /// element in the source iterable and all elements in the [inner]
  /// collection that match on the key.
  GroupJoinIterable<T, TInner, TKey, TResult> groupJoin<TInner, TKey, TResult>(
    Iterable<TInner> other,
    TResult Function(T, Iterable<TInner>) resultSelector, {
    TKey Function(T) outerKeySelector,
    TKey Function(TInner) innerKeySelector,
    EqualityComparer<TKey> keyComparer,
  }) {
    assert(other != null);
    assert(resultSelector != null);

    outerKeySelector ??= (T v) => v as TKey;
    innerKeySelector ??= (TInner v) => v as TKey;
    keyComparer ??= EqualityComparer.forType<TKey>();

    return GroupJoinIterable<T, TInner, TKey, TResult>(this, other,
        outerKeySelector, innerKeySelector, resultSelector, keyComparer);
  }

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
  GroupSelectIterable<T, TKey, TResult> groupSelect<TKey, TResult>(
    TResult Function(TKey, Iterable<T>) resultSelector, {
    TKey Function(T) keySelector,
    EqualityComparer<TKey> keyComparer,
  }) {
    keySelector ??= (T v) => v as TKey;
    keyComparer ??= EqualityComparer.forType<TKey>();

    return GroupSelectIterable<T, TKey, TResult>(
        this, keySelector, resultSelector, keyComparer);
  }

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
  GroupSelectValueIterable<T, TKey, TValue, TResult>
      groupSelectValue<TKey, TValue, TResult>(
    TResult Function(TKey, Iterable<TValue>) resultSelector, {
    TKey Function(T) keySelector,
    TValue Function(T) valueSelector,
    EqualityComparer<TKey> keyComparer,
  }) {
    keySelector ??= (T v) => v as TKey;
    valueSelector ??= (T v) => v as TValue;
    keyComparer ??= EqualityComparer.forType<TKey>();

    return GroupSelectValueIterable(
        this, keySelector, valueSelector, resultSelector, keyComparer);
  }

  /// Returns the set intersection between the iterable and the given
  /// collection.
  ///
  /// After applying the [intersect] method to an iterable, the resulting
  /// iterable will consist of all the elements in the source iterable that
  /// are also present in the given [other] collection. This is equivalent to
  /// taking the set intersection of the two sequences.
  ///
  /// Optionally, a [selector] can be supplied to refine the comparison. If
  /// one is provided, the [intersect] method will use the [selector] function in
  /// order to determine equivalency.  If omitted, [intersect] will resort to the default
  /// hash code implementation for `T`;
  ///
  /// If all of the elements in the source iterable match an element in the
  /// given [other] collection, the iterable will be unchanged.
  Iterable<T> intersect<TKey>(Iterable<T> other,
      [TKey Function(T) selector]) sync* {
    selector ??= (T v) => v as TKey;

    final set = Set<TKey>.from(other.map(selector));
    for (var v in this) {
      if (set.contains(selector(v))) yield v;
    }
  }

  /// Finds keys in this iterable with matching keys in the [other] collection
  /// and returns a value that is the result of the corresponding elements being
  /// merged.
  ///
  /// First, [joinMap] will iterate over the [other] collection and make a lookup
  /// table of its elements, referenceable by a key generated by
  /// [innerKeySelector]. Then [joinMap] will iterate over the source iteration,
  /// generating keys via the [outerKeySelector]. If a generated key matches a
  /// key in the collection lookup, the collection element and the iterable
  /// element are passed through the [selector]. The returned value of
  /// [selector] is then added to the resulting iterable.
  ///
  /// Elements in the source iterable that doesn't share a key in the
  /// lookup table as well as elements in [other] that don't share a key with a
  /// source iterable element are discarded.
  Iterable<TResult> joinMap<TInner, TKey, TResult>(
    Iterable<TInner> other,
    TKey Function(T) outerKeySelector,
    TKey Function(TInner) innerKeySelector,
    TResult Function(T, TInner) resultSelector, {
    EqualityComparer<TKey> keyComparer,
  }) sync* {
    keyComparer ??= EqualityComparer.forType<TKey>();

    final lookup = Lookup.createForJoin(other, innerKeySelector, keyComparer);

    final outerIterator = iterator;

    Iterator<TInner> groupIterator;

    TKey outerKey;
    T outerValue;
    Grouping<TKey, TInner> grouping;
    while (outerIterator.moveNext()) {
      outerValue = outerIterator.current;
      outerKey = outerKeySelector(outerIterator.current);
      grouping = lookup.getGrouping(outerKey, false);

      if (grouping != null) {
        groupIterator = grouping.iterator;

        while (groupIterator.moveNext()) {
          yield resultSelector(outerValue, groupIterator.current);
        }

        groupIterator = null;
      }
    }
  }

  /// Returns the last element in the iterable.
  ///
  /// If the iterable is empty, the value specified by [defaultValue] will be
  /// returned instead. If [defaultValue] is omitted, the returned value will be
  /// `null`.
  ///
  /// <strong>The [lastOrDefault] method is an iterable-consuming method. All lazy iterables
  /// will be iterated fully in the process of calculating the result.</strong>
  T lastOrDefault([T defaultVal]) {
    if (isEmpty) return defaultVal;
    return last;
  }

  /// Returns the last element in the iterable matching a specified condition,
  /// or a default value if none is found.
  ///
  /// Iterates over the entire iterable and returns last value that matched the
  /// [condition].
  ///
  /// If the iterable is empty, or if no value was found that matched the [condition],
  /// the value specified by [defaultValue] will be returned instead. If [defaultValue]
  /// is omitted, the returned value will be `null`.
  ///
  /// <strong>The [lastWhereOrDefault] method is an iterable-consuming method. All lazy
  /// iterables will be iterated fully in the process of calculating the result.</strong>
  T lastWhereOrDefault(bool Function(T) condition, [T defaultVal]) {
    if (isEmpty) return defaultVal;

    var found = false;
    T val;

    for (var v in this) {
      if (condition(v)) {
        val = v;
        found = true;
      }
    }

    if (found) {
      return val;
    }

    return defaultVal;
  }

  /// Returns the maximum value in the iterable.
  ///
  /// Iterates over the iterable and applies the [comparer] to each element
  /// in order to find the maximum value. Once iteration is complete, [max]
  /// will return the largest element found.
  ///
  /// When the type of the iterable is one of the below types, the
  /// [comparer] can be omitted. In this case, the function defaults to
  /// predefined maximum functions depending on the type:
  ///
  /// - Numeric types (`num`, `int`, `double`) return the maximum of all elements
  /// as defined by the `max` function in `dart:math`.
  ///
  /// - `String` types return the alphabetic maximum of all elements.
  ///
  /// If the iterable type is not one of these types, the [EqualityComparer]
  /// must be provided. Otherwise, an [ArgumentError] will be thrown.
  ///
  /// If the iterable is empty, a [StateError] will be thrown.
  ///
  /// <strong>The [max] method is an iterable-consuming method. All lazy
  /// iterables will be iterated fully in the process of calculating the result.</strong>
  T max([int Function(T, T) comparer]) {
    if (comparer == null) {
      if (T == num) {
        comparer = (T a, T b) => (a as num).compareTo(b as num);
      } else if (T == int) {
        comparer = (T a, T b) => (a as int).compareTo(b as int);
      } else if (T == double) {
        comparer = (T a, T b) => (a as double).compareTo(b as double);
      } else if (T == String) {
        comparer = (T a, T b) => (a as String).compareTo(b as String);
      }
    }

    if (isEmpty) {
      throw StateError('Iterable must not be empty.');
    }

    if (comparer == null) {
      throw ArgumentError('comparer must not be null.');
    }

    T max;
    for (var v in this) {
      if (max == null) {
        max = v;
      } else if (comparer(v, max) > 0) {
        max = v;
      }
    }

    return max;
  }

  /// Returns the minimum value in the iterable.
  ///
  /// Iterates over the iterable and applies the [comparer] to each element
  /// in order to find the minimum value. Once iteration is complete, [min]
  /// will return the smallest element found.
  ///
  /// When the type of the iterable is one of the below types, the
  /// [comparer] can be omitted. In this case, the function defaults to
  /// predefined minimum functions depending on the type:
  ///
  /// - Numeric types (`num`, `int`, `double`) return the minimum of all elements
  /// as defined by the `min` function in `dart:math`.
  ///
  /// - `String` types return the alphabetic minimum of all elements.
  ///
  /// If the iterable type is not one of these types, the [comparer]
  /// must be provided. Otherwise, an [ArgumentError] will be thrown.
  ///
  /// If the iterable is empty, a [StateError] will be thrown.
  ///
  /// <strong>The [min] method is an iterable-consuming method. All lazy
  /// iterables will be iterated fully in the process of calculating the result.</strong>
  T min([int Function(T, T) comparer]) {
    if (comparer == null) {
      if (T == num) {
        comparer = (T a, T b) => (a as num).compareTo(b as num);
      } else if (T == int) {
        comparer = (T a, T b) => (a as int).compareTo(b as int);
      } else if (T == double) {
        comparer = (T a, T b) => (a as double).compareTo(b as double);
      } else if (T == String) {
        comparer = (T a, T b) => (a as String).compareTo(b as String);
      }
    }

    if (isEmpty) {
      throw StateError('Iterable must not be empty.');
    }

    if (comparer == null) {
      throw ArgumentError('comparer must not be null');
    }

    T min;
    for (var v in this) {
      if (min == null) {
        min = v;
      } else if (comparer(v, min) < 0) {
        min = v;
      }
    }

    return min;
  }

  /// Returns all elements in the iterable that are castable to the specified
  /// type.
  ///
  /// After applying [ofType] to an iterable, the resulting iterable will
  /// consist of all elements in the source iterable that can be safely cast
  /// to `TResult`, omitting all elements that cannot.
  ///
  /// If all elements in the source iterable can be safely cast to `TResult`,
  /// the resulting iterable will be unchanged.
  ///
  /// (This is a convenience method to maintain naming-consistency with its .NET LINQ equivalent.
  /// Internally it functions identically to [whereType].)
  Iterable<TOther> ofType<TOther>() => whereType<TOther>();

  /// Sorts the iteration in ascending (least-to-greatest) order.
  ///
  /// First, [orderBy] iterates over the entire iterable, creating a list of
  /// keys generated by [keySelector] associated to their corresponding
  /// elements. Then a QuickSort algorithm is applied to the keys, using the
  /// [sorter] property in [keyComparer] to determine sort order. Afterwards,
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
  /// <strong>The [orderBy] method is an iterable-consuming method. All lazy
  /// iterables will be iterated fully in the process of calculating the result.</strong>
  Iterable<T> orderBy<TKey>(
    TKey Function(T) keySelector, {
    EqualityComparer<TKey> keyComparer,
  }) {
    ArgumentError.checkNotNull(keySelector);
    return InternalOrderedIterable(this, keySelector, keyComparer, false);
  }

  /// Sorts the iteration in descending (greatest-to-least) order.
  ///
  /// First, [orderByDescending] iterates over the entire iterable, creating a
  /// list of keys generated by [keySelector] associated to their corresponding
  /// elements. Then a QuickSort algorithm is applied to the keys, using the
  /// [sorter] property in [keyComparer] to determine sort order. Afterwards,
  /// the resulting iterable will consist of the elements in the source
  /// iterable in the order determined by the sorted list of keys.
  ///
  /// When the type of the iterable is one of the below types, the
  /// [EqualityComparer] can be omitted. In this case, the function defaults to
  /// predefined minimum functions depending on the type:
  ///
  /// - Numeric types (`num`, `int`, `double`) will be sorted by their values in descending order.
  /// - `String` types will be sorted in reverse-alphabetic order.
  ///
  /// If the iterable type is not one of these types and the [EqualityComparer]
  /// is not provided, the order of the resulting iterable is unpredictable.
  ///
  /// If the iterable is already sorted in descending order, the resulting
  /// iterable will be unchanged.
  ///
  /// <strong>The [orderByDescending] method is an iterable-consuming method. All lazy
  /// iterables will be iterated fully in the process of calculating the result.</strong>
  Iterable<T> orderByDescending<TKey>(
    TKey Function(T) keySelector, {
    EqualityComparer<TKey> keyComparer,
  }) {
    ArgumentError.checkNotNull(keySelector);
    return InternalOrderedIterable(this, keySelector, keyComparer, true);
  }

  /// Inserts an element at the beginning of the iterable.
  ///
  /// Takes the specified element and inserts it at the beginning of the
  /// iterable.
  Iterable<T> prepend(T value) sync* {
    yield value;
    yield* this;
  }

  /// Reverses the order of the iterable.
  ///
  /// The iterable is iterated over and stored in a list. The resulting
  /// iterable is the product of then iterating over that list in reverse
  /// order.
  ///
  /// <strong>The [reverse] method is an iterable-consuming method. All lazy
  /// iterables will be iterated fully in the process of calculating the result.</strong>
  Iterable<T> reverse() sync* {
    final list = toList();
    yield* list.reversed;
  }

  /// Groups elements in the iterator into segments of [size] length, optionally
  /// truncating elements that don't fit into a full-size group.
  ///
  /// Iterates through the iterator and groups elements into a secondary list
  /// of [size] length. Once the list is full, the list is then yielded.
  ///
  /// If [includeTail] is false, when the source iteration is complete, any
  /// remaining elements are discarded. If true, these elements are returned as
  /// a final list of some length less than [size]. (False by default.)
  Iterable<Iterable<T>> segment(int size, {bool includeTail = false}) sync* {
    var package = List<T>(size);
    var index = 0;

    for (var v in this) {
      package[index++] = v;
      if (index >= package.length) {
        yield package;
        package = List<T>(size);
        index = 0;
      }
    }

    if (index > 0 && includeTail) {
      yield List<T>.of(package.sublist(0, index));
    }
  }

  /// Applies a mapping function to the elements in the iterable.
  ///
  /// During iteration, the [selector] function is provided each value in the iterable
  /// along with the index of the value in the iteration. The returned value of that
  /// function is then provided as the next element of the resulting iterable.
  Iterable<TResult> select<TResult>(TResult Function(T, int) selector) sync* {
    var index = 0;
    for (var v in this) {
      yield selector(v, index++);
    }
  }

  /// Maps elements in an iterable to collections and then flattens those
  /// collections into a single iterable.
  ///
  /// During iteration, the [selector] function is provided each value in the iterable
  /// along with the index of the value in the iteration. The
  /// returned collection of that function is then iterated over, and each
  /// value in that iteration is provided as the next element of the
  /// resulting iterable. The result is all of the collections flattened so that
  /// their values become elements in a single iterable.
  Iterable<TResult> selectMany<TResult>(
      Iterable<TResult> Function(T, int) selector) sync* {
    var index = 0;
    for (var v in this) {
      yield* selector(v, index++);
    }
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
  /// <strong>The [sequenceEqual] method is an iterable-consuming method. All lazy
  /// iterables in this iterable and in the [other] iterable will be iterated fully
  /// in the process of calculating the result.</strong>
  bool sequenceEqual<TKey>(Iterable<T> other,
      [TKey Function(T) outerSelector, TKey Function(T) innerSelector]) {
    if (other == null) {
      return false;
    }

    final iterA = iterator;
    final iterB = other.iterator;

    bool aHasNext;
    bool bHasNext;

    outerSelector ??= (T v) => v as TKey;
    innerSelector ??= (T v) => v as TKey;

    do {
      aHasNext = iterA.moveNext();
      bHasNext = iterB.moveNext();

      if (aHasNext && bHasNext) {
        if (outerSelector(iterA.current) != innerSelector(iterB.current)) {
          return false;
        }
      }
    } while (aHasNext && bHasNext);

    if (aHasNext != bHasNext) return false;

    return true;
  }

  /// Returns the single element in the iterable, or a [defaultValue] if no
  /// such element exists.
  ///
  /// Returns the single value in this iterable, assuming the iterable has a
  /// length of one. If the iterable is empty, the value specified by
  /// [defaultValue] is returned instead. If the iterable contains more than
  /// one element, a [StateError] is thrown.
  ///
  /// The [singleOrDefault] function will short-circuit after reaching the second
  /// element of the iteration, if one exists. In the worst-case scenario,
  /// [singleOrDefault] will iterate over two elements of the iterable.
  T singleOrDefault([T defaultVal]) {
    final iter = iterator;
    if (!iter.moveNext()) return defaultVal;

    var val = iter.current;
    if (iter.moveNext()) {
      throw StateError('The iterable has more than one element.');
    }

    return val;
  }

  /// Returns the single element in the iterable matching a
  /// [condition], or a [defaultValue] if no such element exists.
  ///
  /// Iterates over the entire iterable, applying the [condition] function to
  /// each element. At the end of the iteration, if only a single element matches
  /// the [condition], that element is returned. If no elements match the [condition],
  /// the value specified by [defaultValue] is returned instead. If more than
  /// one element matches the [condition], a [StateError] is thrown.
  ///
  /// The [singleOrDefault] function will short-circuit after finding a second element
  /// that matches the [condition]. In the worst-case scenario, [singleOrDefault]
  /// will iterate over the entire iterable.
  T singleWhereOrDefault(bool Function(T) condition, [T defaultVal]) {
    final iter = iterator;
    if (!iter.moveNext()) return defaultVal;

    T val;
    var found = false;
    do {
      if (condition(iter.current)) {
        if (!found) {
          val = iter.current;
          found = true;
        } else {
          throw StateError(
              'The iterable has more than one element matching the condition.');
        }
      }
    } while (iter.moveNext());

    if (!found) return defaultVal;
    return val;
  }

  /// Calculates the sum of the elements in an iterable, optionally using
  /// [selector] to obtain the value to be summed.
  ///
  /// Iterates over the entire iterable, passing each element to the
  /// [selector] function and adding its return value to a running total. Once
  /// iteration is complete, the total is returned.
  ///
  /// The type of the returned total is dependent on the value returned by the
  /// [selector] function. If all values are `int`, the return value of [sum]
  /// will be `int`. If all values are `double`, the return value of [sum] will
  /// be `double`. If all values are `num` or there is a combination of `int`
  /// and `double`, the return value of [sum] will be `num`.
  ///
  /// When the type of the iterable is a numeric primitive (e.g. `int`,
  /// `double`, or `num`), the [selector] function can be omitted. If so,
  /// the elements themselves are added to the running total.
  ///
  /// If the type of the iterable is not a numeric primitive, the [selector]
  /// function must be provided. Otherwise, a [StateError] is thrown.
  ///
  /// <strong>The [min] method is an iterable-consuming method. All lazy
  /// iterables will be iterated fully in the process of calculating the result.</strong>
  num sum([num Function(T) selector]) {
    if (selector == null) {
      if (T == num) {
        selector = (T n) => n as num;
      } else if (T == int) {
        selector = (T n) => n as int;
      } else if (T == double) {
        selector = (T n) => n as double;
      }
    }

    if (isEmpty) {
      throw StateError('Iterator must not be empty.');
    }

    if (selector == null) {
      throw StateError(
          'If T isn\'t a subtype of num, selector must not be null.');
    }

    var total = T == int ? 0 : 0.0;

    for (var n in this) {
      total += selector(n);
    }

    return total;
  }

  /// Adds a secondary sorting pass to iteration in ascending
  /// (least-to-greatest) order.
  ///
  /// [thenByE] applies to an iterable that has been sorted by [orderBy] or
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
  /// <strong>The [thenBy] method is an iterable-consuming method. All lazy
  /// iterables will be iterated fully in the process of calculating the result.</strong>
  Iterable<T> thenBy<TKey>(
    TKey Function(T) keySelector, {
    EqualityComparer<TKey> keyComparer,
  }) {
    ArgumentError.checkNotNull(keySelector);
    if (this is! InternalOrderedIterable) {
      throw UnsupportedError(
          'thenBy must be called immediately following a call to orderBy, orderByDescending, thenBy, or thenByDescending.');
    }
    return (this as dynamic)
        .createOrderedIterable<TKey>(keySelector, keyComparer, false);
  }

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
  /// <strong>The [thenByDescending] method is an iterable-consuming method. All lazy
  /// iterables will be iterated fully in the process of calculating the result.</strong>
  Iterable<T> thenByDescending<TKey>(
    TKey Function(T) keySelector, {
    EqualityComparer<TKey> keyComparer,
  }) {
    ArgumentError.checkNotNull(keySelector);
    if (this is! InternalOrderedIterable) {
      throw UnsupportedError(
          'thenByDescending must be called immediately following a call to orderBy, orderByDescending, thenBy, or thenByDescending.');
    }
    return (this as dynamic)
        .createOrderedIterable<TKey>(keySelector, keyComparer, true);
  }

  /// Converts the iterable to a [Map].
  ///
  /// Iterates over the entire iterable, generating a [MapEntry] from each
  /// element with the [entrySelector] function then saving each generated
  /// entry in a [Map] under the generated key.
  ///
  /// If a duplicate key is produced, the value generated by a prior element is
  /// overwritten. As such, the length of the resulting [Map] is not guaranteed
  /// to be the same length as the iterable.
  ///
  /// <strong>The [toMap] method is an iterable-consuming method. All lazy
  /// iterables will be iterated fully in the process of calculating the result.</strong>
  Map<TKey, TValue> toMap<TKey, TValue>(
      MapEntry<TKey, TValue> Function(T) entrySelector) {
    return Map.fromEntries(map(entrySelector));
  }

  /// Returns the set union between the iterable and the given
  /// collection.
  ///
  /// After applying the [union] method to an iterable, the resulting
  /// iterable will consist of all the distinct elements in the source
  /// iterable as well as the distinct elements in the given [other]
  /// collection. This is equivalent to taking the set union of the two
  /// sequences.
  ///
  /// Optionally, a [selector] can be supplied to refine the comparison. If
  /// one is provided, the [union] method will use the [selector] function in
  /// order to determine equivalency. If omitted, [union] will resort to the default
  /// hash code implementation for `T`;
  ///
  /// Due to the nature of set unions, the resulting iterable will be as though
  /// [distinct] was applied to it, so duplicate elements after the first found
  /// will be discarded. If the intention is to combine elements of two
  /// iterables/collections, use [concat] instead.
  Iterable<T> union<TKey>(Iterable<T> other,
      [TKey Function(T) selector]) sync* {
    selector ??= (T v) => v as TKey;

    final set = <TKey>{};

    for (var v in this) {
      if (set.add(selector(v))) {
        yield v;
      }
    }

    for (var v in other) {
      if (set.add(selector(v))) {
        yield v;
      }
    }
  }

  /// Combines the values of the iterable and another collection into an
  /// iterable of new values.
  ///
  /// During iteration, each element in the iterable is passed to the [selector]
  /// function along with the element in the given [other] collection at the
  /// corresponding position. The returned value of the [selector] function is
  /// then returned. If either the iterable's or the [other]
  /// collection's iteration reaches the end of its elements, iteration is stopped.
  ///
  /// The length of the resulting iterable will be equal to the lesser of the
  /// lengths of the source iterable or the given [other] collection.
  Iterable<TResult> zip<TOther, TResult>(
      Iterable<TOther> other, TResult Function(T, TOther) selector) sync* {
    final sourceIterator = iterator;
    final otherIterator = other.iterator;

    while (sourceIterator.moveNext() && otherIterator.moveNext()) {
      yield selector(sourceIterator.current, otherIterator.current);
    }
  }
}
