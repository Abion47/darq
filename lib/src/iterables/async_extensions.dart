import 'dart:async';

extension AsyncIterableExtensions<T> on Iterable<Future<T>> {
  /// Awaits each future in the iterable and returns an iterable of the returned values
  /// once all the futures have completed.
  ///
  /// (This is a convenience method and is identical to `Future.wait(iterable)`)
  Future<Iterable<T>> awaitAll() => Future.wait(this);

  /// Awaits each future in the iterable and returns the value of the first future to complete.
  ///
  /// (This is a convenience method and is identical to `Future.any(iterable)`)
  Future<T> awaitAny() => Future.any(this);
}
