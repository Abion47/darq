extension BatchSelectExtension<T> on Iterable<T> {
  /// Groups elements in the iterator into batches of [size] length and puts them
  /// through a mapping function, optionally truncating elements that don't fit
  /// into a full-size batch.
  ///
  /// Iterates through the iterator and groups elements into a secondary list
  /// of [size] length. Once the list is full, the list is then passed to [selector]
  /// which maps them to the result type.
  ///
  /// If [includeTail] is false, when the source iteration is complete, any
  /// remaining elements are discarded. If true, these elements are returned as
  /// a final list of some length less than [size]. (False by default.)
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 2, 3, 4, 5, 6];
  ///       final result = list.batchSelect(2, (b) => b.toString());
  ///
  ///       // Result: ['[1, 2]', '[3, 4]', '[5, 6]']
  ///     }
  Iterable<TResult> batchSelect<TResult>(
    int size,
    TResult Function(List<T> batch) selector, {
    bool includeTail = false,
  }) sync* {
    if (size <= 0) {
      throw RangeError.value(
          size, 'size', 'The value of "size" must be a positive integer.');
    }

    var package = <T>[];

    for (var v in this) {
      package.add(v);
      if (package.length >= size) {
        yield selector(package);
        package = <T>[];
      }
    }

    if (package.isNotEmpty && includeTail) {
      yield selector(List<T>.of(package));
    }
  }
}
