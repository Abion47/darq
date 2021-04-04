import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('randomize', () {
    test('on ints', () {
      final list = Iterable.generate(10, (i) => i);
      final randomized1 = list.randomize();
      expect(randomized1.length, list.length);

      for (var i in randomized1) {
        expect(list.contains(i), isTrue);
      }

      expect(randomized1, isNot(equals(list)));

      final randomized2 = list.randomize();
      expect(randomized1, isNot(equals(randomized2)));
    });

    test('memoizable', () {
      final list = Iterable.generate(10, (i) => i);
      final randomizedIterable = list.randomize();

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
