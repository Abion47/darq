import '../consumers/math_consumers.dart';
import '../equality_comparer.dart';

extension InsertionIterableExtensions<T> on Iterable<T> {
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

  /// Inserts all elements in an iterable at the end of this iterable.
  ///
  /// This is a convenience method that is identical to calling [iterable.followedBy(other)].
  Iterable<T> appendAll(Iterable<T> other) => followedBy(other);

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
  Iterable<T> concat(Iterable<T> other) => followedBy(other);

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
  ) =>
      followedBy(c1).followedBy(c2);

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
  ) =>
      followedBy(c1).followedBy(c2).followedBy(c3);

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
  ) =>
      followedBy(c1).followedBy(c2).followedBy(c3).followedBy(c4);

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
  ) =>
      followedBy(c1)
          .followedBy(c2)
          .followedBy(c3)
          .followedBy(c4)
          .followedBy(c5);

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
  ) =>
      followedBy(c1)
          .followedBy(c2)
          .followedBy(c3)
          .followedBy(c4)
          .followedBy(c5)
          .followedBy(c6);

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
  ) =>
      followedBy(c1)
          .followedBy(c2)
          .followedBy(c3)
          .followedBy(c4)
          .followedBy(c5)
          .followedBy(c6)
          .followedBy(c7);

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
  ) =>
      followedBy(c1)
          .followedBy(c2)
          .followedBy(c3)
          .followedBy(c4)
          .followedBy(c5)
          .followedBy(c6)
          .followedBy(c7)
          .followedBy(c8);

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
  ) =>
      followedBy(c1)
          .followedBy(c2)
          .followedBy(c3)
          .followedBy(c4)
          .followedBy(c5)
          .followedBy(c6)
          .followedBy(c7)
          .followedBy(c8)
          .followedBy(c9);

  /// Concatenates this iterable and a provided iterable of iterables.
  ///
  /// Flattens the elements in [iterables] into a single iterable and then
  /// appends the elements of that iterable to the end of this iterable.
  Iterable<T> concatAll(Iterable<Iterable<T>> iterables) sync* {
    yield* this;
    for (var iterable in iterables) {
      yield* iterable;
    }
  }

  /// Returns all elements in this iterable except those that are equal to
  /// the specified value.
  Iterable<T> exclude(
    T elem, {
    bool Function(T, T) comparer,
  }) sync* {
    comparer ??= EqualityComparer.forType<T>()?.compare ?? (a, b) => a == b;

    for (var o in this) {
      if (comparer(elem, o)) {
        yield (o);
      }
    }
  }

  /// Returns all elements in this iterable except the element at [index].
  ///
  /// If [index] is greater than the length of the iterable, the iterable is
  /// unchanged. If [index] is less than zero, a [RangeException] is thrown.
  Iterable<T> excludeAt(int index) sync* {
    if (index < 0) {
      throw RangeError.index(index, this, 'index',
          'The value of "index" must be greater than zero.');
    }
    if (index == 0) {
      yield* skip(0);
      return;
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      if (i == index) {
        iterator.moveNext();
      }
      yield iterator.current;
      i++;
    }
  }

  /// Returns all elements in this iterable except those that are within the
  /// specified range.
  ///
  /// If [start] is greater than the length of the iterable or if [count] is zero,
  /// the iterable is unchanged. If [start] or [count] are less than zero, a
  /// [RangeException] is thrown.
  Iterable<T> excludeRange(int start, int count) sync* {
    if (start < 0) {
      throw RangeError.index(start, this, 'start',
          'The value of "start" must be greater than zero.');
    }
    if (count < 0) {
      throw RangeError.index(count, this, 'count',
          'The value of "count" must be greater than zero.');
    }
    if (start == 0) {
      yield* skip(count);
      return;
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      while (i >= start && i < start + count) {
        iterator.moveNext();
      }
      yield iterator.current;
      i++;
    }
  }

  /// Inserts an element into the iterable at the specified index.
  ///
  /// Takes the specified element and inserts it into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, a [RangeError] is thrown.
  Iterable<T> insert(int index, T value) sync* {
    if (index == 0) {
      yield* prepend(value);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield value;
      }
      i++;
    }

    if (index >= i) {
      throw RangeError.index(index, this, null, null, i);
    }
  }

  /// Inserts two elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts them into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, a [RangeError] is thrown.
  Iterable<T> insert2(int index, T v1, T v2) sync* {
    if (index == 0) {
      yield* prepend2(v1, v2);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield v1;
        yield v2;
      }
      i++;
    }

    if (index >= i) {
      throw RangeError.index(index, this, null, null, i);
    }
  }

  /// Inserts three elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts them into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, a [RangeError] is thrown.
  Iterable<T> insert3(int index, T v1, T v2, T v3) sync* {
    if (index == 0) {
      yield* prepend3(v1, v2, v3);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
      }
      i++;
    }

    if (index >= i) {
      throw RangeError.index(index, this, null, null, i);
    }
  }

  /// Inserts four elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts them into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, a [RangeError] is thrown.
  Iterable<T> insert4(int index, T v1, T v2, T v3, T v4) sync* {
    if (index == 0) {
      yield* prepend4(v1, v2, v3, v4);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
        yield v4;
      }
      i++;
    }

    if (index >= i) {
      throw RangeError.index(index, this, null, null, i);
    }
  }

  /// Inserts five elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts them into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, a [RangeError] is thrown.
  Iterable<T> insert5(int index, T v1, T v2, T v3, T v4, T v5) sync* {
    if (index == 0) {
      yield* prepend5(v1, v2, v3, v4, v5);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
        yield v4;
        yield v5;
      }
      i++;
    }

    if (index >= i) {
      throw RangeError.index(index, this, null, null, i);
    }
  }

  /// Inserts six elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts them into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, a [RangeError] is thrown.
  Iterable<T> insert6(int index, T v1, T v2, T v3, T v4, T v5, T v6) sync* {
    if (index == 0) {
      yield* prepend6(v1, v2, v3, v4, v5, v6);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
        yield v4;
        yield v5;
        yield v6;
      }
      i++;
    }

    if (index >= i) {
      throw RangeError.index(index, this, null, null, i);
    }
  }

  /// Inserts seven elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts them into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, a [RangeError] is thrown.
  Iterable<T> insert7(
      int index, T v1, T v2, T v3, T v4, T v5, T v6, T v7) sync* {
    if (index == 0) {
      yield* prepend7(v1, v2, v3, v4, v5, v6, v7);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
        yield v4;
        yield v5;
        yield v6;
        yield v7;
      }
      i++;
    }

    if (index >= i) {
      throw RangeError.index(index, this, null, null, i);
    }
  }

  /// Inserts eight elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts them into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, a [RangeError] is thrown.
  Iterable<T> insert8(
      int index, T v1, T v2, T v3, T v4, T v5, T v6, T v7, T v8) sync* {
    if (index == 0) {
      yield* prepend8(v1, v2, v3, v4, v5, v6, v7, v8);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
        yield v4;
        yield v5;
        yield v6;
        yield v7;
        yield v8;
      }
      i++;
    }

    if (index >= i) {
      throw RangeError.index(index, this, null, null, i);
    }
  }

  /// Inserts nine elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts them into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, a [RangeError] is thrown.
  Iterable<T> insert9(
      int index, T v1, T v2, T v3, T v4, T v5, T v6, T v7, T v8, T v9) sync* {
    if (index == 0) {
      yield* prepend9(v1, v2, v3, v4, v5, v6, v7, v8, v9);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
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
      i++;
    }

    if (index >= i) {
      throw RangeError.index(index, this, null, null, i);
    }
  }

  /// Inserts all elements from another iterable into this iterable at the specified index.
  ///
  /// Takes the all elements from another iterable and inserts them into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, a [RangeError] is thrown.
  Iterable<T> insertAll(int index, Iterable<T> other) sync* {
    if (index == 0) {
      yield* other.followedBy(this);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield* other;
      }
      i++;
    }

    if (index >= i) {
      throw RangeError.index(index, this, null, null, i);
    }
  }

  /// Inserts an element into the iterable at the specified index.
  ///
  /// Takes the specified element and inserts it into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of the underlying iterable is exausted before the position [index]
  /// is reached, [value] is added to the end iterable as if calling [append].
  Iterable<T> insertOrAppend(int index, T value) sync* {
    if (index == 0) {
      yield* prepend(value);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield value;
      }
      i++;
    }

    if (index >= i) {
      yield value;
    }
  }

  /// Inserts two elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts it into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of the underlying iterable is exausted before the position [index]
  /// is reached, the elements are added to the end iterable as if calling [append].
  Iterable<T> insertOrAppend2(int index, T v1, T v2) sync* {
    if (index == 0) {
      yield* prepend2(v1, v2);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield v1;
        yield v2;
      }
      i++;
    }

    if (index >= i) {
      yield v1;
      yield v2;
    }
  }

  /// Inserts three elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts it into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of the underlying iterable is exausted before the position [index]
  /// is reached, the elements are added to the end iterable as if calling [append].
  Iterable<T> insertOrAppend3(int index, T v1, T v2, T v3) sync* {
    if (index == 0) {
      yield* prepend3(v1, v2, v3);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
      }
      i++;
    }

    if (index >= i) {
      yield v1;
      yield v2;
      yield v3;
    }
  }

  /// Inserts four elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts it into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of the underlying iterable is exausted before the position [index]
  /// is reached, the elements are added to the end iterable as if calling [append].
  Iterable<T> insertOrAppend4(int index, T v1, T v2, T v3, T v4) sync* {
    if (index == 0) {
      yield* prepend4(v1, v2, v3, v4);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
        yield v4;
      }
      i++;
    }

    if (index >= i) {
      yield v1;
      yield v2;
      yield v3;
      yield v4;
    }
  }

  /// Inserts five elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts it into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of the underlying iterable is exausted before the position [index]
  /// is reached, the elements are added to the end iterable as if calling [append].
  Iterable<T> insertOrAppend5(int index, T v1, T v2, T v3, T v4, T v5) sync* {
    if (index == 0) {
      yield* prepend5(v1, v2, v3, v4, v5);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
        yield v4;
        yield v5;
      }
      i++;
    }

    if (index >= i) {
      yield v1;
      yield v2;
      yield v3;
      yield v4;
      yield v5;
    }
  }

  /// Inserts six elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts it into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of the underlying iterable is exausted before the position [index]
  /// is reached, the elements are added to the end iterable as if calling [append].
  Iterable<T> insertOrAppend6(
      int index, T v1, T v2, T v3, T v4, T v5, T v6) sync* {
    if (index == 0) {
      yield* prepend6(v1, v2, v3, v4, v5, v6);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
        yield v4;
        yield v5;
        yield v6;
      }
      i++;
    }

    if (index >= i) {
      yield v1;
      yield v2;
      yield v3;
      yield v4;
      yield v5;
      yield v6;
    }
  }

  /// Inserts seven elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts it into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of the underlying iterable is exausted before the position [index]
  /// is reached, the elements are added to the end iterable as if calling [append].
  Iterable<T> insertOrAppend7(
      int index, T v1, T v2, T v3, T v4, T v5, T v6, T v7) sync* {
    if (index == 0) {
      yield* prepend7(v1, v2, v3, v4, v5, v6, v7);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
        yield v4;
        yield v5;
        yield v6;
        yield v7;
      }
      i++;
    }

    if (index >= i) {
      yield v1;
      yield v2;
      yield v3;
      yield v4;
      yield v5;
      yield v6;
      yield v7;
    }
  }

  /// Inserts eight elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts it into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of the underlying iterable is exausted before the position [index]
  /// is reached, the elements are added to the end iterable as if calling [append].
  Iterable<T> insertOrAppend8(
      int index, T v1, T v2, T v3, T v4, T v5, T v6, T v7, T v8) sync* {
    if (index == 0) {
      yield* prepend8(v1, v2, v3, v4, v5, v6, v7, v8);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
        yield v4;
        yield v5;
        yield v6;
        yield v7;
        yield v8;
      }
      i++;
    }

    if (index >= i) {
      yield v1;
      yield v2;
      yield v3;
      yield v4;
      yield v5;
      yield v6;
      yield v7;
      yield v8;
    }
  }

  /// Inserts nine elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts it into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of the underlying iterable is exausted before the position [index]
  /// is reached, the elements are added to the end iterable as if calling [append].
  Iterable<T> insertOrAppend9(
      int index, T v1, T v2, T v3, T v4, T v5, T v6, T v7, T v8, T v9) sync* {
    if (index == 0) {
      yield* prepend9(v1, v2, v3, v4, v5, v6, v7, v8, v9);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
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
      i++;
    }

    if (index >= i) {
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

  /// Inserts all elements from another iterable into this iterable at the specified index.
  ///
  /// Takes the all elements from another iterable and inserts them into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, the elements in [other] are added to the end iterable as if calling [append].
  Iterable<T> insertOrAppendAll(int index, Iterable<T> other) sync* {
    if (index == 0) {
      yield* other.followedBy(this);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield* other;
      }
      i++;
    }

    if (index >= i) {
      yield* other;
    }
  }

  /// Pads the iterable to be at least [length], adding [padding]
  /// to the end as needed to guarantee the length.
  ///
  /// If the iterable is already has at least [length] elements,
  /// the iterable is unchanged.
  Iterable<T> padEnd(int length, {T padding}) sync* {
    var count = 0;

    for (var o in this) {
      yield o;
      count++;
    }

    for (; count < length; count++) {
      yield padding;
    }
  }

  /// Pads the iterable to be at least [length], adding [padding]
  /// to the start as needed to guarantee the length.
  ///
  /// If the iterable is already has at least [length] elements,
  /// the iterable is unchanged.
  ///

  Iterable<T> padStart(int length, {T padding}) sync* {
    var paddingElements = length - count();
    for (; paddingElements > 0; paddingElements--) {
      yield padding;
    }

    for (var o in this) {
      yield o;
    }
  }

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

  /// Inserts all elements in an iterable at the beginning of this iterable.
  ///
  /// This is a convenience method that is identical to calling [other.followedBy(iterable)].
  Iterable<T> prependAll(Iterable<T> other) => other.followedBy(this);

  /// Inserts an element into the iterable at the specified index.
  ///
  /// Takes the specified element and inserts it into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, [value] is not inserted and this iterable is unchanged.
  Iterable<T> tryInsert(int index, T value) sync* {
    if (index == 0) {
      yield* prepend(value);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield value;
      }
      i++;
    }
  }

  /// Inserts two elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts it into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, the given elements are not inserted and this iterable is unchanged.
  Iterable<T> tryInsert2(int index, T v1, T v2) sync* {
    if (index == 0) {
      yield* prepend2(v1, v2);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield v1;
        yield v2;
      }
      i++;
    }
  }

  /// Inserts three elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts it into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, the given elements are not inserted and this iterable is unchanged.
  Iterable<T> tryInsert3(int index, T v1, T v2, T v3) sync* {
    if (index == 0) {
      yield* prepend3(v1, v2, v3);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
      }
      i++;
    }
  }

  /// Inserts four elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts it into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, the given elements are not inserted and this iterable is unchanged.
  Iterable<T> tryInsert4(int index, T v1, T v2, T v3, T v4) sync* {
    if (index == 0) {
      yield* prepend4(v1, v2, v3, v4);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
        yield v4;
      }
      i++;
    }
  }

  /// Inserts five elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts it into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, the given elements are not inserted and this iterable is unchanged.
  Iterable<T> tryInsert5(int index, T v1, T v2, T v3, T v4, T v5) sync* {
    if (index == 0) {
      yield* prepend5(v1, v2, v3, v4, v5);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
        yield v4;
        yield v5;
      }
      i++;
    }
  }

  /// Inserts six elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts it into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, the given elements are not inserted and this iterable is unchanged.
  Iterable<T> tryInsert6(int index, T v1, T v2, T v3, T v4, T v5, T v6) sync* {
    if (index == 0) {
      yield* prepend6(v1, v2, v3, v4, v5, v6);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
        yield v4;
        yield v5;
        yield v6;
      }
      i++;
    }
  }

  /// Inserts seven elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts it into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, the given elements are not inserted and this iterable is unchanged.
  Iterable<T> tryInsert7(
      int index, T v1, T v2, T v3, T v4, T v5, T v6, T v7) sync* {
    if (index == 0) {
      yield* prepend7(v1, v2, v3, v4, v5, v6, v7);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
        yield v4;
        yield v5;
        yield v6;
        yield v7;
      }
      i++;
    }
  }

  /// Inserts eight elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts it into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, the given elements are not inserted and this iterable is unchanged.
  Iterable<T> tryInsert8(
      int index, T v1, T v2, T v3, T v4, T v5, T v6, T v7, T v8) sync* {
    if (index == 0) {
      yield* prepend8(v1, v2, v3, v4, v5, v6, v7, v8);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
        yield v4;
        yield v5;
        yield v6;
        yield v7;
        yield v8;
      }
      i++;
    }
  }

  /// Inserts nine elements into the iterable at the specified index.
  ///
  /// Takes the specified elements and inserts it into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, the given elements are not inserted and this iterable is unchanged.
  Iterable<T> tryInsert9(
      int index, T v1, T v2, T v3, T v4, T v5, T v6, T v7, T v8, T v9) sync* {
    if (index == 0) {
      yield* prepend9(v1, v2, v3, v4, v5, v6, v7, v8, v9);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
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
      i++;
    }
  }

  /// Inserts an element into the iterable at the specified index.
  ///
  /// Takes the specified element and inserts it into the iterable at the
  /// position [index].
  ///
  /// If [index] is less than zero, an [ArgumentError] is thrown.
  ///
  /// If iteration of this iterable is exausted before the position [index]
  /// is reached, the elements in [other] are not inserted and this iterable is unchanged.
  Iterable<T> tryInsertAll(int index, Iterable<T> other) sync* {
    if (index == 0) {
      yield* other.followedBy(this);
      return;
    }
    if (index < 0) {
      throw ArgumentError('Parameter "index" must be greater than zero.');
    }

    final iterator = this.iterator;
    var i = 0;

    while (iterator.moveNext()) {
      yield iterator.current;
      if (i == index) {
        yield* other;
      }
      i++;
    }
  }
}
