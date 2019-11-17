class RangeIterable extends Iterable<int> {
  final int start;
  final int length;

  RangeIterable(this.start, this.length)
      : assert(start != null),
        assert(length != null),
        assert(length > 0);

  @override
  Iterator<int> get iterator => _RangeIterator(start, length);
}

class _RangeIterator extends Iterator<int> {
  final int start;
  final int length;

  _RangeIterator(this.start, this.length);

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

    if (_currentValue >= start + length) {
      return false;
    }

    return true;
  }
}
