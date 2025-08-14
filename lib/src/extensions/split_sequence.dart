import '../utility/equality_comparer.dart';

extension SplitSequenceExtension<T> on Iterable<T> {
  /// Splits the is iterable into multiple iterables on elements that match
  /// the separator.
  ///
  /// Optionally a [comparer] can be provided to determine if an element
  /// is equal to the separator.
  ///
  /// If [keepSeparator] is true, the returned iterables will be interleaved with
  /// the value of the separator. Otherwise, the separator elements will be omitted
  /// from the output.
  Iterable<Iterable<T>> splitSequence(
    Iterable<T> separator, {
    bool Function(T separator, T element)? comparer,
    bool keepSeparator = false,
  }) sync* {
    final separatorList = separator.toList(growable: false);
    var index = 0;
    var buffer = <T>[];

    comparer ??= EqualityComparer.forType<T>().compare;

    for (var o in this) {
      if (comparer(separatorList[index], o)) {
        index++;

        if (index >= separatorList.length) {
          yield List.unmodifiable(buffer);
          if (keepSeparator) yield separatorList;
          index = 0;
          buffer = <T>[];
        }
      } else {
        if (index > 0) buffer.addAll(separatorList.take(index));
        buffer.add(o);
        index = 0;
      }
    }

    if (index > 0) {
      buffer.addAll(separatorList.take(index));
    }

    if (buffer.isNotEmpty) {
      yield List.unmodifiable(buffer);
    }
  }
}
