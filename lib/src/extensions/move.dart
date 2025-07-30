extension MoveExtension<T> on Iterable<T> {
  /// Moves a range of elements in this iterable to a new position, offsetting
  /// other elements to compensate.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1, 2, 3, 4, 5];
  ///       final result = list.move(3, 2, 0);
  ///
  ///       // Result: [3, 4, 0, 1, 2, 5]
  ///     }
  Iterable<T> move(int from, int count, int to) sync* {
    if (from < 0) {
      throw RangeError.index(from, this, 'from',
          'The value of "from" must be greater than or equal to zero.');
    }
    if (count < 0) {
      throw RangeError.index(count, this, 'count',
          'The value of "count" must be greater than or equal to zero.');
    }
    if (to < 0) {
      throw RangeError.index(to, this, 'to',
          'The value of "to" must be greater than or equal to zero.');
    }

    if (from == to || count == 0) {
      yield* this;
    }

    Iterable<T> _innerLoop(
      int startIndex,
      int bufferSize,
      int yieldIndex,
    ) sync* {
      var hasMore = true;
      var e = iterator;

      bool moveNext() => hasMore && (hasMore = e.moveNext());

      for (var i = 0; i < startIndex && moveNext(); i++) {
        yield e.current;
      }

      var buffer = List<T?>.filled(bufferSize, null);
      var length = 0;

      for (; length < bufferSize && moveNext(); length++) {
        buffer[length] = e.current;
      }

      for (var i = 0; i < yieldIndex && moveNext(); i++) {
        yield e.current;
      }

      for (var i = 0; i < length; i++) {
        final item = buffer[i];
        if (item == null) {
          throw StateError('Buffer element should not be null');
        }
        yield item;
      }

      while (moveNext()) {
        yield e.current;
      }
    }

    yield* to < from
        ? _innerLoop(to, from - to, count)
        : _innerLoop(from, count, to - from);
  }
}
