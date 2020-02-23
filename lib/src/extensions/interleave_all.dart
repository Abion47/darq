import 'all.dart';

extension InterleaveAllExtension<T> on Iterable<T> {
  /// Returns the elements of this iterable interleaved with the elements of every iterable in
  /// [others].
  ///
  /// The elements of the resulting iterable will consist of the first element of
  /// this iterable followed by the first element of each iterable in [others], followed by the second
  /// element of this iterable, and so on until all iterables are fully consumed.
  ///
  /// If the iterables are not the same length, any iterable which is consumed before iteration is
  /// complete will be skipped for the remainder of iteration.
  Iterable<T> interleaveAll(Iterable<Iterable<T>> others) sync* {
    if (others == null) {
      throw ArgumentError.notNull('others');
    }
    if (others.any((i) => i == null)) {
      throw ArgumentError('Every element in "others" must not be null.');
    }

    final iterators = [
      iterator,
      ...others.map((i) => i.iterator),
    ];

    final isClosedMap = [...iterators.map((i) => i.moveNext())];

    do {
      for (var i = 0; i < iterators.length; i++) {
        if (isClosedMap[i]) yield iterators[i].current;
      }
    } while (isClosedMap.all((b) => !b));
  }
}
