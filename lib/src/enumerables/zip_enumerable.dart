import '../typedefs.dart';
import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../iterators/zip_iterator.dart';

class ZipEnumerable<TFirst, TSecond, TResult> extends Enumerable<TResult>
    implements EnumerableWithSource<TFirst> {
  final Enumerable<TFirst> source;
  final Iterable<TSecond> second;
  final ZipSelector<TFirst, TSecond, TResult> selector;

  const ZipEnumerable(this.source, this.second, this.selector);

  @override
  Iterator<TResult> get iterator => ZipIterator<TFirst, TSecond, TResult>(this);
}
