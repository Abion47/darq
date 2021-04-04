import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('tuple3', () {
    final reference = Tuple3(
      0,
      0.1,
      'a',
    );

    void testTuple(Tuple3 tuple) {
      expect(tuple.item0, isA<int>());
      expect(tuple.item1, isA<double>());
      expect(tuple.item2, isA<String>());

      expect(tuple.item0, equals(reference.item0));
      expect(tuple.item1, equals(reference.item1));
      expect(tuple.item2, equals(reference.item2));
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
      final fromList = Tuple3<int, double, String>.fromList(<dynamic>[
        0,
        0.1,
        'a',
      ]);

      testTuple(fromList);

      // From map
      final fromMap = Tuple3<int, double, String>.fromJson(<String, dynamic>{
        'item0': 0,
        'item1': 0.1,
        'item2': 'a',
      });

      testTuple(fromMap);
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
      ]);

      expect(copy2, isA<Tuple2>());
      expect((copy2 as Tuple2).item0, isA<int>());
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
  });
}
