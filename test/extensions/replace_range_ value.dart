import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('replaceRangeValue', () {
    test('replace elements in range', () {
      final Iterable<int> list = [1, 2, 3, 4, 5];

      final result = list.replaceRangeValue(6, start: 1, count: 2);
      expect(result, orderedEquals(<int>[1, 6, 6, 4, 5]));

      final result2 = list.replaceRangeValue(6, start: 3, count: 8);
      expect(result2, orderedEquals(<int>[1, 2, 3, 6, 6]));
    });

    test('Error: Start less than zero', () {
      final Iterable<int> list = [1, 2, 3, 4, 5];
      void task() => list.replaceRangeValue(6, start: -1, count: 1);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: Count less than zero', () {
      final Iterable<int> list = [1, 2, 3, 4, 5];
      void task() => list.replaceRangeValue(6, start: 1, count: -1);
      expect(task, throwsA(isA<RangeError>()));
    });
  });
}
