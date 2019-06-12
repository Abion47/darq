import '../equality_comparer.dart';
import '../grouping.dart';
import '../lookup.dart';
import '../typedefs.dart';
import '../enumerable.dart';
import '../enumerable_with_source.dart';

class GroupByValueEnumerable<TSource, TKey, TValue> extends Enumerable<IGrouping<TKey, TValue>> with EnumerableWithSource<TSource> {
  final Selector<TSource, TKey> keySelector;
  final Selector<TSource, TValue> valueSelector;
  final EqualityComparer<TKey> keyComparer;

  GroupByValueEnumerable(Enumerable<TSource> source, this.keySelector, this.valueSelector, EqualityComparer<TKey> keyComparer)
    : this.keyComparer = keyComparer ?? EqualityComparer.forType<TKey>() {
    this.src = source;
  }
  
  @override
  Iterator<IGrouping<TKey, TValue>> get iterator {
    return Lookup.create<TSource, TKey, TValue>(source, keySelector, valueSelector, keyComparer).iterator;
  }
}