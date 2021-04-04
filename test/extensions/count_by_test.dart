import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('countBy', () {
    test('Count empty list', () {
      final list = <int>[];
      final result = list.countBy((i) => i);
      expect(result, orderedEquals(<int>[]));
    });

    test('Count odds and evens', () {
      final list = [0, 1, 2, 3, 4, 5, 6];
      final result = list.countBy((i) => i % 2);
      expect(result.count(), equals(2));
      expect(result.elementAt(0).key, 0);
      expect(result.elementAt(0).value, 4);
      expect(result.elementAt(1).key, 1);
      expect(result.elementAt(1).value, 3);
    });

    test('Count string lengths', () {
      final list = ['', 'a', 'b', 'c', 'd', 'aa', 'ab'];
      final result = list.countBy((s) => s.length);
      expect(result.count(), equals(3));
      expect(result.elementAt(0).key, 0);
      expect(result.elementAt(0).value, 1);
      expect(result.elementAt(1).key, 1);
      expect(result.elementAt(1).value, 4);
      expect(result.elementAt(2).key, 2);
      expect(result.elementAt(2).value, 2);
    });
  });
}
