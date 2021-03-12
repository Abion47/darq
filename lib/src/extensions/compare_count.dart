import 'count.dart';

extension CompareCountExtension<T> on Iterable<T> {
  /// Compares the length of this iterable and [other] and returns an
  /// integer representing their comparison.
  ///
  /// If this iterable is longer than [other], this method returns 1.
  ///
  /// If [other] is longer than this iterable, this method returns -1.
  ///
  /// If this iterable and [other] are the same length, this method returns 0.
  int compareCount(Iterable other) {
    return count().compareTo(other.count());
  }
}
