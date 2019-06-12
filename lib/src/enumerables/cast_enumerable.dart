import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../typedefs.dart';
import '../iterators/cast_iterator.dart';

class CastEnumerable<TSource, TResult> extends Enumerable<TResult>
    with EnumerableWithSource<TSource> {
  final CastTransformer<TSource, TResult> transformer;

  CastEnumerable(Enumerable<TSource> source, this.transformer) {
    this.src = source;
  }

  @override
  Iterator<TResult> get iterator => CastIterator(this);
}
