import '../equality_comparer.dart';
import '../grouping.dart';
import '../lookup.dart';

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
