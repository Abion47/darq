import '../utility/error.dart';

extension NonNullExtension<T> on Iterable<T> {
  /// Returns this iterable with all null values excluded.
  ///
  /// If this iterable doesn't contain any null values, the
  /// iterable will be unaffected.
  Iterable<T> nonNull() sync* {
    checkNullError(this);

    for (var o in this) {
      if (o != null) {
        yield o;
      }
    }
  }
}
