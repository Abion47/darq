import '../utility/equality_comparer.dart';

extension SequenceEqualsSelectExtension<T> on Iterable<T> {
  /// Returns `true` if this iterable is equivalent to the given collection.
  ///
  /// Iterates over both this iterable and the given [other] collection. The
  /// [outerSelector] function and the [innerSelector] is applied to elements in
  /// the same position of the source iterable and the [other] iterable, respectively.
  /// If the comparison returns false for any element pair, [sequenceEqualsSelect]
  /// will return `false`.
  ///
  /// Furthermore, if either collections iteration ends before the other's does,
  /// the lengths of the collections is deemed unequal, and [sequenceEqualsSelect] will
  /// return `false`.
  ///
  /// If the iterable and the [other] collection are the same length and each
  /// element in the corresponsing positions of both are deemed equal by the
  /// selector functions, [sequenceEqualsSelect] will return `true`.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final listA = ['a', 'b', 'c'];
  ///       final listB = [97, 98, 99];
  ///       final result = listA.sequenceEqualsSelect(
  ///         listB,
  ///         outerSelector: (c) => c.codeUnitAt(0),
  ///       );
  ///
  ///       // Result: true
  ///     }
  bool sequenceEqualsSelect<TOther, TKey>(
    Iterable<TOther> other, {
    required TKey Function(T element)? outerSelector,
    required TKey Function(TOther element)? innerSelector,
    bool Function(TKey outer, TKey inner)? comparer,
  }) {
    final iterA = iterator;
    final iterB = other.iterator;

    bool aHasNext;
    bool bHasNext;

    outerSelector ??= (T v) => v as TKey;
    innerSelector ??= (TOther v) => v as TKey;
    comparer ??= EqualityComparer.forType<TKey>().compare;

    do {
      aHasNext = iterA.moveNext();
      bHasNext = iterB.moveNext();

      if (aHasNext && bHasNext) {
        if (!comparer(
          outerSelector(iterA.current),
          innerSelector(iterB.current),
        )) {
          return false;
        }
      }
    } while (aHasNext && bHasNext);

    if (aHasNext != bHasNext) return false;

    return true;
  }
}
