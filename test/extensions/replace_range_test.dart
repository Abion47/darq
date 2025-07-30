import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('replaceRange', () {
    test('replace elements in range', () {
      final Iterable<int> list = [1, 2, 3, 4, 5];
      final Iterable<int> src = [6, 7, 8];

      final result = list.replaceRange(src, start: 1, count: 2);
      expect(result, orderedEquals(<int>[1, 6, 7, 4, 5]));

      final result2 = list.replaceRange(src, start: 1, count: 8);
      expect(result2, orderedEquals(<int>[1, 6, 7, 8, 6]));
    });

    test('Error: Empty source iterable', () {
      final Iterable<int> list = [1, 2, 3, 4, 5];
      final Iterable<int> src = [];

      void task() => list.replaceRange(src, start: -1, count: 1);
      expect(task, throwsA(isA<ArgumentError>()));
    });

    test('Error: Start less than zero', () {
      final Iterable<int> list = [1, 2, 3, 4, 5];
      final Iterable<int> src = [6, 7, 8];

      void task() => list.replaceRange(src, start: -1, count: 1);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: Count less than zero', () {
      final Iterable<int> list = [1, 2, 3, 4, 5];
      final Iterable<int> src = [6, 7, 8];

      void task() => list.replaceRange(src, start: 1, count: -1);
      expect(task, throwsA(isA<RangeError>()));
    });
  });
}
