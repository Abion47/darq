import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('excludeAt', () {
    test('Exclude at index', () {
      final list = [1, 2, 3, 4, 5];

      final result = list.excludeAt(2);
      expect(result, orderedEquals(<int>[1, 2, 4, 5]));

      final result2 = list.excludeAt(0);
      expect(result2, orderedEquals(<int>[2, 3, 4, 5]));
    });

    test('Index greater than length', () {
      final list = [1, 2, 3, 4, 5];
      final result = list.excludeAt(5);
      expect(result, orderedEquals(<int>[1, 2, 3, 4, 5]));
    });

    test('Error: Index less than zero', () {
      final list = [1, 2, 3, 4, 5];
      void task() => list.excludeAt(-1);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('examples from issue #17', () {
      final list = [0, 1, 2];
      final result = list.excludeAt(0);
      expect(result, orderedEquals([1, 2]));

      final list2 = [0, 1, 2];
      final result2 = list2.excludeAt(2);
      expect(result2, orderedEquals([0, 1]));
    });
  });
}
