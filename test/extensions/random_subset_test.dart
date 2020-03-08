import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('randomSubset', () {
    test('on ints', () {
      final list = [1, 2, 3, 4, 5];
      final result = list.randomSubset(3).toList();
      expect(result.length, 3);
      for (var i in result) {
        expect(list.contains(i), isTrue);
      }
    });
  });
}
