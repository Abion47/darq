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
    });

    test('cloning', () {
      // copyWith
      final copy0 = reference.copyWith();

      testTuple(copy0);

      // copyWithout
      final testCopyWithout = () => reference.copyWithout(indices: <bool>[]);

      expect(testCopyWithout, throwsA(isA<StateError>()));
    });
  });
}
