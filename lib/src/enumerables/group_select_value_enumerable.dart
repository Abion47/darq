import '../equality_comparer.dart';
import '../lookup.dart';
import '../typedefs.dart';
import '../enumerable.dart';
import '../enumerable_with_source.dart';

class GroupSelectValueEnumerable<TSource, TKey, TValue, TResult>
    extends Enumerable<TResult> with EnumerableWithSource<TSource> {
  final Selector<TSource, TKey> keySelector;
  final Selector<TSource, TValue> valueSelector;
  final GroupSelector<TKey, Iterable<TValue>, TResult> resultSelector;
  final EqualityComparer<TKey> keyComparer;

  GroupSelectValueEnumerable(
      Enumerable<TSource> source,
      this.keySelector,
      this.valueSelector,
      this.resultSelector,
      EqualityComparer<TKey> keyComparer)
      : this.keyComparer = keyComparer ?? EqualityComparer.forType<TKey>() {
    this.src = source;
  }

  @override
  Iterator<TResult> get iterator {
    final lookup = Lookup.create<TSource, TKey, TValue>(
        source, keySelector, valueSelector, keyComparer);
    return lookup.applyResultSelector<TResult>(resultSelector).iterator;
  }
}
