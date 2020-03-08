import 'dart:collection';

import '../utility/error.dart';

extension CountByExtension<T> on Iterable<T> {
  /// Applies [keySelector] to every element in this iterable and returns an iterable
  /// containing each resulting key and the number of times that key appears in this
  /// iterable.
  ///
  /// The order of the resulting iterable is not guaranteed to be any particular order.
  Iterable<MapEntry<TKey, int>> countBy<TKey>(
    TKey Function(T) keySelector,
  ) {
    checkNullError(this);
    ArgumentError.checkNotNull(keySelector, 'keySelector');
    final countMap = HashMap<TKey, int>();
    for (var o in this) {
      final key = keySelector(o);
      countMap.putIfAbsent(key, () => 0);
      countMap[key]++;
    }
    return countMap.entries;
  }
}
