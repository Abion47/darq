import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('pairwise', () {
    test('on ints', () {
      final list = [1, 2, 3, 4];
      final result = list.pairwise();
      expect(result.length, 3);
      expect(result.elementAt(0), orderedEquals(<int>[1, 2]));
      expect(result.elementAt(1), orderedEquals(<int>[2, 3]));
      expect(result.elementAt(2), orderedEquals(<int>[3, 4]));
    });
  });
}
