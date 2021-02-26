import '../utility/equality_comparer.dart';
import '../utility/error.dart';

extension ExcludeExtension<T> on Iterable<T> {
  /// Returns all elements in this iterable except those that are equal to
  /// the specified value.
  Iterable<T> exclude(
    T value, {
    bool Function(T value, T element) comparer,
  }) sync* {
    checkNullError(this);
    comparer ??= EqualityComparer.forType<T>()?.compare ?? (a, b) => a == b;

    for (var o in this) {
      if (!comparer(value, o)) {
        yield (o);
      }
    }
  }
}
