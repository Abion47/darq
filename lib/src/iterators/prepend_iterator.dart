import '../enumerables/prepend_enumerable.dart';
import '../enumerable_iterator.dart';

class PrependIterator<T> extends EnumerableIterator<T, T> {
  bool newElemPassed;

  PrependIterator(PrependEnumerable<T> enumerable) : super.of(enumerable);

  @override
  bool moveNext() {
    if (sourceIterator == null) {
      sourceIterator = enumerable.source.iterator;
      newElemPassed = false;
    }

    if (!newElemPassed) {
      current = (enumerable as PrependEnumerable<T>).newElement;
      newElemPassed = true;
      return true;
    }

    if (sourceIterator.moveNext()) {
      current = sourceIterator.current;
      return true;
    }

    sourceIterator = null;
    current = null;
    return false;
  }
}