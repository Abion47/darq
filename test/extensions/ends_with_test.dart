import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('endsWith', () {
    test('success', () {
      final list = [0, 1, 2, 3, 4, 5];
      final result = list.endsWith([3, 4, 5]);
      expect(result, isTrue);
    });

    test('fail', () {
      final list = [0, 1, 2, 3, 4, 5];
      final result = list.endsWith([4, 5, 6]);
      expect(result, isFalse);
    });
  });
}
