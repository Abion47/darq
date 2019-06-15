import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../iterators/default_if_empty_iterator.dart';

class DefaultIfEmptyEnumerable<T> extends Enumerable<T>
    implements EnumerableWithSource<T> {
  final Enumerable<T> source;
  final T defaultValue;

  const DefaultIfEmptyEnumerable(this.source, this.defaultValue);

  @override
  Iterator<T> get iterator => DefaultIfEmptyIterator(this);
}
