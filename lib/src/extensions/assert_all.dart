extension AssertAllExtension<T> on Iterable<T> {
  /// Asserts that all elements in this iterable meet a given condition. If not, an
  /// [AssertionError] is thrown.
  ///
  /// The iterable is consumed and all elements are passed to [condition]. If the result
  /// of all calls return true, this iterable is returned back. If any call returns false,
  /// an [AssertionError] is thrown.
  ///
  /// If [message] is provided and an error is thrown, the message will be provided with the
  /// error.
  Iterable<T> assertAll(bool Function(T element) condition, [String? message]) {
    assert(every(condition), message);
    return this;
  }
}
