import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('concatAll', () {
    test('Concatenate all lists', () {
      final list = [0, 1, 2];
      final result = list.concatAll([
        [3],
        [4],
        [5]
      ]);
      expect(result, orderedEquals([0, 1, 2, 3, 4, 5]));
    });
  });
}
