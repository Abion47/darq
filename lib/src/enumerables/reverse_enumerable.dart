import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../iterators/reverse_iterator.dart';

class ReverseEnumerable<T> extends Enumerable<T> with EnumerableWithSource<T> {
  ReverseEnumerable(Enumerable<T> source) {
    this.src = source;
  }

  @override
  Iterator<T> get iterator => ReverseIterator(this);
}