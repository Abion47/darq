import 'count.dart';

extension InsertionIterableExtensions<T> on Iterable<T> {
  /// Pads the iterable to be at least [length], adding [padding]
  /// to the start as needed to guarantee the length.
  ///
  /// If the iterable is already has at least [length] elements,
  /// the iterable is unchanged.
  Iterable<T> padStart(int length, {required T padding}) sync* {
    if (length < 0) {
      throw ArgumentError.value(
          length, 'length', 'The value for "length" cannot be less than zero.');
    }

    var paddingElements = length - count();
    for (; paddingElements > 0; paddingElements--) {
      yield padding;
    }

    for (var o in this) {
      yield o;
    }
  }
}
