import '../equality_comparer.dart';
import '../grouping.dart';
import '../lookup.dart';
import '../typedefs.dart';
import '../enumerable.dart';
import '../enumerable_with_source.dart';

class GroupByValueEnumerable<TSource, TKey, TValue>
    extends Enumerable<Grouping<TKey, TValue>>
    implements EnumerableWithSource<TSource> {
  final Enumerable<TSource> source;
  final Selector<TSource, TKey> keySelector;
  final Selector<TSource, TValue> valueSelector;
  final EqualityComparer<TKey> keyComparer;

  const GroupByValueEnumerable(
      this.source, this.keySelector, this.valueSelector, this.keyComparer);

  @override
  Iterator<Grouping<TKey, TValue>> get iterator {
    return Lookup.create<TSource, TKey, TValue>(
            source, keySelector, valueSelector, keyComparer)
        .iterator;
  }
}
