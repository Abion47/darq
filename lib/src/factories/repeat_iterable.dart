/// Creates an iterable whose elements are a single value
/// repeated a specified number of times.
class RepeatIterable<T> extends Iterable<T> {
  final T element;
  final int count;

  /// Creates an iterable consisting of [element] repeated [count] times.
  ///
  /// If the value of [count] is zero, this will result in an empty
  /// iterable. Having the value of [count] be less than zero will result
  /// in an empty iterable.
  RepeatIterable(this.element, this.count) : assert(count >= 0);

  @override
  Iterator<T> get iterator => _RepeatIterator(element, count);
}

class _RepeatIterator<T> extends Iterator<T> {
  final T element;
  final int count;

  _RepeatIterator(this.element, this.count);

  int _currentCount = 0;

  @override
  T get current => element;

  @override
  bool moveNext() {
    if (_currentCount >= count) return false;

    _currentCount++;
    return true;
  }
}
