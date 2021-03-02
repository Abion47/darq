import 'count.dart';

extension SkipLastExtension<T> on Iterable<T> {
  /// Skips the last [count] elements in an iterable.
  Iterable<T> skipLast(int count) {
    final length = this.count();
    if (length < count) {
      throw ArgumentError.value(count, 'count',
          'The value of "count" cannot be greater than the length of the iterable.');
    }

    if (length == count) {
      return Iterable.empty();
    }

    return take(length - count);
  }
}
