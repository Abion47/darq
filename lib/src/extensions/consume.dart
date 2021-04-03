extension ConsumeExtension<T> on Iterable<T> {
  /// Fully consumes this iterable.
  ///
  /// This method will fully consume the iterable, visiting every element once
  /// but performing no action. Nothing gets returned from this method.
  void consume() {
    final iterator = this.iterator;
    while (iterator.moveNext()) {}
  }
}
