import 'dart:math';

import '../utility/error.dart';

extension RandomSubsetExtension<T> on Iterable<T> {
  /// Returns an iterable of the specified size consisting of
  /// random elements from this iterable.
  ///
  /// Internally this method performs a partial Fisher-Yates
  /// shuffle of the list. A partial shuffle is to avoid a wasteful
  /// amount of shuffling when [size] is less than the length of
  /// the iterable.
  Iterable<T> randomSubset(int size, [Random random]) {
    checkNullError(this);
    ArgumentError.checkNotNull(size, 'size');

    final list = toList();
    random ??= Random();

    if (list.length < size) {
      throw RangeError.range(
        size,
        0,
        list.length,
        'size',
        'The value of "size" cannot be greater than the length of the iterable.',
      );
    }

    var m = 0;
    var w = list.length;
    var g = w - 1;

    while (m < size) {
      var k = g - random.nextInt(w);
      var tmp = list[k];
      list[k] = list[m];
      list[m] = tmp;
      m++;
      w--;
    }

    return list.take(size);
  }
}
