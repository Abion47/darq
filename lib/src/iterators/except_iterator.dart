import '../enumerables/except_enumerable.dart';
import '../enumerable_iterator.dart';
import '../set.dart';

class ExceptIterator<T> extends EnumerableIterator<T, T> {
  ExceptIterator(ExceptEnumerable<T> enumerable) : super.of(enumerable);

  ComparableSet<T> _elementCache;

  @override
  bool moveNext() {
    if (sourceIterator == null) {
      sourceIterator = enumerable.source.iterator;
      _elementCache = ComparableSet<T>((enumerable as ExceptEnumerable<T>).comparer);
      _elementCache.addAll((enumerable as ExceptEnumerable<T>).other);
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