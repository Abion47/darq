import '../utility/equality_comparer.dart';
import '../utility/error.dart';

extension StartsWithExtension<T> on Iterable<T> {
  /// Returns true if this iterable starts with the same elements that are in
  /// [other].
  bool startsWith(
    Iterable<T> other, {
    bool Function(T, T) comparer,
  }) {
    checkNullError(this);
    ArgumentError.checkNotNull(other, 'other');

    comparer ??= EqualityComparer.forType<T>().compare ?? (a, b) => a == b;

    final iterator = this.iterator;

    for (var o in other) {
      if (!iterator.moveNext()) {
        return false;
      }
      if (!comparer(o, iterator.current)) {
        return false;
      }
    }

    return true;
  }
}
