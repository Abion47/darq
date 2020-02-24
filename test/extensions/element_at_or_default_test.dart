import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('elementAtOrDefault', () {
    test('Get element', () {
      final list = <int>[0, 1, 2, 3, 4];
      final result = list.elementAtOrDefault(3);
      expect(result, equals(3));
    });

    test('Get element outside range', () {
      final list = <int>[0, 1, 2, 3, 4];
      final result = list.elementAtOrDefault(6);
      expect(result, isNull);
    });

    test('Get element outside range with default value', () {
      final list = <int>[0, 1, 2, 3, 4];
      final result = list.elementAtOrDefault(6, defaultValue: 5);
      expect(result, equals(5));
    });

    test('Error: null index', () {
      final list = <int>[0, 1, 2, 3, 4];
      final task = () => list.elementAtOrDefault(null);
      expect(task, throwsA(isA<ArgumentError>()));
    });

    test('Error: negative index', () {
      final list = <int>[0, 1, 2, 3, 4];
      final task = () => list.elementAtOrDefault(-1);
      expect(task, throwsA(isA<ArgumentError>()));
    });
  });
}
