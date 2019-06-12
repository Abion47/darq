import '../enumerables/take_enumerable.dart';
import '../enumerable_iterator.dart';

class TakeIterator<T> extends EnumerableIterator<T, T> {
  TakeIterator(TakeEnumerable<T> enumerable) : super.of(enumerable);

  int _takeCount;
  int _takeCountMax;

  @override
  bool moveNext() {
    if (sourceIterator == null) {
      sourceIterator = enumerable.source.iterator;
      _takeCount = 0;
      _takeCountMax = (enumerable as TakeEnumerable<T>).count;
    }

    if (_takeCount < _takeCountMax && sourceIterator.moveNext()) {
      _takeCount++;

      current = sourceIterator.current;
      return true;
    }

    sourceIterator = null;
    current = null;
    _takeCount = null;
    return false;
  }
}