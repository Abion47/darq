import '../enumerables/select_many_enumerable.dart';
import '../enumerable_iterator.dart';

class SelectManyIterator<TSource, TResult> extends EnumerableIterator<TSource, TResult> {
  SelectManyIterator(SelectManyEnumerable<TSource, TResult> enumerable) : super.of(enumerable);

  Iterator<TResult> _innerIterator;

  @override
  bool moveNext() {
    if (sourceIterator == null) {
      sourceIterator = enumerable.source.iterator;
    }

    if (_innerIterator != null) {
      if (_innerIterator.moveNext()) {
        current = _innerIterator.current;
        return true;
      }

      _innerIterator = null;
    }

    if (_innerIterator == null) {
      if (sourceIterator.moveNext()) {
        _innerIterator = (enumerable as SelectManyEnumerable<TSource, TResult>).selector(sourceIterator.current).iterator;

        if (_innerIterator.moveNext()) {
          current = _innerIterator.current;
          return true;
        }
      }
    }

    sourceIterator = null;
    current = null;
    return false;
  }
}