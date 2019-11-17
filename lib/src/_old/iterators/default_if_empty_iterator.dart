import '../enumerables/default_if_empty_enumerable.dart';
import '../enumerable_iterator.dart';

class DefaultIfEmptyIterator<T> extends EnumerableIterator<T, T> {
  DefaultIfEmptyIterator(DefaultIfEmptyEnumerable<T> enumerable)
      : super.of(enumerable);

  bool valueReturned;

  @override
  bool moveNext() {
    if (sourceIterator == null) {
      sourceIterator = enumerable.source.iterator;
      valueReturned = false;
    }

    if (sourceIterator.moveNext()) {
      current = sourceIterator.current;
      valueReturned = true;
      return true;
    }

    if (!valueReturned) {
      current = (enumerable as DefaultIfEmptyEnumerable<T>).defaultValue;
      valueReturned = true;
      return true;
    }

    sourceIterator = null;
    valueReturned = false;
    current = null;
    return false;
  }
}
