extension ConsumeExtension<T> on Iterable<T> {
  /// Fully consumes this iterable.
  ///
  /// This method will fully consume the iterable. Nothing gets returned
  /// from this method.
  void consume() {
    final iterator = this.iterator;
    while (iterator.moveNext()) {}
  }
}
