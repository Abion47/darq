import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('tuple7', () {
    final reference = Tuple7(
      0,
      0.1,
      'a',
      false,
      const [],
      const <dynamic>{},
      const {},
    );

    void testTuple(Tuple tuple) {
      expect(
          tuple,
          isA<
              Tuple7<int, double, String, bool, List<dynamic>, Set<dynamic>,
                  Map<dynamic, dynamic>>>());
      expect(tuple, reference);
    }

    test('construction', () {
      // From Constructor
      final constructed = Tuple7(
        0,
        0.1,
        'a',
        false,
        const [],
        const <dynamic>{},
        const {},
      );
      testTuple(constructed);

      // From list
      final fromList = Tuple7<int, double, String, bool, List<dynamic>,
          Set<dynamic>, Map<dynamic, dynamic>>.fromList([
        0,
        0.1,
        'a',
        false,
        const [],
        const <dynamic>{},
        const {},
      ]);
      testTuple(fromList);

      void fromListErrorTooShort() => Tuple7.fromList([]);
      expect(fromListErrorTooShort, throwsA(isA<ArgumentError>()));

      void fromListErrorNotTrimmed() =>
          Tuple7.fromList([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
      expect(fromListErrorNotTrimmed, throwsA(isA<ArgumentError>()));

      // From map
      final fromMap = Tuple7<int, double, String, bool, List<dynamic>,
          Set<dynamic>, Map<dynamic, dynamic>>.fromJson(<String, dynamic>{
        'item0': 0,
        'item1': 0.1,
        'item2': 'a',
        'item3': false,
        'item4': const [],
        'item5': const <dynamic>{},
        'item6': const {},
      });

      testTuple(fromMap);

      // From record
      final fromRecord = Tuple7<int, double, String, bool, List<dynamic>,
          Set<dynamic>, Map<dynamic, dynamic>>.fromRecord((
        0,
        0.1,
        'a',
        false,
        const [],
        const <dynamic>{},
        const {},
      ));

      testTuple(fromRecord);
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
      expect(iterator.current, equals(const []));

      expect(iterator.moveNext(), isTrue);
      expect(iterator.current, equals(const <dynamic>{}));

      expect(iterator.moveNext(), isTrue);
      expect(iterator.current, equals(const {}));

      expect(iterator.moveNext(), isFalse);
    });

    test('hashing', () {
      final hash1 = reference.hashCode;
      final hash2 = reference.copyWith(item0: 1);
      expect(hash1, isNot(equals(hash2)));
    });

    test('casting', () {
      expect(
          reference,
          isA<
              Tuple7<int, double, String, bool, List<dynamic>, Set<dynamic>,
                  Map<dynamic, dynamic>>>());
      expect(
          reference.asType<num, double, String, bool, List<dynamic>,
              Set<dynamic>, Map<dynamic, dynamic>>(),
          isA<
              Tuple7<num, double, String, bool, List<dynamic>, Set<dynamic>,
                  Map<dynamic, dynamic>>>());
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
      expect(copy1.item4, equals(const []));
      expect(copy1.item5, equals(const <dynamic>{}));
      expect(copy1.item6, equals(const {}));

      // copyWithout
      final copy2 = reference.copyWithout(indices: [
        true,
        false,
        true,
        false,
        true,
        false,
        false,
      ]) as Tuple3;

      expect(copy2, isA<Tuple3<dynamic, dynamic, dynamic>>());
      expect(copy2.asType<int, String, List<dynamic>>(),
          isA<Tuple3<int, String, List<dynamic>>>());
      expect(copy2.item0, isA<int>());
      expect(copy2.item1, isA<String>());
      expect(copy2.item2, isA<List<dynamic>>());
    });

    test('mapActions', () {
      reference.mapActions(
        item0: (i) => expect(i, equals(0)),
        item1: (i) => expect(i, equals(0.1)),
        item2: (i) => expect(i, equals('a')),
        item3: (i) => expect(i, equals(false)),
        item4: (i) => expect(i, equals(const [])),
        item5: (i) => expect(i, equals(const <dynamic>{})),
        item6: (i) => expect(i, equals(const {})),
      );
    });

    test('deconstructing', () {
      // toRecord
      final record = reference.toRecord();

      expect(
          record,
          isA<
              (
                int,
                double,
                String,
                bool,
                List<dynamic>,
                Set<dynamic>,
                Map<dynamic, dynamic>
              )>());
      expect(record.$1, 0);
      expect(record.$2, 0.1);
      expect(record.$3, 'a');
      expect(record.$4, false);
      expect(record.$5, const []);
      expect(record.$6, const <dynamic>{});
      expect(record.$7, const {});
    });

    test('toJson', () {
      final json = reference.toJson();
      expect(json, {
        'item0': 0,
        'item1': 0.1,
        'item2': 'a',
        'item3': false,
        'item4': const [],
        'item5': const <dynamic>{},
        'item6': const {},
      });
    });

    test('comparison', () {
      final otherA = Tuple7(
        0,
        0.1,
        'a',
        false,
        const [],
        const <dynamic>{},
        const {},
      );
      final otherB = Tuple7(
        10,
        0.1,
        'a',
        false,
        const [],
        const <dynamic>{},
        const {},
      );

      expect(reference == otherA, isTrue);
      expect(reference.hashCode, otherA.hashCode);

      expect(reference == otherB, isFalse);
      expect(reference.hashCode, isNot(otherB.hashCode));
    });

    test('length', () {
      expect(reference.length, 7);
    });

    test('toString', () {
      expect(reference.toString(), '(0, 0.1, a, false, [], {}, {})');
    });
  });
}
