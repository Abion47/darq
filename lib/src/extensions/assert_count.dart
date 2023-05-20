import 'count.dart';

extension AssertCountExtension<T> on Iterable<T> {
  /// Asserts that any elements in this iterable meet a given condition. If not, an
  /// [AssertionError] is thrown.
  ///
  /// The iterable is consumed and the elements are counted. If the length of the iterable
  /// is equal to the given [count], the iterable is returned. If not,
  /// an [AssertionError] is thrown.
  ///
  /// If [message] is provided and an [AssertionError] is thrown, the message will
  /// be provided with the error.
  Iterable<T> assertCount(int count, [String? message]) {
    assert(count == this.count(), message);
    return this;
  }
}
