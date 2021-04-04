import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('tuple0', () {
    final reference = Tuple0();

    void testTuple(Tuple tuple) {
      expect(tuple, isA<Tuple0>());
    }

    test('construction', () {
      // From Constructor
      final constructed = Tuple0();

      testTuple(constructed);

      // From list
      final fromList = Tuple0.fromList(<dynamic>[]);

      testTuple(fromList);

      // From map
      final fromMap = Tuple0.fromJson(<String, dynamic>{});

      testTuple(fromMap);
    });

    test('cloning', () {
      // copyWith
      final copy0 = reference.copyWith();

      testTuple(copy0);

      // copyWithout
      final testCopyWithout = () => reference.copyWithout(indices: <bool>[]);

      expect(testCopyWithout, throwsA(isA<StateError>()));
    });
  });

  group('tuple1', () {
    final reference = Tuple1(
      0,
    );

    void testTuple(Tuple1 tuple) {
      expect(tuple.item, isA<int>());

      expect(tuple.item, equals(reference.item));
    }

    test('construction', () {
      // From Constructor
      final constructed = Tuple1(
        0,
      );

      testTuple(constructed);

      // From list
      final fromList = Tuple1<int>.fromList(<dynamic>[
        0,
      ]);

      testTuple(fromList);

      // From map
      final fromMap = Tuple1<int>.fromJson(<String, dynamic>{
        'item': 0,
      });

      testTuple(fromMap);
    });

    test('cloning', () {
      // copyWith
      final copy1 = reference.copyWith(1);

      expect(copy1.item, equals(1));

      // copyWithout
      final copy2 = reference.copyWithout(indices: [false]);

      expect(copy2, isA<Tuple0>());
    });

    test('mapActions', () {
      reference.mapActions(
        item: (i) => expect(i, equals(0)),
      );
    });
  });

  group('tuple2', () {
    final reference = Tuple2(
      0,
      0.1,
    );

    void testTuple(Tuple2 tuple) {
      expect(tuple.item0, isA<int>());
      expect(tuple.item1, isA<double>());

      expect(tuple.item0, equals(reference.item0));
      expect(tuple.item1, equals(reference.item1));
    }

    test('construction', () {
      // From Constructor
      final constructed = Tuple2(
        0,
        0.1,
      );

      testTuple(constructed);

      // From list
      final fromList = Tuple2<int, double>.fromList(<dynamic>[
        0,
        0.1,
      ]);

      testTuple(fromList);

      // From map
      final fromMap = Tuple2<int, double>.fromJson(<String, dynamic>{
        'item0': 0,
        'item1': 0.1,
      });

      testTuple(fromMap);
    });

    test('cloning', () {
      // copyWith
      final copy1 = reference.copyWith(item1: 1.1);

      expect(copy1.item0, equals(0));
      expect(copy1.item1, equals(1.1));

      // copyWithout
      final copy2 = reference.copyWithout(indices: [
        true,
        false,
      ]);

      expect(copy2, isA<Tuple1>());
      expect((copy2 as Tuple1).item, isA<int>());
      expect(copy2.item, isA<int>());
    });

    test('mapActions', () {
      reference.mapActions(
        item0: (i) => expect(i, equals(0)),
        item1: (i) => expect(i, equals(0.1)),
      );
    });
  });

  group('tuple3', () {
    final reference = Tuple3(
      0,
      0.1,
      'a',
    );

    void testTuple(Tuple3 tuple) {
      expect(tuple.item0, isA<int>());
      expect(tuple.item1, isA<double>());
      expect(tuple.item2, isA<String>());

      expect(tuple.item0, equals(reference.item0));
      expect(tuple.item1, equals(reference.item1));
      expect(tuple.item2, equals(reference.item2));
    }

    test('construction', () {
      // From Constructor
      final constructed = Tuple3(
        0,
        0.1,
        'a',
      );

      testTuple(constructed);

      // From list
      final fromList = Tuple3<int, double, String>.fromList(<dynamic>[
        0,
        0.1,
        'a',
      ]);

      testTuple(fromList);

      // From map
      final fromMap = Tuple3<int, double, String>.fromJson(<String, dynamic>{
        'item0': 0,
        'item1': 0.1,
        'item2': 'a',
      });

      testTuple(fromMap);
    });

    test('cloning', () {
      // copyWith
      final copy1 = reference.copyWith(item1: 1.1);

      expect(copy1.item0, equals(0));
      expect(copy1.item1, equals(1.1));
      expect(copy1.item2, equals('a'));

      // copyWithout
      final copy2 = reference.copyWithout(indices: [
        true,
        false,
        true,
      ]);

      expect(copy2, isA<Tuple2>());
      expect((copy2 as Tuple2).item0, isA<int>());
      expect(copy2.item0, isA<int>());
      expect(copy2.item1, isA<String>());
    });

    test('mapActions', () {
      reference.mapActions(
        item0: (i) => expect(i, equals(0)),
        item1: (i) => expect(i, equals(0.1)),
        item2: (i) => expect(i, equals('a')),
      );
    });
  });

  group('tuple4', () {
    final reference = Tuple4(
      0,
      0.1,
      'a',
      false,
    );

    void testTuple(Tuple4 tuple) {
      expect(tuple.item0, isA<int>());
      expect(tuple.item1, isA<double>());
      expect(tuple.item2, isA<String>());
      expect(tuple.item3, isA<bool>());

      expect(tuple.item0, equals(reference.item0));
      expect(tuple.item1, equals(reference.item1));
      expect(tuple.item2, equals(reference.item2));
      expect(tuple.item3, equals(reference.item3));
    }

    test('construction', () {
      // From Constructor
      final constructed = Tuple4(
        0,
        0.1,
        'a',
        false,
      );

      testTuple(constructed);

      // From list
      final fromList = Tuple4<int, double, String, bool>.fromList(<dynamic>[
        0,
        0.1,
        'a',
        false,
      ]);

      testTuple(fromList);

      // From map
      final fromMap =
          Tuple4<int, double, String, bool>.fromJson(<String, dynamic>{
        'item0': 0,
        'item1': 0.1,
        'item2': 'a',
        'item3': false,
      });

      testTuple(fromMap);
    });

    test('cloning', () {
      // copyWith
      final copy1 = reference.copyWith(item1: 1.1, item3: true);

      expect(copy1.item0, equals(0));
      expect(copy1.item1, equals(1.1));
      expect(copy1.item2, equals('a'));
      expect(copy1.item3, equals(true));

      // copyWithout
      final copy2 = reference.copyWithout(indices: [
        true,
        false,
        true,
        false,
      ]);

      expect(copy2, isA<Tuple2>());
      expect((copy2 as Tuple2).item0, isA<int>());
      expect(copy2.item0, isA<int>());
      expect(copy2.item1, isA<String>());
    });

    test('mapActions', () {
      reference.mapActions(
        item0: (i) => expect(i, equals(0)),
        item1: (i) => expect(i, equals(0.1)),
        item2: (i) => expect(i, equals('a')),
        item3: (i) => expect(i, equals(false)),
      );
    });
  });

  group('tuple5', () {
    final reference = Tuple5(
      0,
      0.1,
      'a',
      false,
      const <dynamic>[],
    );

    void testTuple(Tuple5 tuple) {
      expect(tuple.item0, isA<int>());
      expect(tuple.item1, isA<double>());
      expect(tuple.item2, isA<String>());
      expect(tuple.item3, isA<bool>());
      expect(tuple.item4, isA<List>());

      expect(tuple.item0, equals(reference.item0));
      expect(tuple.item1, equals(reference.item1));
      expect(tuple.item2, equals(reference.item2));
      expect(tuple.item3, equals(reference.item3));
      expect(tuple.item4, equals(reference.item4));
    }

    test('construction', () {
      // From Constructor
      final constructed = Tuple5(
        0,
        0.1,
        'a',
        false,
        const <dynamic>[],
      );

      testTuple(constructed);

      // From list
      final fromList =
          Tuple5<int, double, String, bool, List>.fromList(<dynamic>[
        0,
        0.1,
        'a',
        false,
        const <dynamic>[],
      ]);

      testTuple(fromList);

      // From map
      final fromMap =
          Tuple5<int, double, String, bool, List>.fromJson(<String, dynamic>{
        'item0': 0,
        'item1': 0.1,
        'item2': 'a',
        'item3': false,
        'item4': const <dynamic>[],
      });

      testTuple(fromMap);
    });

    test('cloning', () {
      // copyWith
      final copy1 = reference.copyWith(item1: 1.1, item3: true);

      expect(copy1.item0, equals(0));
      expect(copy1.item1, equals(1.1));
      expect(copy1.item2, equals('a'));
      expect(copy1.item3, equals(true));
      expect(copy1.item4, equals(const <dynamic>[]));

      // copyWithout
      final copy2 = reference.copyWithout(indices: [
        true,
        false,
        true,
        false,
        true,
      ]);

      expect(copy2, isA<Tuple3>());
      expect((copy2 as Tuple3).item0, isA<int>());
      expect(copy2.item1, isA<String>());
      expect(copy2.item2, isA<List>());
    });

    test('mapActions', () {
      reference.mapActions(
        item0: (i) => expect(i, equals(0)),
        item1: (i) => expect(i, equals(0.1)),
        item2: (i) => expect(i, equals('a')),
        item3: (i) => expect(i, equals(false)),
        item4: (i) => expect(i, equals(const <dynamic>[])),
      );
    });
  });

  group('tuple6', () {
    final reference = Tuple6(
      0,
      0.1,
      'a',
      false,
      const <dynamic>[],
      const <dynamic>{},
    );

    void testTuple(Tuple6 tuple) {
      expect(tuple.item0, isA<int>());
      expect(tuple.item1, isA<double>());
      expect(tuple.item2, isA<String>());
      expect(tuple.item3, isA<bool>());
      expect(tuple.item4, isA<List>());
      expect(tuple.item5, isA<Set>());

      expect(tuple.item0, equals(reference.item0));
      expect(tuple.item1, equals(reference.item1));
      expect(tuple.item2, equals(reference.item2));
      expect(tuple.item3, equals(reference.item3));
      expect(tuple.item4, equals(reference.item4));
      expect(tuple.item5, equals(reference.item5));
    }

    test('construction', () {
      // From Constructor
      final constructed = Tuple6(
        0,
        0.1,
        'a',
        false,
        const <dynamic>[],
        const <dynamic>{},
      );

      testTuple(constructed);

      // From list
      final fromList =
          Tuple6<int, double, String, bool, List, Set>.fromList(<dynamic>[
        0,
        0.1,
        'a',
        false,
        const <dynamic>[],
        const <dynamic>{},
      ]);

      testTuple(fromList);

      // From map
      final fromMap = Tuple6<int, double, String, bool, List, Set>.fromJson(<
          String, dynamic>{
        'item0': 0,
        'item1': 0.1,
        'item2': 'a',
        'item3': false,
        'item4': const <dynamic>[],
        'item5': const <dynamic>{},
      });

      testTuple(fromMap);
    });

    test('cloning', () {
      // copyWith
      final copy1 = reference.copyWith(item1: 1.1, item3: true);

      expect(copy1.item0, equals(0));
      expect(copy1.item1, equals(1.1));
      expect(copy1.item2, equals('a'));
      expect(copy1.item3, equals(true));
      expect(copy1.item4, equals(const <dynamic>[]));
      expect(copy1.item5, equals(const <dynamic>{}));

      // copyWithout
      final copy2 = reference.copyWithout(indices: [
        true,
        false,
        true,
        false,
        true,
        false,
      ]);

      expect(copy2, isA<Tuple3>());
      expect((copy2 as Tuple3).item0, isA<int>());
      expect(copy2.item1, isA<String>());
      expect(copy2.item2, isA<List>());
    });

    test('mapActions', () {
      reference.mapActions(
        item0: (i) => expect(i, equals(0)),
        item1: (i) => expect(i, equals(0.1)),
        item2: (i) => expect(i, equals('a')),
        item3: (i) => expect(i, equals(false)),
        item4: (i) => expect(i, equals(const <dynamic>[])),
        item5: (i) => expect(i, equals(const <dynamic>{})),
      );
    });
  });

  group('tuple7', () {
    final reference = Tuple7(
      0,
      0.1,
      'a',
      false,
      const <dynamic>[],
      const <dynamic>{},
      const <String, dynamic>{},
    );

    void testTuple(Tuple7 tuple) {
      expect(tuple.item0, isA<int>());
      expect(tuple.item1, isA<double>());
      expect(tuple.item2, isA<String>());
      expect(tuple.item3, isA<bool>());
      expect(tuple.item4, isA<List>());
      expect(tuple.item5, isA<Set>());
      expect(tuple.item6, isA<Map>());

      expect(tuple.item0, equals(reference.item0));
      expect(tuple.item1, equals(reference.item1));
      expect(tuple.item2, equals(reference.item2));
      expect(tuple.item3, equals(reference.item3));
      expect(tuple.item4, equals(reference.item4));
      expect(tuple.item5, equals(reference.item5));
      expect(tuple.item6, equals(reference.item6));
    }

    test('construction', () {
      // From Constructor
      final constructed = Tuple7(
        0,
        0.1,
        'a',
        false,
        const <dynamic>[],
        const <dynamic>{},
        const <String, dynamic>{},
      );

      testTuple(constructed);

      // From list
      final fromList =
          Tuple7<int, double, String, bool, List, Set, Map>.fromList(<dynamic>[
        0,
        0.1,
        'a',
        false,
        const <dynamic>[],
        const <dynamic>{},
        const <String, dynamic>{},
      ]);

      testTuple(fromList);

      // From map
      final fromMap = Tuple7<int, double, String, bool, List, Set,
          Map>.fromJson(<String, dynamic>{
        'item0': 0,
        'item1': 0.1,
        'item2': 'a',
        'item3': false,
        'item4': const <dynamic>[],
        'item5': const <dynamic>{},
        'item6': const <String, dynamic>{},
      });

      testTuple(fromMap);
    });

    test('cloning', () {
      // copyWith
      final copy1 = reference.copyWith(item1: 1.1, item3: true);

      expect(copy1.item0, equals(0));
      expect(copy1.item1, equals(1.1));
      expect(copy1.item2, equals('a'));
      expect(copy1.item3, equals(true));
      expect(copy1.item4, equals(const <dynamic>[]));
      expect(copy1.item5, equals(const <dynamic>{}));
      expect(copy1.item6, equals(const <String, dynamic>{}));

      // copyWithout
      final copy2 = reference.copyWithout(indices: [
        true,
        false,
        true,
        false,
        true,
        false,
        false,
      ]);

      expect(copy2, isA<Tuple3>());
      expect((copy2 as Tuple3).item0, isA<int>());
      expect(copy2.item1, isA<String>());
      expect(copy2.item2, isA<List>());
    });

    test('mapActions', () {
      reference.mapActions(
        item0: (i) => expect(i, equals(0)),
        item1: (i) => expect(i, equals(0.1)),
        item2: (i) => expect(i, equals('a')),
        item3: (i) => expect(i, equals(false)),
        item4: (i) => expect(i, equals(const <dynamic>[])),
        item5: (i) => expect(i, equals(const <dynamic>{})),
        item6: (i) => expect(i, equals(const <String, dynamic>{})),
      );
    });
  });

  group('tuple8', () {
    final reference = Tuple8(
      0,
      0.1,
      'a',
      false,
      const <dynamic>[],
      const <dynamic>{},
      const <String, dynamic>{},
      const Symbol('empty'),
    );

    void testTuple(Tuple8 tuple) {
      expect(tuple.item0, isA<int>());
      expect(tuple.item1, isA<double>());
      expect(tuple.item2, isA<String>());
      expect(tuple.item3, isA<bool>());
      expect(tuple.item4, isA<List>());
      expect(tuple.item5, isA<Set>());
      expect(tuple.item6, isA<Map>());
      expect(tuple.item7, isA<Symbol>());

      expect(tuple.item0, equals(reference.item0));
      expect(tuple.item1, equals(reference.item1));
      expect(tuple.item2, equals(reference.item2));
      expect(tuple.item3, equals(reference.item3));
      expect(tuple.item4, equals(reference.item4));
      expect(tuple.item5, equals(reference.item5));
      expect(tuple.item6, equals(reference.item6));
      expect(tuple.item7, equals(reference.item7));
    }

    test('construction', () {
      // From Constructor
      final constructed = Tuple8(
        0,
        0.1,
        'a',
        false,
        const <dynamic>[],
        const <dynamic>{},
        const <String, dynamic>{},
        const Symbol('empty'),
      );

      testTuple(constructed);

      // From list
      final fromList = Tuple8<int, double, String, bool, List, Set, Map,
          Symbol>.fromList(<dynamic>[
        0,
        0.1,
        'a',
        false,
        const <dynamic>[],
        const <dynamic>{},
        const <String, dynamic>{},
        const Symbol('empty')
      ]);

      testTuple(fromList);

      // From map
      final fromMap = Tuple8<int, double, String, bool, List, Set, Map,
          Symbol>.fromJson(<String, dynamic>{
        'item0': 0,
        'item1': 0.1,
        'item2': 'a',
        'item3': false,
        'item4': const <dynamic>[],
        'item5': const <dynamic>{},
        'item6': const <String, dynamic>{},
        'item7': const Symbol('empty'),
      });

      testTuple(fromMap);
    });

    test('cloning', () {
      // copyWith
      final copy1 = reference.copyWith(item1: 1.1, item3: true);

      expect(copy1.item0, equals(0));
      expect(copy1.item1, equals(1.1));
      expect(copy1.item2, equals('a'));
      expect(copy1.item3, equals(true));
      expect(copy1.item4, equals(const <dynamic>[]));
      expect(copy1.item5, equals(const <dynamic>{}));
      expect(copy1.item6, equals(const <String, dynamic>{}));
      expect(copy1.item7, equals(const Symbol('empty')));

      // copyWithout
      final copy2 = reference.copyWithout(indices: [
        true,
        false,
        true,
        false,
        true,
        false,
        false,
        false,
      ]);

      expect(copy2, isA<Tuple3>());
      expect((copy2 as Tuple3).item0, isA<int>());
      expect(copy2.item1, isA<String>());
      expect(copy2.item2, isA<List>());
    });

    test('mapActions', () {
      reference.mapActions(
        item0: (i) => expect(i, equals(0)),
        item1: (i) => expect(i, equals(0.1)),
        item2: (i) => expect(i, equals('a')),
        item3: (i) => expect(i, equals(false)),
        item4: (i) => expect(i, equals(const <dynamic>[])),
        item5: (i) => expect(i, equals(const <dynamic>{})),
        item6: (i) => expect(i, equals(const <String, dynamic>{})),
        item7: (i) => expect(i, equals(const Symbol('empty'))),
      );
    });
  });

  group('tuple9', () {
    final reference = Tuple9(
      0,
      0.1,
      'a',
      false,
      const <dynamic>[],
      const <dynamic>{},
      const <String, dynamic>{},
      const Symbol('empty'),
      BigInt.zero,
    );

    void testTuple(Tuple9 tuple) {
      expect(tuple.item0, isA<int>());
      expect(tuple.item1, isA<double>());
      expect(tuple.item2, isA<String>());
      expect(tuple.item3, isA<bool>());
      expect(tuple.item4, isA<List>());
      expect(tuple.item5, isA<Set>());
      expect(tuple.item6, isA<Map>());
      expect(tuple.item7, isA<Symbol>());
      expect(tuple.item8, isA<BigInt>());

      expect(tuple.item0, equals(reference.item0));
      expect(tuple.item1, equals(reference.item1));
      expect(tuple.item2, equals(reference.item2));
      expect(tuple.item3, equals(reference.item3));
      expect(tuple.item4, equals(reference.item4));
      expect(tuple.item5, equals(reference.item5));
      expect(tuple.item6, equals(reference.item6));
      expect(tuple.item7, equals(reference.item7));
      expect(tuple.item8, equals(reference.item8));
    }

    test('construction', () {
      // From Constructor
      final constructed = Tuple9(
        0,
        0.1,
        'a',
        false,
        const <dynamic>[],
        const <dynamic>{},
        const <String, dynamic>{},
        const Symbol('empty'),
        BigInt.zero,
      );

      testTuple(constructed);

      // From list
      final fromList = Tuple9<int, double, String, bool, List, Set, Map, Symbol,
          BigInt>.fromList(<dynamic>[
        0,
        0.1,
        'a',
        false,
        const <dynamic>[],
        const <dynamic>{},
        const <String, dynamic>{},
        const Symbol('empty'),
        BigInt.zero
      ]);

      testTuple(fromList);

      // From map
      final fromMap = Tuple9<int, double, String, bool, List, Set, Map, Symbol,
          BigInt>.fromJson(<String, dynamic>{
        'item0': 0,
        'item1': 0.1,
        'item2': 'a',
        'item3': false,
        'item4': const <dynamic>[],
        'item5': const <dynamic>{},
        'item6': const <String, dynamic>{},
        'item7': const Symbol('empty'),
        'item8': BigInt.zero
      });

      testTuple(fromMap);
    });

    test('cloning', () {
      // copyWith
      final copy1 = reference.copyWith(item1: 1.1, item3: true);

      expect(copy1.item0, equals(0));
      expect(copy1.item1, equals(1.1));
      expect(copy1.item2, equals('a'));
      expect(copy1.item3, equals(true));
      expect(copy1.item4, equals(const <dynamic>[]));
      expect(copy1.item5, equals(const <dynamic>{}));
      expect(copy1.item6, equals(const <String, dynamic>{}));
      expect(copy1.item7, equals(const Symbol('empty')));
      expect(copy1.item8, equals(BigInt.zero));

      // copyWithout
      final copy2 = reference.copyWithout(indices: [
        true,
        false,
        true,
        false,
        true,
        false,
        false,
        false,
        false,
      ]);

      expect(copy2, isA<Tuple3>());
      expect((copy2 as Tuple3).item0, isA<int>());
      expect(copy2.item1, isA<String>());
      expect(copy2.item2, isA<List>());
    });

    test('mapActions', () {
      reference.mapActions(
        item0: (i) => expect(i, equals(0)),
        item1: (i) => expect(i, equals(0.1)),
        item2: (i) => expect(i, equals('a')),
        item3: (i) => expect(i, equals(false)),
        item4: (i) => expect(i, equals(const <dynamic>[])),
        item5: (i) => expect(i, equals(const <dynamic>{})),
        item6: (i) => expect(i, equals(const <String, dynamic>{})),
        item7: (i) => expect(i, equals(const Symbol('empty'))),
        item8: (i) => expect(i, equals(BigInt.zero)),
      );
    });
  });
}
