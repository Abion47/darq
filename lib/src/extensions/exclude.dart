import '../utility/equality_comparer.dart';
import '../utility/error.dart';

extension ExcludeExtension<T> on Iterable<T> {
  /// Returns all elements in this iterable except those that are equal to
  /// the specified value.
  Iterable<T> exclude(
    T elem, {
    bool Function(T, T) comparer,
  }) sync* {
    checkNullError(this);
    comparer ??= EqualityComparer.forType<T>()?.compare ?? (a, b) => a == b;

    for (var o in this) {
      if (!comparer(elem, o)) {
        yield (o);
      }
    }
  }
}
