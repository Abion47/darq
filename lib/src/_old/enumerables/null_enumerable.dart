import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../errors.dart';
import '../iterators/null_iterator.dart';

class NullEnumerable<T> extends Enumerable<T>
    implements EnumerableWithSource<T> {
  const NullEnumerable();

  @override
  Iterable<T> get source => throw EnumerableError.isNull();

  @override
  Iterator<T> get iterator => NullIterator();
}
