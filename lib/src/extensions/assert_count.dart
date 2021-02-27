import 'count.dart';

extension AssertCountExtension<T> on Iterable<T> {
  /// Asserts that any elements in this iterable meet a given condition. If not, an
  /// [AssertionError] is thrown.
  ///
  /// The iterable is consumed and all elements are passed to [condition]. If the result
  /// of any call returns true, this iterable is returned back. If all such calls return false,
  /// an [AssertionError] is thrown.
  ///
  /// If [message] is provided and an error is thrown, the message will be provided with the
  /// error.
  Iterable<T> assertCount(int count, [String? message]) {
    assert(count == this.count(), message);
    return this;
  }
}
