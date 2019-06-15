import '../enumerable.dart';
import '../enumerable_with_source.dart';

class StringEnumerable extends Enumerable<String>
    implements EnumerableWithSource<String> {
  final String sourceString;
  final List<String> _cache;

  const StringEnumerable(this.sourceString, [this._cache]);

  factory StringEnumerable.withCache(String sourceString) {
    List<String> cache = _toIterable(sourceString);
    return StringEnumerable(sourceString, cache);
  }

  @override
  Iterable<String> get source => _cache ?? _toIterable(sourceString);

  @override
  Iterator<String> get iterator => source.iterator;

  static Iterable<String> _toIterable(String source) sync* {
    for (int i = 0; i < source.length; i++) {
      yield source[i];
    }
  }
}
