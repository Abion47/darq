import '../utility/error.dart';

extension AppendAllExtension<T> on Iterable<T> {
  /// Inserts all elements in an iterable at the end of this iterable.
  ///
  /// This is a convenience method that is identical to calling [iterable.followedBy(other)].
  Iterable<T> appendAll(Iterable<T> other) {
    checkNullError(this);
    ArgumentError.checkNotNull(other, 'other');
    return followedBy(other);
  }
}
