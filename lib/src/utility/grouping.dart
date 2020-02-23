import 'equality_comparer.dart';
import 'lookup.dart';

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

class GroupJoinIterator<TSource, TInner, TKey, TResult>
    extends Iterator<TResult> {
  final GroupJoinIterable<TSource, TInner, TKey, TResult> iterable;

  GroupJoinIterator(this.iterable);

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

class Grouping<TKey, TValue> extends Iterable<TValue> {
  List<TValue> elements;
  Grouping hashNext;
  Grouping next;
  TKey key;
  int hash;

  int get count => elements.length;

  @override
  Iterator<TValue> get iterator => elements.iterator;

  void add(TValue value) {
    elements.add(value);
  }

  bool containsValue(TValue value) => elements.contains(value);
  int indexOf(TValue value) => elements.indexOf(value);

  TValue operator [](int index) => elements[index];

  @override
  int get hashCode => hash;
}
