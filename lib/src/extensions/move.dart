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
      return;
    }

    Iterable<T> _innerMove(
        int startIndex, int yieldIndex, int bufferSize) sync* {
      final iterator = this.iterator;
      var hasMore = true;

      bool moveNext() => hasMore && (hasMore = iterator.moveNext());

      for (var i = 0; i < from && moveNext(); i++) {
        yield iterator.current;
      }

      final buffer = List<T>(bufferSize);
      var length = 0;

      for (; length < bufferSize && moveNext(); length++) {
        buffer[length] = iterator.current;
      }

      for (var i = 0; i < yieldIndex && moveNext(); i++) {
        yield iterator.current;
      }

      for (var i = 0; i < length; i++) {
        yield buffer[i];
      }

      while (moveNext()) {
        yield iterator.current;
      }
    }

    yield* to < from
        ? _innerMove(to, count, from - to)
        : _innerMove(from, to - from, count);
  }
}
