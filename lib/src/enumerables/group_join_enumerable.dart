import '../iterators/group_join_iterator.dart';
import '../equality_comparer.dart';
import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../typedefs.dart';

class GroupJoinEnumerable<TSource, TInner, TKey, TResult>
    extends Enumerable<TResult> with EnumerableWithSource<TSource> {
  final Iterable<TInner> inner;
  final Selector<TSource, TKey> outerKeySelector;
  final Selector<TInner, TKey> innerKeySelector;
  final GroupSelector<TSource, Iterable<TInner>, TResult> resultSelector;
  final EqualityComparer<TKey> keyComparer;

  GroupJoinEnumerable(
      Enumerable<TSource> source,
      this.inner,
      this.outerKeySelector,
      this.innerKeySelector,
      this.resultSelector,
      EqualityComparer<TKey> keyComparer)
      : this.keyComparer = keyComparer ?? EqualityComparer.forType<TKey>() {
    this.src = source;
  }

  @override
  Iterator<TResult> get iterator => GroupJoinIterator(this);
}
