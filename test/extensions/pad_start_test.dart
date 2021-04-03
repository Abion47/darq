import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('padStart', () {
    test('Pad start with value', () {
      final list = [1, 2];
      final result = list.padStart(3, padding: 3);
      expect(result, orderedEquals([3, 1, 2]));
    });

    test('Pad start long with value', () {
      final list = [1, 2];
      final result = list.padStart(10, padding: 3);
      expect(result, orderedEquals([3, 3, 3, 3, 3, 3, 3, 3, 1, 2]));
    });

    test('Pad start list already long enough', () {
      final list = [1, 2, 3, 4];
      final result = list.padStart(3, padding: 5);
      expect(result, orderedEquals([1, 2, 3, 4]));
    });
  });
}
