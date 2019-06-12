import '../enumerables/union_enumerable.dart';
import '../enumerable_iterator.dart';
import '../set.dart';

class UnionIterator<T> extends EnumerableIterator<T, T> {
  UnionIterator(UnionEnumerable<T> enumerable) : super.of(enumerable);

  Iterator<T> _otherIterator;
  ComparableSet<T> _elementCache;

  @override
  bool moveNext() {
    if (sourceIterator == null) {
      sourceIterator = enumerable.source.iterator;
      _otherIterator = (enumerable as UnionEnumerable<T>).other.iterator;
      _elementCache = ComparableSet<T>((enumerable as UnionEnumerable<T>).comparer);
    }
    
    T value;

    while (sourceIterator.moveNext()) {
      value = sourceIterator.current;

      if (_elementCache.add(value)) {
        current = value;
        return true;
      }
    }
    
    while (_otherIterator.moveNext()) {
      value = _otherIterator.current;

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