import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('splitWhere', () {
    test('on strings', () {
      final list = ['a', ' ', 'b', 'c', ' ', 'd'];
      final result = list.splitWhere((c) => c == ' ').memoize();
      expect(result.length, 3);
      expect(result.elementAt(0), orderedEquals(<String>['a']));
      expect(result.elementAt(1), orderedEquals(<String>['b', 'c']));
      expect(result.elementAt(2), orderedEquals(<String>['d']));
    });

    test('on strings (with keepSeparator)', () {
      final list = ['a', ' ', 'b', 'c', ' ', 'd'];
      final result =
          list.splitWhere((c) => c == ' ', keepSeparator: true).memoize();
      expect(result.length, 5);
      expect(result.elementAt(0), orderedEquals(<String>['a']));
      expect(result.elementAt(1), orderedEquals(<String>[' ']));
      expect(result.elementAt(2), orderedEquals(<String>['b', 'c']));
      expect(result.elementAt(3), orderedEquals(<String>[' ']));
      expect(result.elementAt(4), orderedEquals(<String>['d']));
    });

    test('on ints', () {
      final list = [1, -1, 2, 3, -2, 4];
      final result = list.splitWhere((e) => e < 0).memoize();
      expect(result.length, 3);
      expect(result.elementAt(0), orderedEquals([1]));
      expect(result.elementAt(1), orderedEquals([2, 3]));
      expect(result.elementAt(2), orderedEquals([4]));
    });

    test('unchanged', () {
      final list = ['a', 'b', 'c', 'd'];
      final result = list.splitWhere((c) => c == ' ').memoize();
      expect(result.length, 1);
      expect(result.elementAt(0), orderedEquals(<String>['a', 'b', 'c', 'd']));
    });

    test('on Strings, more complex case', () {
      final list = ['a', 'e', 'b', 'c', 'E', 'd'];
      final result = list.splitWhere((c) => c.toLowerCase() == 'e').memoize();
      expect(result.length, 3);
      expect(result.elementAt(0), orderedEquals(<String>['a']));
      expect(result.elementAt(1), orderedEquals(<String>['b', 'c']));
      expect(result.elementAt(2), orderedEquals(<String>['d']));
    });
  });
}
