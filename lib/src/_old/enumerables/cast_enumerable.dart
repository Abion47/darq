import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../typedefs.dart';
import '../iterators/cast_iterator.dart';

class CastEnumerable<TSource, TResult> extends Enumerable<TResult>
    implements EnumerableWithSource<TSource> {
  final Enumerable<TSource> source;
  final CastTransformer<TSource, TResult> transformer;

  const CastEnumerable(this.source, this.transformer);

  @override
  Iterator<TResult> get iterator => CastIterator(this);
}
