extension PadEndExtension<T> on Iterable<T> {
  /// Pads the iterable to be at least [length], adding [padding]
  /// to the end as needed to guarantee the length.
  ///
  /// If the iterable is already has at least [length] elements,
  /// the iterable is unchanged.
  Iterable<T> padEnd(int length, {T padding}) sync* {
    var count = 0;

    for (var o in this) {
      yield o;
      count++;
    }

    for (; count < length; count++) {
      yield padding;
    }
  }
}
