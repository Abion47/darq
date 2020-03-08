import 'package:darq/darq.dart';
import 'package:test/test.dart';

import '../fixtures/pet.dart';

void main() {
  group('atMost', () {
    test('on ints: pass', () {
      final list = [2, 4, 6, 8];
      final result = list.atMost(8);
      expect(result, isTrue);
    });

    test('on ints: fail', () {
      final list = [2, 4, 6, 7];
      final result = list.atMost(6);
      expect(result, isFalse);
    });

    test('on Strings: pass', () {
      final list = ['b', 'c', 'd'];
      final result = list.atMost('d');
      expect(result, isTrue);
    });

    test('on Strings: fail', () {
      final list = ['b', 'c', 'd'];
      final result = list.atMost('c');
      expect(result, isFalse);
    });

    test('on custom type: pass', () {
      final list = [Pet('bill', 2), Pet('bill', 4), Pet('bill', 5)];
      final result =
          list.atMost(Pet('', 5), sorter: (p1, p2) => p1.age.compareTo(p2.age));
      expect(result, isTrue);
    });

    test('on custom type: fail', () {
      final list = [Pet('bill', 2), Pet('bill', 4), Pet('bill', 5)];
      final result =
          list.atMost(Pet('', 3), sorter: (p1, p2) => p1.age.compareTo(p2.age));
      expect(result, isFalse);
    });

    test('Error: empty iterable', () {
      final list = <int>[];
      final task = () => list.atMost(1);
      expect(task, throwsA(isA<StateError>()));
    });

    test('Error: null sorter on unsupported type', () {
      final list = [Pet('bill', 2), Pet('bill', 4), Pet('bill', 5)];
      final task = () => list.atMost(Pet('', 3));
      expect(task, throwsA(isA<ArgumentError>()));
    });
  });
}
