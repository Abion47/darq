import 'package:test/test.dart';
import 'package:darq/darq.dart';

void main() {
  group('move', () {
    test('Move elements forward', () {
      final list = [1, 2, 3, 4];
      final result = list.move(0, 2, 1);
      expect(result, orderedEquals(<int>[3, 1, 2, 4]));
    });

    test('Move elements backward', () {
      final list = [0, 1, 2, 3, 4, 5];
      final result = list.move(3, 2, 0);
      expect(result, orderedEquals(<int>[3, 4, 0, 1, 2, 5]));
    });

    test('Error: "from" less than zero', () {
      final list = [0, 1, 2, 3, 4, 5];
      void task() => list.move(-1, 2, 0);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: "count" less than zero', () {
      final list = [0, 1, 2, 3, 4, 5];
      void task() => list.move(3, -1, 0);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: "to" less than zero', () {
      final list = [0, 1, 2, 3, 4, 5];
      void task() => list.move(3, 2, -1);
      expect(task, throwsA(isA<RangeError>()));
    });
  });
}
