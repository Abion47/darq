extension PrependExtension<T> on Iterable<T> {
  /// Inserts an element at the beginning of the iterable.
  ///
  /// Takes the specified element and inserts it at the beginning of the
  /// iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [1, 2, 3, 4];
  ///       final result = list.prepend(0);
  ///
  ///       // Result: [0, 1, 2, 3, 4]
  ///     }
  Iterable<T> prepend(T value) sync* {
    yield value;
    yield* this;
  }

  /// Inserts two elements at the beginning of the iterable.
  ///
  /// Takes the specified elements and inserts them at the beginning of the
  /// iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [2, 3, 4];
  ///       final result = list.prepend2(0, 1);
  ///
  ///       // Result: [0, 1, 2, 3, 4]
  ///     }
  Iterable<T> prepend2(T v1, T v2) sync* {
    yield v1;
    yield v2;
    yield* this;
  }

  /// Inserts three elements at the beginning of the iterable.
  ///
  /// Takes the specified elements and inserts them at the beginning of the
  /// iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [3, 4, 5];
  ///       final result = list.prepend3(0, 1, 2);
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5]
  ///     }
  Iterable<T> prepend3(T v1, T v2, T v3) sync* {
    yield v1;
    yield v2;
    yield v3;
    yield* this;
  }

  /// Inserts four elements at the beginning of the iterable.
  ///
  /// Takes the specified elements and inserts them at the beginning of the
  /// iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [4, 5, 6];
  ///       final result = list.prepend4(0, 1, 2, 3);
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5, 6]
  ///     }
  Iterable<T> prepend4(T v1, T v2, T v3, T v4) sync* {
    yield v1;
    yield v2;
    yield v3;
    yield v4;
    yield* this;
  }

  /// Inserts five elements at the beginning of the iterable.
  ///
  /// Takes the specified elements and inserts them at the beginning of the
  /// iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [5, 6, 7];
  ///       final result = list.prepend5(0, 1, 2, 3, 4);
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5, 6, 7]
  ///     }
  Iterable<T> prepend5(T v1, T v2, T v3, T v4, T v5) sync* {
    yield v1;
    yield v2;
    yield v3;
    yield v4;
    yield v5;
    yield* this;
  }

  /// Inserts six elements at the beginning of the iterable.
  ///
  /// Takes the specified elements and inserts them at the beginning of the
  /// iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [6, 7, 8];
  ///       final result = list.prepend6(0, 1, 2, 3, 4, 5);
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5, 6, 7, 8]
  ///     }
  Iterable<T> prepend6(T v1, T v2, T v3, T v4, T v5, T v6) sync* {
    yield v1;
    yield v2;
    yield v3;
    yield v4;
    yield v5;
    yield v6;
    yield* this;
  }

  /// Inserts seven elements at the beginning of the iterable.
  ///
  /// Takes the specified elements and inserts them at the beginning of the
  /// iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [7, 8, 9];
  ///       final result = list.prepend7(0, 1, 2, 3, 4, 5, 6);
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  ///     }
  Iterable<T> prepend7(T v1, T v2, T v3, T v4, T v5, T v6, T v7) sync* {
    yield v1;
    yield v2;
    yield v3;
    yield v4;
    yield v5;
    yield v6;
    yield v7;
    yield* this;
  }

  /// Inserts eight elements at the beginning of the iterable.
  ///
  /// Takes the specified elements and inserts them at the beginning of the
  /// iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [8, 9, 10];
  ///       final result = list.prepend8(0, 1, 2, 3, 4, 5, 6, 7);
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  ///     }
  Iterable<T> prepend8(T v1, T v2, T v3, T v4, T v5, T v6, T v7, T v8) sync* {
    yield v1;
    yield v2;
    yield v3;
    yield v4;
    yield v5;
    yield v6;
    yield v7;
    yield v8;
    yield* this;
  }

  /// Inserts nine elements at the beginning of the iterable.
  ///
  /// Takes the specified elements and inserts them at the beginning of the
  /// iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [9, 10, 11];
  ///       final result = list.prepend9(0, 1, 2, 3, 4, 5, 6, 7, 8);
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  ///     }
  Iterable<T> prepend9(
      T v1, T v2, T v3, T v4, T v5, T v6, T v7, T v8, T v9) sync* {
    yield v1;
    yield v2;
    yield v3;
    yield v4;
    yield v5;
    yield v6;
    yield v7;
    yield v8;
    yield v9;
    yield* this;
  }
}
