import 'dart:math';

extension RandomSubsetExtension<T> on Iterable<T> {
  /// Returns an iterable of the specified size consisting of
  /// random elements from this iterable. The optional parameter `random`
  /// specifies a random generator to be used for the random selection algorithm.
  ///
  /// Internally this method performs a partial Fisher-Yates
  /// shuffle of the list. A partial shuffle is to avoid a wasteful
  /// amount of shuffling when [size] is less than the length of
  /// the iterable.
  Iterable<T> randomSubset(int size, [Random? random]) {
    return _RandomizedSubsetIterable(this, size, random);
    // final list = toList();
    // random ??= Random();

    // if (list.length < size) {
    //   throw RangeError.range(
    //     size,
    //     0,
    //     list.length,
    //     'size',
    //     'The value of "size" cannot be greater than the length of the iterable.',
    //   );
    // }

    // var m = 0;
    // var w = list.length;
    // var g = w - 1;

    // while (m < size) {
    //   var k = g - random.nextInt(w);
    //   var tmp = list[k];
    //   list[k] = list[m];
    //   list[m] = tmp;
    //   m++;
    //   w--;
    // }

    // return list.take(size);
  }
}

class _RandomizedSubsetIterable<T> extends Iterable<T> {
  final Iterable<T> source;
  final int size;
  final Random? random;

  _RandomizedSubsetIterable(this.source, this.size, this.random);

  @override
  Iterator<T> get iterator => _RandomizedSubsetIterator(this);
}

class _RandomizedSubsetIterator<T> extends Iterator<T> {
  final _RandomizedSubsetIterable<T> _iterable;

  _RandomizedSubsetIterator(this._iterable);

  late List<T> _buffer;
  bool _initialized = false;
  int _idx = -1;

  late T _current;
  @override
  T get current {
    if (_initialized) {
      return _current;
    }
    throw StateError(
        '`moveNext` must be called before `current` can be accessed');
  }

  void initialize() {
    _buffer = _iterable.source.toList();
    final random = _iterable.random ?? Random();

    var w = _buffer.length;
    var g = w - 1;

    for (var m = 0; m < _buffer.length; ++m) {
      var k = g - random.nextInt(w);
      var tmp = _buffer[k];
      _buffer[k] = _buffer[m];
      _buffer[m] = tmp;
      w--;
    }

    _initialized = true;
  }

  @override
  bool moveNext() {
    if (!_initialized) {
      initialize();
    }

    _idx++;

    if (_idx >= _iterable.size || _idx >= _buffer.length) {
      return false;
    }

    _current = _buffer[_idx];
    return true;
  }
}
