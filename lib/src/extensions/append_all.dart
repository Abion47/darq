extension AppendAllExtension<T> on Iterable<T> {
  /// Inserts all elements in an iterable at the end of this iterable.
  ///
  /// This is a convenience method that is identical to calling
  /// [iterable.followedBy(other)](https://api.flutter.dev/flutter/dart-core/Iterable/followedBy.html).
  Iterable<T> appendAll(Iterable<T> other) {
    return followedBy(other);
  }
}
