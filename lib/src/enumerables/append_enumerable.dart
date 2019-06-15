import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../iterators/append_iterator.dart';

class AppendEnumerable<T> extends Enumerable<T>
    implements EnumerableWithSource<T> {
  final Enumerable<T> source;
  final T newElement;

  const AppendEnumerable(this.source, this.newElement);

  @override
  Iterator<T> get iterator => AppendIterator(this);
}
