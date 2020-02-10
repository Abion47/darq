/// Creates an iterable whose elements represent a range of
/// integral values.
class RangeIterable extends Iterable<int> {
  final int start;
  final int end;
  final int interval;

  /// Creates an iterable that contains all elements between [start] (inclusive)
  /// and [end] (exclusive, optionally inclusive).
  ///
  /// This iterable will generate values dynamically in a lazy fashion. When consumed,
  /// the iterable will result in a range of values, typically in the range from [start]
  /// to [end], including [start] but not including [end]. Having the value of [start] be
  /// greater than [end] will result in an error.
  ///
  /// If [inclusive] is true, [end] will be included in the iterable as the last value.
  ///
  /// If [interval] is not 1, the values in the interval will skip [interval] times. For
  /// example, a range of \[2-7\] with an [interval] of 2 will result in the iterable \[2, 4, 6\].
  /// If [interval] is negative, the iterable will be reversed, starting from [end] and
  /// descending to [start]. (If [inclusive] is false, the first value will be `end - 1`.)
  /// Having the value [interval] be 0 will result in an error.
  RangeIterable(
    this.start,
    int end, {
    this.interval = 1,
    bool inclusive = false,
  })  : assert(start != null),
        assert(end != null),
        assert(end >= start),
        assert(interval != null),
        assert(interval != 0, 'The interval must be a non-zero integer.'),
        end = inclusive ? end : end - 1;

  /// Creates an iterable that describes a sequence starting at [start] and containing
  /// [count] elements.
  ///
  /// This iterable will generate values dynamically in a lazy fashion. When consumed,
  /// the iterable will result in a range of values, typically in the range from [start]
  /// (inclusive) to `start + count` (exclusive). Having the value of [count] be zero will
  /// return an empty interval. Having the value of [count] be less than zero will result in
  /// an error.
  ///
  /// If [interval] is not 1, the values in the interval will skip [interval] times. For
  /// example, a [start] of 2, a [count] of 3, and an [interval] of 2 will result in the iterable \[2, 4, 6\].
  /// If [interval] is negative, the iterable will instead count down from [start], e.g. the
  /// previous [start] and [count] values with an [interval] of -2 will result in the iterable
  /// \[2, 0, -2\]. Having the value of [interval] be zero will result in an error.
  RangeIterable.count(
    int start,
    int count, {
    this.interval = 1,
  })  : assert(start != null),
        assert(count != null),
        assert(interval != null),
        assert(interval != 0, 'The interval must be a positive integer.'),
        assert(count >= 0, 'The count must be a positive integer.'),
        start = interval > 0 ? start : start - (count * -interval) + 1,
        end = interval > 0 ? start + (count * interval) - 1 : start;

  @override
  Iterator<int> get iterator => _RangeIterator(start, end, interval);
}

class _RangeIterator extends Iterator<int> {
  _RangeIterator(this.start, this.end, this.interval) {
    _descending = interval < 0;

    if (_descending) {
      _initialValue = end;
      _targetValue = start;
    } else {
      _initialValue = start;
      _targetValue = end;
    }
  }

  final int start;
  final int end;
  final int interval;

  int _initialValue;
  int _targetValue;
  bool _descending;

  int _currentValue;

  @override
  int get current => _currentValue;

  @override
  bool moveNext() {
    if (_currentValue == null) {
      _currentValue = _initialValue;
    } else {
      _currentValue += interval;
    }

    if ((_descending && _currentValue < _targetValue) ||
        (!_descending && _currentValue > _targetValue)) {
      return false;
    }

    return true;
  }
}
