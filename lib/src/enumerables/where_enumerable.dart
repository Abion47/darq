import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../typedefs.dart';
import '../iterators/where_iterator.dart';

class WhereEnumerable<T> extends Enumerable<T> with EnumerableWithSource<T> {
  final Condition<T> condition;

  WhereEnumerable(Enumerable<T> source, this.condition) {
    this.src = source;
  }

  @override
  Iterator<T> get iterator => WhereIterator(this);
}
