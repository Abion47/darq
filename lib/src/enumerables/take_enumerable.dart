import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../iterators/take_iterator.dart';

class TakeEnumerable<T> extends Enumerable<T> with EnumerableWithSource<T> {
  final int count;

  TakeEnumerable(Enumerable<T> source, this.count) {
    this.src = source;
  }

  @override
  Iterator<T> get iterator => TakeIterator(this);
}
