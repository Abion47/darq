import '../enumerable.dart';
import '../enumerable_with_source.dart';
import '../typedefs.dart';

class GeneratedEnumerable<T> extends Enumerable<T>
    implements EnumerableWithSource<T> {
  final int count;
  final Generator<T> generator;
  final List<T> _cache;

  const GeneratedEnumerable(this.count, this.generator, [this._cache]);

  factory GeneratedEnumerable.withCache(int count, Generator<T> generator) {
    final buffer = List<T>.generate(count, generator);
    return GeneratedEnumerable(count, generator, buffer);
  }

  @override
  Iterable<T> get source => _cache ?? Iterable<T>.generate(count, generator);

  @override
  Iterator<T> get iterator => source.iterator;
}
