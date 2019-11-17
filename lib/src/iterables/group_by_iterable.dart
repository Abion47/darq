import '../equality_comparer.dart';
import '../grouping.dart';
import '../lookup.dart';

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
