import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('except', () {
    test('on ints', () {
      final a = [0, 1, 2, 3];
      final b = [2, 3, 4, 5];
      final result = a.except(b);
      expect(result, orderedEquals(<int>[0, 1]));
    });

    test('on ints: self', () {
      final a = [0, 1, 2, 3];
      final result = a.except(a);
      expect(result, orderedEquals(<int>[]));
    });

    test('on Strings', () {
      final a = ['a', 'b', 'c', 'd'];
      final b = ['c', 'd', 'e', 'f'];
      final result = a.except(b);
      expect(result, orderedEquals(<String>['a', 'b']));
    });

    test('on Strings with keySelector', () {
      final a = ['a', 'b', 'c', 'd'];
      final b = ['C', 'D', 'E', 'F'];
      final result5 = a.except(b, (s) => s.toUpperCase());
      expect(result5, orderedEquals(<String>['a', 'b']));
    });
  });
}
