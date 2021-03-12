import 'dart:collection';

extension LagExtension<T> on Iterable<T> {
  /// Returns an iterable that projects the elements in this iterable upon other
  /// elements in this iterable offset backwards by a given value.
  ///
  /// Every element in this iterable is paired with the element appearing in the
  /// iterable [offset] prior to it. Each pairing is then returned as an element
  /// in the resulting iterable.
  ///
  /// For the first [offset] elements in the iterable, the element is paired with
  /// the value passed to [defaultValue].
  ///
  /// If the value of [offset] is zero, the iterable is unchanged. If it is less
  /// than zero, it is converted to the positive equivalent.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = <Object>['a', 'b', 'c', 'd'];
  ///       final result = list.lag(2, defaultValue: 'e');
  ///
  ///       // Result: [['a', 'e'], ['b', 'e'], ['c', 'a'], ['d', 'b']]
  ///     }
  Iterable<Iterable<T>> lag(
    int offset, {
    required T defaultValue,
  }) sync* {
    final queue = Queue<T>();
    offset = offset < 0 ? -offset : offset;
    var index = 0;

    for (var o in this) {
      queue.add(o);
      if (index >= offset) {
        yield [o, queue.removeFirst()];
      } else {
        yield [o, defaultValue];
      }
      index++;
    }
  }
}
