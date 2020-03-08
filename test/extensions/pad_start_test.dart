import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('padStart', () {
    test('Pad start', () {
      final list = [1, 2];
      final result = list.padStart(3);
      expect(result, orderedEquals([null, 1, 2]));
    });

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
      final result = list.padStart(3);
      expect(result, orderedEquals([1, 2, 3, 4]));
    });

    test('Error: null length', () {
      final list = [1, 2];
      final task = () => list.padStart(null);
      expect(task, throwsA(isA<ArgumentError>()));
    });

    test('Error: length less than zero', () {
      final list = [1, 2];
      final task = () => list.padStart(-1);
      expect(task, throwsA(isA<ArgumentError>()));
    });
  });
}
