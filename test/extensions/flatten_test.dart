import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('flatten', () {
    test('Flatten a list of lists', () {
      final list = [
        ['a'],
        ['b'],
        ['c', 'd']
      ];
      final result = list.flatten();
      expect(result, orderedEquals(['a', 'b', 'c', 'd']));
    });
  });
}
