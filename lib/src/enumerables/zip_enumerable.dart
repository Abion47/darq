import '../typedefs.dart';
import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../iterators/zip_iterator.dart';

class ZipEnumerable<TFirst, TSecond, TResult> extends Enumerable<TResult> with EnumerableWithSource<TFirst>  {
  final Iterable<TSecond> second;
  final ZipSelector<TFirst, TSecond, TResult> selector;

  ZipEnumerable(Iterable<TFirst> source, this.second, this.selector) {
    this.src = source;
  }

  @override
  Iterator<TResult> get iterator => ZipIterator<TFirst, TSecond, TResult>(this);
}