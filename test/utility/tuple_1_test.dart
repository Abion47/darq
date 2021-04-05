import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
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
      final copy2 = reference.copyWithout(indices: [false]);

      expect(copy2, isA<Tuple0>());
    });

    test('mapActions', () {
      reference.mapActions(
        item: (i) => expect(i, equals(0)),
      );
    });
  });
}
