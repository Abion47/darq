import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../iterators/concat_iterator.dart';

class ConcatEnumerable<T> extends Enumerable<T> with EnumerableWithSource<T> {
  final Iterable<T> other;

  ConcatEnumerable(Iterable<T> source, this.other) {
    this.src = source;
  }

  @override
  Iterator<T> get iterator => ConcatIterator(this);
}
