import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('lastWhereOrDefault', () {
    test('empty list', () {
      final test = [];
      final result = test.lastWhereOrDefault((i) => i.isOdd);
      expect(result, null);
    });

    test('list with matching elements', () {
      final test = [0, 1, 2, 3];
      final result = test.lastWhereOrDefault((i) => i.isOdd);
      expect(result, 3);
    });

    test('list with no matching elements', () {
      final test = [0, 2, 4, 6];
      final result = test.lastWhereOrDefault((i) => i.isOdd);
      expect(result, null);
    });

    test('empty list with defaultValue', () {
      final test = [];
      final result = test.lastWhereOrDefault((i) => i.isOdd, defaultValue: -1);
      expect(result, -1);
    });

    test('list with no matching elements and defaultValue', () {
      final test = [0, 2, 4, 6];
      final result = test.lastWhereOrDefault((i) => i.isOdd, defaultValue: -1);
      expect(result, -1);
    });
  });
}
