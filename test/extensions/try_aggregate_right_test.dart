import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('Extension Methods', () {
    test('on ints', () {
      final list = [1, 2, 3, 4, 5];
      final result = list.tryAggregateRight((a, b) => a + b);
      expect(result, 15);
      expect(result, isA<int>());
    });

    test('on Strings', () {
      final list = ['1', '2', '3', '4', '5'];
      final result = list.tryAggregateRight((a, b) => a + b);
      expect(result, '54321');
    });

    test('on bool', () {
      final list = [true, true, true, true];
      final result = list.tryAggregateRight((a, b) => a && b);
      expect(result, true);

      final list2 = [true, true, true, false];
      final result2 = list2.tryAggregateRight((a, b) => a && b);
      expect(result2, false);
    });

    test('on empty list', () {
      final list = <int>[];
      final result = list.tryAggregateRight((a, b) => a + b);
      expect(result, null);
    });

    test('on empty list with default value', () {
      final list = <int>[];
      final result = list.tryAggregateRight((a, b) => a + b, defaultValue: 1);
      expect(result, 1);
    });
  });
}
