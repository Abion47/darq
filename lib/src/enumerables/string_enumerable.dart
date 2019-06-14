import '../enumerable.dart';
import '../enumerable_with_source.dart';

class StringEnumerable extends Enumerable<String>
    with EnumerableWithSource<String> {
  final String sourceString;

  List<String> _buffer;

  StringEnumerable(String source) : this.sourceString = source;

  @override
  Iterable<String> get source {
    if (_buffer == null) _buffer = sourceString.split('');
    return _buffer;
  }

  @override
  Iterator<String> get iterator => source.iterator;
}
