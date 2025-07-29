import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('elementAtOrDefault', () {
    test('Get element', () {
      final list = <int>[0, 1, 2, 3, 4];
      final result = list.elementAtOrDefault(3, defaultValue: 5);
      expect(result, equals(3));
    });

    test('Get element outside range', () {
      final list = <int>[0, 1, 2, 3, 4];
      final result = list.elementAtOrDefault(6, defaultValue: 5);
      expect(result, 5);
    });

    test('Error: Index less than zero', () {
      final list = <int>[0, 1, 2, 3, 4];
      void task() => list.elementAtOrDefault(-1, defaultValue: 5);
      expect(task, throwsA(isA<ArgumentError>()));
    });
  });
}
