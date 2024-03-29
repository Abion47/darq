import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('singleOrDefault', () {
    test('on empty list', () {
      final list = <int>[];
      final result = list.singleOrDefault(defaultValue: 3);
      expect(result, equals(3));
    });

    test('on list with one element', () {
      final list = [0];
      final result = list.singleOrDefault(defaultValue: 3);
      expect(result, equals(0));
    });

    test('Error: on list with more than one element', () {
      final list = [0, 1];
      void task() => list.singleOrDefault(defaultValue: 3);
      expect(task, throwsA(isA<StateError>()));
    });
  });
}
