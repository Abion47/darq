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
      ArgumentError.value(
          from, 'from', 'The value of "from" must be greater than zero.');
    }
    if (count < 0) {
      ArgumentError.value(
          count, 'count', 'The value of "count" must be greater than zero.');
    }
    if (to < 0) {
      ArgumentError.value(
          to, 'to', 'The value of "to" must be greater than zero.');
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
      bool moveNext(Iterator<T> e) => hasMore && (hasMore = e.moveNext());

      var e = iterator;
      for (var i = 0; i < startIndex && moveNext(e); i++) {
        yield e.current;
      }

      var buffer = List<T?>.filled(bufferSize, null);
      var length = 0;

      for (; length < bufferSize && moveNext(e); length++) {
        buffer[length] = e.current;
      }

      for (var i = 0; i < yieldIndex && moveNext(e); i++) {
        yield e.current;
      }

      for (var i = 0; i < length; i++) {
        yield buffer[i]!;
      }

      while (moveNext(e)) {
        yield e.current;
      }
    }

    yield* to < from
        ? _innerLoop(to, from - to, count)
        : _innerLoop(from, count, to - from);
  }
}
