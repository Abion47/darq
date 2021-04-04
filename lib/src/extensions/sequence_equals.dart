import '../utility/equality_comparer.dart';

extension SequenceEqualsExtension<T> on Iterable<T> {
  /// Returns `true` if this iterable is equivalent to the given collection.
  ///
  /// Iterates over both this iterable and the given [other] collection. If the
  /// comparison returns false for any element pair, [sequenceEquals]
  /// will return `false`.
  ///
  /// Furthermore, if either collections iteration ends before the other's does,
  /// the lengths of the collections is deemed unequal, and [sequenceEquals] will
  /// return `false`.
  ///
  /// If the iterable and the [other] collection are the same length and each
  /// element in the corresponsing positions of both are deemed equal by the
  /// selector functions, [sequenceEquals] will return `true`.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final listA = ['a', 'b', 'c'];
  ///       final listB = ['a', 'b', 'c'];
  ///       final result = listA.sequenceEquals(listB);
  ///
  ///       // Result: true
  ///     }
  bool sequenceEquals(
    Iterable<T> other, {
    bool Function(T outer, T inner)? comparer,
  }) {
    final iterA = iterator;
    final iterB = other.iterator;

    bool aHasNext;
    bool bHasNext;

    comparer ??= EqualityComparer.forType<T>().compare;

    do {
      aHasNext = iterA.moveNext();
      bHasNext = iterB.moveNext();

      if (aHasNext && bHasNext) {
        if (!comparer(iterA.current, iterB.current)) {
          return false;
        }
      }
    } while (aHasNext && bHasNext);

    if (aHasNext != bHasNext) return false;

    return true;
  }
}
