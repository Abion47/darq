import '../equality_comparer.dart';
import '../lookup.dart';
import '../typedefs.dart';
import '../enumerable.dart';
import '../enumerable_with_source.dart';

class GroupSelectValueEnumerable<TSource, TKey, TValue, TResult>
    extends Enumerable<TResult> implements EnumerableWithSource<TSource> {
  final Enumerable<TSource> source;
  final Selector<TSource, TKey> keySelector;
  final Selector<TSource, TValue> valueSelector;
  final GroupSelector<TKey, Iterable<TValue>, TResult> resultSelector;
  final EqualityComparer<TKey> keyComparer;

  const GroupSelectValueEnumerable(this.source, this.keySelector,
      this.valueSelector, this.resultSelector, this.keyComparer);

  @override
  Iterator<TResult> get iterator {
    final lookup = Lookup.create<TSource, TKey, TValue>(
        source, keySelector, valueSelector, keyComparer);
    return lookup.applyResultSelector<TResult>(resultSelector).iterator;
  }
}
