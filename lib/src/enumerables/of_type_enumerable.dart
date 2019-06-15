import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../iterators/of_type_iterator.dart';

class OfTypeEnumerable<TSource, TResult> extends Enumerable<TResult>
    implements EnumerableWithSource<TSource> {
  final Enumerable<TSource> source;

  const OfTypeEnumerable(this.source);

  @override
  Iterator<TResult> get iterator => OfTypeIterator(this);
}
