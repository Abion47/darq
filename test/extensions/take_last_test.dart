import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('takeLast', () {
    test('on ints', () {
      final list = [1, 2, 3, 4, 5];
      final result = list.takeLast(3);
      expect(result, orderedEquals([3, 4, 5]));
    });
  });
}
