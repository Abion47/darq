extension SubsetsExtension<T> on Iterable<T> {
  /// Returns an iterable of iterables which represents all of the subsets
  /// of this iterable. (Also known as the power set of the iterable.)
  Iterable<Iterable<T>> subsets() sync* {
    final asList = toList();

    if (asList.isNotEmpty) {
      yield* _subsetRecursive(asList, asList.length, asList.length - 1, <T>[]);
    } else {
      yield <T>[];
    }
  }

  Iterable<Iterable<T>> _subsetRecursive(
    List<T> input,
    int k,
    int n,
    List<T> curr,
  ) sync* {
    if (n < 0) {
      yield curr;
    } else {
      yield* _subsetRecursive(input, k, n - 1, curr);
      yield* _subsetRecursive(input, k, n - 1, [input[n], ...curr]);
    }
  }
}
