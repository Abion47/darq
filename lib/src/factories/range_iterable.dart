class RangeIterable extends Iterable<int> {
  final int start;
  final int count;

  RangeIterable(this.start, this.count)
      : assert(start != null),
        assert(count != null),
        assert(count > 0);

  @override
  Iterator<int> get iterator => _RangeIterator(start, count);
}

class _RangeIterator extends Iterator<int> {
  final int start;
  final int count;

  _RangeIterator(this.start, this.count);

  int _currentValue;

  @override
  int get current => _currentValue;

  @override
  bool moveNext() {
    if (_currentValue == null) {
      _currentValue = start;
    } else {
      _currentValue++;
    }

    if (_currentValue >= start + count) {
      return false;
    }

    return true;
  }
}
