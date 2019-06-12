import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../typedefs.dart';
import '../iterators/take_while_iterator.dart';

class TakeWhileEnumerable<T> extends Enumerable<T>
    with EnumerableWithSource<T> {
  final Condition<T> condition;

  TakeWhileEnumerable(Enumerable<T> source, this.condition) {
    this.src = source;
  }

  @override
  Iterator<T> get iterator => TakeWhileIterator(this);
}
