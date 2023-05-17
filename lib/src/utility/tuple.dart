abstract class Tuple extends Iterable<dynamic> {
  const Tuple();

  /// Utility method for creating a [Tuple0].
  static Tuple t0() => Tuple0();

  /// Utility method for creating a [Tuple1].
  static Tuple1<T> t1<T>(T a) => Tuple1<T>(a);

  /// Utility method for creating a [Tuple2].
  static Tuple2<T0, T1> t2<T0, T1>(
    T0 a,
    T1 b,
  ) =>
      Tuple2<T0, T1>(a, b);

  /// Utility method for creating a [Tuple3].
  static Tuple3<T0, T1, T2> t3<T0, T1, T2>(
    T0 a,
    T1 b,
    T2 c,
  ) =>
      Tuple3<T0, T1, T2>(a, b, c);

  /// Utility method for creating a [Tuple4].
  static Tuple4<T0, T1, T2, T3> t4<T0, T1, T2, T3>(
    T0 a,
    T1 b,
    T2 c,
    T3 d,
  ) =>
      Tuple4<T0, T1, T2, T3>(a, b, c, d);

  /// Utility method for creating a [Tuple5].
  static Tuple5<T0, T1, T2, T3, T4> t5<T0, T1, T2, T3, T4>(
    T0 a,
    T1 b,
    T2 c,
    T3 d,
    T4 e,
  ) =>
      Tuple5<T0, T1, T2, T3, T4>(a, b, c, d, e);

  /// Utility method for creating a [Tuple6].
  static Tuple6<T0, T1, T2, T3, T4, T5> t6<T0, T1, T2, T3, T4, T5>(
    T0 a,
    T1 b,
    T2 c,
    T3 d,
    T4 e,
    T5 f,
  ) =>
      Tuple6<T0, T1, T2, T3, T4, T5>(a, b, c, d, e, f);

  /// Utility method for creating a [Tuple7].
  static Tuple7<T0, T1, T2, T3, T4, T5, T6> t7<T0, T1, T2, T3, T4, T5, T6>(
    T0 a,
    T1 b,
    T2 c,
    T3 d,
    T4 e,
    T5 f,
    T6 g,
  ) =>
      Tuple7<T0, T1, T2, T3, T4, T5, T6>(a, b, c, d, e, f, g);

  /// Utility method for creating a [Tuple8].
  static Tuple8<T0, T1, T2, T3, T4, T5, T6, T7>
      t8<T0, T1, T2, T3, T4, T5, T6, T7>(
    T0 a,
    T1 b,
    T2 c,
    T3 d,
    T4 e,
    T5 f,
    T6 g,
    T7 h,
  ) =>
          Tuple8<T0, T1, T2, T3, T4, T5, T6, T7>(a, b, c, d, e, f, g, h);

  /// Utility method for creating a [Tuple9].
  static Tuple9<T0, T1, T2, T3, T4, T5, T6, T7, T8>
      t9<T0, T1, T2, T3, T4, T5, T6, T7, T8>(
    T0 a,
    T1 b,
    T2 c,
    T3 d,
    T4 e,
    T5 f,
    T6 g,
    T7 h,
    T8 i,
  ) =>
          Tuple9<T0, T1, T2, T3, T4, T5, T6, T7, T8>(a, b, c, d, e, f, g, h, i);

  /// Creates a tuple from a map/JSON source.
  ///
  /// The type of tuple created is based on the existance of keys in the map
  /// object. Because of this, if the map was generated from a JSON string where
  /// null values were omitted, the resulting tuple might not be the desired
  /// length. In these cases, you can use `forceLength` to force a particular
  /// length tuple to be returned.
  factory Tuple.fromJson(Map<String, dynamic> map, {int? forceLength}) {
    if (forceLength != null) {
      assert(forceLength >= 0 && forceLength <= 9,
          'The value of forceLength must be between 0 and 9');

      switch (forceLength) {
        case 0:
          return Tuple0.fromJson(map);
        case 1:
          return Tuple1<dynamic>.fromJson(map);
        case 2:
          return Tuple2<dynamic, dynamic>.fromJson(map);
        case 3:
          return Tuple3<dynamic, dynamic, dynamic>.fromJson(map);
        case 4:
          return Tuple4<dynamic, dynamic, dynamic, dynamic>.fromJson(map);
        case 5:
          return Tuple5<dynamic, dynamic, dynamic, dynamic, dynamic>.fromJson(
              map);
        case 6:
          return Tuple6<dynamic, dynamic, dynamic, dynamic, dynamic,
              dynamic>.fromJson(map);
        case 7:
          return Tuple7<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
              dynamic>.fromJson(map);
        case 8:
          return Tuple8<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
              dynamic, dynamic>.fromJson(map);
        case 9:
          return Tuple9<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
              dynamic, dynamic, dynamic>.fromJson(map);
      }
    }
    if (map.containsKey('item8')) {
      return Tuple9<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
          dynamic, dynamic, dynamic>.fromJson(map);
    }
    if (map.containsKey('item7')) {
      return Tuple8<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
          dynamic, dynamic>.fromJson(map);
    }
    if (map.containsKey('item6')) {
      return Tuple7<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
          dynamic>.fromJson(map);
    }
    if (map.containsKey('item5')) {
      return Tuple6<dynamic, dynamic, dynamic, dynamic, dynamic,
          dynamic>.fromJson(map);
    }
    if (map.containsKey('item4')) {
      return Tuple5<dynamic, dynamic, dynamic, dynamic, dynamic>.fromJson(map);
    }
    if (map.containsKey('item3')) {
      return Tuple4<dynamic, dynamic, dynamic, dynamic>.fromJson(map);
    }
    if (map.containsKey('item2')) {
      return Tuple3<dynamic, dynamic, dynamic>.fromJson(map);
    }
    if (map.containsKey('item1')) return Tuple2<dynamic, dynamic>.fromJson(map);
    if (map.containsKey('item')) return Tuple1<dynamic>.fromJson(map);
    return Tuple0.fromJson(map);
  }

  /// Creates a tuple from a list source.
  ///
  /// The list must have a length between 0 and 9.
  factory Tuple.fromList(List<dynamic> items) {
    assert(
        items.length <= 9, 'Tuples of length greater than 9 are unsupported');

    switch (items.length) {
      case 0:
        return Tuple0();
      case 1:
        return Tuple1<dynamic>.fromList(items);
      case 2:
        return Tuple2<dynamic, dynamic>.fromList(items);
      case 3:
        return Tuple3<dynamic, dynamic, dynamic>.fromList(items);
      case 4:
        return Tuple4<dynamic, dynamic, dynamic, dynamic>.fromList(items);
      case 5:
        return Tuple5<dynamic, dynamic, dynamic, dynamic, dynamic>.fromList(
            items);
      case 6:
        return Tuple6<dynamic, dynamic, dynamic, dynamic, dynamic,
            dynamic>.fromList(items);
      case 7:
        return Tuple7<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
            dynamic>.fromList(items);
      case 8:
        return Tuple8<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
            dynamic, dynamic>.fromList(items);
      case 9:
        return Tuple9<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
            dynamic, dynamic, dynamic>.fromList(items);
    }

    throw StateError('Unknown error, this shouldn\'t happen');
  }
}

/// A finite fixed-length ordered list containing 0 dynamically-typed elements.
class Tuple0 extends Tuple {
  /// Creates an empty tuple. This can be useful as a placeholder object
  /// or as a constant symbol.
  const Tuple0();

  /// Creates a tuple from a record.
  ///
  /// (For [Tuple0], the value of `record` is ignored and an empty tuple is
  /// returned.)
  factory Tuple0.fromRecord(() record) => Tuple0();

  /// Creates an empty tuple from a map/JSON source.
  ///
  /// (For [Tuple0], the value of `map` is ignored and the constructor just
  /// returns an empty tuple by default.)
  factory Tuple0.fromJson(Map<String, dynamic> map) => Tuple0();

  /// Creates an empty tuple from a list source, optionally trimming excess items
  /// from the list.
  ///
  /// If the list is not empty and `trim` is false, an [ArgumentError] will be
  /// thrown.
  factory Tuple0.fromList(List<dynamic> list, [bool trim = false]) {
    if (!trim && list.isNotEmpty) {
      throw ArgumentError.value('list',
          'The given list has more than 0 elements. Use `trim: true` if you intended to ignore excess elements.');
    }
    return Tuple0();
  }

  /// Clones this tuple where the clone is cast with the specified type arguments.
  Tuple0 asType() {
    throw StateError(
        'Tuple0 does not have any items and therefore no types to cast');
  }

  /// Clones this tuple where the clone is cast with dynamically-typed items.
  Tuple1<dynamic> asDynamic() {
    throw StateError(
        'Tuple0 does not have any items and therefore no types to cast');
  }

  /// Creates a copy tuple with the elements from this tuple with the value of
  /// each item optionally overridden.
  ///
  /// (For [Tuple0], this merely produces another empty tuple.)
  Tuple0 copyWith() => Tuple0();

  /// A list of boolean values indicating whether certain items in this
  /// tuple should be retained or discarded. The length of the list must
  /// be the same as the length of this tuple.
  ///
  /// This method is unsupported on [Tuple0] as there are no items to either
  /// retain or support.
  Tuple copyWithout({required List<bool> indices}) {
    throw StateError('Tuple0 does not have any items to retain or discard.');
  }

  /// Converts this tuple into a map for JSON serialization.
  ///
  /// (For [Tuple0], this method returns an empty map.)
  Map<String, dynamic> toJson() => <String, dynamic>{};

  /// A utility method for mapping a function to every item in this tuple.
  ///
  /// (For [Tuple0], this method has no parameters and does nothing.)
  void mapActions() {}

  /// Converts this tuple into a record.
  ///
  /// (For [Tuple0], this method returns an empty record. Note: an empty record
  /// is equal to all other empty records and shouldn't be used for uniqueness.)
  () toRecord() => ();

  /// Provides an indexable way to access this tuple's items.
  dynamic operator [](int index) {
    throw RangeError.index(index, this, 'index', 'index out of range', 0);
  }

  @override
  bool operator ==(Object other) {
    return other is Tuple0;
  }

  @override
  int get hashCode {
    return 0;
  }

  /// Returns the constant length of this tuple.
  @override
  int get length => 0;

  @override
  Iterator<dynamic> get iterator => _Tuple0Iterator();

  @override
  String toString() => '()';
}

/// A finite fixed-length ordered list containing 1 dynamically-typed element.
class Tuple1<T> extends Tuple {
  final T item;

  /// Creates a tuple of length 1.
  const Tuple1(this.item);

  /// Creates a tuple from a record.
  factory Tuple1.fromRecord((T,) record) => Tuple1(record.$1);

  /// Creates an tuple from a map/JSON source.
  factory Tuple1.fromJson(Map<String, dynamic> map) => Tuple1(map['item'] as T);

  /// Creates an tuple from a list source.
  factory Tuple1.fromList(List<dynamic> list, [bool trim = false]) {
    if (list.isEmpty) {
      throw ArgumentError.value(
          'list', 'The given list has less than 1 element.');
    }
    if (!trim && list.length > 1) {
      throw ArgumentError.value('list',
          'The given list has more than 1 element. Use `trim: true` if you intended to ignore excess elements.');
    }
    return Tuple1(list[0] as T);
  }

  /// Clones this tuple where the clone is cast with the specified type arguments.
  Tuple1<U> asType<U>() {
    if (item is! U) {
      throw StateError(
          'The provided type arguments do not match the runtime type of this tuple\'s items');
    }
    return Tuple1<U>(item as U);
  }

  /// Clones this tuple where the clone is cast with dynamically-typed items.
  Tuple1<dynamic> asDynamic() => Tuple1<dynamic>(item);

  /// Creates a copy tuple with the elements from this tuple with the value of
  /// each item optionally overridden.
  Tuple1<T> copyWith(T? item) => Tuple1<T>(item ?? this.item);

  /// A list of boolean values indicating whether certain items in this
  /// tuple should be retained or discarded. The length of the list must
  /// be the same as the length of this tuple.
  ///
  /// Note: Due to the dynamic nature of this method, the returned tuple will
  /// not have typing preserved. This can be fixed by calling [asType] on the
  /// result.
  Tuple copyWithout({required List<bool> indices}) {
    assert(indices.length == 1,
        'Length of given list must be same length as tuple.');

    var values = <dynamic>[];
    for (var i = 0; i < indices.length; i++) {
      if (indices[i]) {
        values.add(this[i]);
      }
    }

    return Tuple.fromList(values);
  }

  /// Converts this tuple into a map for JSON serialization.
  Map<String, dynamic> toJson() => <String, dynamic>{'item': item};

  /// A utility method for mapping a function to every item in this tuple.
  void mapActions({
    required void Function(T) item,
  }) {
    item(this.item);
  }

  /// Converts this tuple into a record.
  (T,) toRecord() => (item,);

  /// Provides an indexable way to access this tuple's items.
  dynamic operator [](int index) {
    switch (index) {
      case 0:
        return item;
    }
    throw RangeError.index(index, this, 'index', 'index out of range', 2);
  }

  @override
  bool operator ==(Object other) {
    return other is Tuple1 && item == other.item;
  }

  @override
  int get hashCode {
    final prime = 31;
    var result = 1;

    result = prime * result + item.hashCode;

    return result;
  }

  /// Returns the constant length of this tuple.
  @override
  int get length => 1;

  @override
  Iterator<dynamic> get iterator => _Tuple1Iterator(this);

  @override
  String toString() => '($item)';
}

/// A finite fixed-length ordered list containing 2 dynamically-typed elements.
class Tuple2<T0, T1> extends Tuple {
  final T0 item0;
  final T1 item1;

  /// Creates a tuple of length 2.
  const Tuple2(
    this.item0,
    this.item1,
  );

  /// Creates a tuple from a record.
  factory Tuple2.fromRecord((T0, T1) record) => Tuple2(
        record.$1,
        record.$2,
      );

  /// Creates an tuple from a map/JSON source.
  factory Tuple2.fromJson(Map<String, dynamic> map) => Tuple2(
        map['item0'] as T0,
        map['item1'] as T1,
      );

  /// Creates an tuple from a list source.
  factory Tuple2.fromList(List<dynamic> list, [bool trim = false]) {
    if (list.length < 2) {
      throw ArgumentError.value(
          'list', 'The given list has less than 2 elements.');
    }
    if (!trim && list.length > 2) {
      throw ArgumentError.value('list',
          'The given list has more than 2 elements. Use `trim: true` if you intended to ignore excess elements.');
    }
    return Tuple2(
      list[0] as T0,
      list[1] as T1,
    );
  }

  /// Clones this tuple where the clone is cast with the specified type arguments.
  Tuple2<U0, U1> asType<U0, U1>() {
    if (item0 is! U0 || item1 is! U1) {
      throw StateError(
          'The provided type arguments do not match the runtime type of this tuple\'s items');
    }
    return Tuple2<U0, U1>(item0 as U0, item1 as U1);
  }

  /// Clones this tuple where the clone is cast with dynamically-typed items.
  Tuple2<dynamic, dynamic> asDynamic() => Tuple2<dynamic, dynamic>(
        item0,
        item1,
      );

  /// Creates a copy tuple with the elements from this tuple with the value of
  /// each item optionally overridden.
  Tuple2<T0, T1> copyWith({
    T0? item0,
    T1? item1,
  }) =>
      Tuple2<T0, T1>(
        item0 ?? this.item0,
        item1 ?? this.item1,
      );

  /// A list of boolean values indicating whether certain items in this
  /// tuple should be retained or discarded. The length of the list must
  /// be the same as the length of this tuple.
  ///
  /// Note: Due to the dynamic nature of this method, the returned tuple will
  /// not have typing preserved. This can be fixed by calling [asType] on the
  /// result.
  Tuple copyWithout({required List<bool> indices}) {
    assert(indices.length == 2,
        'Length of given list must be same length as tuple.');

    var values = <dynamic>[];
    for (var i = 0; i < indices.length; i++) {
      if (indices[i]) {
        values.add(this[i]);
      }
    }

    return Tuple.fromList(values);
  }

  /// Converts this tuple into a map for JSON serialization.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'item0': item0,
        'item1': item1,
      };

  /// A utility method for mapping a function to every item in this tuple.
  void mapActions({
    required void Function(T0) item0,
    required void Function(T1) item1,
  }) {
    item0(this.item0);
    item1(this.item1);
  }

  /// Converts this tuple into a record.
  (T0, T1) toRecord() => (item0, item1);

  dynamic operator [](int index) {
    switch (index) {
      case 0:
        return item0;
      case 1:
        return item1;
    }
    throw RangeError.index(index, this, 'index', 'index out of range', 2);
  }

  @override
  bool operator ==(Object other) {
    return other is Tuple2 && item0 == other.item0 && item1 == other.item1;
  }

  @override
  int get hashCode {
    final prime = 31;
    var result = 1;

    result = prime * result + item0.hashCode;
    result = prime * result + item1.hashCode;

    return result;
  }

  /// Returns the constant length of this tuple.
  @override
  int get length => 2;

  @override
  Iterator<dynamic> get iterator => _Tuple2Iterator(this);

  @override
  String toString() => '($item0, $item1)';
}

/// A finite fixed-length ordered list containing 3 dynamically-typed elements.
class Tuple3<T0, T1, T2> extends Tuple {
  final T0 item0;
  final T1 item1;
  final T2 item2;

  /// Creates a tuple of length 3.
  const Tuple3(
    this.item0,
    this.item1,
    this.item2,
  );

  /// Creates a tuple from a record.
  factory Tuple3.fromRecord((T0, T1, T2) record) => Tuple3(
        record.$1,
        record.$2,
        record.$3,
      );

  /// Creates an tuple from a map/JSON source.
  factory Tuple3.fromJson(Map<String, dynamic> map) => Tuple3(
        map['item0'] as T0,
        map['item1'] as T1,
        map['item2'] as T2,
      );

  /// Creates an tuple from a list source.
  factory Tuple3.fromList(List<dynamic> list, [bool trim = false]) {
    if (list.length < 3) {
      throw ArgumentError.value(
          'list', 'The given list has less than 3 elements.');
    }
    if (!trim && list.length > 3) {
      throw ArgumentError.value('list',
          'The given list has more than 3 elements. Use `trim: true` if you intended to ignore excess elements.');
    }
    return Tuple3(
      list[0] as T0,
      list[1] as T1,
      list[2] as T2,
    );
  }

  /// Clones this tuple where the clone is cast with the specified type arguments.
  Tuple3<U0, U1, U2> asType<U0, U1, U2>() {
    if (item0 is! U0 || item1 is! U1 || item2 is! U2) {
      throw StateError(
          'The provided type arguments do not match the runtime type of this tuple\'s items');
    }
    return Tuple3<U0, U1, U2>(
      item0 as U0,
      item1 as U1,
      item2 as U2,
    );
  }

  /// Clones this tuple where the clone is cast with dynamically-typed items.
  Tuple3<dynamic, dynamic, dynamic> asDynamic() =>
      Tuple3<dynamic, dynamic, dynamic>(
        item0,
        item1,
        item2,
      );

  /// Converts this tuple into a map for JSON serialization.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'item0': item0,
        'item1': item1,
        'item2': item2,
      };

  /// Creates a copy tuple with the elements from this tuple with the value of
  /// each item optionally overridden.
  Tuple3<T0, T1, T2> copyWith({
    T0? item0,
    T1? item1,
    T2? item2,
  }) =>
      Tuple3<T0, T1, T2>(
        item0 ?? this.item0,
        item1 ?? this.item1,
        item2 ?? this.item2,
      );

  /// A list of boolean values indicating whether certain items in this
  /// tuple should be retained or discarded. The length of the list must
  /// be the same as the length of this tuple.
  ///
  /// Note: Due to the dynamic nature of this method, the returned tuple will
  /// not have typing preserved. This can be fixed by calling [asType] on the
  /// result.
  Tuple copyWithout({required List<bool> indices}) {
    assert(indices.length == 3,
        'Length of given list must be same length as tuple.');

    var values = <dynamic>[];
    for (var i = 0; i < indices.length; i++) {
      if (indices[i]) {
        values.add(this[i]);
      }
    }

    return Tuple.fromList(values);
  }

  /// Provides an indexable way to access this tuple's items.
  dynamic operator [](int index) {
    switch (index) {
      case 0:
        return item0;
      case 1:
        return item1;
      case 2:
        return item2;
    }
    throw RangeError.index(index, this, 'index', 'index out of range', 3);
  }

  /// Returns the constant length of this tuple.
  @override
  int get length => 3;

  @override
  Iterator<dynamic> get iterator => _Tuple3Iterator(this);

  /// A utility method for mapping a function to every item in this tuple.
  void mapActions({
    required void Function(T0) item0,
    required void Function(T1) item1,
    required void Function(T2) item2,
  }) {
    item0(this.item0);
    item1(this.item1);
    item2(this.item2);
  }

  /// Converts this tuple into a record.
  (T0, T1, T2) toRecord() => (item0, item1, item2);

  @override
  bool operator ==(Object other) {
    return other is Tuple3 &&
        item0 == other.item0 &&
        item1 == other.item1 &&
        item2 == other.item2;
  }

  @override
  int get hashCode {
    final prime = 31;
    var result = 1;

    result = prime * result + item0.hashCode;
    result = prime * result + item1.hashCode;
    result = prime * result + item2.hashCode;

    return result;
  }

  @override
  String toString() => '($item0, $item1, $item2)';
}

/// A finite fixed-length ordered list containing 4 dynamically-typed elements.
class Tuple4<T0, T1, T2, T3> extends Tuple {
  final T0 item0;
  final T1 item1;
  final T2 item2;
  final T3 item3;

  /// Creates a tuple of length 4.
  const Tuple4(
    this.item0,
    this.item1,
    this.item2,
    this.item3,
  );

  /// Creates a tuple from a record.
  factory Tuple4.fromRecord((T0, T1, T2, T3) record) => Tuple4(
        record.$1,
        record.$2,
        record.$3,
        record.$4,
      );

  /// Creates an tuple from a map/JSON source.
  factory Tuple4.fromJson(Map<String, dynamic> map) => Tuple4(
        map['item0'] as T0,
        map['item1'] as T1,
        map['item2'] as T2,
        map['item3'] as T3,
      );

  /// Creates an tuple from a list source.
  factory Tuple4.fromList(List<dynamic> list, [bool trim = false]) {
    if (list.length < 4) {
      throw ArgumentError.value(
          'list', 'The given list has less than 4 elements.');
    }
    if (!trim && list.length > 4) {
      throw ArgumentError.value('list',
          'The given list has more than 4 elements. Use `trim: true` if you intended to ignore excess elements.');
    }
    return Tuple4(
      list[0] as T0,
      list[1] as T1,
      list[2] as T2,
      list[3] as T3,
    );
  }

  /// Clones this tuple where the clone is cast with the specified type arguments.
  Tuple4<U0, U1, U2, U3> asType<U0, U1, U2, U3>() {
    if (item0 is! U0 || item1 is! U1 || item2 is! U2 || item3 is! U3) {
      throw StateError(
          'The provided type arguments do not match the runtime type of this tuple\'s items');
    }
    return Tuple4<U0, U1, U2, U3>(
      item0 as U0,
      item1 as U1,
      item2 as U2,
      item3 as U3,
    );
  }

  /// Clones this tuple where the clone is cast with dynamically-typed items.
  Tuple4<dynamic, dynamic, dynamic, dynamic> asDynamic() =>
      Tuple4<dynamic, dynamic, dynamic, dynamic>(
        item0,
        item1,
        item2,
        item3,
      );

  /// Converts this tuple into a map for JSON serialization.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'item0': item0,
        'item1': item1,
        'item2': item2,
        'item3': item3,
      };

  /// Creates a copy tuple with the elements from this tuple with the value of
  /// each item optionally overridden.
  Tuple4<T0, T1, T2, T3> copyWith({
    T0? item0,
    T1? item1,
    T2? item2,
    T3? item3,
  }) =>
      Tuple4<T0, T1, T2, T3>(
        item0 ?? this.item0,
        item1 ?? this.item1,
        item2 ?? this.item2,
        item3 ?? this.item3,
      );

  /// A list of boolean values indicating whether certain items in this
  /// tuple should be retained or discarded. The length of the list must
  /// be the same as the length of this tuple.
  ///
  /// Note: Due to the dynamic nature of this method, the returned tuple will
  /// not have typing preserved. This can be fixed by calling [asType] on the
  /// result.
  Tuple copyWithout({required List<bool> indices}) {
    assert(indices.length == 4,
        'Length of given list must be same length as tuple.');

    var values = <dynamic>[];
    for (var i = 0; i < indices.length; i++) {
      if (indices[i]) {
        values.add(this[i]);
      }
    }

    return Tuple.fromList(values);
  }

  /// Provides an indexable way to access this tuple's items.
  dynamic operator [](int index) {
    switch (index) {
      case 0:
        return item0;
      case 1:
        return item1;
      case 2:
        return item2;
      case 3:
        return item3;
    }
    throw RangeError.index(index, this, 'index', 'index out of range', 4);
  }

  /// Returns the constant length of this tuple.
  @override
  int get length => 4;

  @override
  Iterator<dynamic> get iterator => _Tuple4Iterator(this);

  /// A utility method for mapping a function to every item in this tuple.
  void mapActions({
    required void Function(T0) item0,
    required void Function(T1) item1,
    required void Function(T2) item2,
    required void Function(T3) item3,
  }) {
    item0(this.item0);
    item1(this.item1);
    item2(this.item2);
    item3(this.item3);
  }

  /// Converts this tuple into a record.
  (T0, T1, T2, T3) toRecord() => (item0, item1, item2, item3);

  @override
  bool operator ==(Object other) {
    return other is Tuple4 &&
        item0 == other.item0 &&
        item1 == other.item1 &&
        item2 == other.item2 &&
        item3 == other.item3;
  }

  @override
  int get hashCode {
    final prime = 31;
    var result = 1;

    result = prime * result + item0.hashCode;
    result = prime * result + item1.hashCode;
    result = prime * result + item2.hashCode;
    result = prime * result + item3.hashCode;

    return result;
  }

  @override
  String toString() => '($item0, $item1, $item2, $item3)';
}

/// A finite fixed-length ordered list containing 5 dynamically-typed elements.
class Tuple5<T0, T1, T2, T3, T4> extends Tuple {
  final T0 item0;
  final T1 item1;
  final T2 item2;
  final T3 item3;
  final T4 item4;

  /// Creates a tuple of length 5.
  const Tuple5(
    this.item0,
    this.item1,
    this.item2,
    this.item3,
    this.item4,
  );

  /// Creates a tuple from a record.
  factory Tuple5.fromRecord((T0, T1, T2, T3, T4) record) => Tuple5(
        record.$1,
        record.$2,
        record.$3,
        record.$4,
        record.$5,
      );

  /// Creates an tuple from a map/JSON source.
  factory Tuple5.fromJson(Map<String, dynamic> map) => Tuple5(
        map['item0'] as T0,
        map['item1'] as T1,
        map['item2'] as T2,
        map['item3'] as T3,
        map['item4'] as T4,
      );

  /// Creates an tuple from a list source.
  factory Tuple5.fromList(List<dynamic> list, [bool trim = false]) {
    if (list.length < 5) {
      throw ArgumentError.value(
          'list', 'The given list has less than 5 elements.');
    }
    if (!trim && list.length > 5) {
      throw ArgumentError.value('list',
          'The given list has more than 5 elements. Use `trim: true` if you intended to ignore excess elements.');
    }
    return Tuple5(
      list[0] as T0,
      list[1] as T1,
      list[2] as T2,
      list[3] as T3,
      list[4] as T4,
    );
  }

  /// Clones this tuple where the clone is cast with the specified type arguments.
  Tuple5<U0, U1, U2, U3, U4> asType<U0, U1, U2, U3, U4>() {
    if (item0 is! U0 ||
        item1 is! U1 ||
        item2 is! U2 ||
        item3 is! U3 ||
        item4 is! U4) {
      throw StateError(
          'The provided type arguments do not match the runtime type of this tuple\'s items');
    }
    return Tuple5<U0, U1, U2, U3, U4>(
      item0 as U0,
      item1 as U1,
      item2 as U2,
      item3 as U3,
      item4 as U4,
    );
  }

  /// Clones this tuple where the clone is cast with dynamically-typed items.
  Tuple5<dynamic, dynamic, dynamic, dynamic, dynamic> asDynamic() =>
      Tuple5<dynamic, dynamic, dynamic, dynamic, dynamic>(
        item0,
        item1,
        item2,
        item3,
        item4,
      );

  /// Converts this tuple into a map for JSON serialization.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'item0': item0,
        'item1': item1,
        'item2': item2,
        'item3': item3,
        'item4': item4,
      };

  /// Creates a copy tuple with the elements from this tuple with the value of
  /// each item optionally overridden.
  Tuple5<T0, T1, T2, T3, T4> copyWith({
    T0? item0,
    T1? item1,
    T2? item2,
    T3? item3,
    T4? item4,
  }) =>
      Tuple5<T0, T1, T2, T3, T4>(
        item0 ?? this.item0,
        item1 ?? this.item1,
        item2 ?? this.item2,
        item3 ?? this.item3,
        item4 ?? this.item4,
      );

  /// A list of boolean values indicating whether certain items in this
  /// tuple should be retained or discarded. The length of the list must
  /// be the same as the length of this tuple.
  ///
  /// Note: Due to the dynamic nature of this method, the returned tuple will
  /// not have typing preserved. This can be fixed by calling [asType] on the
  /// result.
  Tuple copyWithout({required List<bool> indices}) {
    assert(indices.length == 5,
        'Length of given list must be same length as tuple.');

    var values = <dynamic>[];
    for (var i = 0; i < indices.length; i++) {
      if (indices[i]) {
        values.add(this[i]);
      }
    }

    return Tuple.fromList(values);
  }

  /// Provides an indexable way to access this tuple's items.
  dynamic operator [](int index) {
    switch (index) {
      case 0:
        return item0;
      case 1:
        return item1;
      case 2:
        return item2;
      case 3:
        return item3;
      case 4:
        return item4;
    }
    throw RangeError.index(index, this, 'index', 'index out of range', 5);
  }

  /// Returns the constant length of this tuple.
  @override
  int get length => 5;

  @override
  Iterator<dynamic> get iterator => _Tuple5Iterator(this);

  /// A utility method for mapping a function to every item in this tuple.
  void mapActions({
    required void Function(T0) item0,
    required void Function(T1) item1,
    required void Function(T2) item2,
    required void Function(T3) item3,
    required void Function(T4) item4,
  }) {
    item0(this.item0);
    item1(this.item1);
    item2(this.item2);
    item3(this.item3);
    item4(this.item4);
  }

  /// Converts this tuple into a record.
  (T0, T1, T2, T3, T4) toRecord() => (item0, item1, item2, item3, item4);

  @override
  bool operator ==(Object other) {
    return other is Tuple5 &&
        item0 == other.item0 &&
        item1 == other.item1 &&
        item2 == other.item2 &&
        item3 == other.item3 &&
        item4 == other.item4;
  }

  @override
  int get hashCode {
    final prime = 31;
    var result = 1;

    result = prime * result + item0.hashCode;
    result = prime * result + item1.hashCode;
    result = prime * result + item2.hashCode;
    result = prime * result + item3.hashCode;
    result = prime * result + item4.hashCode;

    return result;
  }

  @override
  String toString() => '($item0, $item1, $item2, $item3, $item4)';
}

/// A finite fixed-length ordered list containing 6 dynamically-typed elements.
class Tuple6<T0, T1, T2, T3, T4, T5> extends Tuple {
  final T0 item0;
  final T1 item1;
  final T2 item2;
  final T3 item3;
  final T4 item4;
  final T5 item5;

  /// Creates a tuple of length 6.
  const Tuple6(
    this.item0,
    this.item1,
    this.item2,
    this.item3,
    this.item4,
    this.item5,
  );

  /// Creates a tuple from a record.
  factory Tuple6.fromRecord((T0, T1, T2, T3, T4, T5) record) => Tuple6(
        record.$1,
        record.$2,
        record.$3,
        record.$4,
        record.$5,
        record.$6,
      );

  /// Creates an tuple from a map/JSON source.
  factory Tuple6.fromJson(Map<String, dynamic> map) => Tuple6(
        map['item0'] as T0,
        map['item1'] as T1,
        map['item2'] as T2,
        map['item3'] as T3,
        map['item4'] as T4,
        map['item5'] as T5,
      );

  /// Creates an tuple from a list source.
  factory Tuple6.fromList(List<dynamic> list, [bool trim = false]) {
    if (list.length < 6) {
      throw ArgumentError.value(
          'list', 'The given list has less than 6 elements.');
    }
    if (!trim && list.length > 6) {
      throw ArgumentError.value('list',
          'The given list has more than 6 elements. Use `trim: true` if you intended to ignore excess elements.');
    }
    return Tuple6(
      list[0] as T0,
      list[1] as T1,
      list[2] as T2,
      list[3] as T3,
      list[4] as T4,
      list[5] as T5,
    );
  }

  /// Clones this tuple where the clone is cast with the specified type arguments.
  Tuple6<U0, U1, U2, U3, U4, U5> asType<U0, U1, U2, U3, U4, U5>() {
    if (item0 is! U0 ||
        item1 is! U1 ||
        item2 is! U2 ||
        item3 is! U3 ||
        item4 is! U4 ||
        item5 is! U5) {
      throw StateError(
          'The provided type arguments do not match the runtime type of this tuple\'s items');
    }
    return Tuple6<U0, U1, U2, U3, U4, U5>(
      item0 as U0,
      item1 as U1,
      item2 as U2,
      item3 as U3,
      item4 as U4,
      item5 as U5,
    );
  }

  /// Clones this tuple where the clone is cast with dynamically-typed items.
  Tuple6<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic> asDynamic() =>
      Tuple6<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic>(
        item0,
        item1,
        item2,
        item3,
        item4,
        item5,
      );

  /// Converts this tuple into a map for JSON serialization.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'item0': item0,
        'item1': item1,
        'item2': item2,
        'item3': item3,
        'item4': item4,
        'item5': item5,
      };

  /// Creates a copy tuple with the elements from this tuple with the value of
  /// each item optionally overridden.
  Tuple6<T0, T1, T2, T3, T4, T5> copyWith({
    T0? item0,
    T1? item1,
    T2? item2,
    T3? item3,
    T4? item4,
    T5? item5,
  }) =>
      Tuple6<T0, T1, T2, T3, T4, T5>(
        item0 ?? this.item0,
        item1 ?? this.item1,
        item2 ?? this.item2,
        item3 ?? this.item3,
        item4 ?? this.item4,
        item5 ?? this.item5,
      );

  /// A list of boolean values indicating whether certain items in this
  /// tuple should be retained or discarded. The length of the list must
  /// be the same as the length of this tuple.
  ///
  /// Note: Due to the dynamic nature of this method, the returned tuple will
  /// not have typing preserved. This can be fixed by calling [asType] on the
  /// result.
  Tuple copyWithout({required List<bool> indices}) {
    assert(indices.length == 6,
        'Length of given list must be same length as tuple.');

    var values = <dynamic>[];
    for (var i = 0; i < indices.length; i++) {
      if (indices[i]) {
        values.add(this[i]);
      }
    }

    return Tuple.fromList(values);
  }

  /// Provides an indexable way to access this tuple's items.
  dynamic operator [](int index) {
    switch (index) {
      case 0:
        return item0;
      case 1:
        return item1;
      case 2:
        return item2;
      case 3:
        return item3;
      case 4:
        return item4;
      case 5:
        return item5;
    }
    throw RangeError.index(index, this, 'index', 'index out of range', 6);
  }

  /// Returns the constant length of this tuple.
  @override
  int get length => 6;

  @override
  Iterator<dynamic> get iterator => _Tuple6Iterator(this);

  /// A utility method for mapping a function to every item in this tuple.
  void mapActions({
    required void Function(T0) item0,
    required void Function(T1) item1,
    required void Function(T2) item2,
    required void Function(T3) item3,
    required void Function(T4) item4,
    required void Function(T5) item5,
  }) {
    item0(this.item0);
    item1(this.item1);
    item2(this.item2);
    item3(this.item3);
    item4(this.item4);
    item5(this.item5);
  }

  /// Converts this tuple into a record.
  (T0, T1, T2, T3, T4, T5) toRecord() =>
      (item0, item1, item2, item3, item4, item5);

  @override
  bool operator ==(Object other) {
    return other is Tuple6 &&
        item0 == other.item0 &&
        item1 == other.item1 &&
        item2 == other.item2 &&
        item3 == other.item3 &&
        item4 == other.item4 &&
        item5 == other.item5;
  }

  @override
  int get hashCode {
    final prime = 31;
    var result = 1;

    result = prime * result + item0.hashCode;
    result = prime * result + item1.hashCode;
    result = prime * result + item2.hashCode;
    result = prime * result + item3.hashCode;
    result = prime * result + item4.hashCode;
    result = prime * result + item5.hashCode;

    return result;
  }

  @override
  String toString() => '($item0, $item1, $item2, $item3, $item4, $item5)';
}

/// A finite fixed-length ordered list containing 7 dynamically-typed elements.
class Tuple7<T0, T1, T2, T3, T4, T5, T6> extends Tuple {
  final T0 item0;
  final T1 item1;
  final T2 item2;
  final T3 item3;
  final T4 item4;
  final T5 item5;
  final T6 item6;

  /// Creates a tuple of length 7.
  const Tuple7(
    this.item0,
    this.item1,
    this.item2,
    this.item3,
    this.item4,
    this.item5,
    this.item6,
  );

  /// Creates a tuple from a record.
  factory Tuple7.fromRecord((T0, T1, T2, T3, T4, T5, T6) record) => Tuple7(
        record.$1,
        record.$2,
        record.$3,
        record.$4,
        record.$5,
        record.$6,
        record.$7,
      );

  /// Creates an tuple from a map/JSON source.
  factory Tuple7.fromJson(Map<String, dynamic> map) => Tuple7(
        map['item0'] as T0,
        map['item1'] as T1,
        map['item2'] as T2,
        map['item3'] as T3,
        map['item4'] as T4,
        map['item5'] as T5,
        map['item6'] as T6,
      );

  /// Creates an tuple from a list source.
  factory Tuple7.fromList(List<dynamic> list, [bool trim = false]) {
    if (list.length < 7) {
      throw ArgumentError.value(
          'list', 'The given list has less than 7 elements.');
    }
    if (!trim && list.length > 7) {
      throw ArgumentError.value('list',
          'The given list has more than 7 elements. Use `trim: true` if you intended to ignore excess elements.');
    }
    return Tuple7(
      list[0] as T0,
      list[1] as T1,
      list[2] as T2,
      list[3] as T3,
      list[4] as T4,
      list[5] as T5,
      list[6] as T6,
    );
  }

  /// Clones this tuple where the clone is cast with the specified type arguments.
  Tuple7<U0, U1, U2, U3, U4, U5, U6> asType<U0, U1, U2, U3, U4, U5, U6>() {
    if (item0 is! U0 ||
        item1 is! U1 ||
        item2 is! U2 ||
        item3 is! U3 ||
        item4 is! U4 ||
        item5 is! U5 ||
        item6 is! U6) {
      throw StateError(
          'The provided type arguments do not match the runtime type of this tuple\'s items');
    }
    return Tuple7<U0, U1, U2, U3, U4, U5, U6>(
      item0 as U0,
      item1 as U1,
      item2 as U2,
      item3 as U3,
      item4 as U4,
      item5 as U5,
      item6 as U6,
    );
  }

  /// Clones this tuple where the clone is cast with dynamically-typed items.
  Tuple7<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic>
      asDynamic() =>
          Tuple7<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic>(
            item0,
            item1,
            item2,
            item3,
            item4,
            item5,
            item6,
          );

  /// Converts this tuple into a map for JSON serialization.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'item0': item0,
        'item1': item1,
        'item2': item2,
        'item3': item3,
        'item4': item4,
        'item5': item5,
        'item6': item6,
      };

  /// Creates a copy tuple with the elements from this tuple with the value of
  /// each item optionally overridden.
  Tuple7<T0, T1, T2, T3, T4, T5, T6> copyWith({
    T0? item0,
    T1? item1,
    T2? item2,
    T3? item3,
    T4? item4,
    T5? item5,
    T6? item6,
  }) =>
      Tuple7<T0, T1, T2, T3, T4, T5, T6>(
        item0 ?? this.item0,
        item1 ?? this.item1,
        item2 ?? this.item2,
        item3 ?? this.item3,
        item4 ?? this.item4,
        item5 ?? this.item5,
        item6 ?? this.item6,
      );

  /// A list of boolean values indicating whether certain items in this
  /// tuple should be retained or discarded. The length of the list must
  /// be the same as the length of this tuple.
  ///
  /// Note: Due to the dynamic nature of this method, the returned tuple will
  /// not have typing preserved. This can be fixed by calling [asType] on the
  /// result.
  Tuple copyWithout({required List<bool> indices}) {
    assert(indices.length == 7,
        'Length of given list must be same length as tuple.');

    var values = <dynamic>[];
    for (var i = 0; i < indices.length; i++) {
      if (indices[i]) {
        values.add(this[i]);
      }
    }

    return Tuple.fromList(values);
  }

  /// Provides an indexable way to access this tuple's items.
  dynamic operator [](int index) {
    switch (index) {
      case 0:
        return item0;
      case 1:
        return item1;
      case 2:
        return item2;
      case 3:
        return item3;
      case 4:
        return item4;
      case 5:
        return item5;
      case 6:
        return item6;
    }
    throw RangeError.index(index, this, 'index', 'index out of range', 7);
  }

  /// Returns the constant length of this tuple.
  @override
  int get length => 7;

  @override
  Iterator<dynamic> get iterator => _Tuple7Iterator(this);

  /// A utility method for mapping a function to every item in this tuple.
  void mapActions({
    required void Function(T0) item0,
    required void Function(T1) item1,
    required void Function(T2) item2,
    required void Function(T3) item3,
    required void Function(T4) item4,
    required void Function(T5) item5,
    required void Function(T6) item6,
  }) {
    item0(this.item0);
    item1(this.item1);
    item2(this.item2);
    item3(this.item3);
    item4(this.item4);
    item5(this.item5);
    item6(this.item6);
  }

  /// Converts this tuple into a record.
  (T0, T1, T2, T3, T4, T5, T6) toRecord() =>
      (item0, item1, item2, item3, item4, item5, item6);

  @override
  bool operator ==(Object other) {
    return other is Tuple7 &&
        item0 == other.item0 &&
        item1 == other.item1 &&
        item2 == other.item2 &&
        item3 == other.item3 &&
        item4 == other.item4 &&
        item5 == other.item5 &&
        item6 == other.item6;
  }

  @override
  int get hashCode {
    final prime = 31;
    var result = 1;

    result = prime * result + item0.hashCode;
    result = prime * result + item1.hashCode;
    result = prime * result + item2.hashCode;
    result = prime * result + item3.hashCode;
    result = prime * result + item4.hashCode;
    result = prime * result + item5.hashCode;
    result = prime * result + item6.hashCode;

    return result;
  }

  @override
  String toString() =>
      '($item0, $item1, $item2, $item3, $item4, $item5, $item6)';
}

/// A finite fixed-length ordered list containing 8 dynamically-typed elements.
class Tuple8<T0, T1, T2, T3, T4, T5, T6, T7> extends Tuple {
  final T0 item0;
  final T1 item1;
  final T2 item2;
  final T3 item3;
  final T4 item4;
  final T5 item5;
  final T6 item6;
  final T7 item7;

  /// Creates a tuple of length 8.
  const Tuple8(
    this.item0,
    this.item1,
    this.item2,
    this.item3,
    this.item4,
    this.item5,
    this.item6,
    this.item7,
  );

  /// Creates a tuple from a record.
  factory Tuple8.fromRecord((T0, T1, T2, T3, T4, T5, T6, T7) record) => Tuple8(
        record.$1,
        record.$2,
        record.$3,
        record.$4,
        record.$5,
        record.$6,
        record.$7,
        record.$8,
      );

  /// Creates an tuple from a map/JSON source.
  factory Tuple8.fromJson(Map<String, dynamic> map) => Tuple8(
        map['item0'] as T0,
        map['item1'] as T1,
        map['item2'] as T2,
        map['item3'] as T3,
        map['item4'] as T4,
        map['item5'] as T5,
        map['item6'] as T6,
        map['item7'] as T7,
      );

  /// Creates an tuple from a list source.
  factory Tuple8.fromList(List<dynamic> list, [bool trim = false]) {
    if (list.length < 8) {
      throw ArgumentError.value(
          'list', 'The given list has less than 8 elements.');
    }
    if (!trim && list.length > 8) {
      throw ArgumentError.value('list',
          'The given list has more than 8 elements. Use `trim: true` if you intended to ignore excess elements.');
    }
    return Tuple8(
      list[0] as T0,
      list[1] as T1,
      list[2] as T2,
      list[3] as T3,
      list[4] as T4,
      list[5] as T5,
      list[6] as T6,
      list[7] as T7,
    );
  }

  /// Clones this tuple where the clone is cast with the specified type arguments.
  Tuple8<U0, U1, U2, U3, U4, U5, U6, U7>
      asType<U0, U1, U2, U3, U4, U5, U6, U7>() {
    if (item0 is! U0 ||
        item1 is! U1 ||
        item2 is! U2 ||
        item3 is! U3 ||
        item4 is! U4 ||
        item5 is! U5 ||
        item6 is! U6 ||
        item7 is! U7) {
      throw StateError(
          'The provided type arguments do not match the runtime type of this tuple\'s items');
    }
    return Tuple8<U0, U1, U2, U3, U4, U5, U6, U7>(
      item0 as U0,
      item1 as U1,
      item2 as U2,
      item3 as U3,
      item4 as U4,
      item5 as U5,
      item6 as U6,
      item7 as U7,
    );
  }

  /// Clones this tuple where the clone is cast with dynamically-typed items.
  Tuple8<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic>
      asDynamic() => Tuple8<dynamic, dynamic, dynamic, dynamic, dynamic,
              dynamic, dynamic, dynamic>(
            item0,
            item1,
            item2,
            item3,
            item4,
            item5,
            item6,
            item7,
          );

  /// Converts this tuple into a map for JSON serialization.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'item0': item0,
        'item1': item1,
        'item2': item2,
        'item3': item3,
        'item4': item4,
        'item5': item5,
        'item6': item6,
        'item7': item7,
      };

  /// Creates a copy tuple with the elements from this tuple with the value of
  /// each item optionally overridden.
  Tuple8<T0, T1, T2, T3, T4, T5, T6, T7> copyWith({
    T0? item0,
    T1? item1,
    T2? item2,
    T3? item3,
    T4? item4,
    T5? item5,
    T6? item6,
    T7? item7,
  }) =>
      Tuple8<T0, T1, T2, T3, T4, T5, T6, T7>(
        item0 ?? this.item0,
        item1 ?? this.item1,
        item2 ?? this.item2,
        item3 ?? this.item3,
        item4 ?? this.item4,
        item5 ?? this.item5,
        item6 ?? this.item6,
        item7 ?? this.item7,
      );

  /// A list of boolean values indicating whether certain items in this
  /// tuple should be retained or discarded. The length of the list must
  /// be the same as the length of this tuple.
  ///
  /// Note: Due to the dynamic nature of this method, the returned tuple will
  /// not have typing preserved. This can be fixed by calling [asType] on the
  /// result.
  Tuple copyWithout({required List<bool> indices}) {
    assert(indices.length == 8,
        'Length of given list must be same length as tuple.');

    var values = <dynamic>[];
    for (var i = 0; i < indices.length; i++) {
      if (indices[i]) {
        values.add(this[i]);
      }
    }

    return Tuple.fromList(values);
  }

  /// Provides an indexable way to access this tuple's items.
  dynamic operator [](int index) {
    switch (index) {
      case 0:
        return item0;
      case 1:
        return item1;
      case 2:
        return item2;
      case 3:
        return item3;
      case 4:
        return item4;
      case 5:
        return item5;
      case 6:
        return item6;
      case 7:
        return item7;
    }
    throw RangeError.index(index, this, 'index', 'index out of range', 8);
  }

  /// Returns the constant length of this tuple.
  @override
  int get length => 8;

  @override
  Iterator<dynamic> get iterator => _Tuple8Iterator(this);

  /// A utility method for mapping a function to every item in this tuple.
  void mapActions({
    required void Function(T0) item0,
    required void Function(T1) item1,
    required void Function(T2) item2,
    required void Function(T3) item3,
    required void Function(T4) item4,
    required void Function(T5) item5,
    required void Function(T6) item6,
    required void Function(T7) item7,
  }) {
    item0(this.item0);
    item1(this.item1);
    item2(this.item2);
    item3(this.item3);
    item4(this.item4);
    item5(this.item5);
    item6(this.item6);
    item7(this.item7);
  }

  /// Converts this tuple into a record.
  (T0, T1, T2, T3, T4, T5, T6, T7) toRecord() =>
      (item0, item1, item2, item3, item4, item5, item6, item7);

  @override
  bool operator ==(Object other) {
    return other is Tuple8 &&
        item0 == other.item0 &&
        item1 == other.item1 &&
        item2 == other.item2 &&
        item3 == other.item3 &&
        item4 == other.item4 &&
        item5 == other.item5 &&
        item6 == other.item6 &&
        item7 == other.item7;
  }

  @override
  int get hashCode {
    final prime = 31;
    var result = 1;

    result = prime * result + item0.hashCode;
    result = prime * result + item1.hashCode;
    result = prime * result + item2.hashCode;
    result = prime * result + item3.hashCode;
    result = prime * result + item4.hashCode;
    result = prime * result + item5.hashCode;
    result = prime * result + item6.hashCode;
    result = prime * result + item7.hashCode;

    return result;
  }

  @override
  String toString() =>
      '($item0, $item1, $item2, $item3, $item4, $item5, $item6, $item7)';
}

/// A finite fixed-length ordered list containing 9 dynamically-typed elements.
class Tuple9<T0, T1, T2, T3, T4, T5, T6, T7, T8> extends Tuple {
  final T0 item0;
  final T1 item1;
  final T2 item2;
  final T3 item3;
  final T4 item4;
  final T5 item5;
  final T6 item6;
  final T7 item7;
  final T8 item8;

  /// Creates a tuple of length 9.
  const Tuple9(
    this.item0,
    this.item1,
    this.item2,
    this.item3,
    this.item4,
    this.item5,
    this.item6,
    this.item7,
    this.item8,
  );

  /// Creates a tuple from a record.
  factory Tuple9.fromRecord((T0, T1, T2, T3, T4, T5, T6, T7, T8) record) =>
      Tuple9(
        record.$1,
        record.$2,
        record.$3,
        record.$4,
        record.$5,
        record.$6,
        record.$7,
        record.$8,
        record.$9,
      );

  /// Creates an tuple from a map/JSON source.
  factory Tuple9.fromJson(Map<String, dynamic> map) => Tuple9(
        map['item0'] as T0,
        map['item1'] as T1,
        map['item2'] as T2,
        map['item3'] as T3,
        map['item4'] as T4,
        map['item5'] as T5,
        map['item6'] as T6,
        map['item7'] as T7,
        map['item8'] as T8,
      );

  /// Creates an tuple from a list source.
  factory Tuple9.fromList(List<dynamic> list, [bool trim = false]) {
    if (list.length < 9) {
      throw ArgumentError.value(
          'list', 'The given list has less than 9 elements.');
    }
    if (!trim && list.length > 9) {
      throw ArgumentError.value('list',
          'The given list has more than 9 elements. Use `trim: true` if you intended to ignore excess elements.');
    }
    return Tuple9(
      list[0] as T0,
      list[1] as T1,
      list[2] as T2,
      list[3] as T3,
      list[4] as T4,
      list[5] as T5,
      list[6] as T6,
      list[7] as T7,
      list[8] as T8,
    );
  }

  /// Clones this tuple where the clone is cast with the specified type arguments.
  Tuple9<U0, U1, U2, U3, U4, U5, U6, U7, U8>
      asType<U0, U1, U2, U3, U4, U5, U6, U7, U8>() {
    if (item0 is! U0 ||
        item1 is! U1 ||
        item2 is! U2 ||
        item3 is! U3 ||
        item4 is! U4 ||
        item5 is! U5 ||
        item6 is! U6 ||
        item7 is! U7 ||
        item8 is! U8) {
      throw StateError(
          'The provided type arguments do not match the runtime type of this tuple\'s items');
    }
    return Tuple9<U0, U1, U2, U3, U4, U5, U6, U7, U8>(
      item0 as U0,
      item1 as U1,
      item2 as U2,
      item3 as U3,
      item4 as U4,
      item5 as U5,
      item6 as U6,
      item7 as U7,
      item8 as U8,
    );
  }

  /// Clones this tuple where the clone is cast with dynamically-typed items.
  Tuple9<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
      dynamic> asDynamic() => Tuple9<dynamic, dynamic, dynamic, dynamic,
          dynamic, dynamic, dynamic, dynamic, dynamic>(
        item0,
        item1,
        item2,
        item3,
        item4,
        item5,
        item6,
        item7,
        item8,
      );

  /// Converts this tuple into a map for JSON serialization.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'item0': item0,
        'item1': item1,
        'item2': item2,
        'item3': item3,
        'item4': item4,
        'item5': item5,
        'item6': item6,
        'item7': item7,
        'item8': item8,
      };

  /// Creates a copy tuple with the elements from this tuple with the value of
  /// each item optionally overridden.
  Tuple9<T0, T1, T2, T3, T4, T5, T6, T7, T8> copyWith({
    T0? item0,
    T1? item1,
    T2? item2,
    T3? item3,
    T4? item4,
    T5? item5,
    T6? item6,
    T7? item7,
    T8? item8,
  }) =>
      Tuple9<T0, T1, T2, T3, T4, T5, T6, T7, T8>(
        item0 ?? this.item0,
        item1 ?? this.item1,
        item2 ?? this.item2,
        item3 ?? this.item3,
        item4 ?? this.item4,
        item5 ?? this.item5,
        item6 ?? this.item6,
        item7 ?? this.item7,
        item8 ?? this.item8,
      );

  /// A list of boolean values indicating whether certain items in this
  /// tuple should be retained or discarded. The length of the list must
  /// be the same as the length of this tuple.
  ///
  /// Note: Due to the dynamic nature of this method, the returned tuple will
  /// not have typing preserved. This can be fixed by calling [asType] on the
  /// result.
  Tuple copyWithout({required List<bool> indices}) {
    assert(indices.length == 9,
        'Length of given list must be same length as tuple.');

    var values = <dynamic>[];
    for (var i = 0; i < indices.length; i++) {
      if (indices[i]) {
        values.add(this[i]);
      }
    }

    return Tuple.fromList(values);
  }

  /// Provides an indexable way to access this tuple's items.
  dynamic operator [](int index) {
    switch (index) {
      case 0:
        return item0;
      case 1:
        return item1;
      case 2:
        return item2;
      case 3:
        return item3;
      case 4:
        return item4;
      case 5:
        return item5;
      case 6:
        return item6;
      case 7:
        return item7;
      case 8:
        return item8;
    }
    throw RangeError.index(index, this, 'index', 'index out of range', 9);
  }

  /// Returns the constant length of this tuple.
  @override
  int get length => 9;

  @override
  Iterator<dynamic> get iterator => _Tuple9Iterator(this);

  /// A utility method for mapping a function to every item in this tuple.
  void mapActions({
    required void Function(T0) item0,
    required void Function(T1) item1,
    required void Function(T2) item2,
    required void Function(T3) item3,
    required void Function(T4) item4,
    required void Function(T5) item5,
    required void Function(T6) item6,
    required void Function(T7) item7,
    required void Function(T8) item8,
  }) {
    item0(this.item0);
    item1(this.item1);
    item2(this.item2);
    item3(this.item3);
    item4(this.item4);
    item5(this.item5);
    item6(this.item6);
    item7(this.item7);
    item8(this.item8);
  }

  /// Converts this tuple into a record.
  (T0, T1, T2, T3, T4, T5, T6, T7, T8) toRecord() =>
      (item0, item1, item2, item3, item4, item5, item6, item7, item8);

  @override
  bool operator ==(Object other) {
    return other is Tuple9 &&
        item0 == other.item0 &&
        item1 == other.item1 &&
        item2 == other.item2 &&
        item3 == other.item3 &&
        item4 == other.item4 &&
        item5 == other.item5 &&
        item6 == other.item6 &&
        item7 == other.item7 &&
        item8 == other.item8;
  }

  @override
  int get hashCode {
    final prime = 31;
    var result = 1;

    result = prime * result + item0.hashCode;
    result = prime * result + item1.hashCode;
    result = prime * result + item2.hashCode;
    result = prime * result + item3.hashCode;
    result = prime * result + item4.hashCode;
    result = prime * result + item5.hashCode;
    result = prime * result + item6.hashCode;
    result = prime * result + item7.hashCode;
    result = prime * result + item8.hashCode;

    return result;
  }

  @override
  String toString() =>
      '($item0, $item1, $item2, $item3, $item4, $item5, $item6, $item7, $item8)';
}

// Iterators

class _Tuple0Iterator implements Iterator<dynamic> {
  _Tuple0Iterator();

  @override
  dynamic get current => null;

  @override
  bool moveNext() {
    return false;
  }
}

class _Tuple1Iterator<T> implements Iterator<dynamic> {
  _Tuple1Iterator(this.tuple);
  final Tuple1<T> tuple;

  int index = 0;
  dynamic _current;
  @override
  dynamic get current => _current;

  @override
  bool moveNext() {
    if (index >= 1) return false;
    _current = tuple[index];
    index++;
    return true;
  }
}

class _Tuple2Iterator<T0, T1> implements Iterator<dynamic> {
  _Tuple2Iterator(this.tuple);
  final Tuple2<T0, T1> tuple;

  int index = 0;
  dynamic _current;
  @override
  dynamic get current => _current;

  @override
  bool moveNext() {
    if (index >= 2) return false;
    _current = tuple[index];
    index++;
    return true;
  }
}

class _Tuple3Iterator<T0, T1, T2> implements Iterator<dynamic> {
  _Tuple3Iterator(this.tuple);
  final Tuple3<T0, T1, T2> tuple;

  int index = 0;
  dynamic _current;
  @override
  dynamic get current => _current;

  @override
  bool moveNext() {
    if (index >= 3) return false;
    _current = tuple[index];
    index++;
    return true;
  }
}

class _Tuple4Iterator<T0, T1, T2, T3> implements Iterator<dynamic> {
  _Tuple4Iterator(this.tuple);
  final Tuple4<T0, T1, T2, T3> tuple;

  int index = 0;
  dynamic _current;
  @override
  dynamic get current => _current;

  @override
  bool moveNext() {
    if (index >= 4) return false;
    _current = tuple[index];
    index++;
    return true;
  }
}

class _Tuple5Iterator<T0, T1, T2, T3, T4> implements Iterator<dynamic> {
  _Tuple5Iterator(this.tuple);
  final Tuple5<T0, T1, T2, T3, T4> tuple;

  int index = 0;
  dynamic _current;
  @override
  dynamic get current => _current;

  @override
  bool moveNext() {
    if (index >= 5) return false;
    _current = tuple[index];
    index++;
    return true;
  }
}

class _Tuple6Iterator<T0, T1, T2, T3, T4, T5> implements Iterator<dynamic> {
  _Tuple6Iterator(this.tuple);
  final Tuple6<T0, T1, T2, T3, T4, T5> tuple;

  int index = 0;
  dynamic _current;
  @override
  dynamic get current => _current;

  @override
  bool moveNext() {
    if (index >= 6) return false;
    _current = tuple[index];
    index++;
    return true;
  }
}

class _Tuple7Iterator<T0, T1, T2, T3, T4, T5, T6> implements Iterator<dynamic> {
  _Tuple7Iterator(this.tuple);
  final Tuple7<T0, T1, T2, T3, T4, T5, T6> tuple;

  int index = 0;
  dynamic _current;
  @override
  dynamic get current => _current;

  @override
  bool moveNext() {
    if (index >= 7) return false;
    _current = tuple[index];
    index++;
    return true;
  }
}

class _Tuple8Iterator<T0, T1, T2, T3, T4, T5, T6, T7>
    implements Iterator<dynamic> {
  _Tuple8Iterator(this.tuple);
  final Tuple8<T0, T1, T2, T3, T4, T5, T6, T7> tuple;

  int index = 0;
  dynamic _current;
  @override
  dynamic get current => _current;

  @override
  bool moveNext() {
    if (index >= 8) return false;
    _current = tuple[index];
    index++;
    return true;
  }
}

class _Tuple9Iterator<T0, T1, T2, T3, T4, T5, T6, T7, T8>
    implements Iterator<dynamic> {
  _Tuple9Iterator(this.tuple);
  final Tuple9<T0, T1, T2, T3, T4, T5, T6, T7, T8> tuple;

  int index = 0;
  dynamic _current;
  @override
  dynamic get current => _current;

  @override
  bool moveNext() {
    if (index >= 9) return false;
    _current = tuple[index];
    index++;
    return true;
  }
}
