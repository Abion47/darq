import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('padEnd', () {
    test('Pad end with value', () {
      final list = [1, 2];
      final result = list.padEnd(3, padding: 3);
      expect(result, orderedEquals(<int>[1, 2, 3]));
    });

    test('Pad end long with value', () {
      final list = [1, 2];
      final result = list.padEnd(10, padding: 3);
      expect(result, orderedEquals(<int>[1, 2, 3, 3, 3, 3, 3, 3, 3, 3]));
    });

    test('Pad end list already long enough', () {
      final list = [1, 2, 3, 4];
      final result = list.padEnd(3, padding: 5);
      expect(result, orderedEquals(<int>[1, 2, 3, 4]));
    });
  });
}
