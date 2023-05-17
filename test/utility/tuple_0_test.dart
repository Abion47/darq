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
      expect(() => reference.asType(), throwsA(isA<StateError>()));
      expect(() => reference.asDynamic(), throwsA(isA<StateError>()));
    });

    test('cloning', () {
      // copyWith
      final copy0 = reference.copyWith();

      testTuple(copy0);

      // copyWithout
      void task() => reference.copyWithout(indices: <bool>[]);

      expect(task, throwsA(isA<StateError>()));
    });

    test('deconstructing', () {
      // toRecord
      final record = reference.toRecord();

      expect(record, isA<()>());
    });
  });
}
