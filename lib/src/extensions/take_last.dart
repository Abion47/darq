import 'count.dart';

extension TakeLastExtension<T> on Iterable<T> {
  /// Takes the last [count] elements in an iterable.
  Iterable<T> takeLast(int count) {
    if (count < 0) {
      throw RangeError.value(
          count, 'count', 'The value of "count" cannot be negative.');
    }
    if (count == 0) {
      return Iterable<T>.empty();
    }

    final length = this.count();
    return skip(length - count);
  }
}
