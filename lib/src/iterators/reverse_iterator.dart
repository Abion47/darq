import '../enumerables/reverse_enumerable.dart';
import '../enumerable_iterator.dart';

class ReverseIterator<T> extends EnumerableIterator<T, T> {
  ReverseIterator(ReverseEnumerable<T> enumerable) : super.of(enumerable);

  Iterable<T> _items;

  @override
  bool moveNext() {
    if (sourceIterator == null) {
      _items = enumerable.source.toList().reversed;
      sourceIterator = _items.iterator;
    }

    if (sourceIterator.moveNext()) {
      current = sourceIterator.current;
      return true;
    }

    sourceIterator = null;
    current = null;
    _items = null;
    return false;
  }
}