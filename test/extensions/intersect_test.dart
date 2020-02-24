import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('intersect', () {
    test('on ints', () {
      final a = [0, 1, 2, 3];
      final b = [2, 3, 4, 5];
      final result = a.intersect(b);
      expect(result, orderedEquals([2, 3]));
    });

    test('on ints: self', () {
      final a = [0, 1, 2, 3];
      final result = a.intersect(a);
      expect(result, orderedEquals([0, 1, 2, 3]));
    });

    test('on Strings', () {
      final a = ['a', 'b', 'c', 'd'];
      final b = ['c', 'd', 'e', 'f'];
      final result = a.intersect(b);
      expect(result, orderedEquals(['c', 'd']));
    });

    test('on Strings with keySelector', () {
      final a = ['a', 'b', 'c', 'd'];
      final b = ['C', 'D', 'E', 'F'];
      final result5 = a.intersect(b, (s) => s.toUpperCase());
      expect(result5, orderedEquals(['c', 'd']));
    });
  });
}
