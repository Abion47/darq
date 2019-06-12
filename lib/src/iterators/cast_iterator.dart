import '../errors.dart';
import '../enumerables/cast_enumerable.dart';
import '../enumerable_iterator.dart';

class CastIterator<TSource, TResult> extends EnumerableIterator<TSource, TResult> {
  CastIterator(CastEnumerable<TSource, TResult> enumerable) : super.of(enumerable);

  @override
  bool moveNext() {
    if (sourceIterator == null) {
      sourceIterator = enumerable.source.iterator;
    }
    
    final castEnumerable = enumerable as CastEnumerable<TSource, TResult>;

    if (sourceIterator.moveNext()) {
      final srcValue = sourceIterator.current;
      
      if (castEnumerable.transformer == null) {
        if (srcValue is TResult) {
          current = srcValue;
          return true;
        }
        throw ConversionError<TSource, TResult>(srcValue);
      }

      current = castEnumerable.transformer(srcValue);
      return true;
    }

    sourceIterator = null;
    current = null;
    return false;
  }
}