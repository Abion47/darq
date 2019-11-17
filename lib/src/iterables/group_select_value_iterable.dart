import '../equality_comparer.dart';
import '../lookup.dart';

class GroupSelectValueIterable<TSource, TKey, TValue, TResult>
    extends Iterable<TResult> {
  final Iterable<TSource> source;
  final TKey Function(TSource) keySelector;
  final TValue Function(TSource) valueSelector;
  final TResult Function(TKey, Iterable<TValue>) resultSelector;
  final EqualityComparer<TKey> keyComparer;

  const GroupSelectValueIterable(this.source, this.keySelector,
      this.valueSelector, this.resultSelector, this.keyComparer);

  @override
  Iterator<TResult> get iterator {
    final lookup = Lookup.create<TSource, TKey, TValue>(
        source, keySelector, valueSelector, keyComparer);
    return lookup.applyResultSelector<TResult>(resultSelector).iterator;
  }
}
