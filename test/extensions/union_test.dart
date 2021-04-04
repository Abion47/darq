import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('union', () {
    test('on ints', () {
      final a = [0, 1, 2, 3];
      final b = [2, 3, 4, 5];
      final result = a.union(b);
      expect(result, orderedEquals(<int>[0, 1, 2, 3, 4, 5]));
    });

    test('on ints: self', () {
      final a = [0, 1, 2, 3];
      final result = a.union(a);
      expect(result, orderedEquals(<int>[0, 1, 2, 3]));
    });

    test('on Strings', () {
      final a = ['a', 'b', 'c', 'd'];
      final b = ['c', 'd', 'e', 'f'];
      final result = a.union(b);
      expect(result, orderedEquals(<String>['a', 'b', 'c', 'd', 'e', 'f']));
    });

    test('on Strings with keySelector', () {
      final a = ['a', 'b', 'c', 'd'];
      final b = ['C', 'D', 'E', 'F'];
      final result5 = a.union(b, (s) => s.toUpperCase());
      expect(result5, orderedEquals(<String>['a', 'b', 'c', 'd', 'E', 'F']));
    });
  });
}
