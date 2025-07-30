import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('tuple0', () {
    final reference = Tuple0();

    void testTuple(Tuple tuple) {
      expect(tuple, isA<Tuple0>());
      expect(tuple, reference);
    }

    test('construction', () {
      // From Constructor
      final constructed = Tuple0();
      testTuple(constructed);

      // From list
      final fromList = Tuple0.fromList([]);
      testTuple(fromList);

      final fromListTrimmed =
          Tuple0.fromList([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], true);
      testTuple(fromListTrimmed);

      void fromListErrorNotTrimmed() =>
          Tuple0.fromList([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
      expect(fromListErrorNotTrimmed, throwsA(isA<ArgumentError>()));

      // From map
      final fromMap = Tuple0.fromJson({});
      testTuple(fromMap);

      // From record
      final fromRecord = Tuple0.fromRecord(());
      testTuple(fromRecord);
    });

    test('index accessor', () {
      expect(() => reference[0], throwsA(isA<RangeError>()));
    });

    test('iteration', () {
      final iterator = reference.iterator;
      expect(iterator.moveNext(), isFalse);
    });

    test('hashing', () {
      final hash1 = reference.hashCode;
      expect(hash1, equals(0));
    });

    test('casting', () {
      expect(reference, isA<Tuple0>());
      expect(() => reference.asType(), throwsA(isA<UnsupportedError>()));
      expect(() => reference.asDynamic(), throwsA(isA<UnsupportedError>()));
    });

    test('cloning', () {
      // copyWith
      final copy0 = reference.copyWith();

      testTuple(copy0);

      // copyWithout
      void task() => reference.copyWithout(indices: <bool>[]);

      expect(task, throwsA(isA<UnsupportedError>()));
    });

    test('deconstructing', () {
      // toRecord
      final record = reference.toRecord();

      expect(record, isA<()>());
    });

    test('toJson', () {
      final json = reference.toJson();
      expect(json, {});
    });

    test('mapActions', () {
      reference.mapActions();
    });

    test('comparison', () {
      final other = Tuple0();

      expect(reference == other, isTrue);
      expect(reference.hashCode, other.hashCode);
    });

    test('length', () {
      expect(reference.length, 0);
    });

    test('toString', () {
      expect(reference.toString(), '()');
    });
  });
}
