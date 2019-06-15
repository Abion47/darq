import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../iterators/prepend_iterator.dart';

class PrependEnumerable<T> extends Enumerable<T>
    implements EnumerableWithSource<T> {
  final Enumerable<T> source;
  final T newElement;

  const PrependEnumerable(this.source, this.newElement);

  @override
  Iterator<T> get iterator => PrependIterator(this);
}
