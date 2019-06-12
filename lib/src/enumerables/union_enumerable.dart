import '../equality_comparer.dart';
import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../iterators/union_iterator.dart';

class UnionEnumerable<T> extends Enumerable<T> with EnumerableWithSource<T> {
  final Iterable<T> other;
  final EqualityComparer<T> comparer;

  UnionEnumerable(Enumerable<T> source, this.other, EqualityComparer<T> comparer)
    : this.comparer = comparer ?? EqualityComparer.forType<T>() {
    this.src = source;
  }
  
  @override
  Iterator<T> get iterator => UnionIterator(this);
}