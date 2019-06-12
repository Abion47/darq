import '../enumerable.dart';
import '../enumerable_with_source.dart';

class RepeatEnumerable<T> extends Enumerable<T> {
  final T value;
  final int count;

  RepeatEnumerable(this.value, this.count);

  @override
  Iterator<T> get iterator => iterate().iterator;

  Iterable<T> iterate() sync* {
    for (int i = 0; i < count; i++) {
      yield value;
    }
  }
}
