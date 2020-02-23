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
    var package = List<T>(size);
    var index = 0;

    for (var v in this) {
      package[index++] = v;
      if (index >= package.length) {
        yield selector(package);
        package = List<T>(size);
        index = 0;
      }
    }

    if (index > 0 && includeTail) {
      yield selector(List<T>.of(package.sublist(0, index)));
    }
  }
}
