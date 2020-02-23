import 'dart:collection';

import '../equality_comparer.dart';
import '../grouping.dart';
import '../lookup.dart';
import '../consumers/boolean_consumers.dart';

extension MutationIterableExtensions<T> on Iterable<T> {
  /// Returns this iterable with all null values replaced with the following element.
  ///
  /// If the null value appears at the end of the iterable, it will be filled forward instead.
  ///
  /// If this iterable doesn't contain any null values, the
  /// iterable will be unaffected.
  ///
  /// If this iterable contains only null values, a [StateError] will be thrown.
  Iterable<T> fillBackward() sync* {
    final iterator = this.iterator;
    T lastValue;

    var nullCount = 0;

    while (iterator.moveNext()) {
      while (iterator.current == null) {
        nullCount++;
        if (!iterator.moveNext()) {
          if (lastValue == null) {
            throw StateError(
                'Cannot perform fillBackward on an iterable that contains only null values.');
          }
          for (var i = 0; i < nullCount; i++) {
            yield lastValue;
          }
        }
      }

      if (nullCount > 0) {
        for (var i = 0; i < nullCount; i++) {
          yield iterator.current;
        }
        nullCount = 0;
      }

      yield iterator.current;
      lastValue = iterator.current;
    }
  }

  /// Returns this iterable with all null values replaced with the following element.
  ///
  /// If the null value appears at the end of the iterable, it will be filled forward instead.
  ///
  /// If this iterable doesn't contain any null values, the
  /// iterable will be unaffected.
  ///
  /// If this iterable contains only null values, a [StateError] will be thrown.
  Iterable<T> fillForward() sync* {
    final iterator = this.iterator;
    if (!iterator.moveNext()) return;

    var nullCount = 0;
    while (iterator.current == null) {
      nullCount++;
      if (!iterator.moveNext()) {
        throw StateError(
            'Cannot perform fillForward on an iterable that contains only null values.');
      }
    }

    var lastValue = iterator.current;
    for (var i = 0; i < nullCount; i++) {
      yield lastValue;
    }

    while (iterator.moveNext()) {
      yield iterator.current ?? lastValue;
      if (iterator.current != null) lastValue = iterator.current;
    }

    for (var o in this) {
      yield o ?? lastValue;
      if (o != null) lastValue = o;
    }
  }

  /// Returns this iterable with all null values replaced with the specified element.
  ///
  /// If this iterable doesn't contain any null values, the iterable will be unaffected.
  Iterable<T> fillMissing(T value) sync* {
    for (var o in this) {
      yield o ?? value;
    }
  }

  /// Flattens this iterable of iterables into a single iterable.
  ///
  /// Flattens each iterable element contained in this iterable into a single
  /// iterable. The resulting iterable will contain all the elements if each
  /// inner iterable in a single iterable, maintaining iteration order.
  ///
  /// (This is a convenience method that is equivalent to calling `iterable.expand((e) => e))`.)
  Iterable<TResult> flatten<TResult>() => expand((e) => e as Iterable<TResult>);

  /// Returns an iterable of [MapEntry] representing the elements in this iterable combined with
  /// the zero-based index where the element was found.
  ///
  /// The returned iterable will consist of a sequence of [MapEntry] elements. For each entry,
  /// the key will be the index and the value will be the element itself.
  ///
  /// Optionally a [startIndex] value can be provided. The first element in the resulting
  /// iterable will begin with that value. (Defaults to 0)
  ///
  /// A value can be provided for [descending] as well. If true, the indices in the returned
  /// iterable will count down from the starting index. (Defaults to false)
  Iterable<MapEntry<int, T>> index(
      [int startIndex = 0, bool descending = false]) sync* {
    var index = startIndex;
    for (var o in this) {
      yield MapEntry(index, o);
      index += descending ? -1 : 1;
    }
  }

  /// Returns the elements of this iterable interleaved with the elements of [other].
  ///
  /// The elements of the resulting iterable will consist of the first element of
  /// this iterable followed by the first element of [other], followed by the second
  /// element of this iterable, and so on until both iterables are fully consumed.
  ///
  /// If the iterables are not the same length, the remaining elements of the longer
  /// iterable will be appended to the end of the resulting iterable in iteration
  /// order.
  Iterable<T> interleave(Iterable<T> other) sync* {
    if (other == null) {
      throw ArgumentError.notNull('other');
    }

    final iterator = this.iterator;
    final otherIterator = other.iterator;

    var iteratorClosed = iterator.moveNext();
    var otherIteratorClosed = otherIterator.moveNext();

    do {
      if (!iteratorClosed) yield iterator.current;
      if (!otherIteratorClosed) yield otherIterator.current;
    } while (!(iteratorClosed && otherIteratorClosed));
  }

  /// Returns the elements of this iterable interleaved with the elements of every iterable in
  /// [others].
  ///
  /// The elements of the resulting iterable will consist of the first element of
  /// this iterable followed by the first element of each iterable in [others], followed by the second
  /// element of this iterable, and so on until all iterables are fully consumed.
  ///
  /// If the iterables are not the same length, any iterable which is consumed before iteration is
  /// complete will be skipped for the remainder of iteration.
  Iterable<T> interleaveAll(Iterable<Iterable<T>> others) sync* {
    if (others == null) {
      throw ArgumentError.notNull('others');
    }
    if (others.any((i) => i == null)) {
      throw ArgumentError('Every element in "others" must not be null.');
    }

    final iterators = [
      iterator,
      ...others.map((i) => i.iterator),
    ];

    final isClosedMap = [...iterators.map((i) => i.moveNext())];

    do {
      for (var i = 0; i < iterators.length; i++) {
        if (isClosedMap[i]) yield iterators[i].current;
      }
    } while (isClosedMap.all((b) => !b));
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
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final a = {'1': 1, '2': 2, '3': 3, '4': 4};
  ///       final b = {'1': 1.0, '2': 2.0, '3': 3.0, '5': 5.0};
  ///
  ///       final result = a.entries.joinMap(
  ///         b.entries,
  ///         (x, y) => '${x.value}: ${y.value}',
  ///         outerKeySelector: (x) => x.key,
  ///         innerKeySelector: (y) => y.key,
  ///       );
  ///
  ///       // Result: ['1: 1.0', '2: 2.0', '3: 3.0']
  ///     }
  Iterable<TResult> joinMap<TInner, TKey, TResult>(
    Iterable<TInner> other,
    TResult Function(T, TInner) resultSelector, {
    TKey Function(T) outerKeySelector,
    TKey Function(TInner) innerKeySelector,
    EqualityComparer<TKey> keyComparer,
  }) sync* {
    outerKeySelector ??= (T v) => v as TKey;
    innerKeySelector ??= (TInner v) => v as TKey;
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

  /// Returns an iterable that projects the elements in this iterable upon other
  /// elements in this iterable offset backwards by a given value.
  ///
  /// Every element in this iterable is paired with the element appearing in the
  /// iterable [offset] prior to it. These pairings are then passed to [selector]
  /// which generates the final element yielded to the new iterable.
  ///
  /// For the first [offset] elements in the iterable, the element is paired with
  /// the value passed to [defaultValue].
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = <Object>['a', 'b', 'c', 'd'];
  ///       final result = list.lag(2, (a, b) => '$a$b', defaultValue: 'e');
  ///
  ///       // Result: ['ae', 'be', 'ca', 'db']
  ///     }
  Iterable<TResult> lag<TResult>(
    int offset,
    TResult Function(T, T) selector, {
    T defaultValue,
  }) sync* {
    if (selector == null) {
      throw ArgumentError.notNull('selector');
    }

    final queue = Queue<T>();
    offset = offset < 0 ? -offset : offset;
    var index = 0;

    for (var o in this) {
      queue.add(o);
      if (index >= offset) {
        yield selector(o, queue.removeFirst());
      } else {
        yield selector(o, defaultValue);
      }
      index++;
    }
  }

  /// Returns an iterable that projects the elements in this iterable upon other
  /// elements in this iterable offset forwards by a given value.
  ///
  /// Every element in this iterable is paired with the element appearing in the
  /// iterable [offset] following it. These pairings are then passed to [selector]
  /// which generates the final element yielded to the new iterable.
  ///
  /// For the last [offset] elements in the iterable, the element is paired with
  /// the value passed to [defaultValue].
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = ['a', 'b', 'c', 'd'];
  ///       final result = list.lead(2, (a, b) => '$a$b', defaultValue: 'e');
  ///
  ///       // Result: ['ac', 'bd', 'ce', 'de']
  ///     }
  Iterable<TResult> lead<TResult>(
    int offset,
    TResult Function(T, T) selector, {
    T defaultValue,
  }) sync* {
    if (selector == null) {
      throw ArgumentError.notNull('selector');
    }

    final queue = Queue<T>();
    offset = offset < 0 ? -offset : offset;
    var index = 0;

    for (var o in this) {
      queue.add(o);
      if (index >= offset) {
        yield selector(queue.removeFirst(), o);
      }
      index++;
    }

    while (queue.isNotEmpty) {
      yield selector(queue.removeFirst(), defaultValue);
    }
  }

  /// Moves a range of elements in this iterable to a new position, offsetting
  /// other elements to compensate.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1, 2, 3, 4, 5];
  ///       final result = list.move(3, 2, 0);
  ///
  ///       // Result: [3, 4, 0, 1, 2, 5]
  ///     }
  Iterable<T> move(int from, int count, int to) sync* {
    if (from < 0) {
      ArgumentError.value(
          from, 'from', 'The value of "from" must be greater than zero.');
    }
    if (count < 0) {
      ArgumentError.value(
          count, 'count', 'The value of "count" must be greater than zero.');
    }
    if (to < 0) {
      ArgumentError.value(
          to, 'to', 'The value of "to" must be greater than zero.');
    }

    if (from == to || count == 0) {
      yield* this;
      return;
    }

    Iterable<T> _innerMove(
        int startIndex, int yieldIndex, int bufferSize) sync* {
      final iterator = this.iterator;
      var hasMore = true;

      bool moveNext() => hasMore && (hasMore = iterator.moveNext());

      for (var i = 0; i < from && moveNext(); i++) {
        yield iterator.current;
      }

      final buffer = List<T>(bufferSize);
      var length = 0;

      for (; length < bufferSize && moveNext(); length++) {
        buffer[length] = iterator.current;
      }

      for (var i = 0; i < yieldIndex && moveNext(); i++) {
        yield iterator.current;
      }

      for (var i = 0; i < length; i++) {
        yield buffer[i];
      }

      while (moveNext()) {
        yield iterator.current;
      }
    }

    yield* to < from
        ? _innerMove(to, count, from - to)
        : _innerMove(from, to - from, count);
  }

  /// Returns this iterable with all null values excluded.
  ///
  /// If this iterable doesn't contain any null values, the
  /// iterable will be unaffected.
  Iterable<T> nonNull() sync* {
    for (var o in this) {
      if (o != null) {
        yield o;
      }
    }
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
  /// Example:
  ///
  ///     void main() {
  ///       final list = <num>[0, 1.0, 2, 3.5];
  ///       final result = list.ofType<int>();
  ///
  ///       // Result: [0, 2]
  ///     }
  ///
  /// (This is a convenience method to maintain naming-consistency with its .NET LINQ equivalent.
  /// Internally it functions identically to [whereType].)
  Iterable<TOther> ofType<TOther>() => whereType<TOther>();

  /// Returns all elements in the iterable that are castable to one of the specified
  /// types.
  ///
  /// After applying [ofType2] to an iterable, the resulting iterable will
  /// consist of all elements in the source iterable that can be safely cast
  /// to `T1` or `T2`, omitting all elements that cannot.
  ///
  /// If all elements in the source iterable can be safely cast to one of the provided types,
  /// the resulting iterable will be unchanged.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = <Object>[0, 1.2, 'a', true];
  ///       final result = list.ofType<int, double>();
  ///
  ///       // Result: [0, 1.2]
  ///     }
  Iterable<T> ofType2<T1, T2>() sync* {
    for (var o in this) {
      if (o is T1 || o is T2) {
        yield o;
      }
    }
  }

  /// Returns all elements in the iterable that are castable to one of the specified
  /// types.
  ///
  /// After applying [ofType3] to an iterable, the resulting iterable will
  /// consist of all elements in the source iterable that can be safely cast
  /// to `T1`, `T2`, or `T3`, omitting all elements that cannot.
  ///
  /// If all elements in the source iterable can be safely cast to one of the provided types,
  /// the resulting iterable will be unchanged.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = <Object>[0, 1.2, 'a', true];
  ///       final result = list.ofType3<int, double, String>();
  ///
  ///       // Result: [0, 1.2, 'a']
  ///     }
  Iterable<T> ofType3<T1, T2, T3>() sync* {
    for (var o in this) {
      if (o is T1 || o is T2 || o is T3) {
        yield o;
      }
    }
  }

  /// Returns all elements in the iterable that are castable to one of the specified
  /// types.
  ///
  /// After applying [ofType4] to an iterable, the resulting iterable will
  /// consist of all elements in the source iterable that can be safely cast
  /// to `T1`, `T2`, `T3`, or `T4`, omitting all elements that cannot.
  ///
  /// If all elements in the source iterable can be safely cast to one of the provided types,
  /// the resulting iterable will be unchanged.
  Iterable<T> ofType4<T1, T2, T3, T4>() sync* {
    for (var o in this) {
      if (o is T1 || o is T2 || o is T3 || o is T4) {
        yield o;
      }
    }
  }

  /// Returns all elements in the iterable that are castable to one of the specified
  /// types.
  ///
  /// After applying [ofType5] to an iterable, the resulting iterable will
  /// consist of all elements in the source iterable that can be safely cast
  /// to `T1`, `T2`, `T3`, `T4` or `T5`, omitting all elements that cannot.
  ///
  /// If all elements in the source iterable can be safely cast to one of the provided types,
  /// the resulting iterable will be unchanged.
  Iterable<T> ofType5<T1, T2, T3, T4, T5>() sync* {
    for (var o in this) {
      if (o is T1 || o is T2 || o is T3 || o is T4 || o is T5) {
        yield o;
      }
    }
  }

  /// Returns all elements in the iterable that are castable to one of the specified
  /// types.
  ///
  /// After applying [ofType6] to an iterable, the resulting iterable will
  /// consist of all elements in the source iterable that can be safely cast
  /// to `T1`, `T2`, `T3`, `T4`, `T5` or `T6`, omitting all elements that cannot.
  ///
  /// If all elements in the source iterable can be safely cast to one of the provided types,
  /// the resulting iterable will be unchanged.
  Iterable<T> ofType6<T1, T2, T3, T4, T5, T6>() sync* {
    for (var o in this) {
      if (o is T1 || o is T2 || o is T3 || o is T4 || o is T5 || o is T6) {
        yield o;
      }
    }
  }

  /// Returns all elements in the iterable that are castable to one of the specified
  /// types.
  ///
  /// After applying [ofType7] to an iterable, the resulting iterable will
  /// consist of all elements in the source iterable that can be safely cast
  /// to `T1`, `T2`, `T3`, `T4`, `T5`, `T6` or `T7`, omitting all elements that cannot.
  ///
  /// If all elements in the source iterable can be safely cast to one of the provided types,
  /// the resulting iterable will be unchanged.
  Iterable<T> ofType7<T1, T2, T3, T4, T5, T6, T7>() sync* {
    for (var o in this) {
      if (o is T1 ||
          o is T2 ||
          o is T3 ||
          o is T4 ||
          o is T5 ||
          o is T6 ||
          o is T7) {
        yield o;
      }
    }
  }

  /// Returns all elements in the iterable that are castable to one of the specified
  /// types.
  ///
  /// After applying [ofType8] to an iterable, the resulting iterable will
  /// consist of all elements in the source iterable that can be safely cast
  /// to `T1`, `T2`, `T3`, `T4`, `T5`, `T6`, `T7` or `T8`, omitting all elements that cannot.
  ///
  /// If all elements in the source iterable can be safely cast to one of the provided types,
  /// the resulting iterable will be unchanged.
  Iterable<T> ofType8<T1, T2, T3, T4, T5, T6, T7, T8>() sync* {
    for (var o in this) {
      if (o is T1 ||
          o is T2 ||
          o is T3 ||
          o is T4 ||
          o is T5 ||
          o is T6 ||
          o is T7 ||
          o is T8) {
        yield o;
      }
    }
  }

  /// Returns all elements in the iterable that are castable to one of the specified
  /// types.
  ///
  /// After applying [ofType9] to an iterable, the resulting iterable will
  /// consist of all elements in the source iterable that can be safely cast
  /// to `T1`, `T2`, `T3`, `T4`, `T5`, `T6`, `T7`, `T8` or `T9`, omitting all elements that cannot.
  ///
  /// If all elements in the source iterable can be safely cast to one of the provided types,
  /// the resulting iterable will be unchanged.
  Iterable<T> ofType9<T1, T2, T3, T4, T5, T6, T7, T8, T9>() sync* {
    for (var o in this) {
      if (o is T1 ||
          o is T2 ||
          o is T3 ||
          o is T4 ||
          o is T5 ||
          o is T6 ||
          o is T7 ||
          o is T8 ||
          o is T9) {
        yield o;
      }
    }
  }

  /// Returns the exclusive prefix sum of this iterable.
  ///
  /// The first element of the returned iterable will be the initial value. Each
  /// subsequent element is the [aggregator] function applied to the previous
  /// value and the corresponding element in this iterable.
  ///
  /// The resulting iterable will have the same length as this iterable. As such,
  /// the final element in this iterable is ignored.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 2, 3, 4];
  ///       final result = list.prescan(0, (a, b) => a + b);
  ///
  ///       // Result: [0, 1, 3, 6]
  ///     }
  Iterable<T> prescan(T initialValue, T Function(T, T) aggregator) sync* {
    final iterator = this.iterator;
    if (!iterator.moveNext()) {
      return;
    }

    var lastValue = initialValue;
    var sum = aggregator(lastValue, iterator.current);
    yield sum;

    lastValue = iterator.current;

    do {
      sum = aggregator(sum, lastValue);
      lastValue = iterator.current;
      yield sum;
    } while (iterator.moveNext());
  }

  /// Returns the exclusive prefix sum of this iterable.
  ///
  /// The first element of the returned iterable will be the initial value. Each
  /// subsequent element is the [aggregator] function applied to the previous
  /// value and the corresponding element in this iterable.
  ///
  /// The resulting iterable will have the same length as this iterable. As such,
  /// the final element in this iterable is ignored.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 2, 3, 4];
  ///       final result = list.prescan(0, (a, b) => a + b);
  ///
  ///       // Result: [0, 1, 3, 6]
  ///     }
  Iterable<T> scan(T Function(T, T) aggregator) sync* {
    final iterator = this.iterator;
    if (!iterator.moveNext()) {
      return;
    }

    var sum = iterator.current;
    yield sum;

    while (iterator.moveNext()) {
      sum = aggregator(sum, iterator.current);
      yield sum;
    }
  }

  /// Applies a mapping function to the elements in the iterable.
  ///
  /// During iteration, the [selector] function is provided each value in the iterable
  /// along with the index of the value in the iteration. The returned value of that
  /// function is then provided as the next element of the resulting iterable.
  ///
  ///     void main() {
  ///       final list = ['a', 'b', 'c', 'd'];
  ///       final result = list.select((c, i) => '$i_$c');
  ///
  ///       // Result: ['0_a', '1_b', '2_c', '3_d']
  ///     }
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
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = ['abc', 'de', 'f', 'ghij'];
  ///       final result = list.selectMany((s, i) => s.iterable);
  ///
  ///       // Result: ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j']
  ///     }
  Iterable<TResult> selectMany<TResult>(
      Iterable<TResult> Function(T, int) selector) sync* {
    var index = 0;
    for (var v in this) {
      yield* selector(v, index++);
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
  ///
  /// Example:
  ///
  ///     void main() {
  ///       var listA = [1, 2, 3, 4];
  ///       var listB = [5.0, 6.0, 7.0];
  ///       var result = listA.zip(listB, (a, b) => '$a: $b');
  ///
  ///       // Result: [ '1: 5.0', '2: 6.0', '7: 7.0' ]
  ///     }
  Iterable<TResult> zip<TOther, TResult>(
      Iterable<TOther> other, TResult Function(T, TOther) selector) sync* {
    final sourceIterator = iterator;
    final otherIterator = other.iterator;

    while (sourceIterator.moveNext() && otherIterator.moveNext()) {
      yield selector(sourceIterator.current, otherIterator.current);
    }
  }
}
