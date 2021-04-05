import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
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

    test('index accessor', () {
      expect(reference[0], equals(reference.item0));
      expect(reference[1], equals(reference.item1));
      expect(reference[2], equals(reference.item2));
      expect(reference[3], equals(reference.item3));
      expect(reference[4], equals(reference.item4));
      expect(reference[5], equals(reference.item5));
      expect(reference[6], equals(reference.item6));
      expect(() => reference[7], throwsA(isA<RangeError>()));
    });

    test('iteration', () {
      final iterator = reference.iterator;

      expect(iterator.moveNext(), isTrue);
      expect(iterator.current, equals(0));

      expect(iterator.moveNext(), isTrue);
      expect(iterator.current, equals(0.1));

      expect(iterator.moveNext(), isTrue);
      expect(iterator.current, equals('a'));

      expect(iterator.moveNext(), isTrue);
      expect(iterator.current, equals(false));

      expect(iterator.moveNext(), isTrue);
      expect(iterator.current, equals(const <dynamic>[]));

      expect(iterator.moveNext(), isTrue);
      expect(iterator.current, equals(const <dynamic>{}));

      expect(iterator.moveNext(), isTrue);
      expect(iterator.current, equals(const <String, dynamic>{}));

      expect(iterator.moveNext(), isFalse);
    });

    test('hashing', () {
      final hash1 = reference.hashCode;
      final hash2 = reference.copyWith(item0: 1);
      expect(hash1, isNot(equals(hash2)));
    });

    test('casting', () {
      expect(
          reference, isA<Tuple7<int, double, String, bool, List, Set, Map>>());
      expect(reference.asType<num, double, String, bool, List, Set, Map>(),
          isA<Tuple7<num, double, String, bool, List, Set, Map>>());
      expect(
          reference.asDynamic(),
          isA<
              Tuple7<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
                  dynamic>>());

      expect(
          () => reference
              .asType<double, double, double, double, double, double, double>(),
          throwsA(isA<StateError>()));
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
}