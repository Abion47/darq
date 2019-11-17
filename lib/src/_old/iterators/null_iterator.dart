import '../enumerable_iterator.dart';

class NullIterator<T> extends EnumerableIterator<T, T> {
  @override
  T get current => null;

  @override
  bool moveNext() {
    return false;
  }
}
