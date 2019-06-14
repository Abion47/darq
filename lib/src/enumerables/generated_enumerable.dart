import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../typedefs.dart';

class GeneratedEnumerable<T> extends Enumerable<T>
    with EnumerableWithSource<T> {
  final int count;
  final Generator<T> generator;

  GeneratedEnumerable(this.count, this.generator);

  Iterable<T> _buffer;

  @override
  Iterable<T> get source {
    if (_buffer == null) {
      _buffer = List<T>.generate(count, generator);
    }
    return _buffer;
  }

  @override
  Iterator<T> get iterator => source.iterator;
}
