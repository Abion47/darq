extension MemoizeExtension<T> on Iterable<T> {
  /// Returns an iterable whose elements are cached during the
  /// first iteration.
  ///
  /// During the first time the returned iterable is consumed,
  /// its elements are placed into a cache, which is finalized
  /// once iteration is complete. On subsequent times the
  /// iterable is consumed, the elements from the cache are reused.
  Iterable<T> memoize() => _MemoizedIterable(this);
}

class _MemoizedIterable<T> extends Iterable<T> {
  final Iterable<T> _source;
  List<T> _cache = [];
  bool _isCached = false;

  _MemoizedIterable(this._source);

  @override
  Iterator<T> get iterator => _MemoizedIterator(this);
}

class _MemoizedIterator<T> extends Iterator<T> {
  _MemoizedIterator(this._iterable);
  final _MemoizedIterable<T> _iterable;

  Iterator<T> _sourceIterator;
  int _index = 0;

  T _current;
  @override
  T get current => _current;

  @override
  bool moveNext() {
    if (_iterable._isCached) {
      if (_index >= _iterable._cache.length) {
        return false;
      }
      _current = _iterable._cache[_index];
      _index++;
      return true;
    } else {
      _sourceIterator ??= _iterable._source.iterator;
      if (_sourceIterator.moveNext()) {
        _iterable._cache.add(_sourceIterator.current);
        _current = _sourceIterator.current;
        return true;
      } else {
        _iterable._cache = List.unmodifiable(_iterable._cache);
        _iterable._isCached = true;
        return false;
      }
    }
  }
}
