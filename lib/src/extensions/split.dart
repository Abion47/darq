import 'package:darq/src/utility/equality_comparer.dart';

extension SplitExtension<T> on Iterable<T> {
  /// Splits the is iterable into multiple iterables on elements that match
  /// the separator.
  Iterable<Iterable<T>> split(
    T separator, {
    bool Function(T, T) comparer,
  }) sync* {
    var buffer = <T>[];

    comparer ??= EqualityComparer.forType<T>().compare ?? (a, b) => a == b;

    for (var o in this) {
      if (comparer(separator, o)) {
        yield buffer;
        buffer = <T>[];
      } else {
        buffer.add(o);
      }
    }

    if (buffer.isNotEmpty) {
      yield buffer;
    }
  }
}
