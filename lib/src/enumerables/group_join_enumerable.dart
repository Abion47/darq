import '../iterators/group_join_iterator.dart';
import '../equality_comparer.dart';
import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../typedefs.dart';

class GroupJoinEnumerable<TSource, TInner, TKey, TResult>
    extends Enumerable<TResult> implements EnumerableWithSource<TSource> {
  final Enumerable<TSource> source;
  final Iterable<TInner> inner;
  final Selector<TSource, TKey> outerKeySelector;
  final Selector<TInner, TKey> innerKeySelector;
  final GroupSelector<TSource, Iterable<TInner>, TResult> resultSelector;
  final EqualityComparer<TKey> keyComparer;

  const GroupJoinEnumerable(this.source, this.inner, this.outerKeySelector,
      this.innerKeySelector, this.resultSelector, this.keyComparer);

  @override
  Iterator<TResult> get iterator => GroupJoinIterator(this);
}
