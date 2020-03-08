import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('fillMissing', () {
    test('fill middle nulls', () {
      final list = [1, null, 2, null, 3];
      final result = list.fillMissing(4);
      expect(result, orderedEquals([1, 4, 2, 4, 3]));
    });

    test('Error: list of nulls', () {
      final list = [1, 2, 3];
      final result = list.fillMissing(4);
      expect(result, orderedEquals([1, 2, 3]));
    });
  });
}
