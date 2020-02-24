import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('orderBy', () {
    test('on ints', () {
      final list = [4, 2, 5, 1, 3];
      final result = list.orderBy((i) => i);
      expect(result, orderedEquals([1, 2, 3, 4, 5]));
    });

    test('on Strings', () {
      final list = ['d', 'c', 'a', 'e', 'b'];
      final result = list.orderBy((i) => i);
      expect(result, orderedEquals(['a', 'b', 'c', 'd', 'e']));
    });
  });
}
