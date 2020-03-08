import '../utility/error.dart';

extension FillMissingExtension<T> on Iterable<T> {
  /// Returns this iterable with all null values replaced with the specified element.
  ///
  /// If this iterable doesn't contain any null values, the iterable will be unaffected.
  Iterable<T> fillMissing(T value) sync* {
    checkNullError(this);
    for (var o in this) {
      yield o ?? value;
    }
  }
}
