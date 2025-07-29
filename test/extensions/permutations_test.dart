import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('permutations', () {
    test('on ints', () {
      final list = [1, 2, 3];
      final results = list.permutations();

      expect(results, [
        [1, 2, 3],
        [2, 1, 3],
        [3, 1, 2],
        [1, 3, 2],
        [2, 3, 1],
        [3, 2, 1],
      ]);
    });

    test('on empty list', () {
      final list = [];
      final results = list.permutations();
      expect(results, [[]]);
    });
  });
}
