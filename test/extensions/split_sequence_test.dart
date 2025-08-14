import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('splitSequence', () {
    test('on strings', () {
      final list = 'abcdebcbf'.iterable.toList();
      final result = list.splitSequence('bc'.iterable).memoize();
      expect(result.length, 3);
      expect(result.elementAt(0), orderedEquals(<String>['a']));
      expect(result.elementAt(1), orderedEquals(<String>['d', 'e']));
      expect(result.elementAt(2), orderedEquals(<String>['b', 'f']));
    });

    test('on strings (with keepSeparator)', () {
      final list = 'abcdebcbf'.iterable.toList();
      final result =
          list.splitSequence('bc'.iterable, keepSeparator: true).memoize();
      expect(result.length, 5);
      expect(result.elementAt(0), orderedEquals(<String>['a']));
      expect(result.elementAt(1), orderedEquals(<String>['b', 'c']));
      expect(result.elementAt(2), orderedEquals(<String>['d', 'e']));
      expect(result.elementAt(3), orderedEquals(<String>['b', 'c']));
      expect(result.elementAt(4), orderedEquals(<String>['b', 'f']));
    });

    test('on ints', () {
      final list = [1, 0, 0, 2, 3, 0, 0, 0, 4];
      final result = list.splitSequence([0, 0]).memoize();
      expect(result.length, 3);
      expect(result.elementAt(0), orderedEquals([1]));
      expect(result.elementAt(1), orderedEquals([2, 3]));
      expect(result.elementAt(2), orderedEquals([0, 4]));
    });

    test('unchanged', () {
      final list = ['a', 'b', 'c', 'd'];
      final result = list.splitSequence('de'.iterable).memoize();
      expect(result.length, 1);
      expect(result.elementAt(0), orderedEquals(<String>['a', 'b', 'c', 'd']));
    });

    test('on Strings with comparer', () {
      final list = 'abCdeBcf'.iterable.toList();
      final result = list
          .splitSequence('bc'.iterable,
              comparer: (a, b) => a.toLowerCase() == b.toLowerCase())
          .memoize();
      expect(result.length, 3);
      expect(result.elementAt(0), orderedEquals(<String>['a']));
      expect(result.elementAt(1), orderedEquals(<String>['d', 'e']));
      expect(result.elementAt(2), orderedEquals(<String>['f']));
    });
  });
}
