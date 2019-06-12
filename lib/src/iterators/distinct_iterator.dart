import '../enumerables/distinct_enumerable.dart';
import '../enumerable_iterator.dart';
import '../set.dart';

class DistinctIterator<T> extends EnumerableIterator<T, T> {
  DistinctIterator(DistinctEnumerable<T> enumerable) : super.of(enumerable);

  ComparableSet<T> _elementCache;

  @override
  bool moveNext() {
    if (sourceIterator == null) {
      sourceIterator = enumerable.source.iterator;
      _elementCache = ComparableSet<T>((enumerable as DistinctEnumerable<T>).comparer);
    }

    T value;
    while (sourceIterator.moveNext()) {
      value = sourceIterator.current;

      if (_elementCache.add(value)) {
        current = value;
        return true;
      } 
    }

    sourceIterator = null;
    current = null;
    return false;
  }
}