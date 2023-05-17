import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
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

    void testTuple(
        Tuple8<int, double, String, bool, List<dynamic>, Set<dynamic>,
                Map<String, dynamic>, Symbol>
            tuple) {
      expect(tuple.item0, isA<int>());
      expect(tuple.item1, isA<double>());
      expect(tuple.item2, isA<String>());
      expect(tuple.item3, isA<bool>());
      expect(tuple.item4, isA<List<dynamic>>());
      expect(tuple.item5, isA<Set<dynamic>>());
      expect(tuple.item6, isA<Map<String, dynamic>>());
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
      final fromList = Tuple8<int, double, String, bool, List<dynamic>,
          Set<dynamic>, Map<String, dynamic>, Symbol>.fromList(<dynamic>[
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
      final fromMap = Tuple8<
          int,
          double,
          String,
          bool,
          List<dynamic>,
          Set<dynamic>,
          Map<String, dynamic>,
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

      // From record
      final fromRecord = Tuple8<int, double, String, bool, List<dynamic>,
          Set<dynamic>, Map<String, dynamic>, Symbol>.fromRecord((
        0,
        0.1,
        'a',
        false,
        const <dynamic>[],
        const <dynamic>{},
        const <String, dynamic>{},
        const Symbol('empty'),
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
      expect(reference[7], equals(reference.item7));
      expect(() => reference[8], throwsA(isA<RangeError>()));
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

      expect(iterator.moveNext(), isTrue);
      expect(iterator.current, equals(const Symbol('empty')));

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
              Tuple8<int, double, String, bool, List<dynamic>, Set<dynamic>,
                  Map<String, dynamic>, Symbol>>());
      expect(
          reference.asType<num, double, String, bool, List<dynamic>,
              Set<dynamic>, Map<String, dynamic>, Symbol>(),
          isA<
              Tuple8<num, double, String, bool, List<dynamic>, Set<dynamic>,
                  Map<String, dynamic>, Symbol>>());
      expect(
          reference.asDynamic(),
          isA<
              Tuple8<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
                  dynamic, dynamic>>());

      expect(
          () => reference.asType<double, double, double, double, double, double,
              double, double>(),
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
        item4: (i) => expect(i, equals(const <dynamic>[])),
        item5: (i) => expect(i, equals(const <dynamic>{})),
        item6: (i) => expect(i, equals(const <String, dynamic>{})),
        item7: (i) => expect(i, equals(const Symbol('empty'))),
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
                Map<String, dynamic>,
                Symbol,
              )>());
      expect(record.$1, 0);
      expect(record.$2, 0.1);
      expect(record.$3, 'a');
      expect(record.$4, false);
      expect(record.$5, const <dynamic>[]);
      expect(record.$6, const <dynamic>{});
      expect(record.$7, const <String, dynamic>{});
      expect(record.$8, const Symbol('empty'));
    });
  });
}
