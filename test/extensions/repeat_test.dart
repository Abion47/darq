import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('repeat', () {
    test('on ints', () {
      final list = [1, 2, 3];
      final result = list.repeat(3);
      expect(result, orderedEquals([1, 2, 3, 1, 2, 3, 1, 2, 3]));
    });

    test('on ints with zero count', () {
      final list = [1, 2, 3];
      final result = list.repeat(0);
      expect(result, orderedEquals([]));
    });

    test('Error: on ints with negative count', () {
      final list = [1, 2, 3];
      final task = () => list.repeat(-1);
      expect(task, throwsA(isA<ArgumentError>()));
    });
  });
}
