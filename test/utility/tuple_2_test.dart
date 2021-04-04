import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('tuple2', () {
    final reference = Tuple2(
      0,
      0.1,
    );

    void testTuple(Tuple2 tuple) {
      expect(tuple.item0, isA<int>());
      expect(tuple.item1, isA<double>());

      expect(tuple.item0, equals(reference.item0));
      expect(tuple.item1, equals(reference.item1));
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

      // From map
      final fromMap = Tuple2<int, double>.fromJson(<String, dynamic>{
        'item0': 0,
        'item1': 0.1,
      });

      testTuple(fromMap);
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
      ]);

      expect(copy2, isA<Tuple1>());
      expect((copy2 as Tuple1).item, isA<int>());
      expect(copy2.item, isA<int>());
    });

    test('mapActions', () {
      reference.mapActions(
        item0: (i) => expect(i, equals(0)),
        item1: (i) => expect(i, equals(0.1)),
      );
    });
  });
}
