import '../enumerable.dart';

class RangeEnumerable extends Enumerable<int> {
  final int start;
  final int count;
  final int increment;

  const RangeEnumerable(this.start, this.count, this.increment);

  @override
  Iterator<int> get iterator => iterate().iterator;

  Iterable<int> iterate() sync* {
    for (int i = 0; i < count; i++) {
      yield start + (i * increment);
    }
  }
}
