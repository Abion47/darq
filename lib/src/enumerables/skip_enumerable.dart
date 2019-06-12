import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../iterators/skip_iterator.dart';

class SkipEnumerable<T> extends Enumerable<T> with EnumerableWithSource<T> {
  final int count;

  SkipEnumerable(Enumerable<T> source, this.count) {
    this.src = source;
  }

  @override
  Iterator<T> get iterator => SkipIterator(this);
}
