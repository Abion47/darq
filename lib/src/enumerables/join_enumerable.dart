import '../equality_comparer.dart';
import '../typedefs.dart';
import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../iterators/join_iterator.dart';

class JoinEnumerable<TFirst, TSecond, TKey, TResult> extends Enumerable<TResult> with EnumerableWithSource<TFirst>  {
  final Iterable<TSecond> second;
  final Selector<TFirst, TKey> outerKeySelector;
  final Selector<TSecond, TKey> innerKeySelector;
  final ZipSelector<TFirst, TSecond, TResult> selector;
  final EqualityComparer<TKey> keyComparer;

  JoinEnumerable(Iterable<TFirst> source, this.second, this.outerKeySelector, this.innerKeySelector, this.selector, [EqualityComparer<TKey> keyComparer])
    : this.keyComparer = keyComparer ?? EqualityComparer.forType<TKey>() {
    this.src = source;
  }

  @override
  Iterator<TResult> get iterator => JoinIterator<TFirst, TSecond, TKey, TResult>(this);
}