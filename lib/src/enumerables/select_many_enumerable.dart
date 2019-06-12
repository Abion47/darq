import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../typedefs.dart';
import '../iterators/select_many_iterator.dart';

class SelectManyEnumerable<TSource, TResult> extends Enumerable<TResult>
    with EnumerableWithSource<TSource> {
  final ManySelector<TSource, TResult> selector;

  SelectManyEnumerable(Enumerable<TSource> source, this.selector) {
    this.src = source;
  }

  @override
  Iterator<TResult> get iterator => SelectManyIterator(this);
}
