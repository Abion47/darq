import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('tuple3', () {
    final reference = Tuple3(
      0,
      0.1,
      'a',
    );

    void testTuple(Tuple tuple) {
      expect(tuple, isA<Tuple3<int, double, String>>());
      expect(tuple, reference);
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
      final fromList = Tuple3<int, double, String>.fromList([
        0,
        0.1,
        'a',
      ]);
      testTuple(fromList);

      void fromListErrorTooShort() => Tuple3.fromList([]);
      expect(fromListErrorTooShort, throwsA(isA<ArgumentError>()));

      void fromListErrorNotTrimmed() =>
          Tuple3.fromList([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
      expect(fromListErrorNotTrimmed, throwsA(isA<ArgumentError>()));

      // From map
      final fromMap = Tuple3<int, double, String>.fromJson({
        'item0': 0,
        'item1': 0.1,
        'item2': 'a',
      });
      testTuple(fromMap);

      // From record
      final fromRecord = Tuple3<int, double, String>.fromRecord((
        0,
        0.1,
        'a',
      ));
      testTuple(fromRecord);
    });

    test('index accessor', () {
      expect(reference[0], equals(reference.item0));
      expect(reference[1], equals(reference.item1));
      expect(reference[2], equals(reference.item2));
      expect(() => reference[3], throwsA(isA<RangeError>()));
    });

    test('iteration', () {
      final iterator = reference.iterator;

      expect(iterator.moveNext(), isTrue);
      expect(iterator.current, equals(0));

      expect(iterator.moveNext(), isTrue);
      expect(iterator.current, equals(0.1));

      expect(iterator.moveNext(), isTrue);
      expect(iterator.current, equals('a'));

      expect(iterator.moveNext(), isFalse);
    });

    test('hashing', () {
      final hash1 = reference.hashCode;
      final hash2 = reference.copyWith(item0: 1);
      expect(hash1, isNot(equals(hash2)));
    });

    test('casting', () {
      expect(reference, isA<Tuple3<int, double, String>>());
      expect(reference.asType<num, double, String>(),
          isA<Tuple3<num, double, String>>());
      expect(reference.asDynamic(), isA<Tuple3<dynamic, dynamic, dynamic>>());

      expect(() => reference.asType<double, double, double>(),
          throwsA(isA<StateError>()));
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
      );
    });

    test('deconstructing', () {
      // toRecord
      final record = reference.toRecord();

      expect(record, isA<(int, double, String)>());
      expect(record.$1, 0);
      expect(record.$2, 0.1);
      expect(record.$3, 'a');
    });

    test('toJson', () {
      final json = reference.toJson();
      expect(json, {'item0': 0, 'item1': 0.1, 'item2': 'a'});
    });

    test('comparison', () {
      final otherA = Tuple3(0, 0.1, 'a');
      final otherB = Tuple3(10, 0.1, 'a');

      expect(reference == otherA, isTrue);
      expect(reference.hashCode, otherA.hashCode);

      expect(reference == otherB, isFalse);
      expect(reference.hashCode, isNot(otherB.hashCode));
    });

    test('length', () {
      expect(reference.length, 3);
    });

    test('toString', () {
      expect(reference.toString(), '(0, 0.1, a)');
    });
  });
}
