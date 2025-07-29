import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('skipLast', () {
    test('on ints', () {
      final list = [1, 2, 3, 4, 5];
      final result = list.skipLast(3);
      expect(result, orderedEquals(<int>[1, 2]));
    });

    test('length equals count', () {
      final list = [1, 2, 3];
      final result = list.skipLast(3);
      expect(result, orderedEquals(<int>[]));
    });

    test('Error: length less than count', () {
      final list = [1, 2];
      void task() => list.skipLast(3);
      expect(task, throwsA(isA<ArgumentError>()));
    });
  });
}
