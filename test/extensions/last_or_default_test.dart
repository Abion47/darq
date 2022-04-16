import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('lastOrDefault', () {
    test('empty list', () {
      final test = <int>[];
      final result = test.lastOrDefault();
      expect(result, isNull);
    });

    test('empty list with defaultValue', () {
      final test = <int>[];
      final result = test.lastOrDefault(defaultValue: 4);
      expect(result, 4);
    });

    test('list with elements', () {
      final test = [0, 1, 2, 3];
      final result = test.lastOrDefault();
      expect(result, 3);
    });

    test('list with elements with default value', () {
      final test = [0, 1, 2, 3];
      final result = test.lastOrDefault(defaultValue: 4);
      expect(result, 3);
    });
  });
}
