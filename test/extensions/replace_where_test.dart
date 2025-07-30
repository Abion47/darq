import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('replaceWhere', () {
    test('replace elements matching a condition', () {
      final list = [1, 2, 3, 4, 5];

      final result = list.replaceWhere(6, (n) => n.isEven);
      expect(result, orderedEquals(<int>[1, 6, 3, 6, 5]));

      final result2 = list.replaceWhere(6, (n) => n % 4 == 0);
      expect(result2, orderedEquals(<int>[1, 2, 3, 6, 5]));

      final result3 = list.replaceWhere(6, (n) => n.isNegative);
      expect(result3, orderedEquals(list));
    });
  });
}
