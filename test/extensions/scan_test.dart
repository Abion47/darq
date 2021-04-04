import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('scan', () {
    test('on ints', () {
      final list = [1, 2, 3, 4];
      final result = list.scan((a, b) => a + b);
      expect(result, orderedEquals(<int>[1, 3, 6, 10]));
    });
  });
}
