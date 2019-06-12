import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../iterators/prepend_iterator.dart';

class PrependEnumerable<T> extends Enumerable<T> with EnumerableWithSource<T> {
  final T newElement;

  PrependEnumerable(Enumerable<T> source, this.newElement) {
    this.src = source;
  }

  @override
  Iterator<T> get iterator => PrependIterator(this);
}