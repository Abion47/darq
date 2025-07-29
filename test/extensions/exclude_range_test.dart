import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('excludeRange', () {
    test('Exclude range', () {
      final list = [1, 2, 3, 4, 5];

      final result = list.excludeRange(1, 2);
      expect(result, orderedEquals(<int>[1, 4, 5]));

      final result2 = list.excludeRange(0, 2);
      expect(result2, orderedEquals(<int>[3, 4, 5]));
    });

    test('Start greater than length', () {
      final list = [1, 2, 3, 4, 5];
      final result = list.excludeRange(5, 2);
      expect(result, orderedEquals(<int>[1, 2, 3, 4, 5]));
    });

    test('Count is zero', () {
      final list = [1, 2, 3, 4, 5];
      final result = list.excludeRange(2, 0);
      expect(result, orderedEquals(<int>[1, 2, 3, 4, 5]));
    });

    test('Error: Start less than zero', () {
      final list = [1, 2, 3, 4, 5];
      void task() => list.excludeRange(-1, 2);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: Count less than zero', () {
      final list = [1, 2, 3, 4, 5];
      void task() => list.excludeRange(2, -1);
      expect(task, throwsA(isA<RangeError>()));
    });
  });
}
