import 'count.dart';
import 'take_last.dart';
import 'sequence_equals.dart';
import '../utility/equality_comparer.dart';

extension EndsWithExtension<T> on Iterable<T> {
  /// Returns true if this iterable ends with the same elements that are in
  /// [other].
  bool endsWith(
    Iterable<T> other, {
    bool Function(T, T) comparer,
  }) {
    if (other == null) {
      throw ArgumentError.notNull('other');
    }

    comparer ??= EqualityComparer.forType<T>().compare ?? (a, b) => a == b;

    final count = other.count();
    final tail = takeLast(count);

    return tail.sequenceEquals(other, comparer: comparer);
  }
}
