extension ToStreamExtension<T> on Iterable<T> {
  /// Converts the iterable to a [Stream].
  ///
  /// Wraps the iterable in a [Stream] that emits all the values in this iterable. If
  /// iteration is paused, the stream's events will be paused and vice versa. If an
  /// error is thrown during iteration, the stream will emit the error and then close.
  ///
  /// If `isBroadcast` is set to true, the stream will be a broadcast stream. Otherwise,
  /// the stream will be a single-subscription stream. (Default is false.)
  ///
  /// (This is a convenience method that wraps [Stream.fromIterable].)
  Stream<T> toStream({bool isBroadcast = false}) {
    final stream = Stream.fromIterable(this);
    if (isBroadcast) return stream.asBroadcastStream();
    return stream;
  }
}
