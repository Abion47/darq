import '../enumerable_iterator.dart';
import '../enumerables/concat_enumerable.dart';

class ConcatIterator<T> extends EnumerableIterator<T, T> {
  ConcatIterator(ConcatEnumerable<T> enumerable) : super.of(enumerable);

  Iterator<T> _otherIterator;

  @override
  bool moveNext() {
    if (sourceIterator == null) {
      sourceIterator = enumerable.source.iterator;
      _otherIterator = (enumerable as ConcatEnumerable<T>).other.iterator;
    }

    if (sourceIterator.moveNext()) {
      current = sourceIterator.current;
      return true;
    }

    if (_otherIterator.moveNext()) {
      current = _otherIterator.current;
      return true;
    }

    sourceIterator = null;
    _otherIterator = null;
    current = null;
    return false;
  }
}
