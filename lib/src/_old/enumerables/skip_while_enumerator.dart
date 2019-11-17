import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../typedefs.dart';
import '../iterators/skip_while_iterator.dart';

class SkipWhileEnumerable<T> extends Enumerable<T>
    implements EnumerableWithSource<T> {
  final Enumerable<T> source;
  final Condition<T> condition;

  const SkipWhileEnumerable(this.source, this.condition);

  @override
  Iterator<T> get iterator => SkipWhileIterator(this);
}
