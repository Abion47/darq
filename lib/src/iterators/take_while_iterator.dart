import '../enumerables/take_while_enumerable.dart';
import '../enumerable_iterator.dart';

class TakeWhileIterator<T> extends EnumerableIterator<T, T> {
  TakeWhileIterator(TakeWhileEnumerable<T> enumerable) : super.of(enumerable);

  @override
  bool moveNext() {
    if (sourceIterator == null) {
      sourceIterator = enumerable.source.iterator;
    }

    if (sourceIterator.moveNext()) {
      if ((enumerable as TakeWhileEnumerable<T>)
          .condition(sourceIterator.current)) {
        current = sourceIterator.current;
        return true;
      }
    }

    sourceIterator = null;
    current = null;
    return false;
  }
}
