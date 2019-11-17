import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../typedefs.dart';
import '../iterators/select_many_iterator.dart';

class SelectManyEnumerable<TSource, TResult> extends Enumerable<TResult>
    implements EnumerableWithSource<TSource> {
  final Enumerable<TSource> source;
  final ManySelector<TSource, TResult> selector;

  const SelectManyEnumerable(this.source, this.selector);

  @override
  Iterator<TResult> get iterator => SelectManyIterator(this);
}
