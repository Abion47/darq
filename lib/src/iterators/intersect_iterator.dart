import '../enumerables/intersect_enumerable.dart';
import '../enumerable_iterator.dart';
import '../set.dart';

class IntersectIterator<T> extends EnumerableIterator<T, T> {
  IntersectIterator(IntersectEnumerable<T> enumerable) : super.of(enumerable);

  ComparableSet<T> _elementCache;

  @override
  bool moveNext() {
    if (sourceIterator == null) {
      sourceIterator = enumerable.source.iterator;
      _elementCache =
          ComparableSet<T>((enumerable as IntersectEnumerable<T>).comparer);
      _elementCache.addAll((enumerable as IntersectEnumerable<T>).other);
    }

    T value;
    while (sourceIterator.moveNext()) {
      value = sourceIterator.current;

      if (_elementCache.remove(value)) {
        current = value;
        return true;
      }
    }

    sourceIterator = null;
    current = null;
    return false;
  }
}
