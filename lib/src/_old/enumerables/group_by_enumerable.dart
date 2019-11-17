import '../equality_comparer.dart';
import '../lookup.dart';
import '../typedefs.dart';
import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../grouping.dart';

class GroupByEnumerable<TSource, TKey>
    extends Enumerable<Grouping<TKey, TSource>>
    implements EnumerableWithSource<TSource> {
  final Enumerable<TSource> source;
  final Selector<TSource, TKey> keySelector;
  final EqualityComparer<TKey> keyComparer;

  const GroupByEnumerable(this.source, this.keySelector, this.keyComparer);

  @override
  Iterator<Grouping<TKey, TSource>> get iterator {
    return Lookup.create<TSource, TKey, TSource>(
            source, keySelector, (a) => a, keyComparer)
        .iterator;
  }
}
