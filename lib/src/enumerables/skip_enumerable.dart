import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../iterators/skip_iterator.dart';

class SkipEnumerable<T> extends Enumerable<T>
    implements EnumerableWithSource<T> {
  final Enumerable<T> source;
  final int count;

  const SkipEnumerable(this.source, this.count);

  @override
  Iterator<T> get iterator => SkipIterator(this);
}
