import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('lastWhereOrDefault', () {
    test('empty list with defaultValue', () {
      final test = [];
      final result = test.lastWhereOrDefault((i) => i.isOdd, defaultValue: -1);
      expect(result, -1);
    });

    test('list with matching elements and defaultValue', () {
      final test = [0, 1, 2, 3];
      final result = test.lastWhereOrDefault((i) => i.isOdd, defaultValue: -1);
      expect(result, 3);
    });

    test('list with no matching elements and defaultValue', () {
      final test = [0, 2, 4, 6];
      final result = test.lastWhereOrDefault((i) => i.isOdd, defaultValue: -1);
      expect(result, -1);
    });
  });
}
