import '../equality_comparer.dart';
import '../lookup.dart';
import '../typedefs.dart';
import '../enumerable.dart';
import '../enumerable_with_source.dart';

class GroupSelectEnumerable<TSource, TKey, TResult> extends Enumerable<TResult>
    with EnumerableWithSource<TSource> {
  final Selector<TSource, TKey> keySelector;
  final GroupSelector<TKey, Iterable<TSource>, TResult> resultSelector;
  final EqualityComparer<TKey> keyComparer;

  GroupSelectEnumerable(Enumerable<TSource> source, this.keySelector,
      this.resultSelector, EqualityComparer<TKey> keyComparer)
      : this.keyComparer = keyComparer ?? EqualityComparer.forType<TKey>() {
    this.src = source;
  }

  @override
  Iterator<TResult> get iterator {
    final lookup = Lookup.create<TSource, TKey, TSource>(
        source, keySelector, (e) => e, keyComparer);
    return lookup.applyResultSelector(resultSelector).iterator;
  }
}
