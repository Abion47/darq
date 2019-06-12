import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../typedefs.dart';
import '../iterators/select_iterator.dart';

class SelectEnumerable<TSource, TResult> extends Enumerable<TResult> with EnumerableWithSource<TSource> {
  final Selector<TSource, TResult> selector;

  SelectEnumerable(Enumerable<TSource> source, this.selector) {
    this.src = source;
  }

  @override
  Iterator<TResult> get iterator => SelectIterator(this);
}