import '../enumerable.dart';
import '../enumerable_with_source.dart';

class RangeEnumerable extends Enumerable<int> {
  final int start;
  final int count;
  final int increment;

  RangeEnumerable(this.start, this.count, this.increment);

  @override
  Iterator<int> get iterator => iterate().iterator;

  Iterable<int> iterate() sync* {
    for (int i = 0; i < count; i++) {
      yield start + (i * increment);
    }
  }
}