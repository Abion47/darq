import 'prepend.dart';

extension InsertExtension<T> on Iterable<T> {
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
      if (i == index) {
        yield value;
      }
      yield iterator.current;
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
      if (i == index) {
        yield v1;
        yield v2;
      }
      yield iterator.current;
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
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
      }
      yield iterator.current;
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
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
        yield v4;
      }
      yield iterator.current;
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
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
        yield v4;
        yield v5;
      }
      yield iterator.current;
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
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
        yield v4;
        yield v5;
        yield v6;
      }
      yield iterator.current;
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
      if (i == index) {
        yield v1;
        yield v2;
        yield v3;
        yield v4;
        yield v5;
        yield v6;
        yield v7;
      }
      yield iterator.current;
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
      yield iterator.current;
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
      yield iterator.current;
      i++;
    }

    if (index >= i) {
      throw RangeError.index(index, this, null, null, i);
    }
  }
}
