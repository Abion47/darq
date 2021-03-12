extension ConcatExtension<T> on Iterable<T> {
  /// Concatenates this iterable and another iterables.
  ///
  /// Appends the values of a given [Iterable] to the end of this iterable,
  /// resulting in an iterable that is the concatenation of both.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1, 2];
  ///       final result = list.concat([3, 4, 5]);
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5]
  ///     }
  ///
  /// (This is a convenience method to maintain naming-consistency with its .NET LINQ equivalent.
  /// Internally it functions identically to [followedBy].)
  Iterable<T> concat(Iterable<T> other) {
    return followedBy(other);
  }

  /// Concatenates this iterable and two another iterables.
  ///
  /// Appends the values of two given Iterables to the end of this iterable,
  /// resulting in an iterable that is the concatenation of all of them.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1];
  ///       final result = list.concat2(
  ///         [2, 3],
  ///         [4, 5],
  ///       );
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5]
  ///     }
  Iterable<T> concat2(
    Iterable<T> c1,
    Iterable<T> c2,
  ) {
    return followedBy(c1).followedBy(c2);
  }

  /// Concatenates this iterable and three another iterables.
  ///
  /// Appends the values of three given Iterables to the end of this iterable,
  /// resulting in an iterable that is the concatenation of all of them.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1];
  ///       final result = list.concat3(
  ///         [2, 3],
  ///         [4, 5],
  ///         [6, 7],
  ///       );
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5, 6, 7]
  ///     }
  Iterable<T> concat3(
    Iterable<T> c1,
    Iterable<T> c2,
    Iterable<T> c3,
  ) {
    return followedBy(c1).followedBy(c2).followedBy(c3);
  }

  /// Concatenates this iterable and four another iterables.
  ///
  /// Appends the values of four given Iterables to the end of this iterable,
  /// resulting in an iterable that is the concatenation of all of them.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1];
  ///       final result = list.concat4(
  ///         [2, 3],
  ///         [4, 5],
  ///         [6, 7],
  ///         [8, 9],
  ///       );
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  ///     }
  Iterable<T> concat4(
    Iterable<T> c1,
    Iterable<T> c2,
    Iterable<T> c3,
    Iterable<T> c4,
  ) {
    return followedBy(c1).followedBy(c2).followedBy(c3).followedBy(c4);
  }

  /// Concatenates this iterable and five another iterables.
  ///
  /// Appends the values of five given Iterables to the end of this iterable,
  /// resulting in an iterable that is the concatenation of all of them.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1];
  ///       final result = list.concat5(
  ///         [2, 3],
  ///         [4, 5],
  ///         [6, 7],
  ///         [8, 9],
  ///         [10, 11],
  ///       );
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  ///     }
  Iterable<T> concat5(
    Iterable<T> c1,
    Iterable<T> c2,
    Iterable<T> c3,
    Iterable<T> c4,
    Iterable<T> c5,
  ) {
    return followedBy(c1)
        .followedBy(c2)
        .followedBy(c3)
        .followedBy(c4)
        .followedBy(c5);
  }

  /// Concatenates this iterable and six another iterables.
  ///
  /// Appends the values of six given Iterables to the end of this iterable,
  /// resulting in an iterable that is the concatenation of all of them.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1];
  ///       final result = list.concat6(
  ///         [2, 3],
  ///         [4, 5],
  ///         [6, 7],
  ///         [8, 9],
  ///         [10, 11],
  ///         [12, 13],
  ///       );
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
  ///     }
  Iterable<T> concat6(
    Iterable<T> c1,
    Iterable<T> c2,
    Iterable<T> c3,
    Iterable<T> c4,
    Iterable<T> c5,
    Iterable<T> c6,
  ) {
    return followedBy(c1)
        .followedBy(c2)
        .followedBy(c3)
        .followedBy(c4)
        .followedBy(c5)
        .followedBy(c6);
  }

  /// Concatenates this iterable and seven another iterables.
  ///
  /// Appends the values of seven given Iterables to the end of this iterable,
  /// resulting in an iterable that is the concatenation of all of them.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1];
  ///       final result = list.concat7(
  ///         [2, 3],
  ///         [4, 5],
  ///         [6, 7],
  ///         [8, 9],
  ///         [10, 11],
  ///         [12, 13],
  ///         [14, 15],
  ///       );
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
  ///     }
  Iterable<T> concat7(
    Iterable<T> c1,
    Iterable<T> c2,
    Iterable<T> c3,
    Iterable<T> c4,
    Iterable<T> c5,
    Iterable<T> c6,
    Iterable<T> c7,
  ) {
    return followedBy(c1)
        .followedBy(c2)
        .followedBy(c3)
        .followedBy(c4)
        .followedBy(c5)
        .followedBy(c6)
        .followedBy(c7);
  }

  /// Concatenates this iterable and eight another iterables.
  ///
  /// Appends the values of eight given Iterables to the end of this iterable,
  /// resulting in an iterable that is the concatenation of all of them.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1];
  ///       final result = list.concat8(
  ///         [2, 3],
  ///         [4, 5],
  ///         [6, 7],
  ///         [8, 9],
  ///         [10, 11],
  ///         [12, 13],
  ///         [14, 15],
  ///         [16, 17],
  ///       );
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]
  ///     }
  Iterable<T> concat8(
    Iterable<T> c1,
    Iterable<T> c2,
    Iterable<T> c3,
    Iterable<T> c4,
    Iterable<T> c5,
    Iterable<T> c6,
    Iterable<T> c7,
    Iterable<T> c8,
  ) {
    return followedBy(c1)
        .followedBy(c2)
        .followedBy(c3)
        .followedBy(c4)
        .followedBy(c5)
        .followedBy(c6)
        .followedBy(c7)
        .followedBy(c8);
  }

  /// Concatenates this iterable and nine another iterables.
  ///
  /// Appends the values of nine given Iterables to the end of this iterable,
  /// resulting in an iterable that is the concatenation of all of them.
  ///
  /// Example:
  ///
  ///     void main() {
  ///       final list = [0, 1];
  ///       final result = list.concat9(
  ///         [2, 3],
  ///         [4, 5],
  ///         [6, 7],
  ///         [8, 9],
  ///         [10, 11],
  ///         [12, 13],
  ///         [14, 15],
  ///         [16, 17],
  ///         [18, 19],
  ///       );
  ///
  ///       // Result: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
  ///     }
  Iterable<T> concat9(
    Iterable<T> c1,
    Iterable<T> c2,
    Iterable<T> c3,
    Iterable<T> c4,
    Iterable<T> c5,
    Iterable<T> c6,
    Iterable<T> c7,
    Iterable<T> c8,
    Iterable<T> c9,
  ) {
    return followedBy(c1)
        .followedBy(c2)
        .followedBy(c3)
        .followedBy(c4)
        .followedBy(c5)
        .followedBy(c6)
        .followedBy(c7)
        .followedBy(c8)
        .followedBy(c9);
  }
}
