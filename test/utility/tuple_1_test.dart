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
