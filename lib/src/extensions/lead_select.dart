import 'dart:collection';

extension LeadSelectExtension<T> on Iterable<T> {
  /// Returns an iterable that projects the elements in this iterable upon other
  /// elements in this iterable offset forwards by a given value.
  ///
  /// Every element in this iterable is paired with the element appearing in the
  /// iterable [offset] following it. These pairings are then passed to [selector]
  /// which generates the final element yielded to the new iterable.
  ///
  /// For the last [offset] elements in the iterable, the element is paired with
  /// the value passed to [defaultValue].
  ///
  /// If the value of [offset] is zero, the iterable is unchanged. If it is less
  /// than zero, it is converted to the positive equivalent.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = ['a', 'b', 'c', 'd'];
  ///       final result = list.lead(2, (a, b) => '$a$b', defaultValue: 'e');
  ///
  ///       // Result: ['ac', 'bd', 'ce', 'de']
  ///     }
  Iterable<TResult> leadSelect<TResult>(
    int offset,
    TResult Function(T leadedElement, T element) selector, {
    required T defaultValue,
  }) sync* {
    final queue = Queue<T>();
    offset = offset < 0 ? -offset : offset;
    var index = 0;

    for (var o in this) {
      queue.add(o);
      if (index >= offset) {
        yield selector(queue.removeFirst(), o);
      }
      index++;
    }

    while (queue.isNotEmpty) {
      yield selector(queue.removeFirst(), defaultValue);
    }
  }
}
