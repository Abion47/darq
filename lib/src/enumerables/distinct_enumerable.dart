import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../equality_comparer.dart';
import '../iterators/distinct_iterator.dart';

class DistinctEnumerable<T> extends Enumerable<T>
    implements EnumerableWithSource<T> {
  final Enumerable<T> source;
  final EqualityComparer<T> comparer;

  const DistinctEnumerable(this.source, this.comparer);

  @override
  Iterator<T> get iterator => DistinctIterator(this);
}
