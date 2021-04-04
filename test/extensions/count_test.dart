import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('count', () {
    test('Count list', () {
      final list = [0, 1, 2, 3, 4, 5];
      final result = list.count();
      expect(result, equals(6));
    });

    test('Count empty list', () {
      final list = <int>[];
      final result = list.count();
      expect(result, equals(0));
    });

    test('Count list with condition', () {
      final list = [0, 1, 2, 3, 4, 5];
      final result = list.count((i) => i.isEven);
      expect(result, equals(3));
    });
  });
}
