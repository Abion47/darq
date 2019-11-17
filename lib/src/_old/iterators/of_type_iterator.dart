import '../enumerables/of_type_enumerable.dart';
import '../enumerable_iterator.dart';

class OfTypeIterator<TSource, TResult>
    extends EnumerableIterator<TSource, TResult> {
  OfTypeIterator(OfTypeEnumerable<TSource, TResult> enumerable)
      : super.of(enumerable);

  @override
  bool moveNext() {
    if (sourceIterator == null) {
      sourceIterator = enumerable.source.iterator;
    }

    TSource value;
    while (sourceIterator.moveNext()) {
      value = sourceIterator.current;
      if (value is TResult) {
        current = value;
        return true;
      }
    }

    sourceIterator = null;
    current = null;
    return false;
  }
}
