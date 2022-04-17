import 'package:darq/darq.dart';
import 'package:test/test.dart';

import '../fixtures/pet.dart';

void main() {
  group('between', () {
    test('on ints: pass', () {
      final list = [2, 4, 6, 8];
      final result = list.between(1, 9);
      expect(result, isTrue);
    });

    test('on ints: fail high', () {
      final list = [2, 4, 6, 8];
      final result = list.between(1, 7);
      expect(result, isFalse);
    });

    test('on ints: fail low', () {
      final list = [2, 4, 6, 8];
      final result = list.between(3, 9);
      expect(result, isFalse);
    });

    test('on ints: pass high inclusive', () {
      final list = [2, 4, 6, 8];
      final result = list.between(1, 8);
      expect(result, isFalse);
      final result2 = list.between(1, 8, maximumInclusive: true);
      expect(result2, isTrue);
    });

    test('on ints: pass low inclusive', () {
      final list = [2, 4, 6, 8];
      final result = list.between(2, 9);
      expect(result, isFalse);
      final result2 = list.between(2, 9, minimumInclusive: true);
      expect(result2, isTrue);
    });

    test('on custom type: pass', () {
      final list = [Pet('bill', 2), Pet('bill', 4), Pet('bill', 5)];
      final result = list.between(
        Pet('', 1),
        Pet('', 9),
        sorter: (p1, p2) => p1.age.compareTo(p2.age),
      );
      expect(result, isTrue);
    });

    test('on custom type: fail', () {
      final list = [Pet('bill', 2), Pet('bill', 4), Pet('bill', 5)];
      final result = list.between(
        Pet('', 3),
        Pet('', 7),
        sorter: (p1, p2) => p1.age.compareTo(p2.age),
      );
      expect(result, isFalse);
    });

    test('Error: empty iterable', () {
      final list = <int>[];
      void task() => list.between(1, 9);
      expect(task, throwsA(isA<StateError>()));
    });

    test('Error: null sorter on unsupported type', () {
      final list = [Pet('bill', 2), Pet('bill', 4), Pet('bill', 5)];
      void task() => list.between(Pet('', 3), Pet('', 5));
      expect(task, throwsA(isA<ArgumentError>()));
    });
  });
}
