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
