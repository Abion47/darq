import '../lookup.dart';
import '../enumerable_iterator.dart';
import '../enumerables/group_join_enumerable.dart';

class GroupJoinIterator<TSource, TInner, TKey, TResult>
    extends EnumerableIterator<TSource, TResult> {
  GroupJoinIterator(
      GroupJoinEnumerable<TSource, TInner, TKey, TResult> enumerable)
      : super.of(enumerable);

  Lookup<TKey, TInner> _lookup;

  @override
  bool moveNext() {
    final castEnum =
        enumerable as GroupJoinEnumerable<TSource, TInner, TKey, TResult>;

    if (sourceIterator == null) {
      sourceIterator = enumerable.source.iterator;
      _lookup = Lookup.createForJoin<TKey, TInner>(
          castEnum.inner, castEnum.innerKeySelector, castEnum.keyComparer);
    }

    if (sourceIterator.moveNext()) {
      final item = sourceIterator.current;
      current = castEnum.resultSelector(
          item, _lookup[castEnum.outerKeySelector(item)]);
      return true;
    }

    sourceIterator = null;
    _lookup = null;
    current = null;
    return false;
  }
}
