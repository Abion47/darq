import '../equality_comparer.dart';
import '../lookup.dart';

class GroupSelectIterable<TSource, TKey, TResult> extends Iterable<TResult> {
  final Iterable<TSource> source;
  final TKey Function(TSource) keySelector;
  final TResult Function(TKey, Iterable<TSource>) resultSelector;
  final EqualityComparer<TKey> keyComparer;

  const GroupSelectIterable(
      this.source, this.keySelector, this.resultSelector, this.keyComparer);

  @override
  Iterator<TResult> get iterator {
    final lookup = Lookup.create<TSource, TKey, TSource>(
        source, keySelector, (e) => e, keyComparer);
    return lookup.applyResultSelector<TResult>(resultSelector).iterator;
  }
}
