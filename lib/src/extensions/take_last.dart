import 'count.dart';

extension TakeLastExtension<T> on Iterable<T> {
  /// Takes the last [count] elements in an iterable.
  Iterable<T> takeLast(int count) {
    final length = this.count();
    return skip(length - count);
  }
}
