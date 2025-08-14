import 'dart:math';

extension RandomExtension<T> on Iterable<T> {
  /// Returns a random element from this iterable. The optional parameter [random]
  /// specifies a random generator to be used for the random selection algorithm.
  ///
  /// Internally, the iterable is consumed.
  T random({Random? random}) {
    final list = toList();
    if (list.isEmpty) throw StateError("No element");

    random ??= Random();
    return list[random.nextInt(list.length)];
  }
}
