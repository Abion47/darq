import '../utility/equality_comparer.dart';
import 'count.dart';
import 'sequence_equals.dart';
import 'take_last.dart';

extension EndsWithExtension<T> on Iterable<T> {
  /// Returns true if this iterable ends with the same elements that are in
  /// [other].
  bool endsWith(
    Iterable<T> other, {
    bool Function(T value, T otherValue)? comparer,
  }) {
    comparer ??= EqualityComparer.forType<T>().compare;

    final count = other.count();
    final tail = takeLast(count);

    return tail.sequenceEquals(other, comparer: comparer);
  }
}
