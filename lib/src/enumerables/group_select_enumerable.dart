import '../equality_comparer.dart';
import '../lookup.dart';
import '../typedefs.dart';
import '../enumerable.dart';
import '../enumerable_with_source.dart';

class GroupSelectEnumerable<TSource, TKey, TResult> extends Enumerable<TResult>
    implements EnumerableWithSource<TSource> {
  final Enumerable<TSource> source;
  final Selector<TSource, TKey> keySelector;
  final GroupSelector<TKey, Iterable<TSource>, TResult> resultSelector;
  final EqualityComparer<TKey> keyComparer;

  const GroupSelectEnumerable(
      this.source, this.keySelector, this.resultSelector, this.keyComparer);

  @override
  Iterator<TResult> get iterator {
    final lookup = Lookup.create<TSource, TKey, TSource>(
        source, keySelector, (e) => e, keyComparer);
    return lookup.applyResultSelector(resultSelector).iterator;
  }
}
