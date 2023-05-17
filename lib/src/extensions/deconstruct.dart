extension Deconstruct1Extension<T> on Iterable<(T,)> {
  /// Takes this iterable of records and deconstructs it into a record of iterables.
  ///
  /// The returned record will contain iterables containing each individual field
  /// of the record, returned in the same order as the fields themselves.
  ///
  /// For iterables of single-field records, this effectively unwraps the field
  /// value from the record.
  (Iterable<T>,) deconstruct() {
    final list1 = <T>[];

    for (final record in this) {
      list1.add(record.$1);
    }

    return (list1,);
  }
}

extension Deconstruct2Extension<T1, T2> on Iterable<(T1, T2)> {
  /// Takes this iterable of records and deconstructs it into a record of iterables.
  ///
  /// The returned record will contain iterables containing each individual field
  /// of the record, returned in the same order as the fields themselves.
  (Iterable<T1>, Iterable<T2>) deconstruct() {
    final list1 = <T1>[];
    final list2 = <T2>[];

    for (final record in this) {
      list1.add(record.$1);
      list2.add(record.$2);
    }

    return (list1, list2);
  }
}

extension Deconstruct3Extension<T1, T2, T3> on Iterable<(T1, T2, T3)> {
  /// Takes this iterable of records and deconstructs it into a record of iterables.
  ///
  /// The returned record will contain iterables containing each individual field
  /// of the record, returned in the same order as the fields themselves.
  (Iterable<T1>, Iterable<T2>, Iterable<T3>) deconstruct() {
    final list1 = <T1>[];
    final list2 = <T2>[];
    final list3 = <T3>[];

    for (final record in this) {
      list1.add(record.$1);
      list2.add(record.$2);
      list3.add(record.$3);
    }

    return (list1, list2, list3);
  }
}

extension Deconstruct4Extension<T1, T2, T3, T4> on Iterable<(T1, T2, T3, T4)> {
  /// Takes this iterable of records and deconstructs it into a record of iterables.
  ///
  /// The returned record will contain iterables containing each individual field
  /// of the record, returned in the same order as the fields themselves.
  (Iterable<T1>, Iterable<T2>, Iterable<T3>, Iterable<T4>) deconstruct() {
    final list1 = <T1>[];
    final list2 = <T2>[];
    final list3 = <T3>[];
    final list4 = <T4>[];

    for (final record in this) {
      list1.add(record.$1);
      list2.add(record.$2);
      list3.add(record.$3);
      list4.add(record.$4);
    }

    return (list1, list2, list3, list4);
  }
}

extension Deconstruct5Extension<T1, T2, T3, T4, T5>
    on Iterable<(T1, T2, T3, T4, T5)> {
  /// Takes this iterable of records and deconstructs it into a record of iterables.
  ///
  /// The returned record will contain iterables containing each individual field
  /// of the record, returned in the same order as the fields themselves.
  (Iterable<T1>, Iterable<T2>, Iterable<T3>, Iterable<T4>, Iterable<T5>)
      deconstruct() {
    final list1 = <T1>[];
    final list2 = <T2>[];
    final list3 = <T3>[];
    final list4 = <T4>[];
    final list5 = <T5>[];

    for (final record in this) {
      list1.add(record.$1);
      list2.add(record.$2);
      list3.add(record.$3);
      list4.add(record.$4);
      list5.add(record.$5);
    }

    return (list1, list2, list3, list4, list5);
  }
}

extension Deconstruct6Extension<T1, T2, T3, T4, T5, T6>
    on Iterable<(T1, T2, T3, T4, T5, T6)> {
  /// Takes this iterable of records and deconstructs it into a record of iterables.
  ///
  /// The returned record will contain iterables containing each individual field
  /// of the record, returned in the same order as the fields themselves.
  (
    Iterable<T1>,
    Iterable<T2>,
    Iterable<T3>,
    Iterable<T4>,
    Iterable<T5>,
    Iterable<T6>
  ) deconstruct() {
    final list1 = <T1>[];
    final list2 = <T2>[];
    final list3 = <T3>[];
    final list4 = <T4>[];
    final list5 = <T5>[];
    final list6 = <T6>[];

    for (final record in this) {
      list1.add(record.$1);
      list2.add(record.$2);
      list3.add(record.$3);
      list4.add(record.$4);
      list5.add(record.$5);
      list6.add(record.$6);
    }

    return (list1, list2, list3, list4, list5, list6);
  }
}

extension Deconstruct7Extension<T1, T2, T3, T4, T5, T6, T7>
    on Iterable<(T1, T2, T3, T4, T5, T6, T7)> {
  /// Takes this iterable of records and deconstructs it into a record of iterables.
  ///
  /// The returned record will contain iterables containing each individual field
  /// of the record, returned in the same order as the fields themselves.
  (
    Iterable<T1>,
    Iterable<T2>,
    Iterable<T3>,
    Iterable<T4>,
    Iterable<T5>,
    Iterable<T6>,
    Iterable<T7>,
  ) deconstruct() {
    final list1 = <T1>[];
    final list2 = <T2>[];
    final list3 = <T3>[];
    final list4 = <T4>[];
    final list5 = <T5>[];
    final list6 = <T6>[];
    final list7 = <T7>[];

    for (final record in this) {
      list1.add(record.$1);
      list2.add(record.$2);
      list3.add(record.$3);
      list4.add(record.$4);
      list5.add(record.$5);
      list6.add(record.$6);
      list7.add(record.$7);
    }

    return (list1, list2, list3, list4, list5, list6, list7);
  }
}

extension Deconstruct8Extension<T1, T2, T3, T4, T5, T6, T7, T8>
    on Iterable<(T1, T2, T3, T4, T5, T6, T7, T8)> {
  /// Takes this iterable of records and deconstructs it into a record of iterables.
  ///
  /// The returned record will contain iterables containing each individual field
  /// of the record, returned in the same order as the fields themselves.
  (
    Iterable<T1>,
    Iterable<T2>,
    Iterable<T3>,
    Iterable<T4>,
    Iterable<T5>,
    Iterable<T6>,
    Iterable<T7>,
    Iterable<T8>,
  ) deconstruct() {
    final list1 = <T1>[];
    final list2 = <T2>[];
    final list3 = <T3>[];
    final list4 = <T4>[];
    final list5 = <T5>[];
    final list6 = <T6>[];
    final list7 = <T7>[];
    final list8 = <T8>[];

    for (final record in this) {
      list1.add(record.$1);
      list2.add(record.$2);
      list3.add(record.$3);
      list4.add(record.$4);
      list5.add(record.$5);
      list6.add(record.$6);
      list7.add(record.$7);
      list8.add(record.$8);
    }

    return (list1, list2, list3, list4, list5, list6, list7, list8);
  }
}

extension Deconstruct9Extension<T1, T2, T3, T4, T5, T6, T7, T8, T9>
    on Iterable<(T1, T2, T3, T4, T5, T6, T7, T8, T9)> {
  /// Takes this iterable of records and deconstructs it into a record of iterables.
  ///
  /// The returned record will contain iterables containing each individual field
  /// of the record, returned in the same order as the fields themselves.
  (
    Iterable<T1>,
    Iterable<T2>,
    Iterable<T3>,
    Iterable<T4>,
    Iterable<T5>,
    Iterable<T6>,
    Iterable<T7>,
    Iterable<T8>,
    Iterable<T9>,
  ) deconstruct() {
    final list1 = <T1>[];
    final list2 = <T2>[];
    final list3 = <T3>[];
    final list4 = <T4>[];
    final list5 = <T5>[];
    final list6 = <T6>[];
    final list7 = <T7>[];
    final list8 = <T8>[];
    final list9 = <T9>[];

    for (final record in this) {
      list1.add(record.$1);
      list2.add(record.$2);
      list3.add(record.$3);
      list4.add(record.$4);
      list5.add(record.$5);
      list6.add(record.$6);
      list7.add(record.$7);
      list8.add(record.$8);
      list9.add(record.$9);
    }

    return (list1, list2, list3, list4, list5, list6, list7, list8, list9);
  }
}
