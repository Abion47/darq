import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('skipLast', () {
    test('on ints', () {
      final list = [1, 2, 3, 4, 5];
      final result = list.skipLast(3);
      expect(result, orderedEquals(<int>[1, 2]));
    });
  });
}
