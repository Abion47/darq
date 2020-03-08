import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('split', () {
    test('on ints', () {
      final list = ['a', ' ', 'b', 'c', ' ', 'd'];
      final result = list.split(' ').memoize();
      expect(result.length, 3);
      expect(result.elementAt(0), orderedEquals(['a']));
      expect(result.elementAt(1), orderedEquals(['b', 'c']));
      expect(result.elementAt(2), orderedEquals(['d']));
    });

    test('unchanged', () {
      final list = ['a', 'b', 'c', 'd'];
      final result = list.split(' ').memoize();
      expect(result.length, 1);
      expect(result.elementAt(0), orderedEquals(['a', 'b', 'c', 'd']));
    });

    test('on Strings with comparer', () {
      final list = ['a', 'e', 'b', 'c', 'E', 'd'];
      final result = list
          .split('e', comparer: (a, b) => a.toLowerCase() == b.toLowerCase())
          .memoize();
      expect(result.length, 3);
      expect(result.elementAt(0), orderedEquals(['a']));
      expect(result.elementAt(1), orderedEquals(['b', 'c']));
      expect(result.elementAt(2), orderedEquals(['d']));
    });
  });
}
