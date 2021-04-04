import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('partition', () {
    test('on ints', () {
      final list = [1, 2, 3, 4, 5, 6];
      final result = list.partition((i) => i % 2 == 0);
      expect(result.length, 2);
      expect(result.elementAt(0), orderedEquals(<int>[2, 4, 6]));
      expect(result.elementAt(1), orderedEquals(<int>[1, 3, 5]));
    });
  });
}
