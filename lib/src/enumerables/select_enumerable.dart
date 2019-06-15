import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../typedefs.dart';
import '../iterators/select_iterator.dart';

class SelectEnumerable<TSource, TResult> extends Enumerable<TResult>
    implements EnumerableWithSource<TSource> {
  final Enumerable<TSource> source;
  final Selector<TSource, TResult> selector;

  const SelectEnumerable(this.source, this.selector);

  @override
  Iterator<TResult> get iterator => SelectIterator(this);
}
