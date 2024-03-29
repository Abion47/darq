import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('permutations', () {
    test('on ints', () {
      final list = [1, 2, 3];
      final results = list.permutations().memoize();
      expect(results.length, 6);
      expect(results.elementAt(0), orderedEquals(<int>[1, 2, 3]));
      expect(results.elementAt(1), orderedEquals(<int>[2, 1, 3]));
      expect(results.elementAt(2), orderedEquals(<int>[3, 1, 2]));
      expect(results.elementAt(3), orderedEquals(<int>[1, 3, 2]));
      expect(results.elementAt(4), orderedEquals(<int>[2, 3, 1]));
      expect(results.elementAt(5), orderedEquals(<int>[3, 2, 1]));
    });
  });
}
