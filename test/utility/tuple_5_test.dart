import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('tuple5', () {
    final reference = Tuple5(
      0,
      0.1,
      'a',
      false,
      const <dynamic>[],
    );

    void testTuple(Tuple5 tuple) {
      expect(tuple.item0, isA<int>());
      expect(tuple.item1, isA<double>());
      expect(tuple.item2, isA<String>());
      expect(tuple.item3, isA<bool>());
      expect(tuple.item4, isA<List>());

      expect(tuple.item0, equals(reference.item0));
      expect(tuple.item1, equals(reference.item1));
      expect(tuple.item2, equals(reference.item2));
      expect(tuple.item3, equals(reference.item3));
      expect(tuple.item4, equals(reference.item4));
    }

    test('construction', () {
      // From Constructor
      final constructed = Tuple5(
        0,
        0.1,
        'a',
        false,
        const <dynamic>[],
      );

      testTuple(constructed);

      // From list
      final fromList =
          Tuple5<int, double, String, bool, List>.fromList(<dynamic>[
        0,
        0.1,
        'a',
        false,
        const <dynamic>[],
      ]);

      testTuple(fromList);

      // From map
      final fromMap =
          Tuple5<int, double, String, bool, List>.fromJson(<String, dynamic>{
        'item0': 0,
        'item1': 0.1,
        'item2': 'a',
        'item3': false,
        'item4': const <dynamic>[],
      });

      testTuple(fromMap);
    });

    test('cloning', () {
      // copyWith
      final copy1 = reference.copyWith(item1: 1.1, item3: true);

      expect(copy1.item0, equals(0));
      expect(copy1.item1, equals(1.1));
      expect(copy1.item2, equals('a'));
      expect(copy1.item3, equals(true));
      expect(copy1.item4, equals(const <dynamic>[]));

      // copyWithout
      final copy2 = reference.copyWithout(indices: [
        true,
        false,
        true,
        false,
        true,
      ]);

      expect(copy2, isA<Tuple3>());
      expect((copy2 as Tuple3).item0, isA<int>());
      expect(copy2.item1, isA<String>());
      expect(copy2.item2, isA<List>());
    });

    test('mapActions', () {
      reference.mapActions(
        item0: (i) => expect(i, equals(0)),
        item1: (i) => expect(i, equals(0.1)),
        item2: (i) => expect(i, equals('a')),
        item3: (i) => expect(i, equals(false)),
        item4: (i) => expect(i, equals(const <dynamic>[])),
      );
    });
  });
}
