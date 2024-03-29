extension PrependAllExtension<T> on Iterable<T> {
  /// Inserts all elements in an iterable at the beginning of this iterable.
  ///
  /// This is a convenience method that is identical to calling [other.followedBy(iterable)](https://api.flutter.dev/flutter/dart-core/Iterable/followedBy.html).
  Iterable<T> prependAll(Iterable<T> other) {
    return other.followedBy(this);
  }
}
