import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('tuple1', () {
    final reference = Tuple1(
      0,
    );

    void testTuple(Tuple tuple) {
      expect(tuple, isA<Tuple1<int>>());
      expect(tuple, reference);
    }

    test('construction', () {
      // From Constructor
      final constructed = Tuple1(
        0,
      );
      testTuple(constructed);

      // From list
      final fromList = Tuple1<int>.fromList([0]);
      testTuple(fromList);

      final fromListTrimmed =
          Tuple1<int>.fromList([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], true);
      testTuple(fromListTrimmed);

      void fromListErrorTooShort() => Tuple1.fromList([]);
      expect(fromListErrorTooShort, throwsA(isA<ArgumentError>()));

      void fromListErrorNotTrimmed() =>
          Tuple1.fromList([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
      expect(fromListErrorNotTrimmed, throwsA(isA<ArgumentError>()));

      // From map
      final fromMap = Tuple1<int>.fromJson({
        'item': 0,
      });
      testTuple(fromMap);

      final fromMapAlt = Tuple1<int>.fromJson({
        'item0': 0,
      });
      testTuple(fromMapAlt);

      // From record
      final fromRecord = Tuple1<int>.fromRecord((0,));
      testTuple(fromRecord);
    });

    test('index accessor', () {
      expect(reference[0], equals(reference.item));
      expect(() => reference[1], throwsA(isA<RangeError>()));
    });

    test('iteration', () {
      final iterator = reference.iterator;

      expect(iterator.moveNext(), isTrue);
      expect(iterator.current, equals(0));

      expect(iterator.moveNext(), isFalse);
    });

    test('hashing', () {
      final hash1 = reference.hashCode;
      final hash2 = reference.copyWith(1);
      expect(hash1, isNot(equals(hash2)));
    });

    test('casting', () {
      expect(reference, isA<Tuple1<int>>());
      expect(reference.asType<num>(), isA<Tuple1<num>>());
      expect(reference.asDynamic(), isA<Tuple1<dynamic>>());

      expect(() => reference.asType<double>(), throwsA(isA<StateError>()));
    });

    test('cloning', () {
      // copyWith
      final copy1 = reference.copyWith(1);
      expect(copy1.item, equals(1));

      // copyWithout
      final copy2 = reference.copyWithout(indices: [true]);
      expect(copy2, reference);

      final copy3 = reference.copyWithout(indices: [false]);
      expect(copy3, isA<Tuple0>());
    });

    test('mapActions', () {
      reference.mapActions(
        item: (i) => expect(i, equals(0)),
      );
    });

    test('deconstructing', () {
      // toRecord
      final record = reference.toRecord();

      expect(record, isA<(int,)>());
      expect(record.$1, 0);
    });

    test('toJson', () {
      final json = reference.toJson();
      expect(json, {'item': 0});
    });

    test('comparison', () {
      final otherA = Tuple1(0);
      final otherB = Tuple1(10);

      expect(reference == otherA, isTrue);
      expect(reference.hashCode, otherA.hashCode);

      expect(reference == otherB, isFalse);
      expect(reference.hashCode, isNot(otherB.hashCode));
    });

    test('length', () {
      expect(reference.length, 1);
    });

    test('toString', () {
      expect(reference.toString(), '(0)');
    });
  });
}
