import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('tuple4', () {
    final reference = Tuple4(
      0,
      0.1,
      'a',
      false,
    );

    void testTuple(Tuple tuple) {
      expect(tuple, isA<Tuple4<int, double, String, bool>>());
      expect(tuple, reference);
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
      final fromList = Tuple4<int, double, String, bool>.fromList([
        0,
        0.1,
        'a',
        false,
      ]);
      testTuple(fromList);

      void fromListErrorTooShort() => Tuple4.fromList([]);
      expect(fromListErrorTooShort, throwsA(isA<ArgumentError>()));

      void fromListErrorNotTrimmed() =>
          Tuple4.fromList([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
      expect(fromListErrorNotTrimmed, throwsA(isA<ArgumentError>()));

      // From map
      final fromMap = Tuple4<int, double, String, bool>.fromJson({
        'item0': 0,
        'item1': 0.1,
        'item2': 'a',
        'item3': false,
      });

      testTuple(fromMap);

      // From record
      final fromRecord = Tuple4<int, double, String, bool>.fromRecord((
        0,
        0.1,
        'a',
        false,
      ));

      testTuple(fromRecord);
    });

    test('index accessor', () {
      expect(reference[0], equals(reference.item0));
      expect(reference[1], equals(reference.item1));
      expect(reference[2], equals(reference.item2));
      expect(reference[3], equals(reference.item3));
      expect(() => reference[4], throwsA(isA<RangeError>()));
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

      expect(iterator.moveNext(), isFalse);
    });

    test('hashing', () {
      final hash1 = reference.hashCode;
      final hash2 = reference.copyWith(item0: 1);
      expect(hash1, isNot(equals(hash2)));
    });

    test('casting', () {
      expect(reference, isA<Tuple4<int, double, String, bool>>());
      expect(reference.asType<num, double, String, bool>(),
          isA<Tuple4<num, double, String, bool>>());
      expect(reference.asDynamic(),
          isA<Tuple4<dynamic, dynamic, dynamic, dynamic>>());

      expect(() => reference.asType<double, double, double, double>(),
          throwsA(isA<StateError>()));
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
      ]) as Tuple2;

      expect(copy2, isA<Tuple2<dynamic, dynamic>>());
      expect(copy2.asType<int, String>(), isA<Tuple2<int, String>>());
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

    test('deconstructing', () {
      // toRecord
      final record = reference.toRecord();

      expect(record, isA<(int, double, String, bool)>());
      expect(record.$1, 0);
      expect(record.$2, 0.1);
      expect(record.$3, 'a');
      expect(record.$4, false);
    });

    test('toJson', () {
      final json = reference.toJson();
      expect(json, {'item0': 0, 'item1': 0.1, 'item2': 'a', 'item3': false});
    });

    test('comparison', () {
      final otherA = Tuple4(0, 0.1, 'a', false);
      final otherB = Tuple4(10, 0.1, 'a', false);

      expect(reference == otherA, isTrue);
      expect(reference.hashCode, otherA.hashCode);

      expect(reference == otherB, isFalse);
      expect(reference.hashCode, isNot(otherB.hashCode));
    });

    test('length', () {
      expect(reference.length, 4);
    });

    test('toString', () {
      expect(reference.toString(), '(0, 0.1, a, false)');
    });
  });
}
