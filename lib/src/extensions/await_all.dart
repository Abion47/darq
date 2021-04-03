extension AwaitAllExtension<T> on Iterable<Future<T>> {
  /// Awaits each future in the iterable and returns an iterable of the returned values
  /// once all the futures have completed.
  ///
  /// (This is a convenience method and is identical to `Future.wait(iterable)`)
  Future<Iterable<T>> awaitAll() {
    return Future.wait(this);
  }
}
