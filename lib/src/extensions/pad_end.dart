extension PadEndExtension<T> on Iterable<T> {
  /// Pads the iterable to be at least [length], adding [padding]
  /// to the end as needed to guarantee the length.
  ///
  /// If the iterable is already has at least [length] elements,
  /// the iterable is unchanged.
  Iterable<T> padEnd(int length, {required T padding}) sync* {
    if (length < 0) {
      throw ArgumentError.value(
          length, 'length', 'The value for "length" cannot be less than zero.');
    }

    if (length == 0) {
      yield* this;
      return;
    }

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
