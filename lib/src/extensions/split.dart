import '../utility/equality_comparer.dart';

extension SplitExtension<T> on Iterable<T> {
  /// Splits the is iterable into multiple iterables on elements that match
  /// the separator.
  ///
  /// Optionally a [comparer] can be provided to determine if an element
  /// is equal to the separator.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = ['a', ' ', 'b', 'c', ' ', 'd'];
  ///       final result = list.split(' ');
  ///
  ///       // Result: [
  ///       //   ['a''],
  ///       //   ['b', 'c'],
  ///       //   ['d'],
  ///       // ]
  ///     }
  Iterable<Iterable<T>> split(
    T separator, {
    bool Function(T separator, T element)? comparer,
  }) sync* {
    var buffer = <T>[];

    comparer ??= EqualityComparer.forType<T>().compare;

    for (var o in this) {
      if (comparer(separator, o)) {
        yield List.unmodifiable(buffer);
        buffer = <T>[];
      } else {
        buffer.add(o);
      }
    }

    if (buffer.isNotEmpty) {
      yield List.unmodifiable(buffer);
    }
  }
}
