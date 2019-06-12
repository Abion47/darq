import '../enumerables/skip_while_enumerator.dart';
import '../enumerable_iterator.dart';

class SkipWhileIterator<T> extends EnumerableIterator<T, T> {
  SkipWhileIterator(SkipWhileEnumerable<T> enumerable) : super.of(enumerable);

  bool _skipping;

  @override
  bool moveNext() {
    if (sourceIterator == null) {
      sourceIterator = enumerable.source.iterator;
      _skipping = true;

      sourceIterator.moveNext();
    }

    while (_skipping) {
      if (!(enumerable as SkipWhileEnumerable<T>).condition(sourceIterator.current)) {
        _skipping = false;
        current = sourceIterator.current;
        return true;
      } else {
        sourceIterator.moveNext();
      }
    }

    if (sourceIterator.moveNext()) {
      current = sourceIterator.current;
      return true;
    }

    sourceIterator = null;
    current = null;
    _skipping = null;
    return false;
  }
}