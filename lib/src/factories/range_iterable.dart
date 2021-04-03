/// Creates an iterable whose elements represent a range of
/// integral values.
class RangeIterable extends Iterable<int> {
  final int start;
  final int end;
  final int step;

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
  /// If [step] is not 1, the values in the interval will skip [step] times. For
  /// example, a range of \[2-7\] with an [step] of 2 will result in the iterable \[2, 4, 6\].
  /// If [step] is negative, the iterable will be reversed, starting from [end] and
  /// descending to [start]. (If [inclusive] is false, the first value will be `end - 1`.)
  /// Having the value [step] be 0 will result in an error.
  RangeIterable(
    this.start,
    int end, {
    this.step = 1,
    bool inclusive = false,
  })  : assert(end >= start),
        assert(step != 0, 'The interval must be a non-zero integer.'),
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
  /// If [step] is not 1, the values in the interval will skip [step] times. For
  /// example, a [start] of 2, a [count] of 3, and an [step] of 2 will result in the iterable \[2, 4, 6\].
  /// If [step] is negative, the iterable will instead count down from [start], e.g. the
  /// previous [start] and [count] values with an [step] of -2 will result in the iterable
  /// \[2, 0, -2\]. Having the value of [step] be zero will result in an error.
  RangeIterable.count(
    int start,
    int count, {
    this.step = 1,
  })  : assert(step != 0, 'The interval must be a positive integer.'),
        assert(count >= 0, 'The count must be a positive integer.'),
        start = step > 0 ? start : start - (count * -step) + 1,
        end = step > 0 ? start + (count * step) - 1 : start;

  @override
  Iterator<int> get iterator => _RangeIterator(start, end, step);
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

    _currentValue = _initialValue;
  }

  final int start;
  final int end;
  final int interval;

  late int _initialValue;
  late int _targetValue;
  late bool _descending;
  late int _currentValue;

  bool _interationBegan = false;

  @override
  int get current => _currentValue;

  @override
  bool moveNext() {
    if (!_interationBegan) {
      _currentValue = _initialValue;
      _interationBegan = true;
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
