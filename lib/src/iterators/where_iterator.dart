import '../enumerables/where_enumerable.dart';
import '../enumerable_iterator.dart';

class WhereIterator<T> extends EnumerableIterator<T, T> {
  WhereIterator(WhereEnumerable<T> enumerable) : super.of(enumerable);

  @override
  bool moveNext() {
    if (sourceIterator == null) {
      sourceIterator = enumerable.source.iterator;
    }

    while (sourceIterator.moveNext()) {
      if ((enumerable as WhereEnumerable<T>).condition(sourceIterator.current)) {
        current = sourceIterator.current;
        return true;
      }
    }

    sourceIterator = null;
    current = null;
    return false;
  }
}