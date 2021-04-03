extension PermutationsExtension<T> on Iterable<T> {
  /// Returns an iterable that consists of iterables, where each iterable is
  /// a collection of all the permutations of the elements in this iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 2, 3];
  ///       final result = list.permutations();
  ///
  ///       // Result: [
  ///       //   [1, 2, 3],
  ///       //   [2, 1, 3],
  ///       //   [3, 1, 2],
  ///       //   [1, 3, 2],
  ///       //   [2, 3, 1],
  ///       //   [3, 2, 1],
  ///       // ]
  ///     }
  Iterable<Iterable<T>> permutations() {
    final tempList = toList();
    return _permutationsRecursive(tempList, tempList.length, tempList.length);
  }

  Iterable<Iterable<T>> _permutationsRecursive(
    List<T> input,
    int size,
    int n,
  ) sync* {
    if (size == 0) {
      yield [];
    } else if (size == 1) {
      yield List.unmodifiable(input);
    } else {
      for (var i = 0; i < size; i++) {
        yield* _permutationsRecursive(input, size - 1, n);

        if (size.isOdd) {
          swap(input, 0, size - 1);
        } else {
          swap(input, i, size - 1);
        }
      }
    }
  }

  void swap(List<T> input, int a, int b) {
    final temp = input[a];
    input[a] = input[b];
    input[b] = temp;
  }
}
