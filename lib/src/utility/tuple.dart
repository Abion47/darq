/// A finite fixed-length ordered list containing 0 dynamically-typed elements.
class Tuple0 extends Iterable<dynamic> {
  const Tuple0();

  factory Tuple0.fromJson(Map<String, dynamic> map) => Tuple0();
  factory Tuple0.fromList(List list, [bool trim = false]) {
    if (!trim && list.isNotEmpty) {
      throw ArgumentError.value('list',
          'The given list has more than 0 elements. Use `trim: true` if you intended to ignore excess elements.');
    }
    return Tuple0();
  }

  Tuple0 copyWith() => Tuple0();

  Map<String, dynamic> toMap() => {};

  dynamic operator [](int index) {
    throw RangeError.index(index, this, 'index', 'index out of range', 0);
  }

  void mapActions() {}

  @override
  bool operator ==(Object other) {
    return other is Tuple0;
  }

  @override
  int get hashCode {
    return 0;
  }

  @override
  Iterator get iterator => _Tuple0Iterator();

  @override
  String toString() => '()';
}

/// A finite fixed-length ordered list containing 1 dynamically-typed element.
class Tuple1<T> extends Iterable<dynamic> {
  final T item;

  const Tuple1(this.item);

  factory Tuple1.fromJson(Map<String, dynamic> map) => Tuple1(map['item']);
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

  Tuple1 copyWith(T? item) => Tuple1(item ?? this.item);

  Map<String, dynamic> toMap() => {'item': item};

  dynamic operator [](int index) {
    switch (index) {
      case 0:
        return item;
    }
    throw RangeError.index(index, this, 'index', 'index out of range', 2);
  }

  void mapActions({
    required void Function(T) item,
  }) {
    item(this.item);
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

  @override
  Iterator get iterator => _Tuple1Iterator(this);

  @override
  String toString() => '($item)';
}

/// A finite fixed-length ordered list containing 2 dynamically-typed elements.
class Tuple2<T0, T1> extends Iterable<dynamic> {
  final T0 item0;
  final T1 item1;

  const Tuple2(
    this.item0,
    this.item1,
  );

  factory Tuple2.fromJson(Map<String, dynamic> map) => Tuple2(
        map['item0'],
        map['item1'],
      );
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

  Tuple2 copyWith({
    T0? item0,
    T1? item1,
  }) =>
      Tuple2(
        item0 ?? this.item0,
        item1 ?? this.item1,
      );

  Map<String, dynamic> toJson() => {
        'item0': item0,
        'item1': item1,
      };

  dynamic operator [](int index) {
    switch (index) {
      case 0:
        return item0;
      case 1:
        return item1;
    }
    throw RangeError.index(index, this, 'index', 'index out of range', 2);
  }

  void mapActions({
    required void Function(T0) item0,
    required void Function(T1) item1,
  }) {
    item0(this.item0);
    item1(this.item1);
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

  @override
  Iterator get iterator => _Tuple2Iterator(this);

  @override
  String toString() => '($item0, $item1)';
}

/// A finite fixed-length ordered list containing 3 dynamically-typed elements.
class Tuple3<T0, T1, T2> extends Iterable<dynamic> {
  final T0 item0;
  final T1 item1;
  final T2 item2;

  const Tuple3(
    this.item0,
    this.item1,
    this.item2,
  );

  factory Tuple3.fromJson(Map<String, dynamic> map) => Tuple3(
        map['item0'],
        map['item1'],
        map['item2'],
      );
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

  Map<String, dynamic> toJson() => {
        'item0': item0,
        'item1': item1,
        'item2': item2,
      };

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

  @override
  Iterator get iterator => _Tuple3Iterator(this);

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
class Tuple4<T0, T1, T2, T3> extends Iterable<dynamic> {
  final T0 item0;
  final T1 item1;
  final T2 item2;
  final T3 item3;

  const Tuple4(
    this.item0,
    this.item1,
    this.item2,
    this.item3,
  );

  factory Tuple4.fromJson(Map<String, dynamic> map) => Tuple4(
        map['item0'],
        map['item1'],
        map['item2'],
        map['item3'],
      );
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

  Map<String, dynamic> toJson() => {
        'item0': item0,
        'item1': item1,
        'item2': item2,
        'item3': item3,
      };

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

  @override
  Iterator get iterator => _Tuple4Iterator(this);

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
class Tuple5<T0, T1, T2, T3, T4> extends Iterable<dynamic> {
  final T0 item0;
  final T1 item1;
  final T2 item2;
  final T3 item3;
  final T4 item4;

  const Tuple5(
    this.item0,
    this.item1,
    this.item2,
    this.item3,
    this.item4,
  );

  factory Tuple5.fromJson(Map<String, dynamic> map) => Tuple5(
        map['item0'],
        map['item1'],
        map['item2'],
        map['item3'],
        map['item4'],
      );
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

  Map<String, dynamic> toJson() => {
        'item0': item0,
        'item1': item1,
        'item2': item2,
        'item3': item3,
        'item4': item4,
      };

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

  @override
  Iterator get iterator => _Tuple5Iterator(this);

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
class Tuple6<T0, T1, T2, T3, T4, T5> extends Iterable<dynamic> {
  final T0 item0;
  final T1 item1;
  final T2 item2;
  final T3 item3;
  final T4 item4;
  final T5 item5;

  const Tuple6(
    this.item0,
    this.item1,
    this.item2,
    this.item3,
    this.item4,
    this.item5,
  );

  factory Tuple6.fromJson(Map<String, dynamic> map) => Tuple6(
        map['item0'],
        map['item1'],
        map['item2'],
        map['item3'],
        map['item4'],
        map['item5'],
      );
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

  Map<String, dynamic> toJson() => {
        'item0': item0,
        'item1': item1,
        'item2': item2,
        'item3': item3,
        'item4': item4,
        'item5': item5,
      };

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

  @override
  Iterator get iterator => _Tuple6Iterator(this);

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
class Tuple7<T0, T1, T2, T3, T4, T5, T6> extends Iterable<dynamic> {
  final T0 item0;
  final T1 item1;
  final T2 item2;
  final T3 item3;
  final T4 item4;
  final T5 item5;
  final T6 item6;

  const Tuple7(
    this.item0,
    this.item1,
    this.item2,
    this.item3,
    this.item4,
    this.item5,
    this.item6,
  );

  factory Tuple7.fromJson(Map<String, dynamic> map) => Tuple7(
        map['item0'],
        map['item1'],
        map['item2'],
        map['item3'],
        map['item4'],
        map['item5'],
        map['item6'],
      );
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

  Map<String, dynamic> toJson() => {
        'item0': item0,
        'item1': item1,
        'item2': item2,
        'item3': item3,
        'item4': item4,
        'item5': item5,
        'item6': item6,
      };

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

  @override
  Iterator get iterator => _Tuple7Iterator(this);

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
class Tuple8<T0, T1, T2, T3, T4, T5, T6, T7> extends Iterable<dynamic> {
  final T0 item0;
  final T1 item1;
  final T2 item2;
  final T3 item3;
  final T4 item4;
  final T5 item5;
  final T6 item6;
  final T7 item7;

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

  @override
  Iterator get iterator => _Tuple8Iterator(this);

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
class Tuple9<T0, T1, T2, T3, T4, T5, T6, T7, T8> extends Iterable<dynamic> {
  final T0 item0;
  final T1 item1;
  final T2 item2;
  final T3 item3;
  final T4 item4;
  final T5 item5;
  final T6 item6;
  final T7 item7;
  final T8 item8;

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

  @override
  Iterator get iterator => _Tuple9Iterator(this);

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
