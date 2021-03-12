import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('firstWhereOrDefault', () {
    test('list with matching elements', () {
      final test = [0, 1, 2, 3];
      final result = test.firstWhereOrDefault((i) => i.isOdd, defaultValue: -1);
      expect(result, 1);
    });

    test('empty list with defaultValue', () {
      final test = [];
      final result = test.firstWhereOrDefault((i) => i.isOdd, defaultValue: -1);
      expect(result, -1);
    });

    test('list with no matching elements and defaultValue', () {
      final test = [0, 2, 4, 6];
      final result = test.firstWhereOrDefault((i) => i.isOdd, defaultValue: -1);
      expect(result, -1);
    });
  });
}
