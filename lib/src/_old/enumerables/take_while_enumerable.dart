import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../typedefs.dart';
import '../iterators/take_while_iterator.dart';

class TakeWhileEnumerable<T> extends Enumerable<T>
    implements EnumerableWithSource<T> {
  final Enumerable<T> source;
  final Condition<T> condition;

  const TakeWhileEnumerable(this.source, this.condition);

  @override
  Iterator<T> get iterator => TakeWhileIterator(this);
}
