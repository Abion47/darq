import 'dart:collection';

extension LagSelectExtension<T> on Iterable<T> {
  /// Returns an iterable that projects the elements in this iterable upon other
  /// elements in this iterable offset backwards by a given value.
  ///
  /// Every element in this iterable is paired with the element appearing in the
  /// iterable [offset] prior to it. These pairings are then passed to [selector]
  /// which generates the final element yielded to the new iterable.
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
  ///       final result = list.lagSelect(2, (a, b) => '$a$b', defaultValue: 'e');
  ///
  ///       // Result: ['ae', 'be', 'ca', 'db']
  ///     }
  Iterable<TResult> lagSelect<TResult>(
    int offset,
    TResult Function(T element, T laggedElement) selector, {
    required T defaultValue,
  }) sync* {
    final queue = Queue<T>();
    offset = offset < 0 ? -offset : offset;
    var index = 0;

    for (var o in this) {
      queue.add(o);
      if (index >= offset) {
        yield selector(o, queue.removeFirst());
      } else {
        yield selector(o, defaultValue);
      }
      index++;
    }
  }
}
