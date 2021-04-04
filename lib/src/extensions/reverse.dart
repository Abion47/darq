extension ReverseExtension<T> on Iterable<T> {
  /// Reverses the order of the iterable.
  ///
  /// The iterable is iterated over and stored in a list. The resulting
  /// iterable is the product of then iterating over that list in reverse
  /// order. (This method is identical to calling `toList` on the iterable
  /// and then calling the `reversed` property.)
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 2, 3, 4];
  ///       final result = list.reverse();
  ///
  ///       // Result: [4, 3, 2, 1]
  ///     }
  Iterable<T> reverse() {
    return _ReversedIterable(this);
  }
}

class _ReversedIterable<T> extends Iterable<T> {
  final Iterable<T> _source;

  _ReversedIterable(this._source);

  @override
  Iterator<T> get iterator => _ReversedIterator(this);
}

class _ReversedIterator<T> extends Iterator<T> {
  final _ReversedIterable<T> _iterable;

  _ReversedIterator(this._iterable);

  late List<T> _reversed;
  late T _current;
  bool _initialized = false;
  int _idx = -1;

  @override
  T get current => _current;

  void initialize() {
    _reversed = _iterable._source.toList().reversed.toList();
    _initialized = true;
  }

  @override
  bool moveNext() {
    if (!_initialized) {
      initialize();
    }

    _idx++;

    if (_idx >= _reversed.length) {
      return false;
    }

    _current = _reversed[_idx];
    return true;
  }
}
