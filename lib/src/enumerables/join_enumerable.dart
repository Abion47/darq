import '../equality_comparer.dart';
import '../typedefs.dart';
import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../iterators/join_iterator.dart';

class JoinEnumerable<TFirst, TSecond, TKey, TResult> extends Enumerable<TResult>
    implements EnumerableWithSource<TFirst> {
  final Enumerable<TFirst> source;
  final Iterable<TSecond> second;
  final Selector<TFirst, TKey> outerKeySelector;
  final Selector<TSecond, TKey> innerKeySelector;
  final ZipSelector<TFirst, TSecond, TResult> selector;
  final EqualityComparer<TKey> keyComparer;

  const JoinEnumerable(this.source, this.second, this.outerKeySelector,
      this.innerKeySelector, this.selector, this.keyComparer);

  @override
  Iterator<TResult> get iterator =>
      JoinIterator<TFirst, TSecond, TKey, TResult>(this);
}
