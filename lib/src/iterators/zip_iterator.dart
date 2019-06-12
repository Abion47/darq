import '../enumerable_iterator.dart';
import '../enumerables/zip_enumerable.dart';

class ZipIterator<TFirst, TSecond, TResult> extends EnumerableIterator<TFirst, TResult> {
  ZipIterator(ZipEnumerable<TFirst, TSecond, TResult> enumerable) : super.of(enumerable);

  Iterator<TSecond> _secondIterator;

  @override
  bool moveNext() {
    final castEnum = enumerable as ZipEnumerable<TFirst, TSecond, TResult>;

    if (sourceIterator == null) {
      sourceIterator = enumerable.source.iterator;
      _secondIterator = castEnum.second.iterator;
    }

    if (sourceIterator.moveNext() && _secondIterator.moveNext()) {
      current = castEnum.selector(sourceIterator.current, _secondIterator.current);
      return true;
    }

    sourceIterator = null;
    _secondIterator = null;
    current = null;
    return false;
  }
}