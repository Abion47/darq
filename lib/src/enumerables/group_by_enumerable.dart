import '../equality_comparer.dart';
import '../lookup.dart';
import '../typedefs.dart';
import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../grouping.dart';

class GroupByEnumerable<TSource, TKey>
    extends Enumerable<IGrouping<TKey, TSource>>
    with EnumerableWithSource<TSource> {
  final Selector<TSource, TKey> keySelector;
  final EqualityComparer<TKey> keyComparer;

  GroupByEnumerable(Enumerable<TSource> source, this.keySelector,
      EqualityComparer<TKey> keyComparer)
      : this.keyComparer = keyComparer ?? EqualityComparer.forType<TKey>() {
    this.src = source;
  }

  @override
  Iterator<IGrouping<TKey, TSource>> get iterator {
    return Lookup.create<TSource, TKey, TSource>(
            source, keySelector, (a) => a, keyComparer)
        .iterator;
  }
}
