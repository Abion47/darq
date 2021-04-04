import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('subsets', () {
    test('on ints', () {
      final list = [1, 2, 3];
      final results = list.subsets().memoize();
      expect(results.length, 8);
      expect(results.elementAt(0), orderedEquals(<int>[]));
      expect(results.elementAt(1), orderedEquals(<int>[1]));
      expect(results.elementAt(2), orderedEquals(<int>[2]));
      expect(results.elementAt(3), orderedEquals(<int>[1, 2]));
      expect(results.elementAt(4), orderedEquals(<int>[3]));
      expect(results.elementAt(5), orderedEquals(<int>[1, 3]));
      expect(results.elementAt(6), orderedEquals(<int>[2, 3]));
      expect(results.elementAt(7), orderedEquals(<int>[1, 2, 3]));
    });

    test('on empty list', () {
      final list = <int>[];
      final results = list.subsets().memoize();
      expect(results.length, 1);
      expect(results.elementAt(0), orderedEquals(<int>[]));
    });
  });
}
