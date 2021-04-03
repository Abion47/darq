extension BatchExtension<T> on Iterable<T> {
  /// Groups elements in the iterator into batches of [size] length, optionally
  /// truncating elements that don't fit into a full-size batch.
  ///
  /// Iterates through the iterator and groups elements into a secondary list
  /// of [size] length. Once the list is full, the list is then yielded.
  ///
  /// If [includeTail] is false, when the source iteration is complete, any
  /// remaining elements are discarded. If true, these elements are returned as
  /// a final list of some length less than [size]. (False by default.)
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 2, 3, 4, 5, 6];
  ///       final result = list.batch(2);
  ///
  ///       // Result: [[1, 2], [3, 4], [5, 6]]
  ///     }
  Iterable<Iterable<T>> batch(int size, {bool includeTail = false}) sync* {
    if (size <= 0) {
      throw ArgumentError('The value of "size" must be greater than zero');
    }

    var package = <T>[];

    for (var v in this) {
      package.add(v);
      if (package.length >= size) {
        yield package;
        package = <T>[];
      }
    }

    if (package.isNotEmpty && includeTail) {
      yield package;
    }
  }
}
