class Tuple2<T1, T2> {
  final T1 item1;
  final T2 item2;

  Tuple2(
    this.item1,
    this.item2,
  );

  factory Tuple2.fromJson(Map<String, dynamic> map) => Tuple2(
        map['item1'],
        map['item2'],
      );

  Tuple2 copyWith({
    T1 item1,
    T2 item2,
  }) =>
      Tuple2(
        item1 ?? this.item1,
        item2 ?? this.item2,
      );

  Map<String, dynamic> toJson() => {
        'item1': item1,
        'item2': item2,
      };

  @override
  String toString() => '($item1, $item2)';
}

class Tuple3<T1, T2, T3> {
  final T1 item1;
  final T2 item2;
  final T3 item3;

  Tuple3(
    this.item1,
    this.item2,
    this.item3,
  );

  factory Tuple3.fromJson(Map<String, dynamic> map) => Tuple3(
        map['item1'],
        map['item2'],
        map['item3'],
      );

  Map<String, dynamic> toJson() => {
        'item1': item1,
        'item2': item2,
        'item3': item3,
      };

  Tuple3 copyWith({
    T1 item1,
    T2 item2,
    T3 item3,
  }) =>
      Tuple3(
        item1 ?? this.item1,
        item2 ?? this.item2,
        item3 ?? this.item3,
      );

  @override
  String toString() => '($item1, $item2, $item3)';
}

class Tuple4<T1, T2, T3, T4> {
  final T1 item1;
  final T2 item2;
  final T3 item3;
  final T4 item4;

  Tuple4(
    this.item1,
    this.item2,
    this.item3,
    this.item4,
  );

  factory Tuple4.fromJson(Map<String, dynamic> map) => Tuple4(
        map['item1'],
        map['item2'],
        map['item3'],
        map['item4'],
      );

  Map<String, dynamic> toJson() => {
        'item1': item1,
        'item2': item2,
        'item3': item3,
        'item4': item4,
      };

  Tuple4 copyWith({
    T1 item1,
    T2 item2,
    T3 item3,
    T4 item4,
  }) =>
      Tuple4(
        item1 ?? this.item1,
        item2 ?? this.item2,
        item3 ?? this.item3,
        item4 ?? this.item4,
      );

  @override
  String toString() => '($item1, $item2, $item3, $item4)';
}

class Tuple5<T1, T2, T3, T4, T5> {
  final T1 item1;
  final T2 item2;
  final T3 item3;
  final T4 item4;
  final T5 item5;

  Tuple5(
    this.item1,
    this.item2,
    this.item3,
    this.item4,
    this.item5,
  );

  factory Tuple5.fromJson(Map<String, dynamic> map) => Tuple5(
        map['item1'],
        map['item2'],
        map['item3'],
        map['item4'],
        map['item5'],
      );

  Map<String, dynamic> toJson() => {
        'item1': item1,
        'item2': item2,
        'item3': item3,
        'item4': item4,
        'item5': item5,
      };

  Tuple5 copyWith({
    T1 item1,
    T2 item2,
    T3 item3,
    T4 item4,
    T5 item5,
  }) =>
      Tuple5(
        item1 ?? this.item1,
        item2 ?? this.item2,
        item3 ?? this.item3,
        item4 ?? this.item4,
        item5 ?? this.item5,
      );

  @override
  String toString() => '($item1, $item2, $item3, $item4, $item5)';
}

class Tuple6<T1, T2, T3, T4, T5, T6> {
  final T1 item1;
  final T2 item2;
  final T3 item3;
  final T4 item4;
  final T5 item5;
  final T6 item6;

  Tuple6(
    this.item1,
    this.item2,
    this.item3,
    this.item4,
    this.item5,
    this.item6,
  );

  factory Tuple6.fromJson(Map<String, dynamic> map) => Tuple6(
        map['item1'],
        map['item2'],
        map['item3'],
        map['item4'],
        map['item5'],
        map['item6'],
      );

  Map<String, dynamic> toJson() => {
        'item1': item1,
        'item2': item2,
        'item3': item3,
        'item4': item4,
        'item5': item5,
        'item6': item6,
      };

  Tuple6 copyWith({
    T1 item1,
    T2 item2,
    T3 item3,
    T4 item4,
    T5 item5,
    T6 item6,
  }) =>
      Tuple6(
        item1 ?? this.item1,
        item2 ?? this.item2,
        item3 ?? this.item3,
        item4 ?? this.item4,
        item5 ?? this.item5,
        item6 ?? this.item6,
      );

  @override
  String toString() => '($item1, $item2, $item3, $item4, $item5, $item6)';
}

class Tuple7<T1, T2, T3, T4, T5, T6, T7> {
  final T1 item1;
  final T2 item2;
  final T3 item3;
  final T4 item4;
  final T5 item5;
  final T6 item6;
  final T7 item7;

  Tuple7(
    this.item1,
    this.item2,
    this.item3,
    this.item4,
    this.item5,
    this.item6,
    this.item7,
  );

  factory Tuple7.fromJson(Map<String, dynamic> map) => Tuple7(
        map['item1'],
        map['item2'],
        map['item3'],
        map['item4'],
        map['item5'],
        map['item6'],
        map['item7'],
      );

  Map<String, dynamic> toJson() => {
        'item1': item1,
        'item2': item2,
        'item3': item3,
        'item4': item4,
        'item5': item5,
        'item6': item6,
        'item7': item7,
      };

  Tuple7 copyWith({
    T1 item1,
    T2 item2,
    T3 item3,
    T4 item4,
    T5 item5,
    T6 item6,
    T7 item7,
  }) =>
      Tuple7(
        item1 ?? this.item1,
        item2 ?? this.item2,
        item3 ?? this.item3,
        item4 ?? this.item4,
        item5 ?? this.item5,
        item6 ?? this.item6,
        item7 ?? this.item7,
      );

  @override
  String toString() =>
      '($item1, $item2, $item3, $item4, $item5, $item6, $item7)';
}

class Tuple8<T1, T2, T3, T4, T5, T6, T7, T8> {
  final T1 item1;
  final T2 item2;
  final T3 item3;
  final T4 item4;
  final T5 item5;
  final T6 item6;
  final T7 item7;
  final T8 item8;

  Tuple8(
    this.item1,
    this.item2,
    this.item3,
    this.item4,
    this.item5,
    this.item6,
    this.item7,
    this.item8,
  );

  factory Tuple8.fromJson(Map<String, dynamic> map) => Tuple8(
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
        'item1': item1,
        'item2': item2,
        'item3': item3,
        'item4': item4,
        'item5': item5,
        'item6': item6,
        'item7': item7,
        'item8': item8,
      };

  Tuple8 copyWith({
    T1 item1,
    T2 item2,
    T3 item3,
    T4 item4,
    T5 item5,
    T6 item6,
    T7 item7,
    T8 item8,
  }) =>
      Tuple8(
        item1 ?? this.item1,
        item2 ?? this.item2,
        item3 ?? this.item3,
        item4 ?? this.item4,
        item5 ?? this.item5,
        item6 ?? this.item6,
        item7 ?? this.item7,
        item8 ?? this.item8,
      );

  @override
  String toString() =>
      '($item1, $item2, $item3, $item4, $item5, $item6, $item7, $item8)';
}

class Tuple9<T1, T2, T3, T4, T5, T6, T7, T8, T9> {
  final T1 item1;
  final T2 item2;
  final T3 item3;
  final T4 item4;
  final T5 item5;
  final T6 item6;
  final T7 item7;
  final T8 item8;
  final T9 item9;

  Tuple9(
    this.item1,
    this.item2,
    this.item3,
    this.item4,
    this.item5,
    this.item6,
    this.item7,
    this.item8,
    this.item9,
  );

  factory Tuple9.fromJson(Map<String, dynamic> map) => Tuple9(
        map['item1'],
        map['item2'],
        map['item3'],
        map['item4'],
        map['item5'],
        map['item6'],
        map['item7'],
        map['item8'],
        map['item9'],
      );

  Map<String, dynamic> toJson() => {
        'item1': item1,
        'item2': item2,
        'item3': item3,
        'item4': item4,
        'item5': item5,
        'item6': item6,
        'item7': item7,
        'item8': item8,
        'item9': item9,
      };

  Tuple9 copyWith({
    T1 item1,
    T2 item2,
    T3 item3,
    T4 item4,
    T5 item5,
    T6 item6,
    T7 item7,
    T8 item8,
    T9 item9,
  }) =>
      Tuple9(
        item1 ?? this.item1,
        item2 ?? this.item2,
        item3 ?? this.item3,
        item4 ?? this.item4,
        item5 ?? this.item5,
        item6 ?? this.item6,
        item7 ?? this.item7,
        item8 ?? this.item8,
        item9 ?? this.item9,
      );

  @override
  String toString() =>
      '($item1, $item2, $item3, $item4, $item5, $item6, $item7, $item8, $item9)';
}
