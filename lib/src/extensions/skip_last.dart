import 'count.dart';

extension SkipLastExtension<T> on Iterable<T> {
  /// Skips the last [count] elements in an iterable.
  Iterable<T> skipLast(int count) {
    final length = this.count();
    return take(length - count);
  }
}
