import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../iterators/take_iterator.dart';

class TakeEnumerable<T> extends Enumerable<T>
    implements EnumerableWithSource<T> {
  final Enumerable<T> source;
  final int count;

  const TakeEnumerable(this.source, this.count);

  @override
  Iterator<T> get iterator => TakeIterator(this);
}
