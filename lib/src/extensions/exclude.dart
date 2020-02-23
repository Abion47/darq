import '../utility/equality_comparer.dart';

extension ExcludeExtension<T> on Iterable<T> {
  /// Returns all elements in this iterable except those that are equal to
  /// the specified value.
  Iterable<T> exclude(
    T elem, {
    bool Function(T, T) comparer,
  }) sync* {
    comparer ??= EqualityComparer.forType<T>()?.compare ?? (a, b) => a == b;

    for (var o in this) {
      if (comparer(elem, o)) {
        yield (o);
      }
    }
  }
}
