import '../equality_comparer.dart';
import '../grouping.dart';
import '../lookup.dart';
import '../tuple.dart';

extension GroupedIterableExtensions<T> on Iterable<T> {
  /// Groups elements in the iterator into batches of [size] length, optionally
  /// truncating elements that don't fit into a full-size batch.
  ///
  /// Iterates through the iterator and groups elements into a secondary list
  /// of [size] length. Once the list is full, the list is then yielded.
  ///
  /// If [includeTail] is false, when the source iteration is complete, any
  /// remaining elements are discarded. If true, these elements are returned as
  /// a final list of some length less than [size]. (False by default.)
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 2, 3, 4, 5, 6];
  ///       final result = list.batch(2);
  ///
  ///       // Result: [[1, 2], [3, 4], [5, 6]]
  ///     }
  Iterable<Iterable<T>> batch(int size, {bool includeTail = false}) sync* {
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

  /// Groups elements in the iterator into batches of [size] length and puts them
  /// through a mapping function, optionally truncating elements that don't fit
  /// into a full-size batch.
  ///
  /// Iterates through the iterator and groups elements into a secondary list
  /// of [size] length. Once the list is full, the list is then passed to [selector]
  /// which maps them to the result type.
  ///
  /// If [includeTail] is false, when the source iteration is complete, any
  /// remaining elements are discarded. If true, these elements are returned as
  /// a final list of some length less than [size]. (False by default.)
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 2, 3, 4, 5, 6];
  ///       final result = list.batchSelect(2, (b) => b.toString());
  ///
  ///       // Result: ['[1, 2]', '[3, 4]', '[5, 6]']
  ///     }
  Iterable<TResult> batchSelect<TResult>(
    int size,
    TResult Function(List<T> batch) selector, {
    bool includeTail = false,
  }) sync* {
    var package = List<T>(size);
    var index = 0;

    for (var v in this) {
      package[index++] = v;
      if (index >= package.length) {
        yield selector(package);
        package = List<T>(size);
        index = 0;
      }
    }

    if (index > 0 && includeTail) {
      yield selector(List<T>.of(package.sublist(0, index)));
    }
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
  ///

  ///
  _GroupByIterable<T, TKey> groupBy<TKey>(
    TKey Function(T) keySelector, {
    EqualityComparer<TKey> keyComparer,
  }) {
    keySelector ??= (T v) => v as TKey;
    keyComparer ??= EqualityComparer.forType<TKey>();

    return _GroupByIterable<T, TKey>(this, keySelector, keyComparer);
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
  ///

  ///
  _GroupByValueIterable<T, TKey, TValue> groupByValue<TKey, TValue>({
    TKey Function(T) keySelector,
    TValue Function(T) valueSelector,
    EqualityComparer<TKey> keyComparer,
  }) {
    keySelector ??= (T v) => v as TKey;
    valueSelector ??= (T v) => v as TValue;
    keyComparer ??= EqualityComparer.forType<TKey>();

    return _GroupByValueIterable<T, TKey, TValue>(
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
  ///

  ///
  _GroupJoinIterable<T, TInner, TKey, TResult> groupJoin<TInner, TKey, TResult>(
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

    return _GroupJoinIterable<T, TInner, TKey, TResult>(this, other,
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
  _GroupSelectIterable<T, TKey, TResult> groupSelect<TKey, TResult>(
    TResult Function(TKey, Iterable<T>) resultSelector, {
    TKey Function(T) keySelector,
    EqualityComparer<TKey> keyComparer,
  }) {
    keySelector ??= (T v) => v as TKey;
    keyComparer ??= EqualityComparer.forType<TKey>();

    return _GroupSelectIterable<T, TKey, TResult>(
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
  ///

  ///
  _GroupSelectValueIterable<T, TKey, TValue, TResult>
      groupSelectValue<TKey, TValue, TResult>(
    TResult Function(TKey, Iterable<TValue>) resultSelector, {
    TKey Function(T) keySelector,
    TValue Function(T) valueSelector,
    EqualityComparer<TKey> keyComparer,
  }) {
    keySelector ??= (T v) => v as TKey;
    valueSelector ??= (T v) => v as TValue;
    keyComparer ??= EqualityComparer.forType<TKey>();

    return _GroupSelectValueIterable(
        this, keySelector, valueSelector, resultSelector, keyComparer);
  }

  /// Returns an iterable that pairs every element with the element before it.
  ///
  /// Every element returned by this method is a [Tuple2] containing every element
  /// in this iterable paired with the element that comes before it, with the exception
  /// of the first element. As such, the length of the returned iterable will be
  /// one less than this iterable.
  ///
  /// If this iterable is empty or only contains one element, a [StateError] will be
  /// thrown.
  Iterable<Tuple2<T, T>> pairwise() sync* {
    final iterator = this.iterator;
    if (!iterator.moveNext()) {
      throw StateError('Cannot perform pairwise on an empty iterable.');
    }

    var lastValue = iterator.current;

    if (!iterator.moveNext()) {
      throw StateError(
          'Cannot perform pairwise on an iterable with only one element.');
    }

    do {
      yield Tuple2(lastValue, iterator.current);
    } while (iterator.moveNext());
  }

  /// Returns a [Tuple2] dividing this iterable into two iterables, one iterable
  /// containing elements that match the condition and one containing elements
  /// that do not.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 2, 3, 4];
  ///       final result = list.partition((x) => x % 2 == 0);
  ///
  ///       // Result: ([2, 4], [1, 3])
  ///     }
  Tuple2<Iterable<T>, Iterable<T>> partition(bool Function(T) condition) {
    return Tuple2(
      where((o) => condition(o)),
      where((o) => !condition(o)),
    );
  }
}

class _GroupByIterable<TSource, TKey>
    extends Iterable<Grouping<TKey, TSource>> {
  final Iterable<TSource> source;
  final TKey Function(TSource) keySelector;
  final EqualityComparer<TKey> keyComparer;

  const _GroupByIterable(this.source, this.keySelector, this.keyComparer);

  @override
  Iterator<Grouping<TKey, TSource>> get iterator {
    return Lookup.create<TSource, TKey, TSource>(
            source, keySelector, (a) => a, keyComparer)
        .iterator;
  }
}

class _GroupByValueIterable<TSource, TKey, TValue>
    extends Iterable<Grouping<TKey, TValue>> {
  final Iterable<TSource> source;
  final TKey Function(TSource) keySelector;
  final TValue Function(TSource) valueSelector;
  final EqualityComparer<TKey> keyComparer;

  const _GroupByValueIterable(
      this.source, this.keySelector, this.valueSelector, this.keyComparer);

  @override
  Iterator<Grouping<TKey, TValue>> get iterator {
    return Lookup.create<TSource, TKey, TValue>(
            source, keySelector, valueSelector, keyComparer)
        .iterator;
  }
}

class _GroupJoinIterable<TSource, TInner, TKey, TResult>
    extends Iterable<TResult> {
  final Iterable<TSource> source;
  final Iterable<TInner> inner;
  final TKey Function(TSource) outerKeySelector;
  final TKey Function(TInner) innerKeySelector;
  final TResult Function(TSource, Iterable<TInner>) resultSelector;
  final EqualityComparer<TKey> keyComparer;

  const _GroupJoinIterable(this.source, this.inner, this.outerKeySelector,
      this.innerKeySelector, this.resultSelector, this.keyComparer);

  @override
  Iterator<TResult> get iterator => _GroupJoinIterator(this);
}

class _GroupJoinIterator<TSource, TInner, TKey, TResult>
    extends Iterator<TResult> {
  final _GroupJoinIterable<TSource, TInner, TKey, TResult> iterable;

  _GroupJoinIterator(this.iterable);

  Lookup<TKey, TInner> _lookup;

  TResult _current;
  @override
  TResult get current => _current;

  Iterator<TSource> _sourceIterator;

  @override
  bool moveNext() {
    if (_sourceIterator == null) {
      _sourceIterator = iterable.source.iterator;
      _lookup = Lookup.createForJoin<TKey, TInner>(
          iterable.inner, iterable.innerKeySelector, iterable.keyComparer);
    }

    if (_sourceIterator.moveNext()) {
      final item = _sourceIterator.current;
      _current = iterable.resultSelector(
          item, _lookup[iterable.outerKeySelector(item)]);
      return true;
    }

    _sourceIterator = null;
    _lookup = null;
    _current = null;
    return false;
  }
}

class _GroupSelectIterable<TSource, TKey, TResult> extends Iterable<TResult> {
  final Iterable<TSource> source;
  final TKey Function(TSource) keySelector;
  final TResult Function(TKey, Iterable<TSource>) resultSelector;
  final EqualityComparer<TKey> keyComparer;

  const _GroupSelectIterable(
      this.source, this.keySelector, this.resultSelector, this.keyComparer);

  @override
  Iterator<TResult> get iterator {
    final lookup = Lookup.create<TSource, TKey, TSource>(
        source, keySelector, (e) => e, keyComparer);
    return lookup.applyResultSelector<TResult>(resultSelector).iterator;
  }
}

class _GroupSelectValueIterable<TSource, TKey, TValue, TResult>
    extends Iterable<TResult> {
  final Iterable<TSource> source;
  final TKey Function(TSource) keySelector;
  final TValue Function(TSource) valueSelector;
  final TResult Function(TKey, Iterable<TValue>) resultSelector;
  final EqualityComparer<TKey> keyComparer;

  const _GroupSelectValueIterable(this.source, this.keySelector,
      this.valueSelector, this.resultSelector, this.keyComparer);

  @override
  Iterator<TResult> get iterator {
    final lookup = Lookup.create<TSource, TKey, TValue>(
        source, keySelector, valueSelector, keyComparer);
    return lookup.applyResultSelector<TResult>(resultSelector).iterator;
  }
}
