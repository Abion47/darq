import '../utility/error.dart';

extension PrependAllExtension<T> on Iterable<T> {
  /// Inserts all elements in an iterable at the beginning of this iterable.
  ///
  /// This is a convenience method that is identical to calling [other.followedBy(iterable)].
  Iterable<T> prependAll(Iterable<T> other) {
    checkNullError(this);
    ArgumentError.checkNotNull(other, 'other');
    return other.followedBy(this);
  }
}
