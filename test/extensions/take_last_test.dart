import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('takeLast', () {
    test('on ints', () {
      final list = [1, 2, 3, 4, 5];
      final result = list.takeLast(3);
      expect(result, orderedEquals(<int>[3, 4, 5]));
    });

    test('length equals count', () {
      final list = [1, 2, 3];
      final result = list.takeLast(3);
      expect(result, orderedEquals(<int>[1, 2, 3]));
    });

    test('Error: length less than count', () {
      final list = [1, 2];
      void task() => list.takeLast(3);
      expect(task, throwsA(isA<ArgumentError>()));
    });
  });
}
