class RepeatIterable<T> extends Iterable<T> {
  final T element;
  final int count;

  RepeatIterable(this.element, this.count)
      : assert(count != null),
        assert(count > 0);

  @override
  Iterator<T> get iterator => _RepeatIterator(element, count);
}

class _RepeatIterator<T> extends Iterator<T> {
  final T element;
  final int count;

  _RepeatIterator(this.element, this.count);

  int _currentCount = 0;

  @override
  T get current => element;

  @override
  bool moveNext() {
    if (_currentCount >= count) return false;

    _currentCount++;
    return true;
  }
}
