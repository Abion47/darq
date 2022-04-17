import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('takeEvery', () {
    test('on ints', () {
      final list = [1, 2, 3, 4, 5, 6];
      final result = list.takeEvery(2);
      expect(result, orderedEquals(<int>[2, 4, 6]));
    });

    test('on ints with large step', () {
      final list = [1, 2, 3];
      final result = list.takeEvery(4);
      expect(result, orderedEquals(<int>[]));
    });

    test('Error: zero step', () {
      final list = [1, 2, 3];
      void task() => list.takeEvery(0);
      expect(task, throwsA(isA<RangeError>()));
    });

    test('Error: negative step', () {
      final list = [1, 2, 3];
      void task() => list.takeEvery(-1);
      expect(task, throwsA(isA<RangeError>()));
    });
  });
}
