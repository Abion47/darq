import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('randomSubset', () {
    test('on ints', () {
      final list = [1, 2, 3, 4, 5];
      final result = list.randomSubset(3).toList();
      expect(result.length, 3);
      for (var i in result) {
        expect(list.contains(i), isTrue);
      }
    });

    test('memoizable', () {
      final list = Iterable.generate(10, (i) => i);
      final randomizedIterable = list.randomSubset(3);

      final random1 = randomizedIterable.toList();
      final random2 = randomizedIterable.toList();

      expect(random1, isNot(equals(random2)));

      final memoizedIterable = randomizedIterable.memoize();

      final memoized1 = memoizedIterable.toList();
      final memoized2 = memoizedIterable.toList();

      expect(memoized1, equals(memoized2));
    });
  });
}
