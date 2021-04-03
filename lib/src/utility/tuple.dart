abstract class Tuple extends Iterable<dynamic> {
  const Tuple();

  /// Utility method for creating a [Tuple0].
  factory Tuple.t0() => Tuple0();

  /// Utility method for creating a [Tuple1].
  factory Tuple.t1(a) => Tuple1(a);

  /// Utility method for creating a [Tuple2].
  factory Tuple.t2(a, b) => Tuple2(a, b);

  /// Utility method for creating a [Tuple3].
  factory Tuple.t3(a, b, c) => Tuple3(a, b, c);

  /// Utility method for creating a [Tuple4].
  factory Tuple.t4(a, b, c, d) => Tuple4(a, b, c, d);

  /// Utility method for creating a [Tuple5].
  factory Tuple.t5(a, b, c, d, e) => Tuple5(a, b, c, d, e);

  /// Utility method for creating a [Tuple6].
  factory Tuple.t6(a, b, c, d, e, f) => Tuple6(a, b, c, d, e, f);

  /// Utility method for creating a [Tuple7].
  factory Tuple.t7(a, b, c, d, e, f, g) => Tuple7(a, b, c, d, e, f, g);

  /// Utility method for creating a [Tuple8].
  factory Tuple.t8(a, b, c, d, e, f, g, h) => Tuple8(a, b, c, d, e, f, g, h);

  /// Utility method for creating a [Tuple9].
  factory Tuple.t9(a, b, c, d, e, f, g, h, i) =>
      Tuple9(a, b, c, d, e, f, g, h, i);

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
          return Tuple1.fromJson(map);
        case 2:
          return Tuple2.fromJson(map);
        case 3:
          return Tuple3.fromJson(map);
        case 4:
          return Tuple4.fromJson(map);
        case 5:
          return Tuple5.fromJson(map);
        case 6:
          return Tuple6.fromJson(map);
        case 7:
          return Tuple7.fromJson(map);
        case 8:
          return Tuple8.fromJson(map);
        case 9:
          return Tuple9.fromJson(map);
      }
    }
    if (map.containsKey('item8')) return Tuple9.fromJson(map);
    if (map.containsKey('item7')) return Tuple8.fromJson(map);
    if (map.containsKey('item6')) return Tuple7.fromJson(map);
    if (map.containsKey('item5')) return Tuple6.fromJson(map);
    if (map.containsKey('item4')) return Tuple5.fromJson(map);
    if (map.containsKey('item3')) return Tuple4.fromJson(map);
    if (map.containsKey('item2')) return Tuple3.fromJson(map);
    if (map.containsKey('item1')) return Tuple2.fromJson(map);
    if (map.containsKey('item0')) return Tuple1.fromJson(map);
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
        return Tuple1.fromList(items);
      case 2:
        return Tuple2.fromList(items);
      case 3:
        return Tuple3.fromList(items);
      case 4:
        return Tuple4.fromList(items);
      case 5:
        return Tuple5.fromList(items);
      case 6:
        return Tuple6.fromList(items);
      case 7:
        return Tuple7.fromList(items);
      case 8:
        return Tuple8.fromList(items);
      case 9:
        return Tuple9.fromList(items);
    }

    throw StateError('Unknown error, this shouldn\'t happen');
  }
}

/// A finite fixed-length ordered list containing 0 dynamically-typed elements.
class Tuple0 extends Tuple {
  /// Creates an empty tuple. This can be useful as a placeholder object
  /// or as a constant symbol.
  const Tuple0();

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
  factory Tuple0.fromList(List list, [bool trim = false]) {
    if (!trim && list.isNotEmpty) {
      throw ArgumentError.value('list',
          'The given list has more than 0 elements. Use `trim: true` if you intended to ignore excess elements.');
    }
    return Tuple0();
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
  Map<String, dynamic> toJson() => {};

  /// A utility method for mapping a function to every item in this tuple.
  ///
  /// (For [Tuple0], this method has no parameters and does nothing.)
  void mapActions() {}

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
  Iterator get iterator => _Tuple0Iterator();

  @override
  String toString() => '()';
}

/// A finite fixed-length ordered list containing 1 dynamically-typed element.
class Tuple1<T> extends Tuple {
  final T item;

  /// Creates a tuple of length 1.
  const Tuple1(this.item);

  /// Creates an tuple from a map/JSON source.
  factory Tuple1.fromJson(Map<String, dynamic> map) => Tuple1(map['item']);

  /// Creates an tuple from a list source.
  factory Tuple1.fromList(List list, [bool trim = false]) {
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

  /// Creates a copy tuple with the elements from this tuple with the value of
  /// each item optionally overridden.
  Tuple1 copyWith(T? item) => Tuple1(item ?? this.item);

  /// A list of boolean values indicating whether certain items in this
  /// tuple should be retained or discarded. The length of the list must
  /// be the same as the length of this tuple.
  Tuple copyWithout({required List<bool> indices}) {
    assert(indices.length == 1,
        'Length of given list must be same length as tuple.');

    var values = [];
    for (var i = 0; i < indices.length; i++) {
      if (indices[i]) {
        values.add(this[i]);
      }
    }

    return Tuple.fromList(values);
  }

  /// Converts this tuple into a map for JSON serialization.
  Map<String, dynamic> toJson() => {'item': item};

  /// A utility method for mapping a function to every item in this tuple.
  void mapActions({
    required void Function(T) item,
  }) {
    item(this.item);
  }

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
  Iterator get iterator => _Tuple1Iterator(this);

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

  /// Creates an tuple from a map/JSON source.
  factory Tuple2.fromJson(Map<String, dynamic> map) => Tuple2(
        map['item0'],
        map['item1'],
      );

  /// Creates an tuple from a list source.
  factory Tuple2.fromList(List list, [bool trim = false]) {
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

  /// Creates a copy tuple with the elements from this tuple with the value of
  /// each item optionally overridden.
  Tuple2 copyWith({
    T0? item0,
    T1? item1,
  }) =>
      Tuple2(
        item0 ?? this.item0,
        item1 ?? this.item1,
      );

  /// A list of boolean values indicating whether certain items in this
  /// tuple should be retained or discarded. The length of the list must
  /// be the same as the length of this tuple.
  Tuple copyWithout({required List<bool> indices}) {
    assert(indices.length == 2,
        'Length of given list must be same length as tuple.');

    var values = [];
    for (var i = 0; i < indices.length; i++) {
      if (indices[i]) {
        values.add(this[i]);
      }
    }

    return Tuple.fromList(values);
  }

  /// Converts this tuple into a map for JSON serialization.
  Map<String, dynamic> toJson() => {
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
  Iterator get iterator => _Tuple2Iterator(this);

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

  /// Creates an tuple from a map/JSON source.
  factory Tuple3.fromJson(Map<String, dynamic> map) => Tuple3(
        map['item0'],
        map['item1'],
        map['item2'],
      );

  /// Creates an tuple from a list source.
  factory Tuple3.fromList(List list, [bool trim = false]) {
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

  /// Converts this tuple into a map for JSON serialization.
  Map<String, dynamic> toJson() => {
        'item0': item0,
        'item1': item1,
        'item2': item2,
      };

  /// Creates a copy tuple with the elements from this tuple with the value of
  /// each item optionally overridden.
  Tuple3 copyWith({
    T0? item0,
    T1? item1,
    T2? item2,
  }) =>
      Tuple3(
        item0 ?? this.item0,
        item1 ?? this.item1,
        item2 ?? this.item2,
      );

  /// A list of boolean values indicating whether certain items in this
  /// tuple should be retained or discarded. The length of the list must
  /// be the same as the length of this tuple.
  Tuple copyWithout({required List<bool> indices}) {
    assert(indices.length == 3,
        'Length of given list must be same length as tuple.');

    var values = [];
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
  Iterator get iterator => _Tuple3Iterator(this);

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

  /// Creates an tuple from a map/JSON source.
  factory Tuple4.fromJson(Map<String, dynamic> map) => Tuple4(
        map['item0'],
        map['item1'],
        map['item2'],
        map['item3'],
      );

  /// Creates an tuple from a list source.
  factory Tuple4.fromList(List list, [bool trim = false]) {
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

  /// Converts this tuple into a map for JSON serialization.
  Map<String, dynamic> toJson() => {
        'item0': item0,
        'item1': item1,
        'item2': item2,
        'item3': item3,
      };

  /// Creates a copy tuple with the elements from this tuple with the value of
  /// each item optionally overridden.
  Tuple4 copyWith({
    T0? item0,
    T1? item1,
    T2? item2,
    T3? item3,
  }) =>
      Tuple4(
        item0 ?? this.item0,
        item1 ?? this.item1,
        item2 ?? this.item2,
        item3 ?? this.item3,
      );

  /// A list of boolean values indicating whether certain items in this
  /// tuple should be retained or discarded. The length of the list must
  /// be the same as the length of this tuple.
  Tuple copyWithout({required List<bool> indices}) {
    assert(indices.length == 4,
        'Length of given list must be same length as tuple.');

    var values = [];
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
  Iterator get iterator => _Tuple4Iterator(this);

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

  /// Creates an tuple from a map/JSON source.
  factory Tuple5.fromJson(Map<String, dynamic> map) => Tuple5(
        map['item0'],
        map['item1'],
        map['item2'],
        map['item3'],
        map['item4'],
      );

  /// Creates an tuple from a list source.
  factory Tuple5.fromList(List list, [bool trim = false]) {
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

  /// Converts this tuple into a map for JSON serialization.
  Map<String, dynamic> toJson() => {
        'item0': item0,
        'item1': item1,
        'item2': item2,
        'item3': item3,
        'item4': item4,
      };

  /// Creates a copy tuple with the elements from this tuple with the value of
  /// each item optionally overridden.
  Tuple5 copyWith({
    T0? item0,
    T1? item1,
    T2? item2,
    T3? item3,
    T4? item4,
  }) =>
      Tuple5(
        item0 ?? this.item0,
        item1 ?? this.item1,
        item2 ?? this.item2,
        item3 ?? this.item3,
        item4 ?? this.item4,
      );

  /// A list of boolean values indicating whether certain items in this
  /// tuple should be retained or discarded. The length of the list must
  /// be the same as the length of this tuple.
  Tuple copyWithout({required List<bool> indices}) {
    assert(indices.length == 5,
        'Length of given list must be same length as tuple.');

    var values = [];
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
  Iterator get iterator => _Tuple5Iterator(this);

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

  /// Creates an tuple from a map/JSON source.
  factory Tuple6.fromJson(Map<String, dynamic> map) => Tuple6(
        map['item0'],
        map['item1'],
        map['item2'],
        map['item3'],
        map['item4'],
        map['item5'],
      );

  /// Creates an tuple from a list source.
  factory Tuple6.fromList(List list, [bool trim = false]) {
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

  /// Converts this tuple into a map for JSON serialization.
  Map<String, dynamic> toJson() => {
        'item0': item0,
        'item1': item1,
        'item2': item2,
        'item3': item3,
        'item4': item4,
        'item5': item5,
      };

  /// Creates a copy tuple with the elements from this tuple with the value of
  /// each item optionally overridden.
  Tuple6 copyWith({
    T0? item0,
    T1? item1,
    T2? item2,
    T3? item3,
    T4? item4,
    T5? item5,
  }) =>
      Tuple6(
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
  Tuple copyWithout({required List<bool> indices}) {
    assert(indices.length == 6,
        'Length of given list must be same length as tuple.');

    var values = [];
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
  Iterator get iterator => _Tuple6Iterator(this);

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

  /// Creates an tuple from a map/JSON source.
  factory Tuple7.fromJson(Map<String, dynamic> map) => Tuple7(
        map['item0'],
        map['item1'],
        map['item2'],
        map['item3'],
        map['item4'],
        map['item5'],
        map['item6'],
      );

  /// Creates an tuple from a list source.
  factory Tuple7.fromList(List list, [bool trim = false]) {
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

  /// Converts this tuple into a map for JSON serialization.
  Map<String, dynamic> toJson() => {
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
  Tuple7 copyWith({
    T0? item0,
    T1? item1,
    T2? item2,
    T3? item3,
    T4? item4,
    T5? item5,
    T6? item6,
  }) =>
      Tuple7(
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
  Tuple copyWithout({required List<bool> indices}) {
    assert(indices.length == 7,
        'Length of given list must be same length as tuple.');

    var values = [];
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
  Iterator get iterator => _Tuple7Iterator(this);

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

  /// Creates an tuple from a map/JSON source.
  factory Tuple8.fromJson(Map<String, dynamic> map) => Tuple8(
        map['item0'],
        map['item1'],
        map['item2'],
        map['item3'],
        map['item4'],
        map['item5'],
        map['item6'],
        map['item7'],
      );

  /// Creates an tuple from a list source.
  factory Tuple8.fromList(List list, [bool trim = false]) {
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

  /// Converts this tuple into a map for JSON serialization.
  Map<String, dynamic> toJson() => {
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
  Tuple8 copyWith({
    T0? item0,
    T1? item1,
    T2? item2,
    T3? item3,
    T4? item4,
    T5? item5,
    T6? item6,
    T7? item7,
  }) =>
      Tuple8(
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
  Tuple copyWithout({required List<bool> indices}) {
    assert(indices.length == 8,
        'Length of given list must be same length as tuple.');

    var values = [];
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
  Iterator get iterator => _Tuple8Iterator(this);

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

  /// Creates an tuple from a map/JSON source.
  factory Tuple9.fromJson(Map<String, dynamic> map) => Tuple9(
        map['item0'],
        map['item1'],
        map['item2'],
        map['item3'],
        map['item4'],
        map['item5'],
        map['item6'],
        map['item7'],
        map['item8'],
      );

  /// Creates an tuple from a list source.
  factory Tuple9.fromList(List list, [bool trim = false]) {
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

  /// Converts this tuple into a map for JSON serialization.
  Map<String, dynamic> toJson() => {
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
  Tuple9 copyWith({
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
      Tuple9(
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
  Tuple copyWithout({required List<bool> indices}) {
    assert(indices.length == 9,
        'Length of given list must be same length as tuple.');

    var values = [];
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
  Iterator get iterator => _Tuple9Iterator(this);

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

class _Tuple0Iterator extends Iterator<dynamic> {
  _Tuple0Iterator();

  @override
  dynamic get current => null;

  @override
  bool moveNext() {
    return false;
  }
}

class _Tuple1Iterator extends Iterator<dynamic> {
  _Tuple1Iterator(this.tuple);
  final Tuple1 tuple;

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

class _Tuple2Iterator extends Iterator<dynamic> {
  _Tuple2Iterator(this.tuple);
  final Tuple2 tuple;

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

class _Tuple3Iterator extends Iterator<dynamic> {
  _Tuple3Iterator(this.tuple);
  final Tuple3 tuple;

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

class _Tuple4Iterator extends Iterator<dynamic> {
  _Tuple4Iterator(this.tuple);
  final Tuple4 tuple;

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

class _Tuple5Iterator extends Iterator<dynamic> {
  _Tuple5Iterator(this.tuple);
  final Tuple5 tuple;

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

class _Tuple6Iterator extends Iterator<dynamic> {
  _Tuple6Iterator(this.tuple);
  final Tuple6 tuple;

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

class _Tuple7Iterator extends Iterator<dynamic> {
  _Tuple7Iterator(this.tuple);
  final Tuple7 tuple;

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

class _Tuple8Iterator extends Iterator<dynamic> {
  _Tuple8Iterator(this.tuple);
  final Tuple8 tuple;

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

class _Tuple9Iterator extends Iterator<dynamic> {
  _Tuple9Iterator(this.tuple);
  final Tuple9 tuple;

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
