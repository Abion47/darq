import '../enumerables/skip_enumerable.dart';
import '../enumerable_iterator.dart';

class SkipIterator<T> extends EnumerableIterator<T, T> {
  SkipIterator(SkipEnumerable<T> enumerable) : super.of(enumerable);

  int _skipCount;
  int _skipCountMax;

  @override
  bool moveNext() {    
    if (sourceIterator == null) {
      sourceIterator = enumerable.source.iterator;
      _skipCount = 0;
      _skipCountMax = (enumerable as SkipEnumerable<T>).count;
    }

    while (_skipCount < _skipCountMax) {
      sourceIterator.moveNext();
      _skipCount++;
    }

    if (sourceIterator.moveNext()) {
      current = sourceIterator.current;
      return true;
    }

    sourceIterator = null;
    current = null;
    _skipCount = null;
    _skipCountMax = null;
    return false;
  }
}