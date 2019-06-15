import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../typedefs.dart';
import '../iterators/where_iterator.dart';

class WhereEnumerable<T> extends Enumerable<T>
    implements EnumerableWithSource<T> {
  final Enumerable<T> source;
  final Condition<T> condition;

  const WhereEnumerable(this.source, this.condition);

  @override
  Iterator<T> get iterator => WhereIterator(this);
}
