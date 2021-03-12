import '../utility/tuple.dart';

extension PairwiseExtension<T> on Iterable<T> {
  /// Returns an iterable that pairs every element with the element before it.
  ///
  /// Every element returned by this method is a [Tuple2] containing every element
  /// in this iterable paired with the element that comes before it, with the exception
  /// of the first element. As such, the length of the returned iterable will be
  /// one less than this iterable.
  ///
  /// If this iterable is empty or only contains one element, a [StateError] will be
  /// thrown.
  Iterable<Tuple2<T, T>> pairwise() sync* {
    final iterator = this.iterator;
    if (!iterator.moveNext()) {
      throw StateError('Cannot perform pairwise on an empty iterable.');
    }

    var lastValue = iterator.current;

    if (!iterator.moveNext()) {
      throw StateError(
          'Cannot perform pairwise on an iterable with only one element.');
    }

    do {
      yield Tuple2(lastValue, iterator.current);
      lastValue = iterator.current;
    } while (iterator.moveNext());
  }
}
