import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('tuple2', () {
    final reference = Tuple2(
      0,
      0.1,
    );

    void testTuple(Tuple tuple) {
      expect(tuple, isA<Tuple2<int, double>>());
      expect(tuple, reference);
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

      void fromListErrorTooShort() => Tuple2.fromList([]);
      expect(fromListErrorTooShort, throwsA(isA<ArgumentError>()));

      void fromListErrorNotTrimmed() =>
          Tuple2.fromList([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
      expect(fromListErrorNotTrimmed, throwsA(isA<ArgumentError>()));

      // From map
      final fromMap = Tuple2<int, double>.fromJson(<String, dynamic>{
        'item0': 0,
        'item1': 0.1,
      });
      testTuple(fromMap);

      // From record
      final fromRecord = Tuple2<int, double>.fromRecord((0, 0.1));
      testTuple(fromRecord);
    });

    test('index accessor', () {
      expect(reference[0], equals(reference.item0));
      expect(reference[1], equals(reference.item1));
      expect(() => reference[2], throwsA(isA<RangeError>()));
    });

    test('iteration', () {
      final iterator = reference.iterator;

      expect(iterator.moveNext(), isTrue);
      expect(iterator.current, equals(0));

      expect(iterator.moveNext(), isTrue);
      expect(iterator.current, equals(0.1));

      expect(iterator.moveNext(), isFalse);
    });

    test('hashing', () {
      final hash1 = reference.hashCode;
      final hash2 = reference.copyWith(item0: 1);
      expect(hash1, isNot(equals(hash2)));
    });

    test('casting', () {
      expect(reference, isA<Tuple2<int, double>>());
      expect(reference.asType<num, double>(), isA<Tuple2<num, double>>());
      expect(reference.asDynamic(), isA<Tuple2<dynamic, dynamic>>());

      expect(
          () => reference.asType<double, double>(), throwsA(isA<StateError>()));
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
      ]) as Tuple1;

      expect(copy2, isA<Tuple1<dynamic>>());
      expect(copy2.asType<int>(), isA<Tuple1<int>>());
      expect(copy2.item, isA<int>());
    });

    test('mapActions', () {
      reference.mapActions(
        item0: (i) => expect(i, equals(0)),
        item1: (i) => expect(i, equals(0.1)),
      );
    });

    test('deconstructing', () {
      // toRecord
      final record = reference.toRecord();

      expect(record, isA<(int, double)>());
      expect(record.$1, 0);
      expect(record.$2, 0.1);
    });

    test('toJson', () {
      final json = reference.toJson();
      expect(json, {'item0': 0, 'item1': 0.1});
    });

    test('comparison', () {
      final otherA = Tuple2(0, 0.1);
      final otherB = Tuple2(10, 0.1);

      expect(reference == otherA, isTrue);
      expect(reference.hashCode, otherA.hashCode);

      expect(reference == otherB, isFalse);
      expect(reference.hashCode, isNot(otherB.hashCode));
    });

    test('length', () {
      expect(reference.length, 2);
    });

    test('toString', () {
      expect(reference.toString(), '(0, 0.1)');
    });
  });
}
