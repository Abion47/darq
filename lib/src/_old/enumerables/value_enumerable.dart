import '../enumerable.dart';
import '../enumerable_with_source.dart';

abstract class ValueEnumerable<T> extends Enumerable<T>
    implements EnumerableWithSource<T> {
  const ValueEnumerable();

  static ValueEnumerable<T> create<T>(Iterable<T> source) {
    if (source is List) return ListEnumerable<T>(source);
    return DefaultValueEnumerable<T>(source);
  }

  @override
  Iterator<T> get iterator => source.iterator;
}

class DefaultValueEnumerable<T> extends ValueEnumerable<T> {
  final Iterable<T> source;
  const DefaultValueEnumerable(this.source);
}

class ListEnumerable<T> extends ValueEnumerable<T> {
  final List<T> source;
  const ListEnumerable(this.source);

  T operator [](int index) => source[index];

  @override
  int get length => source.length;
}
