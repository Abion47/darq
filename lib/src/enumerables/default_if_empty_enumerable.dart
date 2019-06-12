import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../iterators/default_if_empty_iterator.dart';

class DefaultIfEmptyEnumerable<T> extends Enumerable<T> with EnumerableWithSource<T> {
  final T defaultValue;

  DefaultIfEmptyEnumerable(Enumerable<T> source, this.defaultValue) {
    this.src = source;
  }
  
  @override
  Iterator<T> get iterator => DefaultIfEmptyIterator(this);
}