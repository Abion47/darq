import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('fillForward', () {
    test('fill middle nulls', () {
      final list = [1, null, 2, null, 3];
      final result = list.fillForward();
      expect(result, orderedEquals(<int>[1, 1, 2, 2, 3]));
    });

    test('fill starting nulls', () {
      final list = [null, 1, null, 2];
      final result = list.fillForward();
      expect(result, orderedEquals(<int>[1, 1, 1, 2]));
    });

    test('Error: list of nulls', () {
      final list = [null, null, null];
      void task() => list.fillForward();
      expect(task, throwsA(isA<StateError>()));
    });
  });
}
