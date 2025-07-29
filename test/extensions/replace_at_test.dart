import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('replaceAt', () {
    test('replace at Nth element', () {
      final list = [1, 2, 3, 4, 5];

      final result = list.replaceAt(6, at: 1);
      expect(result, orderedEquals(<int>[1, 6, 3, 4, 5]));

      final result2 = list.replaceAt(6, at: 3);
      expect(result2, orderedEquals(<int>[1, 2, 3, 6, 5]));

      final result3 = list.replaceAt(6, at: 5);
      expect(result3, orderedEquals(list));
    });

    test('Error: At less than zero', () {
      final list = [1, 2, 3, 4, 5];
      void task() => list.replaceAt(6, at: -1);
      expect(task, throwsA(isA<RangeError>()));
    });
  });
}
