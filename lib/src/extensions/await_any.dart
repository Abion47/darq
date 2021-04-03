extension AwaitAnyExtension<T> on Iterable<Future<T>> {
  /// Awaits each future in the iterable and returns the value of the first future to complete.
  ///
  /// (This is a convenience method and is identical to `Future.any(iterable)`)
  Future<T> awaitAny() {
    return Future.any(this);
  }
}
