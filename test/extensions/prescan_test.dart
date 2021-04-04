import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('prescan', () {
    test('on ints', () {
      final list = [1, 2, 3, 4];
      final result = list.preScan(0, (a, b) => a + b);
      expect(result, orderedEquals(<int>[0, 1, 3, 6]));
    });
  });
}
