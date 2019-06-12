import '../enumerables/append_enumerable.dart';
import '../enumerable_iterator.dart';

class AppendIterator<T> extends EnumerableIterator<T, T> {
  bool newElemPassed;

  AppendIterator(AppendEnumerable<T> enumerable) : super.of(enumerable);

  @override
  bool moveNext() {
    if (sourceIterator == null) {
      sourceIterator = enumerable.source.iterator;
      newElemPassed = false;
    }

    if (sourceIterator.moveNext()) {
      current = sourceIterator.current;
      return true;
    }

    if (!newElemPassed) {
      current = (enumerable as AppendEnumerable<T>).newElement;
      newElemPassed = true;
      return true;
    }

    sourceIterator = null;
    current = null;
    return false;
  }
}