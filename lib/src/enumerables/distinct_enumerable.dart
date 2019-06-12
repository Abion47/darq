import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../equality_comparer.dart';
import '../iterators/distinct_iterator.dart';

class DistinctEnumerable<T> extends Enumerable<T> with EnumerableWithSource<T> {
  EqualityComparer<T> comparer;

  DistinctEnumerable(Enumerable<T> source, [this.comparer]) {
    this.src = source;
    if (comparer == null) comparer = EqualityComparer.forType<T>();
  }

  @override
  Iterator<T> get iterator => DistinctIterator(this);
}
