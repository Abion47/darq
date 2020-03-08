import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('excludeAt', () {
    test('Exclude at index', () {
      final list = [1, 2, 3, 4, 5];
      final result = list.excludeAt(2);
      expect(result, orderedEquals([1, 2, 4, 5]));
    });

    test('Index greater than length', () {
      final list = [1, 2, 3, 4, 5];
      final result = list.excludeAt(5);
      expect(result, orderedEquals([1, 2, 3, 4, 5]));
    });

    test('Error: Index less than zero', () {
      final list = [1, 2, 3, 4, 5];
      final task = () => list.excludeAt(-1);
      expect(task, throwsA(isA<RangeError>()));
    });
  });
}
