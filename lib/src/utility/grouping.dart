import '../extensions/sequence_equals.dart';
import 'equality_comparer.dart';
import 'lookup.dart';

/// This class is created by calls to `Iterable.groupBy` and isn't intended to be
/// instantiated directly.
class GroupByIterable<TSource, TKey> extends Iterable<Grouping<TKey, TSource>> {
  final Iterable<TSource> source;
  final TKey Function(TSource) keySelector;
  final EqualityComparer<TKey> keyComparer;

  const GroupByIterable(this.source, this.keySelector, this.keyComparer);

  @override
  Iterator<Grouping<TKey, TSource>> get iterator {
    return Lookup.create<TSource, TKey, TSource>(
            source, keySelector, (a) => a, keyComparer)
        .iterator;
  }
}

/// This class is created by calls to `Iterable.groupByValue` and isn't intended to be
/// instantiated directly.
class GroupByValueIterable<TSource, TKey, TValue>
    extends Iterable<Grouping<TKey, TValue>> {
  final Iterable<TSource> source;
  final TKey Function(TSource) keySelector;
  final TValue Function(TSource) valueSelector;
  final EqualityComparer<TKey> keyComparer;

  const GroupByValueIterable(
      this.source, this.keySelector, this.valueSelector, this.keyComparer);

  @override
  Iterator<Grouping<TKey, TValue>> get iterator {
    return Lookup.create<TSource, TKey, TValue>(
            source, keySelector, valueSelector, keyComparer)
        .iterator;
  }
}

/// This class is created by calls to `Iterable.groupJoin` and isn't intended to be
/// instantiated directly.
class GroupJoinIterable<TSource, TInner, TKey, TResult>
    extends Iterable<TResult> {
  final Iterable<TSource> source;
  final Iterable<TInner> inner;
  final TKey Function(TSource) outerKeySelector;
  final TKey Function(TInner) innerKeySelector;
  final TResult Function(TSource, Iterable<TInner>) resultSelector;
  final EqualityComparer<TKey> keyComparer;

  const GroupJoinIterable(this.source, this.inner, this.outerKeySelector,
      this.innerKeySelector, this.resultSelector, this.keyComparer);

  @override
  Iterator<TResult> get iterator => GroupJoinIterator(this);
}

/// This class is created by calls to `Iterable.groupJoinIterator` and isn't intended to be
/// instantiated directly.
class GroupJoinIterator<TSource, TInner, TKey, TResult>
    implements Iterator<TResult> {
  final GroupJoinIterable<TSource, TInner, TKey, TResult> iterable;

  GroupJoinIterator(this.iterable) {
    _sourceIterator = iterable.source.iterator;
    _lookup = Lookup.createForJoin<TKey, TInner>(
        iterable.inner, iterable.innerKeySelector, iterable.keyComparer);
  }

  late Lookup<TKey, TInner> _lookup;
  late Iterator<TSource> _sourceIterator;

  TResult? _current;
  @override
  TResult get current {
    if (_current == null) {
      throw StateError('Cannot get current before starting iteration');
    }
    return _current!;
  }

  @override
  bool moveNext() {
    if (_sourceIterator.moveNext()) {
      final item = _sourceIterator.current;
      _current = iterable.resultSelector(
          item, _lookup[iterable.outerKeySelector(item)]);
      return true;
    }

    _current = null;
    return false;
  }
}

/// This class is created by calls to `Iterable.groupSelectIterable` and isn't intended to be
/// instantiated directly.
class GroupSelectIterable<TSource, TKey, TResult> extends Iterable<TResult> {
  final Iterable<TSource> source;
  final TKey Function(TSource) keySelector;
  final TResult Function(TKey, Iterable<TSource>) resultSelector;
  final EqualityComparer<TKey> keyComparer;

  const GroupSelectIterable(
      this.source, this.keySelector, this.resultSelector, this.keyComparer);

  @override
  Iterator<TResult> get iterator {
    final lookup = Lookup.create<TSource, TKey, TSource>(
        source, keySelector, (e) => e, keyComparer);
    return lookup.applyResultSelector<TResult>(resultSelector).iterator;
  }
}

/// This class is created by calls to `Iterable.groupSelectValueIterable` and isn't intended to be
/// instantiated directly.
class GroupSelectValueIterable<TSource, TKey, TValue, TResult>
    extends Iterable<TResult> {
  final Iterable<TSource> source;
  final TKey Function(TSource) keySelector;
  final TValue Function(TSource) valueSelector;
  final TResult Function(TKey, Iterable<TValue>) resultSelector;
  final EqualityComparer<TKey> keyComparer;

  const GroupSelectValueIterable(this.source, this.keySelector,
      this.valueSelector, this.resultSelector, this.keyComparer);

  @override
  Iterator<TResult> get iterator {
    final lookup = Lookup.create<TSource, TKey, TValue>(
        source, keySelector, valueSelector, keyComparer);
    return lookup.applyResultSelector<TResult>(resultSelector).iterator;
  }
}

/// This class is created by calls to grouping `Iterable` methods and isn't
/// intended to be instantiated directly.
class Grouping<TKey, TValue> extends Iterable<TValue> {
  List<TValue> elements;
  TKey key;
  int hash;

  Grouping<TKey, TValue>? hashNext;
  Grouping<TKey, TValue>? next;

  int get count => elements.length;

  Grouping(this.elements, this.key, this.hash);

  @override
  Iterator<TValue> get iterator => elements.iterator;

  void add(TValue value) {
    elements.add(value);
  }

  bool containsValue(TValue value) => elements.contains(value);
  int indexOf(TValue value) => elements.indexOf(value);

  TValue operator [](int index) => elements[index];

  @override
  int get hashCode => Object.hashAll(elements);

  @override
  bool operator ==(Object other) {
    if (other is! Grouping<TKey, TValue>) return false;
    return hash == other.hash && elements.sequenceEquals(other.elements);
  }

  @override
  String toString() => '{$key: $elements}';
}
