import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../errors.dart';
import '../iterators/null_iterator.dart';

class NullEnumerable<T> extends Enumerable<T> with EnumerableWithSource<T> {
  NullEnumerable();

  @override
  Iterable<T> get source => throw NullEnumerableError();

  @override
  Iterator<T> get iterator => NullIterator();
}