mixin EnumerableWithSource<T> {
  Iterable<T> src;
  Iterable<T> get source => src;
}