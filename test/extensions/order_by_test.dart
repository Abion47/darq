import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('orderBy', () {
    test('on ints', () {
      final list = [4, 2, 5, 1, 3];
      final result = list.orderBy((i) => i);
      expect(result, orderedEquals(<int>[1, 2, 3, 4, 5]));
    });

    test('on Strings', () {
      final list = ['d', 'c', 'a', 'e', 'b'];
      final result = list.orderBy((i) => i);
      expect(result, orderedEquals(<String>['a', 'b', 'c', 'd', 'e']));
    });

    test('examples from issue #18', () {
      final list = [true, false, true, false];
      final result = list.orderBy((b) => b);
      expect(result, orderedEquals(<bool>[false, false, true, true]));
    });
  });
}
