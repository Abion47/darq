import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../iterators/concat_iterator.dart';

class ConcatEnumerable<T> extends Enumerable<T>
    implements EnumerableWithSource<T> {
  final Enumerable<T> source;
  final Iterable<T> other;

  const ConcatEnumerable(this.source, this.other);

  @override
  Iterator<T> get iterator => ConcatIterator(this);
}
