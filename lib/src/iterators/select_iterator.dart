import '../enumerables/select_enumerable.dart';
import '../enumerable_iterator.dart';

class SelectIterator<TSource, TResult>
    extends EnumerableIterator<TSource, TResult> {
  SelectIterator(SelectEnumerable<TSource, TResult> enumerable)
      : super.of(enumerable);

  @override
  bool moveNext() {
    if (sourceIterator == null) {
      sourceIterator = enumerable.source.iterator;
    }

    if (sourceIterator.moveNext()) {
      current = (enumerable as SelectEnumerable<TSource, TResult>)
          .selector(sourceIterator.current);
      return true;
    }

    sourceIterator = null;
    current = null;
    return false;
  }
}
