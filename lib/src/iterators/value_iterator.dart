import '../enumerable_iterator.dart';
import '../enumerables/value_enumerable.dart';

class ValueIterator<T> extends EnumerableIterator<T, T> {
  ValueIterator(ValueEnumerable<T> enumerable) : super.of(enumerable);

  @override
  bool moveNext() {
    if (sourceIterator == null) {
      sourceIterator = enumerable.source.iterator;
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
