import '../equality_comparer.dart';
import '../lookup.dart';

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
  final GroupJoinIterable<TSource, TInner, TKey, TResult> enumerable;

  GroupJoinIterator(this.enumerable);

  Lookup<TKey, TInner> _lookup;

  TResult _current;
  TResult get current => _current;

  Iterator<TSource> _sourceIterator;

  @override
  bool moveNext() {
    if (_sourceIterator == null) {
      _sourceIterator = enumerable.source.iterator;
      _lookup = Lookup.createForJoin<TKey, TInner>(enumerable.inner,
          enumerable.innerKeySelector, enumerable.keyComparer);
    }

    if (_sourceIterator.moveNext()) {
      final item = _sourceIterator.current;
      _current = enumerable.resultSelector(
          item, _lookup[enumerable.outerKeySelector(item)]);
      return true;
    }

    _sourceIterator = null;
    _lookup = null;
    _current = null;
    return false;
  }
}
