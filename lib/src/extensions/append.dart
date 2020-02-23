extension AppendExtension<T> on Iterable<T> {
  /// Inserts an element to the end of the iterable.
  ///
  /// Takes the specified element and inserts it at the end of the iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1, 2, 3];
  ///       final result = list.append(4);
  ///
  ///       // Result: [0, 1, 2, 3, 4]
  ///     }
  Iterable<T> append(T value) sync* {
    yield* this;
    yield value;
  }

  /// Inserts two elements to the end of the iterable.
  ///
  /// Takes the specified elements and inserts them at the end of the iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1, 2, 3];
  ///       final result = list.append2(4, 5);
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5]
  ///     }
  Iterable<T> append2(T v1, T v2) sync* {
    yield* this;
    yield v1;
    yield v2;
  }

  /// Inserts three elements to the end of the iterable.
  ///
  /// Takes the specified elements and inserts them at the end of the iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1, 2, 3];
  ///       final result = list.append3(4, 5, 6);
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5, 6]
  ///     }
  Iterable<T> append3(T v1, T v2, T v3) sync* {
    yield* this;
    yield v1;
    yield v2;
    yield v3;
  }

  /// Inserts four elements to the end of the iterable.
  ///
  /// Takes the specified elements and inserts them at the end of the iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1, 2, 3];
  ///       final result = list.append4(4, 5, 6, 7);
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5, 6, 7]
  ///     }
  Iterable<T> append4(T v1, T v2, T v3, T v4) sync* {
    yield* this;
    yield v1;
    yield v2;
    yield v3;
    yield v4;
  }

  /// Inserts five elements to the end of the iterable.
  ///
  /// Takes the specified elements and inserts them at the end of the iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1, 2, 3];
  ///       final result = list.append5(4, 5, 6, 7, 8);
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5, 6, 7, 8]
  ///     }
  Iterable<T> append5(T v1, T v2, T v3, T v4, T v5) sync* {
    yield* this;
    yield v1;
    yield v2;
    yield v3;
    yield v4;
    yield v5;
  }

  /// Inserts six elements to the end of the iterable.
  ///
  /// Takes the specified elements and inserts them at the end of the iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1, 2, 3];
  ///       final result = list.append6(4, 5, 6, 7, 8, 9);
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  ///     }
  Iterable<T> append6(T v1, T v2, T v3, T v4, T v5, T v6) sync* {
    yield* this;
    yield v1;
    yield v2;
    yield v3;
    yield v4;
    yield v5;
    yield v6;
  }

  /// Inserts seven elements to the end of the iterable.
  ///
  /// Takes the specified elements and inserts them at the end of the iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1, 2, 3];
  ///       final result = list.append7(4, 5, 6, 7, 8, 9, 10);
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  ///     }
  Iterable<T> append7(T v1, T v2, T v3, T v4, T v5, T v6, T v7) sync* {
    yield* this;
    yield v1;
    yield v2;
    yield v3;
    yield v4;
    yield v5;
    yield v6;
    yield v7;
  }

  /// Inserts eight elements to the end of the iterable.
  ///
  /// Takes the specified elements and inserts them at the end of the iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1, 2, 3];
  ///       final result = list.append7(4, 5, 6, 7, 8, 9, 10, 11);
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  ///     }
  Iterable<T> append8(T v1, T v2, T v3, T v4, T v5, T v6, T v7, T v8) sync* {
    yield* this;
    yield v1;
    yield v2;
    yield v3;
    yield v4;
    yield v5;
    yield v6;
    yield v7;
    yield v8;
  }

  /// Inserts nine elements to the end of the iterable.
  ///
  /// Takes the specified elements and inserts them at the end of the iterable.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1, 2, 3];
  ///       final result = list.append9(4, 5, 6, 7, 8, 9, 10, 11, 12);
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  ///     }
  Iterable<T> append9(
      T v1, T v2, T v3, T v4, T v5, T v6, T v7, T v8, T v9) sync* {
    yield* this;
    yield v1;
    yield v2;
    yield v3;
    yield v4;
    yield v5;
    yield v6;
    yield v7;
    yield v8;
    yield v9;
  }
}
