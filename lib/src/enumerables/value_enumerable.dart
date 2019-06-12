import '../enumerable.dart';
import '../enumerable_with_source.dart';

class ValueEnumerable<T> extends Enumerable<T> with EnumerableWithSource<T>  {
  final Iterable<T> sourceIterable;

  @override
  Iterable<T> get source => sourceIterable;

  ValueEnumerable(Iterable<T> source) 
    : this.sourceIterable = source;

  @override
  Iterator<T> get iterator => sourceIterable.iterator;
}