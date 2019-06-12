import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../iterators/of_type_iterator.dart';

class OfTypeEnumerable<TSource, TResult> extends Enumerable<TResult> with EnumerableWithSource<TSource> {
  OfTypeEnumerable(Enumerable<TSource> source) {
    this.src = source;
  }

  @override
  Iterator<TResult> get iterator => OfTypeIterator(this);
}