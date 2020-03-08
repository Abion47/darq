import 'package:darq/darq.dart';
import 'package:test/test.dart';

void main() {
  group('fillBackward', () {
    test('fill middle nulls', () {
      final list = [1, null, 2, null, 3];
      final result = list.fillBackward();
      expect(result, orderedEquals([1, 2, 2, 3, 3]));
    });

    test('fill ending nulls', () {
      final list = [1, null, 2, null];
      final result = list.fillBackward();
      expect(result, orderedEquals([1, 2, 2, 2]));
    });

    test('Error: list of nulls', () {
      final list = [null, null, null];
      final task = () => list.fillBackward();
      expect(task, throwsA(isA<StateError>()));
    });
  });
}
