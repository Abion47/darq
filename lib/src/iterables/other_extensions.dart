import 'dart:math';

import '../consumers/math_consumers.dart';
import '../equality_comparer.dart';

extension OtherIterableExtensions<T> on Iterable<T> {
  /// Returns an iterable whose elements are cached during the
  /// first iteration.
  ///
  /// During the first time the returned iterable is consumed,
  /// its elements are placed into a cache, which is finalized
  /// once iteration is complete. On subsequent times the
  /// iterable is consumed, the elements from the cache are reused.
  Iterable<T> memoize() => _MemoizedIterable(this);

  /// Returns an iterable of the specified size consisting of
  /// random elements from this iterable.
  Iterable<T> randomSubset(int size, [Random random]) {
    final list = toList();
    list.shuffle(random);

    return list.take(size);
  }

  /// Repeats this iterable a specified number of times.
  ///
  /// If [count] is zero, this method returns an empty iterable.
  ///
  /// If count is less than zero, an [ArgumentError] is thrown.
  Iterable<T> repeat(int count) sync* {
    if (count < 0) {
      throw ArgumentError.value(
          count, 'count', 'The value of "count" must be greater than zero.');
    }
    for (var i = 0; i < count; i++) {
      yield* this;
    }
  }

  /// Skips the last [count] elements in an iterable.
  Iterable<T> skipLast(int count) {
    final length = this.count();
    return take(length - count);
  }

  /// Splits the is iterable into multiple iterables on elements that match
  /// the separator.
  Iterable<Iterable<T>> split(
    T separator, {
    bool Function(T, T) comparer,
  }) sync* {
    var buffer = <T>[];

    comparer ??= EqualityComparer.forType<T>().compare ?? (a, b) => a == b;

    for (var o in this) {
      if (comparer(separator, o)) {
        yield buffer;
        buffer = <T>[];
      } else {
        buffer.add(o);
      }
    }

    if (buffer.isNotEmpty) {
      yield buffer;
    }
  }

  /// Takes every N-th element in this iterable.
  Iterable<T> takeEvery(int step) sync* {
    var count = 0;
    for (var o in this) {
      count++;
      if (count == step) {
        yield o;
        count = 0;
      }
    }
  }

  /// Takes the last [count] elements in an iterable.
  Iterable<T> takeLast(int count) {
    final length = this.count();
    return skip(length - count);
  }
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
