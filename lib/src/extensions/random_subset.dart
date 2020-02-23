import 'dart:math';

extension RandomSubsetExtension<T> on Iterable<T> {
  /// Returns an iterable of the specified size consisting of
  /// random elements from this iterable.
  Iterable<T> randomSubset(int size, [Random random]) {
    final list = toList();
    list.shuffle(random);

    return list.take(size);
  }
}
