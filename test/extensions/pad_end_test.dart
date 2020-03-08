import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('padEnd', () {
    test('Pad end', () {
      final list = [1, 2];
      final result = list.padEnd(3);
      expect(result, orderedEquals([1, 2, null]));
    });

    test('Pad end with value', () {
      final list = [1, 2];
      final result = list.padEnd(3, padding: 3);
      expect(result, orderedEquals([1, 2, 3]));
    });

    test('Pad end long with value', () {
      final list = [1, 2];
      final result = list.padEnd(10, padding: 3);
      expect(result, orderedEquals([1, 2, 3, 3, 3, 3, 3, 3, 3, 3]));
    });

    test('Pad end list already long enough', () {
      final list = [1, 2, 3, 4];
      final result = list.padEnd(3);
      expect(result, orderedEquals([1, 2, 3, 4]));
    });

    test('Error: null length', () {
      final list = [1, 2];
      final task = () => list.padEnd(null);
      expect(task, throwsA(isA<ArgumentError>()));
    });

    test('Error: length less than zero', () {
      final list = [1, 2];
      final task = () => list.padEnd(-1);
      expect(task, throwsA(isA<ArgumentError>()));
    });
  });
}
