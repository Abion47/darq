import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('insertEvery', () {
    test('insert every Nth element', () {
      final list = [1, 2, 3, 4, 5, 6, 7, 8, 9];

      final result = list.insertEvery(6, step: 2);
      expect(
          result, orderedEquals(<int>[1, 2, 6, 3, 4, 6, 5, 6, 6, 7, 8, 6, 9]));

      final result2 = list.insertEvery(6, step: 4);
      expect(result2, orderedEquals(<int>[1, 2, 3, 4, 6, 5, 6, 7, 8, 6, 9]));

      final result3 = list.insertEvery(6, step: 6);
      expect(result3, orderedEquals([1, 2, 3, 4, 5, 6, 6, 7, 8, 9]));

      final result4 = list.insertEvery(6, step: 2, skip: 3);
      expect(result4, orderedEquals(<int>[1, 2, 3, 4, 5, 6, 6, 7, 6, 8, 9, 6]));
    });

    test('Error: Count less than one', () {
      final list = [1, 2, 3, 4, 5];
      void task() => list.insertEvery(6, step: 0);
      expect(task, throwsA(isA<ArgumentError>()));
    });

    test('Error: Skip less than zero', () {
      final list = [1, 2, 3, 4, 5];
      void task() => list.insertEvery(6, step: 2, skip: -1);
      expect(task, throwsA(isA<ArgumentError>()));
    });
  });
}
