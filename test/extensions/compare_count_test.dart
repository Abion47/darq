import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('compareCount', () {
    test('less than', () {
      final list = [1];
      final other = [1, 2];
      final result = list.compareCount(other);
      expect(result, -1);
    });

    test('equal to', () {
      final list = [1, 2];
      final other = [1, 2];
      final result = list.compareCount(other);
      expect(result, 0);
    });

    test('greater than', () {
      final list = [1, 2, 3];
      final other = [1, 2];
      final result = list.compareCount(other);
      expect(result, 1);
    });
  });
}
