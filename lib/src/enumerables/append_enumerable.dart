import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../iterators/append_iterator.dart';

class AppendEnumerable<T> extends Enumerable<T> with EnumerableWithSource<T> {
  final T newElement;

  AppendEnumerable(Enumerable<T> source, this.newElement) {
    this.src = source;
  }

  @override
  Iterator<T> get iterator => AppendIterator(this);
}