extension AssertAnyExtension<T> on Iterable<T> {
  /// Asserts that any elements in this iterable meet a given condition. If not, an
  /// [AssertionError] is thrown.
  ///
  /// The iterable is consumed and all elements are passed to [condition]. If the result
  /// of any call returns true, this iterable is returned back. If all such calls return false,
  /// an [AssertionError] is thrown.
  ///
  /// If [message] is provided and an error is thrown, the message will be provided with the
  /// error.
  Iterable<T> assertAny(bool Function(T element) condition, [String? message]) {
    assert(any(condition), message);
    return this;
  }
}
