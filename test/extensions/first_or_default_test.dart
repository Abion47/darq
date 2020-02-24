import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('firstOrDefault', () {
    test('empty list', () {
      final test = [];
      final result = test.firstOrDefault();
      expect(result, null);
    });

    test('list with elements', () {
      final test = [0, 1, 2, 3];
      final result = test.firstOrDefault();
      expect(result, 0);
    });

    test('empty list with defaultValue', () {
      final test = [];
      final result = test.firstOrDefault(defaultValue: 4);
      expect(result, 4);
    });
  });
}
