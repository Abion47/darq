import 'dart:math';

extension ShakeExtension<T> on Iterable<T> {
  /// Returns a sequence of elements in random order from the original
  /// sequence. An additional parameter specifies a random generator to be
  /// used for the random selection algorithm.
  ///
  /// Internally this method performs a partial Fisher-Yates
  /// shuffle of the list.
  /// It's called `shake`, because `shuffle` is already occupied in List<> class.
  Iterable<T> shake([Random? random]) {
    final list = toList();
    random ??= Random();

    var w = list.length;
    var g = w - 1;

    for (var m = 0; m < list.length; ++m)
    {
      var k = g - random.nextInt(w);
      var tmp = list[k];
      list[k] = list[m];
      list[m] = tmp;
      w--;
    }

    return list;
  }

  /// Just an alias for `shake` extension.
  Iterable<T> shuffle2([Random? random]) => shake(random);
}
