import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('aggregateRight', () {
    test('on ints', () {
      final list = [1, 2, 3, 4, 5];
      final result = list.aggregateRight((a, b) => a + b);
      expect(result, 15);
      expect(result, isA<int>());
    });

    test('on Strings', () {
      final list = ['1', '2', '3', '4', '5'];
      final result = list.aggregateRight((a, b) => a + b);
      expect(result, '54321');
    });

    test('on bool', () {
      final list = [true, true, true, true];
      final result = list.aggregateRight((a, b) => a && b);
      expect(result, true);

      final list2 = [true, true, true, false];
      final result2 = list2.aggregateRight((a, b) => a && b);
      expect(result2, false);
    });

    test('Error: on empty list', () {
      final list = <int>[];
      void task() => list.aggregateRight((a, b) => a + b);
      expect(task, throwsA(isA<StateError>()));
    });
  });
}
