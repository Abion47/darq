import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('orderByDescending', () {
    test('on ints', () {
      final list = [4, 2, 5, 1, 3];
      final result = list.orderByDescending((i) => i);
      expect(result, orderedEquals([5, 4, 3, 2, 1]));
    });

    test('on Strings', () {
      final list = ['d', 'c', 'a', 'e', 'b'];
      final result = list.orderByDescending((i) => i);
      expect(result, orderedEquals(['e', 'd', 'c', 'b', 'a']));
    });
  });
}
