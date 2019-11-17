import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../iterators/reverse_iterator.dart';

class ReverseEnumerable<T> extends Enumerable<T>
    implements EnumerableWithSource<T> {
  final Enumerable<T> source;

  const ReverseEnumerable(this.source);

  @override
  Iterator<T> get iterator => ReverseIterator(this);
}
