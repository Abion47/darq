import 'enumerable_with_source.dart';

abstract class EnumerableIterator<TSource, TResult> extends Iterator<TResult> {
  final EnumerableWithSource<TSource> enumerable;

  Iterator<TSource> sourceIterator;

  TResult _current;

  EnumerableIterator() : this.of(null);

  EnumerableIterator.of(this.enumerable);

  @override
  TResult get current => _current;

  set current(TResult value) => _current = value;
}
