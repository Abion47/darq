import '../utility/equality_comparer.dart';

extension ExcludeExtension<T> on Iterable<T> {
  /// Returns all elements in this iterable except those that are equal to
  /// the specified value.
  Iterable<T> exclude(
    T value, {
    bool Function(T value, T element)? comparer,
  }) sync* {
    comparer ??= EqualityComparer.forType<T>().compare;

    for (var o in this) {
      if (!comparer(value, o)) {
        yield (o);
      }
    }
  }
}
