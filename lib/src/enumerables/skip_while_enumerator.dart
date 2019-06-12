import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../typedefs.dart';
import '../iterators/skip_while_iterator.dart';

class SkipWhileEnumerable<T> extends Enumerable<T> with EnumerableWithSource<T> {
  final Condition<T> condition;

  SkipWhileEnumerable(Enumerable<T> source, this.condition) {
    this.src = source;
  }

  @override
  Iterator<T> get iterator => SkipWhileIterator(this);
}