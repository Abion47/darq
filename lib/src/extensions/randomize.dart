import 'dart:math';

extension RandomizeExtension<T> on Iterable<T> {
  /// Returns a sequence of elements in random order from the original
  /// sequence. The optional parameter `random` specifies a random generator to be
  /// used for the random selection algorithm.
  ///
  /// Internally this method performs a partial Fisher-Yates shuffle of the list.
  Iterable<T> randomize([Random? random]) {
    return _RandomizableIterable(this, random);
    // final list = toList();
    // random ??= Random();

    // var w = list.length;
    // var g = w - 1;

    // for (var m = 0; m < list.length; ++m) {
    //   var k = g - random.nextInt(w);
    //   var tmp = list[k];
    //   list[k] = list[m];
    //   list[m] = tmp;
    //   w--;
    // }

    // return list;
  }
}

class _RandomizableIterable<T> extends Iterable<T> {
  final Iterable<T> source;
  final Random? random;

  _RandomizableIterable(this.source, this.random);

  @override
  Iterator<T> get iterator => _RandomizableIterator(this);
}

class _RandomizableIterator<T> extends Iterator<T> {
  final _RandomizableIterable<T> _iterable;

  _RandomizableIterator(this._iterable);

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

    if (_idx >= _buffer.length) {
      return false;
    }

    _current = _buffer[_idx];
    return true;
  }
}
